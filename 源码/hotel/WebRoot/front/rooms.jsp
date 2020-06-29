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
  <title>Best Rooms</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="${basePath}/static/front/css/bootstrap.min.css">
  <link rel="stylesheet" href="${basePath}/static/front/css/navs.css">
  <link rel="stylesheet" href="${basePath}/static/front/css/font-awesome.min.css">
  <link rel="stylesheet" href="${basePath}/static/front/css/owl.carousel.min.css">
  <link rel="stylesheet" href="${basePath}/static/front/css/bootstrap-datetimepicker.min.css">
  <link rel="stylesheet" href="${basePath}/static/front/css/jquery-ui.min.css">
  <link rel="stylesheet" href="${basePath}/static/front/css/style.css">
  <link rel="stylesheet" href="${basePath}/static/front/css/responsive.css">

  <script type="text/javascript" src="${basePath}/static/front/js/jquery.min.js"></script>
  <script type="text/javascript" src="${basePath}/lib/layui/layui.all.js"></script>

  <script id="roomtypeshow" type="text/html">
    <div data-groups="[&quot;{{d.group}}&quot;]" class="col-lg-4 col-md-4 col-sm-6 col-xs-12 best-room_li">
      <div class="best-room_img">
        <a href="#"><img src="${basePath}/upload/{{d.roomTypeUrl}}" alt=""></a>
        <div class="best-room_overlay">
          <div class="overlay_icn"><a href="${basePath}/sys/showroom/show.action?id={{d.id}}"></a></div>
        </div>
      </div>
      <div class="best-room-info">
        <div class="best-room_t"><a href="${basePath}/sys/showroom/show.action?id={{d.id}}">{{d.roomTypeName}}</a></div>
        <div class="best-room_desc">{{d.roomTypeDescription}}</div>
        <div class="best-room_price">
          <span>¥{{d.price}}</span> / 晚
        </div>
        <div class="best-room_footer">
          <div class="footer_el __bed"><i class="fa fa-bed"></i> 2</div>
          <div class="footer_el __ppl"><i class="fa fa-user"></i> 4</div>
          <div class="footer_el __wifi">Free WiFi</div>
          <div class="footer_el __area">60 sqm</div>
          <div class="clearfix"></div>
        </div>
      </div>
    </div>
  </script>

  <script type="text/javascript">

      layui.use('laytpl', function(){
          var laytpl = layui.laytpl;
          group = new Array("economic", "standard", "double", "lux");
          $.ajax({
              type: "post",//请求方式
              url: "${basePath}/sys/room/getroomtypelist.action",//地址，就是json文件的请求路径
              dataType: "json",//数据类型可以为 text xml json  script  jsonp
              success: function(jsondata) {//返回的参数就是 action里面所有的有get和set方法的参数
                  data = jsondata.data;
                  for (var i = 0; i < 9 && i < data.length; i++) {
                      if (data[i].roomTypeUrl === undefined) {
                          data[i].roomTypeUrl = "default.JPG";
                      }
                      data[i].group = group[i % 4];
                      var getTpl = roomtypeshow.innerHTML
                          ,view = document.getElementById("grid");
                      laytpl(getTpl).render(data[i], function(html){
                          $("#grid").append(html);
                      });
                  }
              }

          });
      });

  </script>

	</head>
<body>
  <!-- main wrapper -->
  <div class="wrapper">
    <!-- header -->
    <%@ include file="baseJsp.jsp" %>
    <!-- /header -->
    <!-- breadcrumbs -->
    <section class="breadcrumbs" style="background-image: url(${basePath}/static/front/images/breadcrumbs/best-room.jpg)">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <h1 class="h1">选择房间</h1>
          </div>
          <div class="col-md-6">
            <ol class="breadcrumb">
              <li><a href="#">主页</a><i class="fa fa-angle-right"></i></li>
              <li class="active">房间</li>
            </ol>
          </div>
        </div>
      </div>
    </section>
    <!-- /breadcrumbs -->
    <!-- chose best rooms -->
    <section class="gallery best-room">
      <div class="container">
        <h2 class="h2">选择适合你的房型</h2>
            <ul class="portfolio-sorting">
              <li><a href="#" data-group="all" class="active">全部</a></li>
              <li><a href="#" data-group="double">双人</a></li>
              <li><a href="#" data-group="lux">奢华</a></li>
              <li><a href="#" data-group="standard">标准</a></li>
              <li><a href="#" data-group="economic">经济</a></li>
            </ul>
      <div class="container best-room-carousel">
        <div id="grid" class="row best-room_ul best-rooms-isotope-page">
          </ul>
        </div>
      </div>
    </section>
    <!-- /choose best rooms -->
  <!-- footer -->
    <%@ include file="footer.jsp" %>
</div>
  <!-- /footer -->
  <!-- Scripts -->



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
