package com.jiudian.core.base;

import java.io.Serializable;
import java.util.List;

public interface BaseService<T> {
    public BaseDao<T> getBaseDao();
    public void save(T t);
    public void delete(T t);
    public void update(T t);
    public void saveOrUpdate(T t);
    public T get(Serializable id);
    public List<T> getAll();
    public void executeHql(String hqlString, Object... values);
    public List<T> findByHql(String hqlString, Object... values);
    public T load(Serializable id);
    public List<T> findByExample(T t);
    public List<T> findBySql(String sqlString, Object... values);
    public void executeSql(String sqlString, Object... values);
    public List<T> pagingBySql(String sqlString, int first, int max, Object... values);
    public Integer rowCount(String tablename);
}
