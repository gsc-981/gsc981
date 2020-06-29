package com.jiudian.bill.vo;

import com.alibaba.fastjson.annotation.JSONField;
import com.jiudian.bill.entity.Bill;

import java.util.Date;

public class BillVo {
    private String id;
    private String days;
    @JSONField(format="yyyy-MM-dd")
    private Date arrivalDate;
    @JSONField(format="yyyy-MM-dd")
    private Date departureDate;
    private String checkinid;
    private Double totalCosts;

    public BillVo(Bill bill) {
        this.id = bill.getId();
        this.days = bill.getDays();
        this.departureDate = bill.getDepartureDate();
        this.checkinid = bill.getCheckinByCheckinId().getId();
        this.totalCosts = bill.getTotalCosts();
        this.arrivalDate = bill.getCheckinByCheckinId().getArrivalDate();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDays() {
        return days;
    }

    public void setDays(String days) {
        this.days = days;
    }

    public Date getDepartureDate() {
        return departureDate;
    }

    public void setDepartureDate(Date departureDate) {
        this.departureDate = departureDate;
    }

    public String getCheckinid() {
        return checkinid;
    }

    public void setCheckinid(String checkinid) {
        this.checkinid = checkinid;
    }

    public Double getTotalCosts() {
        return totalCosts;
    }

    public void setTotalCosts(Double totalCosts) {
        this.totalCosts = totalCosts;
    }

    public Date getArrivalDate() {
        return arrivalDate;
    }

    public void setArrivalDate(Date arrivalDate) {
        this.arrivalDate = arrivalDate;
    }
}
