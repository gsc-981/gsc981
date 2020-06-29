package com.jiudian.customer.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.jiudian.checkin.entity.CustomerCheckin;
import com.jiudian.core.base.BaseEntity;
import com.jiudian.vip.entity.Vip;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "customer")
public class Customer extends BaseEntity {
    private static final long serialVersionUID = 1L;

    @Column(name = "customerName")
    private String customerName;

    @Column(name = "customerPhone")
    private String customerPhone;

    @Column(name = "customerAddress")
    private String customerAddress;

    @Column(name = "customerCard", unique = true)
    private String customerCard;

    @Column(name = "customerSex")
    private String customerSex;

    @Column(name = "notes")
    private String notes;

    @ManyToOne
    @JoinColumn(name = "vipID", referencedColumnName = "id")
    @JSONField(serialize = false)
    private Vip vipByVipId;

    @OneToMany(mappedBy = "customerByCustomerId")
    @JSONField(serialize = false)
    private Collection<CustomerCheckin> customerCheckinsById;

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public String getCustomerCard() {
        return customerCard;
    }

    public void setCustomerCard(String customerCard) {
        this.customerCard = customerCard;
    }

    public String getCustomerSex() {
        return customerSex;
    }

    public void setCustomerSex(String customerSex) {
        this.customerSex = customerSex;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public Vip getVipByVipId() {
        return vipByVipId;
    }

    public void setVipByVipId(Vip vipByVipId) {
        this.vipByVipId = vipByVipId;
    }

    public Collection<CustomerCheckin> getCustomerCheckinsById() {
        return customerCheckinsById;
    }

    public void setCustomerCheckinsById(Collection<CustomerCheckin> customerCheckinsById) {
        this.customerCheckinsById = customerCheckinsById;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Customer that = (Customer) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

}
