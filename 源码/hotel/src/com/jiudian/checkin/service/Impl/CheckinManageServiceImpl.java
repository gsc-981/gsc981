package com.jiudian.checkin.service.Impl;

import com.alibaba.fastjson.JSON;
import com.jiudian.booking.dao.BookingDao;
import com.jiudian.booking.entity.Booking;
import com.jiudian.checkin.dao.CheckinDao;
import com.jiudian.checkin.dao.CustomerCheckinDao;
import com.jiudian.checkin.entity.Checkin;
import com.jiudian.checkin.entity.CustomerCheckin;
import com.jiudian.checkin.service.CheckinManageService;
import com.jiudian.checkin.vo.CheckinVo;
import com.jiudian.core.base.BaseDao;
import com.jiudian.core.base.BaseServiceImpl;
import com.jiudian.core.util.JsonReturn;
import com.jiudian.customer.dao.CustomerDao;
import com.jiudian.customer.entity.Customer;
import com.jiudian.room.dao.RoomDao;
import com.jiudian.room.dao.RoomTypeDao;
import com.jiudian.room.entity.Room;
import com.jiudian.room.entity.RoomType;
import com.jiudian.vip.dao.VipDao;
import com.jiudian.vip.entity.Vip;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("CheckinManageService")
@Transactional
public class CheckinManageServiceImpl extends BaseServiceImpl<Checkin> implements CheckinManageService {

    @Autowired
    private CheckinDao checkinDao;

    @Autowired
    private VipDao vipDao;

    @Autowired
    private CustomerDao customerDao;

    @Autowired
    private RoomDao roomDao;

    @Autowired
    private CustomerCheckinDao customerCheckinDao;

    @Autowired
    private BookingDao bookingDao;

    @Autowired
    private RoomTypeDao roomTypeDao;

    @Override
    public BaseDao<Checkin> getBaseDao() {
        return checkinDao;
    }

    @Override
    public void addcheckin(String roomid, String accesscardID, String notes, String vipphone, List<Customer> customers) {
        Vip vip = null;
        List<Vip> vips = vipDao.phoneFind(vipphone);
        Room room = roomDao.get(roomid);
        List<Customer> newcustomers = new ArrayList<>();

        //获取到会员信息
        if(vips!=null && !vips.isEmpty()) {
            vip = vips.get(0);
        }

        //获取顾客信息
        for(Customer old : customers){
            List<Customer> customerstemp = customerDao.idcardFind(old.getCustomerCard());
            //如果会员信息存在那么更新
            if(customerstemp!=null && !customerstemp.isEmpty()) {
                Customer temp = customerstemp.get(0);
                temp.setCustomerName(old.getCustomerName());
                temp.setCustomerAddress(old.getCustomerAddress());
                temp.setCustomerPhone(old.getCustomerPhone());
                temp.setCustomerSex(old.getCustomerSex());
                customerDao.update(temp);
                newcustomers.add(temp);
            }
            //如果顾客信息不存在则新建
            else {
                customerDao.save(old);
                newcustomers.add(old);
            }
        }

        //插入一条入住记录
        Checkin checkin = new Checkin();
        checkin.setAccesscardId(accesscardID);
        checkin.setArrivalDate(new Date());
        checkin.setNotes(notes);
        checkin.setRoomByRoomId(room);
        checkin.setVipByVipId(vip);
        checkin.setIspay("0");
        save(checkin);

        //关联入住记录和顾客信息
        for(Customer temp : newcustomers) {
            CustomerCheckin customerCheckin = new CustomerCheckin();
            customerCheckin.setCheckinByCheckinId(checkin);
            customerCheckin.setCustomerByCustomerId(temp);
            customerCheckinDao.save(customerCheckin);
        }

        //修改房间状态
        room.setRoomState("有客");
        roomDao.update(room);
    }

    @Override
    public boolean ablecheckin(String roomid) {
        Boolean able = false;

        Room room = roomDao.get(roomid);
        RoomType roomType= room.getRoomTypeByRoomTypeId();

        //得到某一天这种房型的总预定数
        int bookingnum = bookingDao.bookingNum(new Date(), roomType);

        //得到这种房型的房间数
        int roomnum = roomTypeDao.roomNum(roomType);

        //得到这种房型的入住数
        int checkinnum = checkinDao.checkinNum(roomType);

        if(roomnum>bookingnum+checkinnum) {
            able=true;
        }
        return able;
    }

    @Override
    public void delbooking(String bookingid) {
        Booking booking = bookingDao.get(bookingid);
        bookingDao.delete(booking);
    }

    @Override
    public String checkinPagination(int page, int limit) {
        JsonReturn jsonReturn = new JsonReturn();
        List<Checkin> checkins;
        checkins = pagingBySql("SELECT * FROM checkin", (page-1)*10, limit);
        List<CheckinVo> checkinVos = new ArrayList<>();
        for(Checkin temp : checkins) {
            checkinVos.add(new CheckinVo(temp));
        }
        jsonReturn.setData(checkinVos);
        jsonReturn.setCount(rowCount("checkin"));
        String jsonstring = JSON.toJSONString(jsonReturn);
        return jsonstring;
    }

    @Override
    public String checkiningPagination(int page, int limit) {
        JsonReturn jsonReturn = new JsonReturn();
        List<Checkin> checkins;
        checkins = pagingBySql("SELECT * FROM checkin WHERE ispay=?0", (page-1)*10, limit, "0");
        List<CheckinVo> checkinVos = new ArrayList<>();
        for(Checkin temp : checkins) {
            checkinVos.add(new CheckinVo(temp));
        }
        jsonReturn.setData(checkinVos);
        jsonReturn.setCount(checkinDao.checkiningNum());
        String jsonstring = JSON.toJSONString(jsonReturn);
        return jsonstring;
    }

    @Override
    public String onecheckin(String checkinid) {
        JsonReturn jsonReturn = new JsonReturn();
        Checkin checkin = get(checkinid);
        CheckinVo checkinVo = new CheckinVo(checkin);
        List<CheckinVo> checkinVos = new ArrayList<>();
        checkinVos.add(checkinVo);
        jsonReturn.setData(checkinVos);
        jsonReturn.setCount(1);
        String jsonstring = JSON.toJSONString(jsonReturn);
        return jsonstring;
    }


    @Override
    public void updateexchange(String checkinid, String roomid) {
        Checkin checkin = checkinDao.get(checkinid);
        Room room = roomDao.get(roomid);
        Room oldroom = checkin.getRoomByRoomId();
        oldroom.setRoomState("空房");
        roomDao.update(oldroom);
        room.setRoomState("有客");
        roomDao.update(room);
        checkin.setRoomByRoomId(room);
        checkinDao.update(checkin);
    }
}
