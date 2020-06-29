<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
pageContext.setAttribute("basePath", basePath);
%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Best Room Detail</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="${basePath}/static/front/css/bootstrap.min.css">
  <link rel="stylesheet" href="${basePath}/static/front/css/navs.css">
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
    <!-- breadcrumbs -->
    <section class="breadcrumbs" style="background-image: url(${basePath}/static/front/images/breadcrumbs/best-room.jpg)">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <h1 class="h1">房间细节</h1>
          </div>
          <div class="col-md-6">
            <ol class="breadcrumb">
              <li><a href="#">主页</a><i class="fa fa-angle-right"></i></li>
              <li><a href="#">房间</a><i class="fa fa-angle-right"></i></li>
              <li class="active">房间细节</li>
            </ol>
          </div>
        </div>
      </div>
    </section>
    <!-- /breadcrumbs -->
    <!-- room details-->
    <section class="room-detail">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="row reservation-top">
              <div class="module __reservation">
                <div class="module-block">
                  <form id="myfrom" action="${basePath}/sys/booking/bookingRoom.action" method="post" class="form-planner form-horizontal">
                      <div class="col-md-3 col-xs-12">
                        <div class="form-group">
                            <label>入住时间</label>
                            <input class="form-control __plannerInput" name="arrivalDate" id="time" type="text" placeholder="2017-12-25" required>
                        </div>
                      </div>
                    <div class="col-md-3 col-xs-12">
                      <div class="form-group">
                        <label>离开时间</label>
                        <input class="form-control __plannerInput" name="endDate" id="time1" type="text" placeholder="2017-12-26" required>
                      </div>
                    </div>
                      <div class="col-md-2 col-xs-6">
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
                    <input type="hidden" name="roomTypeId" value="<%=request.getParameter("id")%>">
                      <div class="col-md-2 col-xs-12">
                        <div class="form-group">
                            <input type="button" onclick="yuding(this)" class="btn btn-default wizzard-search-btn" value="预定" />
                        </div>
                      </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-12 marg50"><h2 class="h2">房间类型:<s:property value="roomType.roomTypeName" /></h2></div>
          <div class="col-lg-6 col-md-6 col-sm-6">
              <div class="owl-carousel owl_gallery">
                <div class="item"><img class="img-responsive" src="${basePath}/upload/<s:property value="roomType.roomTypeUrl" default="default.JPG"/>">
                </div>

              </div>
          </div>
          <div class="col-lg-6 col-md-6">
            <div class="room-detail_overview">
              <table class="simple">
                <tr>
                  <td><strong>价格:</strong></td>
                  <td><span>￥ <s:property value="roomType.price"  /></span> / 天</td>
                </tr>
                <tr>
                  <td><strong>面积:</strong></td>
                  <td>150m²</td>
                </tr>
                <tr>
                  <td><strong>床:</strong></td>
                  <td>2 / 张</td>
                </tr>
                <tr>
                  <td><strong>最多容纳人数:</strong></td>
                  <td>5 / 人</td>
                </tr>
                <tr>
                  <td><strong>Wi-Fi:</strong></td>
                  <td>有</td>
                </tr>
                <tr>
                  <td><strong>客房服务:</strong></td>
                  <td>有</td>
                </tr>
                <tr>
                  <td><strong>早餐:</strong></td>
                  <td>有</td>
                </tr>
                <tr>
                  <td><strong>洗衣服务:</strong></td>
                  <td>有</td>
                </tr>
                <tr>
                  <td><strong>机场接送:</strong></td>
                  <td>有</td>
                </tr>
              </table>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- /choose best rooms -->
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
  <script type="text/javascript" src="${basePath}/static/layDate/layDate/laydate/laydate.js"></script>
  <script type="text/javascript">
  	laydate.render({
				  elem: '#time',
				  min: 0,
				  max:30
				});
    laydate.render({
        elem: '#time1',
        min: 0,
        max:60
    });

  </script>
  <!-- /Scripts -->
  
</body>
</html>

