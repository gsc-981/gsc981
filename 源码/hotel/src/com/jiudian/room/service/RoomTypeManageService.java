package com.jiudian.room.service;

import com.jiudian.core.base.BaseService;
import com.jiudian.room.entity.RoomType;
import com.jiudian.room.vo.RoomTypeVo;

import java.util.List;

public interface RoomTypeManageService extends BaseService<RoomType> {
    public void saveroomtype(String id, String roomTypeName, String roomTypeDescription, String roomTypeUrl);
    public List<RoomTypeVo> getroomtypelist();
    public void delroom(RoomType roomType);
}
