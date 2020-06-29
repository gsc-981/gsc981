<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
pageContext.setAttribute("basePath", basePath);
%>

<%@ taglib uri="/struts-tags" prefix="s" %>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
	<html>
		<head>
			<meta charset="utf-8">
			<meta name="renderer" content="webkit|ie-comp|ie-stand">
			<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
			<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
			<meta http-equiv="Cache-Control" content="no-siteapp" />
			<link rel="Bookmark" href="${basePath}/favicon.ico" >
			<link rel="Shortcut Icon" href="${basePath}/favicon.ico" />
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
			<!--/meta 作为公共模版分离出去-->
			
			<title>添加用户 - H-ui.admin v3.1</title>
			<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
			<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
		</head>
		<body>
			<article class="page-container">
				<form action="${basePath}/sys/checkin/updateexchange.action" method="post" class="form form-horizontal" id="form-member-add">
					<input name="checkinid" type="hidden" value='<s:property value="#checkinid" />' >
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>房型：</label>
						<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
							<select id="roomtype" name="roomtypeid" class="select">
							</select>
							</span> </div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>可用的房间：</label>
						<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
							<select id="room" name="roomid" class="select" required>
							</select>
							</span> </div>
					</div>
					<div class="row cl">
						<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
							<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
						</div>
					</div>
				</form>
			</article>
			
			<!--_footer 作为公共模版分离出去-->
			<script type="text/javascript" src="${basePath}/lib/jquery/1.9.1/jquery.min.js"></script> 
			<script type="text/javascript" src="${basePath}/lib/layer/2.4/layer.js"></script>
			<script type="text/javascript" src="${basePath}/static/h-ui/js/H-ui.min.js"></script> 
			<script type="text/javascript" src="${basePath}/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->
			
			<!--请在下方写此页面业务相关的脚本-->
			<script type="text/javascript">
			

                $(function(){

                    var roomtype = $("#roomtype");
                    var room = $("#room");
                    $.ajax({
                        type: "post",//请求方式
                        url: "${basePath}/sys/room/getroomtypelist.action",//地址，就是json文件的请求路径
                        dataType: "json",//数据类型可以为 text xml json  script  jsonp
                        success: function(jsondata) {//返回的参数就是 action里面所有的有get和set方法的参数
                            data = jsondata.data;
                            for (var i = 0; i < data.length; i++) {
                                $("<option value='" + data[i].id + "'>" + data[i].roomTypeName + "</option>").appendTo(roomtype)//动态添加Option子项
                                }

                            $.ajax({
                                type: "post",//请求方式
                                url: '${basePath}/sys/room/getonetyperooms.action?roomTypeId='+$("#roomtype").val(),//地址，就是json文件的请求路径
                                dataType: "json",//数据类型可以为 text xml json  script  jsonp
                                success: function(jsondata){//返回的参数就是 action里面所有的有get和set方法的参数
                                    data = jsondata.data;
                                    for(var i=0;i<data.length;i++){
                                        $("<option value='" + data[i].id + "'>" + data[i].roomName + "</option>").appendTo(room)//动态添加Option子项
                                    }
                                }
                            });

                            }
                        });


                    $("#roomtype").change(function(){
                        $("#room").empty();
                        $.ajax({
                            type: "post",//请求方式
                            url: '${basePath}/sys/room/getonetyperooms.action?roomTypeId='+$("#roomtype").val(),//地址，就是json文件的请求路径
                            dataType: "json",//数据类型可以为 text xml json  script  jsonp
                            success: function(jsondata){//返回的参数就是 action里面所有的有get和set方法的参数
                                data = jsondata.data;
                                for(var i=0;i<data.length;i++){
                                    $("<option value='" + data[i].id + "'>" + data[i].roomName + "</option>").appendTo(room)//动态添加Option子项
                                }
                            }
                        });
					});
                });
			</script> 
			<!--/请在上方写此页面业务相关的脚本-->
		</body>
</html>