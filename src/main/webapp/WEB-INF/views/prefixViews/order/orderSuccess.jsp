<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/25
  Time: 20:02
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
    <title>在线商城|支付页面</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->


    <!-- CSS
    ========================= -->
    <link rel="stylesheet" type="text/css" href="<c:url value="//sp.jd.com/payment/2.0.0/css/main.css"/>">
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
    <link rel="stylesheet" type="text/css" href="<%= basePath %>/statics/prefix/assets/css/buyConfirm.css" />
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath %>/statics/layer-v3.1.1/layer/mobile/need/layer.css">
    <!--modernizr min js here-->
    <script src="<%= basePath %>/statics/prefix/assets/js/vendor/modernizr-3.7.1.min.js"></script>
    <style>

        .icon-box:before {
            content: "";
        }
        .ys2{
            color: #2FAB11;
            font-weight: bold;
        }
    </style>

</head>

<body>


<jsp:include page="/beforePage/toHead"/>

<!--error section area start-->
<div class="error_section">
    <div class="container">
        <div class="container payment-con">
            <form  target="_blank" action="#" id="pay-form" method="post">
                <div class="order-info">
                    <div class="msg">
                        <h5>您的订单已提交成功！
                            请尽快付款，否则订单会被自动取消</h5>
                        <p></p>

                        <p class="post-date">成功付款后，24小时内发货</p>
                    </div>
                    <div class="info">

                    </div>
                </div>

                <div class="xm-plain-box">
                    <div class="box-hd bank-title clearfix">
                        <div id="titleWrap" class="title-wrap">
                            <h2 class="title hide " >你还需要继续支付 <em>49.00</em> 元</h2>
                            <span class="tip-tag"></span>
                        </div>
                    </div>

                    <!-- payment 支付方式选择 -->
                    <div class="payment" id="paymentContent">


                    </div>

                <div class="box-ft clearfix">
                        <input type="button" class="btn btn-primary payBtn" style="background-color: #28a745;border-color: #28a745;" value="确定支付" id="payBtn">
                        <span class="tip" style="color: #8D8D8D">点击确认支付，模拟支付完成</span>
                    </div>
                </div>
            </form>
        </div>

    </div>
</div>
<!--error section area end-->

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
<script type="text/javascript" src="<%= basePath %>/statics/prefix/assets/js/weixin.js"></script>
<!-- Main JS -->
<script src="<%= basePath %>/statics/prefix/assets/js/main.js"></script>
<script src="<%= basePath %>/statics/layer-v3.1.1/layer/layer.js"></script>
<script src="<%= basePath %>/statics/prefix/assets/js/order/countdown.js"></script>
<script src="<%= basePath %>/statics/prefix/assets/js/order/orderSuccess.js"></script>
<script src="<%= basePath %>/statics/prefix/assets/js/head.js"></script>
</body>
</html>
