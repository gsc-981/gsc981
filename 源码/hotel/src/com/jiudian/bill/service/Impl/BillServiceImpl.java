package com.jiudian.bill.service.Impl;

import com.alibaba.fastjson.JSON;
import com.jiudian.bill.dao.BillDao;
import com.jiudian.bill.entity.Bill;
import com.jiudian.bill.service.BillService;
import com.jiudian.bill.vo.BillVo;
import com.jiudian.checkin.dao.CheckinDao;
import com.jiudian.checkin.entity.Checkin;
import com.jiudian.core.base.BaseDao;
import com.jiudian.core.base.BaseServiceImpl;
import com.jiudian.core.util.JsonReturn;
import com.jiudian.room.dao.RoomDao;
import com.jiudian.room.entity.Room;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("BillService")
@Transactional
public class BillServiceImpl extends BaseServiceImpl<Bill> implements BillService {

    @Autowired
    private BillDao billDao;

    @Autowired
    private CheckinDao checkinDao;

    @Autowired
    private RoomDao roomDao;

    @Override
    public String billsPagination(int page, int limit) {
        JsonReturn jsonReturn = new JsonReturn();
        List<Bill> bills = pagingBySql("SELECT * FROM bill", (page-1)*10, limit);
        List<BillVo> billVos = new ArrayList<>();
        for(Bill temp : bills) {
            billVos.add(new BillVo(temp));
        }
        jsonReturn.setData(billVos);
        jsonReturn.setCount(rowCount("bill"));
        String jsonstring = JSON.toJSONString(jsonReturn);
        return jsonstring;
    }

    @Override
    public String paybill(String checkinid) {
        JsonReturn jsonReturn = new JsonReturn();
        Bill bill = new Bill();
        Checkin checkin = checkinDao.get(checkinid);
        bill.setDepartureDate(new Date());
        bill.setCheckinByCheckinId(checkin);
        Date date = new Date(checkin.getArrivalDate().getTime());
        LocalDate begin = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        LocalDate end = LocalDate.now();
        long daysdiff = ChronoUnit.DAYS.between(begin, end);
        double price = checkin.getRoomByRoomId().getRoomPrice();
        if(daysdiff>0) {
            bill.setTotalCosts(price * daysdiff);
        }
        else {
            bill.setTotalCosts(price);
        }
        bill.setDays(String.valueOf(daysdiff));
        save(bill);

        checkin.setIspay("1");
        checkinDao.update(checkin);

        Room room = checkin.getRoomByRoomId();
        room.setRoomState("空房");
        roomDao.update(room);

        List<BillVo> billVos = new ArrayList<>();
        billVos.add(new BillVo(bill));
        jsonReturn.setData(billVos);
        jsonReturn.setMsg("success");
        String jsonstring = JSON.toJSONString(jsonReturn);
        return jsonstring;
    }

    @Override
    public BaseDao<Bill> getBaseDao() {
        return billDao;
    }
}
