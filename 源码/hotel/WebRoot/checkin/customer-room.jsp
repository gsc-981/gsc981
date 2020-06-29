<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
pageContext.setAttribute("basePath", basePath);
%>

<%@ taglib uri="/struts-tags" prefix="s" %>
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
		<!--[if IE 6]>
		<script type="text/javascript" src="${basePath}/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
		<script>DD_belatedPNG.fix('*');</script>
		<![endif]-->
		<title>用户查看</title>
	</head>
	<body>
	<s:iterator value="#customers" status="n">
		<div class="cl pd-20" style=" background-color:#5bacb6">
			<div class="text-c">第<s:property value="#n.index+1" />位住客</div>
		</div>
		<div class="pd-20">
			<table class="table">
				<tbody>
				<tr>
					<th class="text-r" width="80">姓名：</th>
					<td><s:property value="%{customerName}"/> </td>
				</tr>
					<tr>
						<th class="text-r" width="80">性别：</th>
						<td><s:property value="%{customerSex}"/> </td>
					</tr>
					<tr>
						<th class="text-r">手机：</th>
						<td><s:property value="%{customerPhone}"/> </td>
					</tr>
					<tr>
						<th class="text-r">地址：</th>
						<td><s:property value="%{customerAddress}"/> </td>
					</tr>
					<tr>
						<th class="text-r">身份证：</th>
						<td><s:property value="%{customerCard}"/> </td>
					</tr>
					<tr>
						<th class="text-r">备注：</th>
						<td><s:property value="%{notes}"/></td>
					</tr>
				</tbody>
			</table>
		</div>
	</s:iterator>
		<!--_footer 作为公共模版分离出去-->
		<script type="text/javascript" src="${basePath}/lib/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript" src="${basePath}/lib/layer/2.4/layer.js"></script>
		<script type="text/javascript" src="${basePath}/static/h-ui/js/H-ui.min.js"></script>
		<script type="text/javascript" src="${basePath}/static/h-ui.admin/js/H-ui.admin.js"></script> 
		<!--/_footer 作为公共模版分离出去-->
		
		<!--请在下方写此页面业务相关的脚本-->
	</body>
</html>