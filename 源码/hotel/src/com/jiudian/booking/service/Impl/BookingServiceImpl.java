package com.jiudian.booking.service.Impl;

import java.util.Date;
import java.util.List;

import com.jiudian.room.dao.RoomTypeDao;
import com.jiudian.room.entity.RoomType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiudian.booking.dao.BookingDao;
import com.jiudian.booking.entity.Booking;
import com.jiudian.booking.service.BookingService;
import com.jiudian.core.base.BaseDao;
import com.jiudian.core.base.BaseServiceImpl;
import com.jiudian.vip.entity.Vip;
import com.opensymphony.xwork2.ActionContext;

@Service("BookingService")
public class BookingServiceImpl extends BaseServiceImpl<Booking> implements BookingService {

	@Autowired
	private BookingDao bookingDao;

	@Autowired
	private RoomTypeDao roomTypeDao;
	@Override
	public BaseDao<Booking> getBaseDao() {
		// TODO Auto-generated method stub
		return bookingDao;
	}

	@Override
	public void deleteBooking(Booking booking) {
		bookingDao.delete(booking);
		
	}

	@Override
	public String saveBooking(Booking booking, String roomTypeId, Vip vip) {
		Date arrivalDate = booking.getArrivalDate();
		RoomType roomType = roomTypeDao.get(roomTypeId);

		//得到某一天这种房型的总预定数
		int bookingnum = bookingDao.bookingNum(booking.getArrivalDate(), roomType);

		//得到这种房型的房间数
		int roomnum = roomTypeDao.roomNum(roomType);

		//房间数大于预定数，预定成功
		if(roomnum>bookingnum) {
			booking.setRoomTypeByRoomTypeId(roomType);
			booking.setVipByVipId(vip);
			booking.setBookingDate(new Date());
			save(booking);
			ActionContext.getContext().getValueStack().set("roomType", roomType);
			ActionContext.getContext().getValueStack().set("vip", vip);
			ActionContext.getContext().getValueStack().set("booking",booking );
			return "success";
		}
		else
		{
			return "fail";
		}
	}

	@Override
	public List<Booking> mybooking(String vipPhone) {
		return bookingDao.findmybooking(vipPhone);
	}


}
