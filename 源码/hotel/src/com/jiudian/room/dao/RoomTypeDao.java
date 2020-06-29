package com.jiudian.room.dao;

import com.jiudian.core.base.BaseDao;
import com.jiudian.room.entity.RoomType;
import org.springframework.stereotype.Repository;

@Repository
public class RoomTypeDao extends BaseDao<RoomType> {

    public int roomNum(RoomType roomType) {
        String hql = "SELECT count(*) FROM Room r WHERE r.roomTypeByRoomTypeId=?";
        Long count = (Long) this.getHibernateTemplate().find(hql, roomType).listIterator().next();
        return count.intValue();
    }
    
}
