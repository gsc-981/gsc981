<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!-- footer -->
<footer class="footer">
    <div class="footer-top">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="footer-top_logo"><a href="#"><img src="${basePath}/static/front/images/logo/logo.png" alt="Footer logo"></a></div>
                    <div class="footer-top_txt">
                        <p>一豪大酒店是一间五星级精品商务综合型酒店。屹立于东莞市寮步镇，地处海珠广场商业繁华地带，购物、娱乐方便快捷。酒店位于各交通网络之交汇点，是商旅人士云集之处。</p>
                    </div>
                    <div class="footer-top_address">
                        <div><i class="fa fa-phone"></i> 电话： <span>0769 - 8888888</span></div>
                        <div><i class="fa fa-envelope-o"></i> E-mail: <span><a href="mailto:support@email.com">yihao@email.com</a></span></div>
                        <div><i class="fa fa-home"></i> 地址: <span>东莞市寮步镇文昌路2号</span></div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="footer-top_rooms">
                        <ul>
                            <li>
                                <div class="rooms_img">
                                    <a href="#"><img src="${basePath}/static/front/images/footer/1.jpg" alt=""></a>
                                </div>
                                <div class="rooms_info">
                                    <div class="rooms_t"><a href="#">豪华套房</a></div>
                                    <div class="rooms_props">3 床  /  Wi-Fi  /  2 - 洗手间<span>￥399</span></div>
                                </div>
                            </li>
                            <li>
                                <div class="rooms_img">
                                    <a href="#"><img src="${basePath}/static/front/images/footer/2.jpg" alt=""></a>
                                </div>
                                <div class="rooms_info">
                                    <div class="rooms_t"><a href="#">总统套房</a></div>
                                    <div class="rooms_props">4 床  /  Wi-Fi  /  3 - 洗手间<span>￥999</span></div>
                                </div>
                            </li>
                            <li>
                                <div class="rooms_img">
                                    <a href="#"><img src="${basePath}/static/front/images/footer/3.jpg" alt=""></a>
                                </div>
                                <div class="rooms_info">
                                    <div class="rooms_t"><a href="#">水疗房</a></div>
                                    <div class="rooms_props">2 床  /  Wi-Fi  /  2 - 洗手间<span>￥599</span></div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 marg-sm-50 col-xs-12">
                    <div class="footer-top_contact_form">
                        <div class="contact_form_t">留言表</div>
                        <form id="commentform" action="${basePath}/sys/comment/savecomment.action" method="POST" class="row form-horizontal form-wizzard">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <input type="text" name="name" class="form-control" placeholder="您的名字 ">
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <input type="text" name="email" class="form-control" placeholder="Email">
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <textarea rows="6" name="content" class="form-control" placeholder="留言信息"></textarea>
                            </div>
                            <input type="hidden" name="vipid" value="<%=session.getAttribute("vip")%>">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-right">
                                <input type="button" onclick="comment(this)" class="btn btn-default" value="提交"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <div class="footer-bottom_copy">Copyright &copy; 2017.Company name All rights reserved.</div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <div class="footer-bottom_links">
                        <a class="active" href="#">主页</a>
                        <a href="#">新浪微博</a>
                        <a href="#">预订</a>
                        <a href="#">联系我们</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<script type="text/javascript">

    var testlogin="<%=session.getAttribute("user")%>";
    if(testlogin != "null"){
        //$("#login-ad").children("button").remove();
        document.getElementById('denglu').style.display="none";
        document.getElementById('zhuce').style.display="none";
        document.getElementById('mingzi').style.display="inline";
        document.getElementById("dingdan").style.display="inline";

    }


    function comment(obj) {
        //判断是否已登录
        var s="<%=session.getAttribute("vip")%>";
        var c = document.getElementById("commentform");
        if(s == "null"){
            alert("请先登录!");
            window.location.href="${basePath}/front/login.jsp";
        }else{
            c.submit();

        }
    }
</script>