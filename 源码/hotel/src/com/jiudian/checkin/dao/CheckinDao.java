package com.jiudian.checkin.dao;

import com.jiudian.checkin.entity.Checkin;
import com.jiudian.core.base.BaseDao;
import com.jiudian.room.entity.Room;
import com.jiudian.room.entity.RoomType;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public class CheckinDao extends BaseDao <Checkin> {
    public int checkinNum(RoomType roomType) {
        int count = 0;
        String hql = "SELECT c.roomByRoomId FROM Checkin c WHERE c.arrivalDate=?";
        List<Room> roomList =  (List<Room>)this.getHibernateTemplate().find(hql, new Date());
        for(Room temp : roomList) {
            if(temp.getRoomTypeByRoomTypeId()==roomType) {
                count++;
            }
        }
        return count;
    }

    public int checkiningNum() {
        String hql = "SELECT count(*) FROM Checkin c WHERE c.ispay=?";
        Long count = (Long) this.getHibernateTemplate().find(hql, "0").listIterator().next();
        return count.intValue();
    }
}
