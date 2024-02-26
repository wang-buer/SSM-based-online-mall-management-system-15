<%--
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/8
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>在线商城|我的订单</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->


    <!-- CSS
    ========================= -->
    <!--bootstrap min css-->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/bootstrap.min.css">
    <!--owl carousel min css-->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/owl.carousel.min.css">
    <!--slick min css-->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/slick.css">
    <!--magnific popup min css-->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/magnific-popup.css">
    <!--font awesome css-->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/font.awesome.css">
    <!--ionicons css-->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/ionicons.min.css">
    <!--linearicons css-->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/linearicons.css">
    <!--animate css-->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/animate.css">
    <!--jquery ui min css-->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/jquery-ui.min.css">
    <!--slinky menu css-->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/slinky.menu.css">
    <!--plugins css-->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/plugins.css">

    <!-- Main Style CSS -->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/style.css">
    <link rel="stylesheet" href="https://www.layuicdn.com/layui-v2.5.5/css/layui.css"  media="all">
    <!--order css-->
    <link rel="stylesheet" type="text/css" href="<%= basePath %>/statics/prefix/assets/css/reset.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath %>/statics/prefix/assets/css/main.css">
    <!--taber css-->
    <link rel="stylesheet" type="text/css" href="<%= basePath %>/statics/prefix/assets/css/taber.css"/>
    <!--em css-->
    <link rel="stylesheet" type="text/css" href="<%= basePath %>/statics/prefix/assets/css/em.css"/>

    <!--modernizr min js here-->
    <!--<script src="assets/js/vendor/modernizr-3.7.1.min.js"></script>-->
</head>
<body>

<jsp:include page="/beforePage/toHead"/>
<!--breadcrumbs area start-->
<div class="breadcrumbs_area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb_content">
                    <h3>我的订单</h3>
                    <ul>
                        <li><a href="<%= basePath %>/beforePage/toIndex">首页</a></li>
                        <li>订单</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--breadcrumbs area end-->




<div class="price">
    <h2 class="price-h" style="padding-left: 157px;">我的订单</h2>
    <div class="category">
        <ul class="price-h headUl" style="margin-left: 148px;">
            <li class="active" id="allOrders" name="allOrders"></li>
            <li id="noPayLi" name="noPayLi"></li>
            <li id="noSendLi" name="noSendLi"></li>
            <li id="noComplLi" name="noComplLi"></li>
        </ul>

    </div>
    <div class="cont active">
        <div class="main_con clearfix">
            <ul class="order_list_th w978 clearfix" style="margin-bottom:0;margin-top: 0">

                <li class="col03">订单详情</li>
                <li class="col05">操作</li>
                <li class="col04">全部状态</li>
                <li class="col04">收货人</li>
                <li class="col04">金额</li>
            </ul>

            <div class="right_content clearfix orders">

            </div>
            <div id="demo2" class="pageFoot">

            </div>
        </div>
    </div>
    <div class="cont">
        <div class="main_con clearfix">
            <ul class="order_list_th w978 clearfix" style="margin-bottom:0;margin-top: 0">

                <li class="col03">订单详情</li>
                <li class="col05">操作</li>
                <li class="col04">全部状态</li>
                <li class="col04">收货人</li>
                <li class="col04">金额</li>
            </ul>

            <div class="right_content clearfix ordersWithNoPay">

            </div>
            <div id="demo3" class="pageFoot">

            </div>
        </div>
    </div>
    <div class="cont">
        <div class="main_con clearfix">
            <ul class="order_list_th w978 clearfix" style="margin-bottom:0;margin-top: 0">

                <li class="col03">订单详情</li>
                <li class="col05">操作</li>
                <li class="col04">全部状态</li>
                <li class="col04">收货人</li>
                <li class="col04">金额</li>
            </ul>

            <div class="right_content clearfix ordersWithNoSend">

            </div>
            <div id="demo4" class="pageFoot">

            </div>
        </div>
    </div>
    <div class="cont">
        <div class="main_con clearfix">
            <ul class="order_list_th w978 clearfix" style="margin-bottom:0;margin-top: 0">

                <li class="col03">订单详情</li>
                <li class="col05">操作</li>
                <li class="col04">全部状态</li>
                <li class="col04">收货人</li>
                <li class="col04">金额</li>
            </ul>

            <div class="right_content clearfix ordersWithNoCompl">

            </div>
            <div id="demo5" class="pageFoot">

            </div>
        </div>
    </div>


</div>


<jsp:include page="/beforePage/toFoot"/>

<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">
    $(function(){
        //选项卡切换
        $('.category ul li').click(function(){
            indexC = $(this).index();
            $(this).addClass('active').siblings().removeClass('active');
            $('.cont').eq(indexC).addClass('active').siblings().removeClass('active');
        });
        //按钮箭头
        var catew = $('.category').width()-150;
        var cateLiw = 0;
        $('.category ul li').each(function(){
            cateLiw +=$(this).outerWidth();
        });
        var i =0;
        $('.next').click(function(){
            $('.category ul').animate({
                "margin-left":-catew+'px'
            },500);
            i++;
            if((catew+150)*i+(catew+150)>=cateLiw){
                $('.prev').show();
                $('.next').hide();
            }
        });
        $('.prev').click(function(){
            $('.category ul').animate({
                "margin-left":0+'px'
            },500);
            $(this).hide();$('.next').show();
        })
    })
</script>


<!-- JS
============================================ -->
<!--jquery min js-->
<!-- <script src="assets/js/vendor/jquery-3.4.1.min.js"></script>-->
<!--popper min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/popper.js"></script>
<!--bootstrap min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/bootstrap.min.js"></script>
<!--owl carousel min js-->
<!--<script src="assets/js/owl.carousel.min.js"></script>-->
<!--slick min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/slick.min.js"></script>
<!--magnific popup min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/jquery.magnific-popup.min.js"></script>
<!--counterup min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/jquery.counterup.min.js"></script>
<!--jquery countdown min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/jquery.countdown.js"></script>
<!--jquery ui min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/jquery.ui.js"></script>
<!--jquery elevatezoom min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/jquery.elevatezoom.js"></script>
<!--isotope packaged min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/isotope.pkgd.min.js"></script>
<!--slinky menu js-->
<script src="<%= basePath %>/statics/prefix/assets/js/slinky.menu.js"></script>
<!-- Plugins JS -->
<script src="<%= basePath %>/statics/prefix/assets/js/plugins.js"></script>
<script src="https://www.layuicdn.com/layui-v2.5.5/layui.js" charset="utf-8"></script>
<!-- Main JS -->
<script src="<%= basePath %>/statics/prefix/assets/js/main.js"></script>
<script src="<%= basePath %>/statics/prefix/assets/js/order/orderList.js"></script>
<script src="<%= basePath %>/statics/prefix/assets/js/head.js"></script>
</body>
</html>
