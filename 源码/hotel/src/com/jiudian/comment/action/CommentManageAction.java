package com.jiudian.comment.action;

import com.jiudian.comment.entity.Comment;
import com.jiudian.comment.service.CommentManageService;
import com.jiudian.core.util.JsonReturn;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.IOException;

@Controller
@ParentPackage("my-default")
@Namespace("/")
@Scope("prototype")
public class CommentManageAction extends ActionSupport{

    @Autowired
    private CommentManageService commentManageService;

    private String vipid;
    private String id;
    private int limit;
    private int page;
    private String content;
    private String keyword;

    /**
     * 显示所有房间类型
     * */
    @Action(value = "/sys/comment/comment",
            interceptorRefs = {@InterceptorRef("MyInterceptor")},
            results = {@Result(name = "index", location = "/comment/comment.jsp")})
    public String index() {
        return "index";
    }

    /**
     * 评论分页返回json
     *
     */
    @Action(value = "/sys/comment/commentlist",
            interceptorRefs = {@InterceptorRef("MyInterceptor")})
    public void findAllcomment() throws IOException {
        String jsonstring = this.commentManageService.commentPagination(page, limit, keyword);
        ServletActionContext.getResponse().setContentType("application/json;charset=utf-8");
        ServletActionContext.getResponse().getWriter().write(jsonstring);
    }

    /**
     * 删除评论
     * */
    @Action(value = "/sys/comment/deletecomment",
            interceptorRefs = {@InterceptorRef("MyInterceptor")})
    public void deletecomment() throws IOException {
        JsonReturn jsonReturn = new JsonReturn();
        try {
            Comment comment = commentManageService.get(id);
            commentManageService.delete(comment);
            jsonReturn.setMsg("success");
        }catch (Exception e) {
            jsonReturn.setMsg("error");
        }finally {
            ServletActionContext.getResponse().setContentType("application/json;charset=utf-8");
            ServletActionContext.getResponse().getWriter().write(jsonReturn.tojson());
        }
    }

    /**
     * 跳转到修改评论页面
     * */
    @Action(value = "/sys/comment/getonecomment",
            interceptorRefs = {@InterceptorRef("MyInterceptor")},
            results = {@Result(name = "getonecomment", location = "/comment/comment-add.jsp")})
    public String getonecomment() {
        Comment comment = commentManageService.get(id);
        ServletActionContext.getContext().put("comment", comment);
        return "getonecomment";
    }

    /**
     * 新增评论
     * */
    @Action(value = "/sys/comment/savecomment",
            interceptorRefs = {@InterceptorRef("defaultStack")},
            results = {@Result(name = "ok", location = "/front/comment-ok.jsp")})
    public String savecomment() {
        commentManageService.savecomment(vipid, content);
        return "ok";
    }

    /**
     * 修改评论
     * */
    @Action(value = "/sys/comment/updatecomment",
            interceptorRefs = {@InterceptorRef("defaultStack")},
            results = {@Result(name = "ok", location = "/sys/ok.jsp")})
    public String updatecomment() {
        commentManageService.updatecomment(id, content);
        return "ok";
    }

    /**
     * 返回最新评论json
     *
     */
    @Action(value = "/sys/comment/newercomment",
            interceptorRefs = {@InterceptorRef("defaultStack")})
    public void newercomment() throws IOException {
        String jsonstring = this.commentManageService.newercomment();
        ServletActionContext.getResponse().setContentType("application/json;charset=utf-8");
        ServletActionContext.getResponse().getWriter().write(jsonstring);
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setVipid(String vipid) {
        this.vipid = vipid;
    }
}
