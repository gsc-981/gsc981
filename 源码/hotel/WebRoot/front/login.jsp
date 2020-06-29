<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
      <script src="${basePath}/static/js/jquery-3.2.1.min.js"></script>
    </head>
    <body>
        <div class="wrapper">
            <%@ include file="baseJsp.jsp" %>
            <section class="bg-parallax">
                <div class="overlay"></div>
                <div style="height:350px">
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 planner" style="width:350px;float:right;margin:25px 30px;" >
                      <div class="planner-block">
                        <form class="form-planner form-horizontal" method="post">
                          <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                              <div class="form-group">
                                <label>账号</label>
                                <input class="form-control" id="username" name="username" type="text" style="width:250px">
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                              <div class="form-group">
                                <label>密码</label>
                                <input class="form-control " id="password" name="password" type="password" style="width:250px">
                              </div>
                            </div>
                          </div>
                          
                          <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                              <div >
                                <input type="button" class="btn btn-default " id="login" value="&nbsp;&nbsp;&nbsp;&nbsp;登录&nbsp;&nbsp;&nbsp;&nbsp;" style="width:250px">
                              </div>
                            </div>
                          </div>
                        </form>
                      </div>
                    </div>
                    </div>
            </section>
          <%@ include file="footer.jsp" %>
        </div>
    </body>

    <script type="text/javascript" src="${basePath}/lib/layui/layui.all.js"></script>

    <script type="text/javascript">

        function p(s) {
            return s < 10 ? '0' + s: s;
        }

    	$("#login").click(function() {
        var username = $("#username").val();
        var password = $("#password").val();
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
            url : "${basePath}/sys/vip/logincheck.action",
            data : {
                "username" : username,
                "password" : password,
            },
            dataType : "json",
            success : function(data) {
                if(data.msg=="error") {
                	alert("用户名密码错误！")
                }
                else {
                	var birthday = data.msg;

                    var today=new Date();
                    birthday2 = birthday.split("-")[1]+"-"+birthday.split("-")[2];
                    var time = p(today.getMonth()+1)+"-"+p(today.getDate());
                    console.log(birthday2);
                    console.log(time);
                    console.log(birthday2==time);
                    if(birthday2  == time)
                    {
                        layer.open({
                            type: 2,
                            title: false,
                            closeBtn: 0, //不显示关闭按钮
                            shade: [0],
                            area: ['600px', '510px'],
                            offset: 'auto', //右下角弹出
                            time: 3000, //3秒后自动关闭
                            anim: 2,
                            content: ['${basePath}/front/brithday.jsp', 'no'], //iframe的url，no代表不显示滚动条
                            end: function(){ //此处用于演示
                                window.location.href="${basePath}/front/index.jsp";
                            }
                        });
                    }
                    else {
                        layer.msg('登录成功，跳转至首页', {
                            icon: 1,
                            time: 1000 //1秒关闭（如果不配置，默认是3秒）
                        }, function(){
                            window.location.href="${basePath}/front/index.jsp";
                        });
                    }
                }
            },
            error : function() {
                alert("系统异常请稍后重试");
            }
        })
    });
</script>
</html>
