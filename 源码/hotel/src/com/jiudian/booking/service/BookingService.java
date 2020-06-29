package com.jiudian.booking.service;

import java.util.List;

import com.jiudian.booking.entity.Booking;
import com.jiudian.core.base.BaseService;
import com.jiudian.room.entity.Room;
import com.jiudian.room.entity.RoomType;
import com.jiudian.vip.entity.Vip;

public interface BookingService extends BaseService<Booking> {

	public void deleteBooking(Booking booking);

	public String saveBooking(Booking booking, String roomTypeId, Vip vip);

    public List<Booking> mybooking(String vipPhone);
}
