<%--
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/8
  Time: 11:38
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
    <title>在线商城|服务页面</title>
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

    <!--modernizr min js here-->
    <script src="<%= basePath %>/statics/prefix/assets/js/vendor/modernizr-3.7.1.min.js"></script>

</head>

<body>


<jsp:include page="/beforePage/toHead"/>

<!--breadcrumbs area start-->
<div class="breadcrumbs_area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb_content">
                    <h3>便民服务</h3>
                    <ul>
                        <li><a href="<%= basePath %>/beforePage/toIndex">首页</a></li>
                        <li>我们的服务</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--breadcrumbs area end-->

<!--services img area-->
<div class="services_gallery mt-70">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="single_services">
                    <div class="services_thumb">
                        <img src="<%= basePath %>/statics/prefix/assets/img/service/services1.jpg" alt="">
                    </div>
                    <div class="services_content">
                        <h3>乐购</h3>
                        <p> 快乐购物，享受美味</p>

                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="single_services">
                    <div class="services_thumb">
                        <img src="<%= basePath %>/statics/prefix/assets/img/service/services2.jpg" alt="">
                    </div>
                    <div class="services_content">
                        <h3>乐享</h3>
                        <p>享受美味，收获健康</p>

                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="single_services">
                    <div class="services_thumb">
                        <img src="<%= basePath %>/statics/prefix/assets/img/service/services3.jpg" alt="">
                    </div>
                    <div class="services_content">
                        <h3>欢乐</h3>
                        <p>购物是一种令人愉快的体验，收货是一个惊喜的发现。</p>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--services img end-->

<!--our services area-->
<div class="our_services">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="services_title">
                    <h2>我们的服务</h2>
                    <p>在这里你们会体会到最舒适的购物体验，享受到健康美味的绿色食品。</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="services_item">
                    <div class="services_icone">
                        <i class="fa fa-sliders" aria-hidden="true"></i>
                    </div>
                    <div class="services_desc">
                        <h3>在线购物</h3>
                        <p>消费者能通过绿色果蔬商城系统、网上商城购物系统实现在线购物（加入购物车、立即购买、购物车下单等），方便快速，省去中间流通环节，促进销售。</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="services_item">
                    <div class="services_icone">
                        <i class="fa fa-umbrella"></i>
                    </div>
                    <div class="services_desc">
                        <h3>订单管理</h3>

                        <p>通过订单管理功能快速查看已付款、未付款、已成交、待评价等订单情况，让消费者能清晰地了解到所购买的产品情况与消费情况。</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="services_item">
                    <div class="services_icone">

                        <i class="fa fa-camera"></i>

                    </div>
                    <div class="services_desc">
                        <h3>物流查询</h3>

                        <p>通过绿色果蔬商城、网上商城系统为消费者提供物流查询功能，随时随地都能快速了解所购买的产品的物流情况，增加消费者的期待值。</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="services_item">
                    <div class="services_icone">
                        <i class="fa fa-cog"></i>
                    </div>
                    <div class="services_desc">
                        <h3>评价反馈</h3>
                        <p>通过评价反馈功能，增加用户的参与度，也有利于更多消费者了解产品的情况。</p>
                    </div>
                </div>
            </div>
            div>
        </div>
    </div>
</div>
<!--our services area end-->


<!--services section area-->
<div class="unlimited_services">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 col-md-12">
                <div class="services_section_thumb">
                    <img src="<%= basePath %>/statics/prefix/assets/img/service/services4.jpg" alt="">
                </div>
            </div>
            <div class="col-lg-6 col-md-12">
                <div class="unlimited_services_content">
                    <h1>无限创意</h1>
                    <p>通过网络进行网上绿色果蔬销售，我们所有的货物都进行了源头的检查，确保所有的果蔬绿色健康。</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!--services section end-->

<!--advantages wordpress -->
<div class="advantages_ecommerce">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-7 col-md-8 col-sm-12">
                <div class="advantages_content">
                    <h3>网络销售果蔬的优势</h3>
                    <p>通过数据筛选大众喜爱的果蔬以确保果蔬的损失将到最小。</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!--advantages wordpress end-->


<jsp:include page="/beforePage/toFoot"/>

<!-- JS
============================================ -->
<!--jquery min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/vendor/jquery-3.4.1.min.js"></script>
<!--popper min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/popper.js"></script>
<!--bootstrap min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/bootstrap.min.js"></script>
<!--owl carousel min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/owl.carousel.min.js"></script>
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

<!-- Main JS -->
<script src="<%= basePath %>/statics/prefix/assets/js/main.js"></script>
<script src="<%= basePath %>/statics/prefix/assets/js/head.js"></script>



</body>

</html>
