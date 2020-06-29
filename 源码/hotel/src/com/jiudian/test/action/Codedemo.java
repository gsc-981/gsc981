/*
package com.jiudian.test.action;

import com.jiudian.room.entity.Room;

import java.util.List;

public class Codedemo {
    private void demo() {
        List<Room> alllist = getAll();
        */
/**
         *通过sql查询
         **//*

        List<Room> findlist = findBySql("SELECT * FROM room Order By roomName limit 0,10");
        */
/**
         *使用索引占位符为?0 ?1 ?2 等等。
         **//*

        List<Room> findlist = findBySql("SELECT * FROM room Order By ?0 limit ?1,?2", "roomName",0,2);
        */
/**
         *分页，第一个参数为sql语句，第二个为从第几条开始，第三个为查询多少条数据，之后的为要传入占位符的参数
         **//*

        List<Room> findlist = pagingBySql("SELECT * FROM room Order By ?0", 5,3,"roomName");
        */
/**
         *需要执行的sql语句
         **//*

        executeSql("UPDATE room SET roomPrice=288 WHERE roomName=?0", "'0301'");
    }
}
*/
