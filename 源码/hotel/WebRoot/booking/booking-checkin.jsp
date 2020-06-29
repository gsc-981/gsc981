<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
pageContext.setAttribute("basePath", basePath);
%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="S" uri="/struts-tags" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="renderer" content="webkit|ie-comp|ie-stand"/>
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
		<title>预定管理</title>
	</head>
	<body>
		<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 用户管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
		<div class="page-container">
			<div class="mt-20">
			<table class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th width="25"><input type="checkbox" name="" value=""></th>
						<th width="80">ID</th>
						<th width="100">用户名</th>
						<th width="40">性别</th>
						<th width="90">手机</th>
						<th width="150">身份证</th>
						<th width="">会员等级</th>
						<th width="">会员积分</th>
						<th width="">预定时间</th>
						<th width="">预计到达时间</th>
						<th width="">预计离开时间</th>
						<th width="100">入住</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="list" var="c">
						<tr class="text-c">
							<td><input type="checkbox" value="1" name=""></td>
							<td><s:property value="#c.id"/> </td>
							<td><u style="cursor:pointer" class="text-primary" onclick="member_show('<s:property value="#c.customerName"/>','${basePath}/sys/custoemr/showMessage.action?id=<s:property value="#c.vipByVipId.customersByVipId[0].id"/>','<s:property value="#c.id"/>','360','400')"><s:property value="#c.vipByVipId.customersByVipId[0].customerName"/></u></td>
							<td><s:property value="#c.vipByVipId.customersByVipId[0].customerSex"/></td>
							<td><s:property value="#c.vipByVipId.phone"/> </td>
							<td><s:property value="#c.vipByVipId.customersByVipId[0].customerCard"/> </td>
							<td><s:property value="#c.vipByVipId.vipLevel"/></td>
							<td><s:property value="#c.vipByVipId.vipCredit"/> </td>
							<td><s:date name="#c.bookingDate" format="yyy-MM-dd" /></td>
							<td><s:date name="#c.arrivalDate" format="yyy-MM-dd" /></td>
							<td><s:date name="#c.endDate" format="yyy-MM-dd" /></td>
							<td class="td-manage"><a title="入住" href="javascript:;" onclick="member_edit('编辑','${basePath}/sys/checkin/bookingcheckin.action?vipphone=<s:property value="#c.vipByVipId.phone" />&roomtypeid=<s:property value="#c.roomTypeByRoomTypeId.id" />&bookingid=<S:property value="#c.id" />','4','400','200')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe604;</i></a> </td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
			</div>
		</div>
		<!--_footer 作为公共模版分离出去-->
		<script type="text/javascript" src="${basePath}/lib/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript" src="${basePath}/lib/layer/2.4/layer.js"></script>
		<script type="text/javascript" src="${basePath}/static/h-ui/js/H-ui.min.js"></script>
		<script type="text/javascript" src="${basePath}/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->
		
		<!--请在下方写此页面业务相关的脚本-->
		<script type="text/javascript" src="${basePath}/lib/My97DatePicker/4.8/WdatePicker.js"></script>
		<script type="text/javascript" src="${basePath}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="${basePath}/lib/laypage/1.2/laypage.js"></script>
		<script type="text/javascript">
		$(function(){
			$('.table-sort').dataTable({
				"aaSorting": [[ 1, "desc" ]],//默认第几个排序
				"bStateSave": true,//状态保存
				"aoColumnDefs": [
				  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
				  {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
				]
			});
			
		});
		/*查看*/
		function member_show(title,url,id,w,h){
			layer_show(title,url,w,h);
		}
		/*编辑*/
		function member_edit(title,url,id,w,h){
			var index = layer.open({
			type: 2,
			area: [w+'px', h +'px'],
			fix: false, //不固定
			maxmin: true,
			shade:0.4,
			title: title,
			content: url,
			end:function()
			{
				location.reload("${basePage}/sys/booking/bookchecking.action");
			}
		});
		layer.full(index)
		}
		</script> 
	</body>
</html>