<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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

<title>账单管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 账单管理 <span class="c-gray en">&gt;</span> 账单管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="mt-20">
		<table id="bill" lay-filter="test"></table>
	</div>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${basePath}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${basePath}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${basePath}/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${basePath}/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->

<script type="text/javascript" src="${basePath}/lib/layui/layui.js"></script>

<script type="text/html" id="usernameTpl">
	<a onclick="detailsshow('${basePath}/sys/checkin/checkindetails.action?checkinid={{ d.checkinid }}')" class="layui-table-link">点击查看</a>
</script>

<script type="text/javascript">
    layui.use('table', function(){
        var table = layui.table
            ,form = layui.form;
        table.render({
            elem: '#bill'
            ,height: 480
            ,url: '${basePath}/sys/bill/findBill.action' //数据接口
            ,page: true //开启分页
            ,id: 'checkintable'
            ,cols: [[ //表头
                {field: 'id', title: 'ID', width:'10%', sort: true, unresize:true}
                ,{field: 'arrivalDate', title: '到达日期', width:'20%', sort:true, unresize:true}
                ,{field: 'departureDate', title: '离开日期', width:'20%', sort:true, unresize:true}
                ,{field: 'days', title: '入住天数', width:'20%', sort: true, unresize:true}
                ,{ title: '入住信息', width:'20%', sort:true, templet: '#usernameTpl', unresize:true}
                ,{field: 'totalCosts', title: '总共花费', width:'10%', sort:true, unresize:true}
            ]]
        });
    });


    function detailsshow(title){
        layer.open({
            type: 2,
            area: ['100%', '100%'],
            title: "查看详情",
            content: title,
            anim: 5,
        });
    }
</script>
</body>
</html>