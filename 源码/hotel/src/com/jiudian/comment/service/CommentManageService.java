package com.jiudian.comment.service;

import com.jiudian.comment.entity.Comment;
import com.jiudian.core.base.BaseService;

public interface CommentManageService extends BaseService<Comment> {
    public String commentPagination(int page, int limit, String keyword);
    public void savecomment(String id, String content);
    public void updatecomment(String id, String content);
    public String newercomment();
}
