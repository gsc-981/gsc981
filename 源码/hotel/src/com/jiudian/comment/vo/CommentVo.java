package com.jiudian.comment.vo;

import com.alibaba.fastjson.annotation.JSONField;
import com.jiudian.comment.entity.Comment;
import com.jiudian.customer.entity.Customer;

import java.util.Date;
import java.util.List;

public class CommentVo {
    private String id;
    @JSONField(format="yyyy-MM-dd HH:mm:ss")
    private Date time;
    private String vipName;
    private String vipID;
    private String content;

    public CommentVo(Comment comment) {
        id = comment.getId();
        time = comment.getTime();
        Customer customer = comment.getVipByVipId().getCustomersByVipId().iterator().next();
        vipID = customer.getId();
        vipName = customer.getCustomerName();
        content = comment.getContent();
    }

    public CommentVo(String id, Date time, String vipName, String vipID, String content) {
        this.id = id;
        this.time = time;
        this.vipName = vipName;
        this.vipID = vipID;
        this.content = content;
    }

    public CommentVo() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getVipName() {
        return vipName;
    }

    public void setVipName(String vipName) {
        this.vipName = vipName;
    }

    public String getVipID() {
        return vipID;
    }

    public void setVipID(String vipID) {
        this.vipID = vipID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
