package com.jiudian.comment.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.jiudian.core.base.BaseEntity;
import com.jiudian.vip.entity.Vip;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import java.util.Date;
import java.util.Objects;

@Entity
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Table(name = "comment")
public class Comment extends BaseEntity{
    private static final long serialVersionUID = 1L;

    @ManyToOne
    @JoinColumn(name = "vipID", referencedColumnName = "id")
    @JSONField(serialize = false)
    private Vip vipByVipId;

    @Column(name = "time")
    @Temporal(TemporalType.TIMESTAMP)
    private Date time;

    @Column(name = "content")
    private String content;

    public Vip getVipByVipId() {
        return vipByVipId;
    }

    public void setVipByVipId(Vip vipByVipId) {
        this.vipByVipId = vipByVipId;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Comment that = (Comment) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
