package com.jiudian.comment.dao;

import com.jiudian.comment.entity.Comment;
import com.jiudian.core.base.BaseDao;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentDao extends BaseDao<Comment> {
    public List<Comment> keywordFind(int page, int limit, String keyword) {
        List<Comment> comments =
                pagingBySql("SELECT * FROM comment WHERE LOCATE(?0, `content`)>0",
                        (page-1)*10, limit, keyword);
        return comments;
    }
}
