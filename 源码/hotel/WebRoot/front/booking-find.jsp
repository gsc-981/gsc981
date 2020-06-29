<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<% pageContext.setAttribute("basePath", basePath); %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>About Us</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="${basePath}/static/front/css/font-awesome.min.css">
      <link rel="stylesheet" href="${basePath}/static/front/css/owl.carousel.min.css">
      <link rel="stylesheet" href="${basePath}/static/front/css/bootstrap-datetimepicker.min.css">
      <link rel="stylesheet" href="${basePath}/static/front/css/jquery-ui.min.css">
  <link rel="stylesheet" href="${basePath}/static/front/css/style.css">
    <style>
        .div1
        {
        
            margin-left: 60px;
            margin-bottom: 20px;
            font-size: 20px;
        }
    </style>
  <link rel="stylesheet" href="${basePath}/static/front/css/responsive.css">
  <link rel="stylesheet" href="${basePath}/lib/layui/css/layui.css" media="all">
</head>
<body>
  <!-- main wrapper -->
  <div class="wrapper">
    <!-- header -->
    <%@ include file="baseJsp.jsp" %>
    <!-- /header -->
    <!-- breadcrumbs -->
    <section class="breadcrumbs" style="background-image: url(${basePath}/static/front/images/breadcrumbs/about.jpg)">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <h1 class="h1">订单查看</h1>
          </div>
          <div class="col-md-6">
            <ol class="breadcrumb">
              <li><a href="#">主页</a><i class="fa fa-angle-right"></i></li>
              <li class="active">订单查看</li>
            </ol>
          </div>
        </div>
      </div>
    </section>
    <!-- /breadcrumbs -->
    <!-- about -->
    <section class="about">
      <div class="container">
        <h2 class="h2">订单查看</h2>
        <div class="row">
            <table class="layui-table">
              <colgroup>
                <col width="150">
                <col width="200">
                <col>
              </colgroup>
              <thead>
                <tr>
                  <th>订单人</th>
                  <th>入住时间</th>
                  <th>离开时间</th>
                  <th>房间类型</th>
                </tr> 
              </thead>
              <tbody>
              <s:iterator value="frontList" var="c">
                <tr>
                  <td><s:property value="#c.vipByVipId.customersByVipId[0].customerName"/></td>
                  <td><span><s:date name="#c.arrivalDate" format="yyy-MM-dd" /></td>
                  <td><s:date name="#c.endDate" format="yyy-MM-dd" /></td>
                  <td><s:property value="#c.roomTypeByRoomTypeId.roomTypeName"/></td>
                </tr>
               </s:iterator>
              </tbody>
            </table>
        </div>
      </div>
    </section>
    <!-- /about -->
    <!-- Our mission -->
    <!-- /testiomonials -->
  <!-- footer -->
    <%@ include file="footer.jsp" %>
</div>
  <!-- /footer -->
  <!-- Scripts -->
  <script type="text/javascript" src="${basePath}/static/front/js/jquery.min.js"></script>
  <script type="text/javascript" src="${basePath}/static/front/js/tether.min.js"></script>
  <script type="text/javascript" src="${basePath}/static/front/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="${basePath}/static/front/js/jquery-ui.min.js"></script>
  <script type="text/javascript" src="${basePath}/static/front/js/moment.min.js"></script>
  <script type="text/javascript" src="${basePath}/static/front/js/jquery.smartmenus.js"></script>
  <script type="text/javascript" src="${basePath}/static/front/js/jquery.parallax.min.js"></script>
  <script type="text/javascript" src="${basePath}/static/front/js/jquery.shuffle.min.js"></script>
  <script type="text/javascript" src="${basePath}/static/front/js/owl.carousel.min.js"></script>
  <script type="text/javascript" src="${basePath}/static/front/js/main.js"></script>
  <!-- /Scripts -->
</body>
</html>


