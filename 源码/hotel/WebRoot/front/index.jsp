<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
pageContext.setAttribute("basePath", basePath);
%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>一豪酒店</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="${basePath}/static/front/css/bootstrap.min.css">
      <link rel="stylesheet" href="${basePath}/static/front/css/navs.css">
      <link rel="stylesheet" href="${basePath}/lib/layui/css/layui.css" media="all">
      <link rel="stylesheet" href="${basePath}/static/front/css/font-awesome.min.css">
      <link rel="stylesheet" href="${basePath}/static/front/css/owl.carousel.min.css">
      <link rel="stylesheet" href="${basePath}/static/front/css/bootstrap-datetimepicker.min.css">
      <link rel="stylesheet" href="${basePath}/static/front/css/jquery-ui.min.css">
	  <link rel="stylesheet" href="${basePath}/static/front/css/style.css">
	  <link rel="stylesheet" href="${basePath}/static/front/css/responsive.css">
</head>

<body>
  <!-- main wrapper -->
  <div class="wrapper">
    <!-- header -->
     <%@ include file="baseJsp.jsp" %>
    <!-- /header -->
    <!-- parallax -->
      <section class="bg-parallax parallax-window">
        <div class="overlay"></div>
        <div class="container">
          <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
              <div class="parallax-text">
                <h2 class="parallax_t __white">一豪 · 五星级酒店</h2>
                <h2 class="parallax_t __green">东莞市寮步镇文昌路2号</h2>
                <p>酒店拥有精致客房、一流的会议空间、商务友好设施和非凡的服务，可为宾客提供完美的休闲住宿体验。 客房配有豪华床上用品、高速上网接入、全尺寸桌子和符合人体工学原理的座椅。 您可享受 Asia Bistro 餐厅和 Alto Vino 意式餐厅，也可到 Pulp 酒吧品一杯葡萄酒，还可到 YI Ho 中餐厅体验传统粤菜。</p>
              </div>
            </div>
            <!-- planner-->
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 planner">
              <div class="planner-block">
                <form id="myfrom" action="${basePath}/sys/booking/bookingRoom.action" method="post" class="form-planner form-horizontal">
                  <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                      <div class="form-group">
                        <label>入住时间</label>
                        <input class="form-control __plannerInput" id="time" type="text" name="arrivalDate">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                      <div class="form-group">
                        <label>离开时间</label>
                        <input class="form-control __plannerInput" id="time1" type="text" name="endDate">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                      <div class="form-group">
                          <label>房间类型</label>
                          <div class="theme-select">
                            <select id="roomtype" name="roomTypeId" class="form-control __plannerSelect">
                            </select>
                          </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                      <div class="form-group">
                          <label>人数</label>
                          <div class="theme-select">
                            <select class="form-control __plannerSelect">
                              <option value="">1</option>
                              <option value="">2</option>
                              <option value="">3</option>
                              <option value="">4</option>
                              <option value="">5</option>
                            </select>
                          </div>
                        </div>
                      </div>
                  <input type="hidden" name="vipPhone" value="<%=session.getAttribute("phone")%>">
                  <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                      <div >
                        <input type="button" class="btn btn-default " onclick="yuding(this)" value="&nbsp;&nbsp;&nbsp;&nbsp;预定房间&nbsp;&nbsp;&nbsp;&nbsp;">
                      </div>
                    </div>
                  </div>
                </form>
              </div>
            </div>
            <!-- /planner-->
          </div>
        </div>
    </section>
    <!-- /parallax -->
    <!-- chose best rooms -->
    <section class="best-room">
      <div class="container">
        <div class="title-main">
          <h2 class="h2">一豪酒店<span class="title-secondary">特色客房</span></h2>
        </div>
        <div class="best-room-carousel">
          <ul class="row best-room_ul" id="tsrooms">
            
            
            
          </ul>
        </div>
      </div>
    </section>

    <!-- /choose best rooms -->
    <!-- lux banner parallax -->
      <section class="banner bg-parallax2">
        <div class="overlay"></div>
      <div class="banner-parallax">
        <div class="container">
          <div class="text-center">
            <div class="banner-parallax_raiting">
              <a href="#"><span class="star __selected"></span></a>
              <a href="#"><span class="star __selected"></span></a>
              <a href="#"><span class="star __selected"></span></a>
              <a href="#"><span class="star __selected"></span></a>
              <a href="#"><span class="star __selected"></span></a>
            </div>
            <h2 class="banner-parallax_t">超级奢华套房</h2>
            <div class="banner-parallax_price"><span>￥3000</span> / 天</div>
            <a href="#" class="btn btn-default">预定</a>
          </div>
        </div>
      </div>
    </section>

    <!-- /enjoy our services -->
    <!-- testiomonials -->
    <section class="testimonials">
      <div class="container">
        <div class="title-main"><h2 class="h2">客人评价<span class="title-secondary">People Says About Us</span></h2></div>
        <div id="commentitem" class="owl-carousel">
        </div>
      </div>
    </section>
    <!-- /testiomonials -->
    <!-- map -->
    <!-- /map -->
  <!-- /main wrapper -->
  <!-- footer -->
    <%@ include file="footer.jsp" %>
</div>
  <!-- /footer -->
  <!-- Scripts -->

  <script id="commentshow" type="text/html">
    <div class="item">
      <div class="testimonials-block_i">
        <div class="testimonials-block_t">完美的 <span>体验!</span></div>
        <p>{{d.content}}</p>
      </div>
      <div class="testimonials-block_user">
        <div class="user_img"><img src="${basePath}/static/front/images/testimonials/mila.png" alt=""></div>
        <div class="user_n">{{d.vipName}}</div>
      </div>
    </div>
  </script>

  <script id="roomtypeshow" type="text/html">
    <li class='col-lg-4 col-md-4 col-sm-6 col-xs-12 best-room_li'>
      <div class='best-room_img'><a href='${basePath}/sys/showroom/show.action?id={{d.id}}'><img src='${basePath}/upload/{{d.roomTypeUrl}}'></a>
        <div class='best-room_overlay'>
          <div class='overlay_icn'><a href='${basePath}/sys/showroom/show.action?id={{d.id}}'></a></div>
          </div> </div> <div class='best-room-info'><div class='best-room_t'><a href='${basePath}/sys/showroom/show.action?id={{d.id}}'>{{d.roomTypeName}}</a></div>
        <div class='best-room_desc'>{{d.roomTypeDescription}}</div>
        <div class='best-room_price'><span>{{d.price}}</span> / 天 </div></div></li>
  </script>

  <script type="text/javascript" src="${basePath}/static/front/js/jquery.min.js"></script>
  <script type="text/javascript" src="${basePath}/lib/layui/layui.all.js"></script>
  <script type="text/javascript" src="${basePath}/static/front/js/owl.carousel.min.js"></script>
  <script type="text/javascript" src="${basePath}/static/front/js/tether.min.js"></script>
  <script type="text/javascript" src="${basePath}/static/front/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="${basePath}/static/front/js/jquery-ui.min.js"></script>
  <script type="text/javascript" src="${basePath}/static/front/js/moment.min.js"></script>
  <script type="text/javascript" src="${basePath}/static/front/js/jquery.smartmenus.js"></script>
  <script type="text/javascript" src="${basePath}/static/front/js/jquery.parallax.min.js"></script>
  <script type="text/javascript" src="${basePath}/static/front/js/jquery.shuffle.min.js"></script>
  <script type="text/javascript" src="${basePath}/static/front/js/main.js"></script>

  <script type="text/javascript">

      $('.owl-carousel').owlCarousel({
          loop:true,
          margin:30,
          nav:false,
          autoplay:true,
          autoplayTimeout:6500,
          smartSpeed:1200,
          autoHeight: true,
          responsive:{
              0:{
                  items:1
              },
              600:{
                  items:2
              },
              1000:{
                  items:2
              }
          }
      });


      layui.use('laytpl', function(){
          var laytpl = layui.laytpl;
          $.ajax({
              type: "post",//请求方式
              url: "${basePath}/sys/comment/newercomment.action",//地址，就是json文件的请求路径
              dataType: "json",//数据类型可以为 text xml json  script  jsonp
              success: function(jsondata) {//返回的参数就是 action里面所有的有get和set方法的参数
                  data = jsondata.data;
                  for (var i = 0; i < 5 && i < data.length; i++) {
                      var getTpl = commentshow.innerHTML;
                      laytpl(getTpl).render(data[i], function(html){
                          $('.owl-carousel').owlCarousel('add', html).owlCarousel('update');
                          //$("#commentitem").append(html);
                      });
                  }
              }

          });
      });


      layui.use('laytpl', function(){
          var laytpl = layui.laytpl;
          var roomtype = $("#roomtype");
          $.ajax({
              type: "post",//请求方式
              url: "${basePath}/sys/room/getroomtypelist.action",//地址，就是json文件的请求路径
              dataType: "json",//数据类型可以为 text xml json  script  jsonp
              success: function(jsondata) {//返回的参数就是 action里面所有的有get和set方法的参数
                  data = jsondata.data;
                  for (var i = 0; i < data.length; i++) {
                      $("<option value='" + data[i].id + "'>" + data[i].roomTypeName + "</option>").appendTo(roomtype)//动态添加Option子项
                      if (data[i].roomTypeUrl === undefined) {
                          data[i].roomTypeUrl = "default.JPG";
                      }
                      var getTpl = roomtypeshow.innerHTML;
                      laytpl(getTpl).render(data[i], function(html){
                          $("#tsrooms").append(html);
                      });
                  }
              }

          });
      });


      layui.use('laydate', function() {
          var laydate = layui.laydate;
          laydate.render({
              min: 0,
              max: 30,
              elem: '#time'

          });
      });

      layui.use('laydate', function() {
          var laydate = layui.laydate;
          laydate.render({
              min: 0,
              max: 60,
              elem: '#time1'

          });
      });


/*      function initcomment() {
          $("#commentitem").owlCarousel({
              items:2,
              margin:30,
              loop:true,
              autoplay:true,
              autoplayTimeout:5000,
          });
      }*/
  </script>


  <!-- /Scripts -->
</body>
</html>








