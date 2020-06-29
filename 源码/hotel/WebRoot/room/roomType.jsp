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
<link rel="stylesheet" href="${basePath}/lib/layui/css/layui.css" media="all">
<!--[if IE 6]>
<script type="text/javascript" src="${basePath}/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>产品分类</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 房间管理 <span class="c-gray en">&gt;</span> 房型管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<a class="btn btn-primary-outline radius" href="javascript:;" onClick="addroomtype()">增加</a>
	<table class="table table-border table-bordered table-hover radius">
	<thead>
	<tr>
		<th>编号</th>
		<th>类型</th>
		<th>描述</th>
		<th>图片</th>
		<th>操作</th>
	</tr>
	</thead>
	<tbody>
	<s:iterator value="#roomtypes" status="n">
		<tr>
			<th><s:property value="#n.index+1" /></th>
			<td><s:property value="roomTypeName" /></td>
			<td><s:property value="roomTypeDescription" /></td>
			<td><a href="javascript:;" class="preview" style="display:block" data-width="400" data-height="300" data-src="${basePath}/upload/<s:property value="roomTypeUrl" default="default.JPG" />" >
				<img class="img-responsive avatar size-XXXL" src="${basePath}/upload/<s:property value="roomTypeUrl" default="default.JPG" />" />
			</a></td>
			<td>
				<a title="编辑" href="javascript:;" onClick="updateroomtype('<s:property value="id" />')" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
				<a title="删除" href="javascript:;" onClick="deleteroomtype('<s:property value="id" />')" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
			</td>
		</tr>
	</s:iterator>
	</tbody>
	</table>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${basePath}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${basePath}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${basePath}/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${basePath}/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript">
	//图片预览效果
    $(".preview").Huipreview();

	//删除房间类型
	function deleteroomtype(id) {
            layer.confirm('删除须谨慎，确认要删除吗？',function(index){
            $.ajax({
                type : "post",
                url : "${basePath}/sys/room/deleteroomtype.action?id="+id,
                dataType : "json",
                success : function(data) {
                    if(data.msg=="success") {
                        alert("删除成功！")
                        window.location.href="${basePath}/sys/room/roomtype.action";
                    }
                    else {
                        layer.alert("删除失败！")
                    }
                },
                error : function() {
                    layer.alert("系统异常请稍后重试");
                }
            });
        });
    }

    //修改房间类型
    function updateroomtype(id) {
        layer_show("房型修改", "${basePath}/sys/room/getoneroomtype.action?id="+id, "700", "350");
    }

    //修改房间类型
    function addroomtype() {
        layer_show("新增房型", "${basePath}/sys/room/addroomtype.action", "700", "350");
    }
</script>
</body>
</html>