package com.jiudian.room.service;

import com.jiudian.core.base.BaseService;
import com.jiudian.room.entity.Room;

import java.util.List;

public interface RoomManageService extends BaseService<Room>{
    public String roomPagination(int page, int limit, String keyword);
    public void saveroom(String id, String roomName, String roomPhone, String roomTypeId, Double roomPrice, String roomAble, String notes);
    public List<Room> findRoom(String parameter);
    public String nullroomPagination(int page, int limit);
    public String getonetyperooms(String roomtypeid);
    public String getnullrooms();
    public void deleteroom(Room room);
}
