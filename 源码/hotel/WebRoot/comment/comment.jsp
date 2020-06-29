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

<title>评论管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 评论管理 <span class="c-gray en">&gt;</span> 评论管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="demoTable">
		搜索评论：
		<div class="layui-inline">
			<input class="layui-input" name="keyword" id="demoReload" autocomplete="off">
		</div>
		<button class="layui-btn" data-type="reload">搜索</button>
	</div>
	<div class="mt-20">
		<table id="comment" lay-filter="test"></table>
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
	<a class="layui-btn layui-btn-mini" lay-event="edit">编辑</a>
	<a class="layui-btn layui-btn-danger layui-btn-mini" lay-event="del">删除</a>
</script>

<script type="text/html" id="usernameTpl">
	<a onclick="member_show('','${basePath}/sys/custoemr/showMessage.action?id={{ d.vipID }}','','360','400')" class="layui-table-link">{{ d.vipName }}</a>
</script>

<script type="text/javascript">
    layui.use('table', function(){
        var table = layui.table
            ,form = layui.form;
        table.render({
            elem: '#comment'
            ,height: 480
            ,url: '${basePath}/sys/comment/commentlist.action' //数据接口
            ,page: true //开启分页
            ,id: 'commenttable'
            ,cols: [[ //表头
                {field: 'id', title: 'ID', width:'10%', sort: true, unresize:true}
                ,{field: 'vipID', title: '会员信息', width:'10%', sort:true, templet: '#usernameTpl', unresize:true}
                ,{field: 'time', title: '评论时间', width:'20%', sort:true, unresize:true}
                ,{field: 'content', title: '评论内容', width:'40%', unresize:true}
                ,{ title: '评论操作', width:'20%', toolbar: '#bar'}
            ]]
        });

        //监听工具条
        table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            if(layEvent === 'detail'){ //查看
                //do somehing
            } else if(layEvent === 'del'){ //删除
                layer.confirm('真的删除行么', function(index){
                    //向服务端发送删除指令
                    $.ajax({
                        type : "post",
                        url : "${basePath}/sys/comment/deletecomment.action?id="+data.id,
                        dataType : "json",
                        success : function(data) {
                            if(data.msg=="success") {
                                alert("删除成功！");
                                location.replace(location.href);
                            }
                            else {
                                alert("删除失败！")
                            }
                        },
                        error : function() {
                            alert("系统异常请稍后重试");
                        }
                    });
                });
            } else if(layEvent === 'edit'){ //编辑
                //do something
                layer_show("评论修改", "${basePath}/sys/comment/getonecomment.action?id="+data.id, "500", "300");
            }
        });

        var $ = layui.$, active = {
            reload: function(){
                var demoReload = $('#demoReload');

                table.reload('commenttable', {
                    where: {
                        keyword: demoReload.val()
                    }
                });
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

    });


    function member_show(title,url,id,w,h){
        layer_show(title,url,w,h);
    }
</script>
</body>
</html>