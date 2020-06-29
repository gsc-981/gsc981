<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    pageContext.setAttribute("basePath", basePath);
%>

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
    <title>一豪酒店后台</title>
</head>
<body>
<header class="navbar-wrapper">
    <div class="navbar navbar-fixed-top">
        <div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs" href="#">一豪酒店管理</a> <a class="logo navbar-logo-m f-l mr-10 visible-xs" href="#">酒店管理系统</a>
            <span class="logo navbar-slogan f-l mr-10 hidden-xs">v1.0</span>
            <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
            <nav class="nav navbar-nav">
                <ul class="cl">
                    <li class="dropDown dropDown_hover"><a href="javascript:;" class="dropDown_A"><i class="Hui-iconfont">&#xe600;</i> 新增 <i class="Hui-iconfont">&#xe6d5;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="#" ><i class="Hui-iconfont">&#xe616;</i> 资讯</a></li>
                            <li><a href="#" ><i class="Hui-iconfont">&#xe613;</i> 图片</a></li>
                            <li><a href="#" ><i class="Hui-iconfont">&#xe620;</i> 产品</a></li>
                            <li><a href="#" ><i class="Hui-iconfont">&#xe60d;</i> 用户</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
                <ul class="cl">
                    <li>超级管理员</li>
                    <li class="dropDown dropDown_hover">
                        <a href="#" class="dropDown_A">admin <i class="Hui-iconfont">&#xe6d5;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;" onClick="myselfinfo()">个人信息</a></li>
                            <li><a href="javascript:;" onClick="logout()">切换账户</a></li>
                            <li><a href="javascript:;" onClick="logout()">退出</a></li>
                        </ul>
                    </li>
                    <li id="Hui-msg"> <a href="#" title="消息"><span class="badge badge-danger">1</span><i class="Hui-iconfont" style="font-size:18px">&#xe68a;</i></a> </li>
                    <li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
                            <li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
                            <li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
                            <li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
                            <li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
                            <li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<aside class="Hui-aside">
    <div class="menu_dropdown bk_2">
        <dl id="menu-room">
            <dt><i class="Hui-iconfont">&#xe616;</i> 房间管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="${basePath}/sys/room/room.action" data-title="房间管理" href="javascript:void(0)">房间管理</a></li>
                    <li><a data-href="${basePath}/sys/room/roomtype.action" data-title="房型管理" href="javascript:void(0)">房型管理</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-customer">
            <dt><i class="Hui-iconfont">&#xe60d;</i> 客户管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="${basePath}/sys/customer/findAllCustomer.action" data-title="客户列表" href="javascript:;">客户列表</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-booking">
            <dt><i class="Hui-iconfont">&#xe603;</i> 预定管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="${basePath}/sys/booking/findAll.action" data-title="预定管理" href="javascript:void(0)">预定管理</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-product">
            <dt><i class="Hui-iconfont">&#xe620;</i> 入住管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="${basePath}/sys/checkin/checkin.action" data-title="到店入住" href="javascript:void(0)">到店入住</a></li>
                    <li><a data-href="${basePath}/sys/booking/bookchecking.action" data-title="预定入住" href="javascript:void(0)">预定入住</a></li>
                    <li><a data-href="${basePath}/sys/checkin/checkining.action" data-title="正在入住" href="javascript:void(0)">正在入住</a></li>
                    <li><a data-href="${basePath}/sys/checkin/allcheckin.action" data-title="入住管理" href="javascript:void(0)">入住管理</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-bill">
            <dt><i class="Hui-iconfont">&#xe6b5;</i> 账单管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="${basePath}/sys/bill/bill.action" data-title="账单管理" href="javascript:void(0)">账单管理</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-member">
            <dt><i class="Hui-iconfont">&#xe6b4;</i> 会员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="${basePath}/sys/vip/findAll.action" data-title="会员列表" href="javascript:;">会员列表</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-comment">
            <dt><i class="Hui-iconfont">&#xe6b3;</i> 评论管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="${basePath}/sys/comment/comment.action" data-title="评论管理" href="javascript:void(0)">评论管理</a></li>
            </dd>
        </dl>
        <dl id="menu-staff">
            <dt><i class="Hui-iconfont">&#xe62d;</i> 员工管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="${basePath}/sys/sysUser/findAll.action" data-title="员工列表" href="javascript:;">员工列表</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-druid">
            <dt><i class="Hui-iconfont">&#xe6bb;</i> 连接池管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="${basePath}/druid/datasource.html" data-title="数据源" href="javascript:void(0)">数据源</a></li>
                    <li><a data-href="${basePath}/druid/sql.html" data-title="连接池监控" href="javascript:void(0)">连接池监控</a></li>
                    <li><a data-href="${basePath}/druid/wall.html" data-title="SQL防火墙" href="javascript:void(0)">SQL防火墙</a></li>
                    <li><a data-href="${basePath}/druid/webapp.html" data-title="Web应用" href="javascript:void(0)">Web应用</a></li>
                    <li><a data-href="${basePath}/druid/weburi.html" data-title="URI监控" href="javascript:void(0)">URI监控</a></li>
                    <li><a data-href="${basePath}/druid/websession.html" data-title="Session监控" href="javascript:void(0)">Session监控</a></li>
                    <li><a data-href="${basePath}/druid/spring.html" data-title="Spring监控" href="javascript:void(0)">Spring监控</a></li>
                </ul>
            </dd>
        </dl>
    </div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
    <div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
        <div class="Hui-tabNav-wp">
            <ul id="min_title_list" class="acrossTab cl">
                <li class="active">
                    <span title="我的桌面" data-href="${basePath}/sys/welcome.jsp">我的桌面</span>
                    <em></em></li>
            </ul>
        </div>
        <div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
    </div>
    <div id="iframe_box" class="Hui-article">
        <div class="show_iframe">
            <div style="display:none" class="loading"></div>
            <iframe scrolling="yes" frameborder="0" src="${basePath}/sys/welcome.jsp"></iframe>
        </div>
    </div>
</section>

<div class="contextMenu" id="Huiadminmenu">
    <ul>
        <li id="closethis">关闭当前 </li>
        <li id="closeall">关闭全部 </li>
    </ul>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${basePath}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${basePath}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${basePath}/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${basePath}/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${basePath}/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript">
    $(function(){
        /*$("#min_title_list li").contextMenu('Huiadminmenu', {
            bindings: {
                'closethis': function(t) {
                    console.log(t);
                    if(t.find("i")){
                        t.find("i").trigger("click");
                    }
                },
                'closeall': function(t) {
                    alert('Trigger was '+t.id+'\nAction was Email');
                },
            }
        });*/
    });
    /*个人信息*/
    function myselfinfo(){
        layer.open({
            type: 1,
            area: ['300px','200px'],
            fix: false, //不固定
            maxmin: true,
            shade:0.4,
            title: '查看信息',
            content: '<div>管理员信息</div>'
        });
    }

    function logout() {
        if(confirm("是否安全退出？")) {
            window.location.href = "${basePath}/sys/Logout.action";
        }
    }
    /*资讯-添加*/
    function article_add(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    /*图片-添加*/
    function picture_add(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    /*产品-添加*/
    function product_add(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    /*用户-添加*/
    function member_add(title,url,w,h){
        layer_show(title,url,w,h);
    }


</script>

</body>
</html>
