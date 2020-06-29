﻿<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	pageContext.setAttribute("basePath", basePath);
%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${basePath}/lib/html5shiv.js"></script>
<script type="text/javascript" src="${basePath}/lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${basePath}/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${basePath}/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${basePath}/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${basePath}/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${basePath}/static/h-ui.admin/css/style.css" />
<link rel="stylesheet" type="text/css" href="${basePath}/lib/layui/css/layui.css" media="all" />
<!--[if IE 6]>
<script type="text/javascript" src="${basePath}/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->

<title>正在入住</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 入住管理 <span class="c-gray en">&gt;</span> 正在入住 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="mt-20">
		<table id="checkin" lay-filter="test"></table>
	</div>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${basePath}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${basePath}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${basePath}/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${basePath}/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->

<script type="text/javascript" src="${basePath}/lib/layui/layui.js"></script>

<script type="text/html" id="bar">
	<a class="layui-btn layui-btn-mini" lay-event="edit">换房</a>
	<a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="pay">结账</a>
</script>

<script type="text/html" id="usernameTpl">
	<a onclick="member_show('','${basePath}/sys/checkin/getOneRoomCustomers.action?id={{ d.id }}','','360','400')" class="layui-table-link">点击查看</a>
</script>

<script type="text/javascript">
    layui.use('table', function(){
        var table = layui.table
            ,form = layui.form;
        table.render({
            elem: '#checkin'
            ,height: 480
            ,url: '${basePath}/sys/checkin/checkininglist.action' //数据接口
            ,page: true //开启分页
            ,id: 'checkintable'
            ,cols: [[ //表头
                {field: 'id', title: 'ID', width:'10%', sort: true, unresize:true}
				,{field: 'accesscardId', title: '房卡号', width:'10%', sort: true, unresize:true}
                ,{field: 'roomname', title: '房间名称', width:'10%', sort:true, unresize:true}
                ,{ title: '入住信息', width:'10%', sort:true, templet: '#usernameTpl', unresize:true}
                ,{field: 'arrivalDate', title: '入住时间', width:'15%', sort:true, unresize:true}
                ,{field: 'vipphone', title: '会员号码', width:'15%', sort:true, unresize:true}
                ,{field: 'notes', title: '备注', width:'10%', unresize:true}
                ,{ title: '入住管理', width:'20%', toolbar: '#bar'}
            ]]
        });

        //监听工具条
        table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            if(layEvent === 'detail'){ //查看
                //do somehing
            } else if(layEvent === 'pay'){ //删除
                layer.confirm('真的要结算吗', function(index){
                        $.ajax({
                            type : "post",
                            url : "${basePath}/sys/bill/payBill.action",
                            data : {
                                "checkinid" : data.id,
                            },
                            dataType : "json",
                            success : function(data) {
                                if(data.msg=="success") {
                                    layer.alert("入住日期:"+data.data[0].arrivalDate+"<br />离开日期:"+data.data[0].departureDate+"<br />入住天数:"+data.data[0].days+"<br />需要支付:"+data.data[0].totalCosts,function () {
                                        window.location.href="${basePath}/sys/bill/bill.action";
                                    })
                                }
                                else {
                                    alert("用户名密码错误！")
                                }
                            },
                            error : function() {
                                alert("系统异常请稍后重试");
                            }
                        })
                });
            } else if(layEvent === 'edit'){ //编辑
                //do something
                layer_show("入住换房", "${basePath}/sys/checkin/exchange.action?checkinid="+data.id, "500", "300");
            }
        });

    });


    function member_show(title,url,id,w,h){
        layer_show(title,url,w,h);
    }
</script>
</body>
</html>