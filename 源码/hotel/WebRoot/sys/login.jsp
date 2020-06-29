<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    pageContext.setAttribute("basePath", basePath);
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>一豪酒店管理系统登录登陆</title>
		<meta name="keywords" content="">
		<meta name="description" content="">
		<meta name="viewport" content="width=device-width">
		<link href="${basePath}/static/public/css/base.css" rel="stylesheet" type="text/css">
		<link href="${basePath}/static/public/css/login.css" rel="stylesheet" type="text/css">
	</head>
	<body>
	
	<div class="login">
		<form method="post" id="form">
				<div class="logo"></div>
			    <div class="login_form">
			    	<div class="user">
			        	<input class="text_value" value="" name="username" type="text" id="username" placeholder="用户名">
			            <input class="text_value" value="" name="password" type="password" id="password" placeholder="密码">
			        </div>
			        <input class="button" type="button" id="login"/>
			    </div>
		  </form>
		    <div id="tip"></div>
		    <div class="foot">
			Copyright &copy; 2017.Company name All rights reserved.一豪酒店
			</div>
	</div>
	<div style="display:none"></div>
	</body>
	<script type="text/javascript" src="${basePath}/lib/jquery/1.9.1/jquery.min.js"></script> 
		<script>
	    $("#login").click(function() {
	        var username = $("#username").val();
	        var password = $("#password").val();
	        var type = $("#type").val();
	        if(!!!username) {
	            $("#username").focus();
	            return;
	        }
	
	        if(!!!password) {
	            $("#password").focus();
	            return;
	        }
	
	        $.ajax({
	            type : "post",
	            url : "${basePath}/sys/login/logincheck.action",
	            data : {
	                "username" : username,
	                "password" : password,
	                "type" : type
	            },
	            dataType : "json",
	            success : function(data) {
	                if(data.msg=="success") {
	                    window.location.href="${basePath}/sys/index.jsp";
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
	</script>
</html>
