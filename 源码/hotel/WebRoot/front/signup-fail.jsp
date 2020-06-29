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
    <title>注册失败</title>
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
                    <h1 class="h1">注册失败</h1>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li><a href="#">注册</a><i class="fa fa-angle-right"></i></li>
                        <li class="active">注册失败</li>
                    </ol>
                </div>
            </div>
        </div>
    </section>
    <!-- /breadcrumbs -->
    <!-- about -->
    <section class="about">
        <div class="container">
            <h2 class="h2">注册失败</h2>
            <div class="row">
                <div style="text-align:center;width:300px;margin:-30px auto;">
                    <span style="color:#be0000;font-size:60px;">×</span>
                    <div>该手机号或身份证号已经被注册</div>
                </div>
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
