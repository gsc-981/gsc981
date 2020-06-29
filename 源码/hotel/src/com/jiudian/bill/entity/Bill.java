package com.jiudian.bill.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.jiudian.checkin.entity.Checkin;
import com.jiudian.core.base.BaseEntity;
import com.jiudian.sys.entity.SysUser;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import java.util.Date;
import java.util.Objects;

@Entity
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "bill")
public class Bill extends BaseEntity{
    private static final long serialVersionUID = 1L;

    @Column(name = "departureDate")
    @Temporal(TemporalType.DATE)
    private Date departureDate;

    @Column(name = "days")
    private String days;

    @Column(name = "totalCosts", precision = 2)
    private Double totalCosts;

    @ManyToOne
    @JoinColumn(name = "checkinID", referencedColumnName = "id")
    @JSONField(serialize = false)
    private Checkin checkinByCheckinId;

    @ManyToOne
    @JoinColumn(name = "loginId", referencedColumnName = "id")
    @JSONField(serialize = false)
    private SysUser sysUserBySysUserId;

    public Date getDepartureDate() {
        return departureDate;
    }

    public void setDepartureDate(Date departureDate) {
        this.departureDate = departureDate;
    }

    public String getDays() {
        return days;
    }

    public void setDays(String days) {
        this.days = days;
    }

    public Double getTotalCosts() {
        return totalCosts;
    }

    public void setTotalCosts(Double totalCosts) {
        this.totalCosts = totalCosts;
    }

    public Checkin getCheckinByCheckinId() {
        return checkinByCheckinId;
    }

    public void setCheckinByCheckinId(Checkin checkinByCheckinId) {
        this.checkinByCheckinId = checkinByCheckinId;
    }

    public SysUser getSysUserBySysUserId() {
        return sysUserBySysUserId;
    }

    public void setSysUserBySysUserId(SysUser sysUserBySysUserId) {
        this.sysUserBySysUserId = sysUserBySysUserId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Bill that = (Bill) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
