package com.jiudian.booking.dao;

import com.jiudian.room.entity.RoomType;
import org.springframework.stereotype.Repository;

import com.jiudian.booking.entity.Booking;
import com.jiudian.core.base.BaseDao;

import java.util.Date;
import java.util.List;

@Repository
public class BookingDao extends BaseDao<Booking> {

    public int bookingNum(Date arrivalDate, RoomType roomType) {
        String hql = "SELECT count(*) FROM Booking b WHERE b.arrivalDate=? AND b.roomTypeByRoomTypeId=?";
        Long count = (Long) this.getHibernateTemplate().find(hql, arrivalDate, roomType).listIterator().next();
        return count.intValue();
    }

    public List<Booking> findmybooking(String vipPhone) {
        String sql = "SELECT * FROM booking WHERE vipPhone=?0";
        List<Booking> bookings = findBySql(sql, vipPhone);
        return bookings;
    }
}
