<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<header class="header">
      <div class="header-top">
        <div class="container">
          <div class="row">
            <div class="col-lg-9 col-md-8 col-sm-8 col-xs-12">
              <div class="header-location"><i class="fa fa-home"></i> <a href="#">东莞市寮步镇文昌路2号</a></div>
              <div class="header-email"><i class="fa fa-envelope-o"></i> <a href="mailto:support@email.com">yuhao@email.com</a></div>
              <div class="header-phone"><i class="fa fa-phone"></i> <a href="#">0769 - 88888888</a></div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
              <div class="header-social pull-right">
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-google-plus"></i></a>
                <a href="#"><i class="fa fa-dribbble"></i></a>
                <a href="#"><i class="fa fa-instagram"></i></a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="header-bottom">
        <nav class="navbar navbar-universal navbar-custom">
          <div class="container">
            <div class="row">
              <div class="col-lg-3">
                <div class="logo"><a href="${basePath}/front/index.jsp" class="navbar-brand page-scroll"><img src="${basePath}/static/front/images/logo/logo.png" alt="logo"></a></div>
              </div>
              <div class="col-lg-9">
                <div class="navbar-header">
                  <button type="button" data-toggle="collapse" data-target=".navbar-main-collapse" class="navbar-toggle"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                </div>
                <div class="collapse navbar-collapse navbar-main-collapse">
                  <ul class="nav navbar-nav navbar-right">
                    <li><a href="${basePath}/front/index.jsp">主页</a></li>
                     <li><a href="${basePath}/front/rooms.jsp">房间</a></li>
                    <li  id="denglu"><a href="${basePath}/front/login.jsp">登录</a></li>
                    <li id="zhuce"><a href="${basePath}/front/signup.jsp">注册</a></li>
                    <li id="dingdan" style="display:none;"><a href="${basePath}/sys/booking/frontFindAll.action">订单查看</a></li>
                    <li id="mingzi" style="display:none;"><a href="javascript:void(0)" onclick="logout()"><%=session.getAttribute("user") %></a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </nav>
      </div>
  <script type="text/javascript">

      function CompareDate(d1,d2)
      {
          return ((new Date(d1.replace(/-/g,"\/"))) > (new Date(d2.replace(/-/g,"\/"))));
      }


      function yuding(obj) {
          //判断是否已登录
          var s="<%=session.getAttribute("user")%>";
          var c = document.getElementById("myfrom");
          var start = $("#time").val();
          var end = $("#time1").val();

          if(s== "null"){
              alert("请先登录");
              window.location.href ="${basePath}/front/login.jsp";
          }else{
              if($("#time").val() =='' || $("#time1").val() ==''){
                  alert('时间不能为空！');
                  $("#time").focus();
                  return false;
              }
              if(!CompareDate(end,start)) {
                  alert('离开时间应该在入住时间之前！');
                  return false;
              }
              c.submit();

          }
      }

      function logout() {
          if(confirm("是否要退出登录")) {
              window.location.href = "${basePath}/front/vipLogout.action";
          }
      }
  </script>
    </header>
