package com.jiudian.checkin.vo;


import com.alibaba.fastjson.annotation.JSONField;
import com.jiudian.checkin.entity.Checkin;

import java.util.Date;

public class CheckinVo {
    private String id;
    @JSONField(format="yyyy-MM-dd")
    private Date arrivalDate;
    private String accesscardId;
    private String notes;
    private String vipphone;
    private String roomname;
    private String ispay;

    public CheckinVo(Checkin checkin) {
        this.id = checkin.getId();
        this.arrivalDate = checkin.getArrivalDate();
        this.accesscardId = checkin.getAccesscardId();
        this.notes = checkin.getNotes();
        if(checkin.getRoomByRoomId()!=null) {
            this.roomname = checkin.getRoomByRoomId().getRoomName();
        }
        if(checkin.getVipByVipId()!=null) {
            this.vipphone = checkin.getVipByVipId().getPhone();
        }
        this.ispay = checkin.getIspay();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getArrivalDate() {
        return arrivalDate;
    }

    public void setArrivalDate(Date arrivalDate) {
        this.arrivalDate = arrivalDate;
    }

    public String getAccesscardId() {
        return accesscardId;
    }

    public void setAccesscardId(String accesscardId) {
        this.accesscardId = accesscardId;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public String getVipphone() {
        return vipphone;
    }

    public void setVipphone(String vipphone) {
        this.vipphone = vipphone;
    }

    public String getRoomname() {
        return roomname;
    }

    public void setRoomname(String roomname) {
        this.roomname = roomname;
    }

    public String getIspay() {
        return ispay;
    }

    public void setIspay(String ispay) {
        this.ispay = ispay;
    }
}
