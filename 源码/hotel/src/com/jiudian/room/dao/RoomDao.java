package com.jiudian.room.dao;

import com.jiudian.core.base.BaseDao;
import com.jiudian.room.entity.Room;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RoomDao extends BaseDao<Room> {
    public List<Room> getonetyperooms(String roomtypeid) {
        List<Room> rooms= this.findBySql("SELECT * FROM room WHERE roomTypeId=?0 AND roomState=?1", roomtypeid, "空房");
        return rooms;
    }

    public List<Room> getnullrooms() {
        List<Room> rooms= this.findBySql("SELECT * FROM room WHERE roomState=?0","空房");
        return rooms;
    }

    public int nullroomNum() {
        String hql = "SELECT count(*) FROM Room r WHERE r.roomState=? ORDER BY r.roomName";
        Long count = (Long) this.getHibernateTemplate().find(hql, "空房").listIterator().next();
        return count.intValue();
    }
}

