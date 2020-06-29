package com.jiudian.room.vo;

import com.jiudian.room.entity.RoomType;

public class RoomTypeVo {
    private String id;
    private String roomTypeName;
    private String roomTypeUrl;
    private String roomTypeDescription;
    private double price;

    public RoomTypeVo(RoomType roomType) {
        this.id = roomType.getId();
        this.roomTypeName = roomType.getRoomTypeName();
        this.roomTypeUrl = roomType.getRoomTypeUrl();
        this.roomTypeDescription = roomType.getRoomTypeDescription();
        if(roomType.getRoomsByRoomTypeId().size()>0) {
            this.price = roomType.getRoomsByRoomTypeId().iterator().next().getRoomPrice();
        }
        else {
            this.price = 1000;
        }
        
    }

    public RoomTypeVo(String id, String roomTypeName) {
        this.id = id;
        this.roomTypeName = roomTypeName;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRoomTypeName() {
        return roomTypeName;
    }

    public void setRoomTypeName(String roomTypeName) {
        this.roomTypeName = roomTypeName;
    }

    public String getRoomTypeUrl() {
        return roomTypeUrl;
    }

    public void setRoomTypeUrl(String roomTypeUrl) {
        this.roomTypeUrl = roomTypeUrl;
    }

	public String getRoomTypeDescription() {
		return roomTypeDescription;
	}

	public void setRoomTypeDescription(String roomTypeDescription) {
		this.roomTypeDescription = roomTypeDescription;
	}

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
