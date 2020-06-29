<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
pageContext.setAttribute("basePath", basePath);
%>

<!DOCTYPE html>
<html lang="en">
    <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <title>一豪酒店</title>
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="${basePath}/static/front/css/bootstrap.min.css">
        <link rel="stylesheet" href="${basePath}/static/front/css/navs.css">
        <link rel="stylesheet" href="${basePath}/static/front/css/font-awesome.min.css">
        <link rel="stylesheet" href="${basePath}/static/front/css/owl.carousel.min.css">
        <link rel="stylesheet" href="${basePath}/static/front/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" href="${basePath}/static/front/css/jquery-ui.min.css">
        <link rel="stylesheet" href="${basePath}/static/front/css/style.css">
        <link rel="stylesheet" href="${basePath}/static/front/css/responsive.css">
      <link type="text/css" rel="stylesheet" href="${basePath}/static/front/css/login.css" media="screen" />
    </head>
    <body>
        <div class="wrapper">
            <%@ include file="baseJsp.jsp" %>
            <section>
                <div>
                    <div style="width:600px;margin:30px auto;">
                        <form action="${basePath}/sys/customer/save.action" method="post">
                            <h3 style="font-size:20px;">姓名:</h3>
                            <input type="text" class="form-control" style="margin:10px 0px;" name="customerName" id="customerName" required="required">
                            <h3 style="font-size:20px;">性别:</h3>
                            <select class="form-control" name="customerSex" required="required">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                            <h3 style="font-size:20px;">电话号码:</h3>
                            <input type="text" class="form-control" style="margin:10px 0px;" onblur="check('phone')" id="phone" name="customerPhone" required="required">
                            <h3 style="font-size:20px;">密码:</h3>
                            <input type="text" class="form-control" style="margin:10px 0px;" onblur="check('phone')" name="password" required="required">
                            <h3 style="font-size:20px;">生日:</h3>
                            <input type="text" class="form-control" style="margin:10px 0px;" name="birthday" id="birthday" required="required">
                            <h3 style="font-size:20px;">身份证:</h3>
                            <input type="text" class="form-control" style="margin:10px 0px;" name="customerCard" id="idcard" onblur="check('idcard')" required="required">
                            <h3 style="font-size:20px;">地址:</h3>
                            <input type="text" class="form-control" style="margin:10px 0px;" name="customerAddress" required="required">
                            <input type="submit" class="btn btn-default " value="&nbsp;&nbsp;&nbsp;&nbsp;注册&nbsp;&nbsp;&nbsp;&nbsp;" style="width:600px;margin:10px 0px;">
                        </form>
                    </div>
                </div>
            </section>
            <%@ include file="footer.jsp" %>
        </div>
    </body>
    <script type="text/javascript" src="${basePath}/static/layDate/layDate/laydate/laydate.js"></script>
    <script type="text/javascript">
    	laydate.render({
			  elem: '#birthday' 
			});
    	
    	function check(action)
    	{
    		if(action=="phone")
    			{
    				phone = document.getElementById("phone");
    				if(phone.value.length!=11)
    					{
    						phone.value = "";
    						alert("请输入11位手机号");
                            document.getElementById("customerName").focus();
    					}
    			}
    		if(action=="idcard")
			{
				IdCard = document.getElementById("idcard");
				if(IdCard.value.length==15){

                }
                else if(IdCard.value.length==18){

                }
                else {
                    console.log(IdCard.value.length);
                    IdCard.value = "";
                    alert("请输入15位或18位身份证");
                    document.getElementById("customerName").focus();
                }
			}
    	}
    </script>
</html>