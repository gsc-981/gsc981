package com.jiudian.room.vo;

import com.jiudian.room.entity.Room;

public class RoomVo {
    private String id;
    private String roomName;
    private String roomPhone;
    private Double roomPrice;
    private String roomState;
    private String roomAble;
    private String notes;
    private String roomType;

    public RoomVo(Room room) {
        this.id = room.getId();
        this.roomName = room.getRoomName();
        this.roomPhone = room.getRoomPhone();
        this.roomPrice = room.getRoomPrice();
        this.roomState = room.getRoomState();
        this.roomAble = room.getRoomAble();
        this.notes = room.getNotes();
        if(room.getRoomTypeByRoomTypeId()==null) {
            this.roomType = "";
        }
        else {
            this.roomType = room.getRoomTypeByRoomTypeId().getRoomTypeName();
        }
    }

    public RoomVo(String id, String roomName, String roomPhone, Double roomPrice, String roomState, String roomAble, String notes, String roomType) {
        this.id = id;
        this.roomName = roomName;
        this.roomPhone = roomPhone;
        this.roomPrice = roomPrice;
        this.roomState = roomState;
        this.roomAble = roomAble;
        this.notes = notes;
        this.roomType = roomType;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public String getRoomPhone() {
        return roomPhone;
    }

    public void setRoomPhone(String roomPhone) {
        this.roomPhone = roomPhone;
    }

    public Double getRoomPrice() {
        return roomPrice;
    }

    public void setRoomPrice(Double roomPrice) {
        this.roomPrice = roomPrice;
    }

    public String getRoomState() {
        return roomState;
    }

    public void setRoomState(String roomState) {
        this.roomState = roomState;
    }

    public String getRoomAble() {
        return roomAble;
    }

    public void setRoomAble(String roomAble) {
        this.roomAble = roomAble;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }
}
