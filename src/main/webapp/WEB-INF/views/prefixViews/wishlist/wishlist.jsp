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
    <title>在线商城|收藏夹</title>
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
    <link rel="stylesheet" href="https://www.layuicdn.com/layui-v2.5.5/css/layui.css"  media="all">
</head>

<body>

<jsp:include page="/beforePage/toHead"/>

<!--breadcrumbs area start-->
<div class="breadcrumbs_area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb_content">
                    <h3>Wishlist</h3>
                    <ul>
                        <li><a href="<%= basePath %>/beforePage/toIndex">首页</a></li>
                        <li>收藏夹</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--breadcrumbs area end-->


<!--wishlist area start -->
<div class="wishlist_area mt-70">
    <div class="container">
        <form action="#">
            <div class="row">
                <div class="col-12">
                    <div class="table_desc wishlist">
                        <div class="cart_page table-responsive collectListContent">
                            <div class="noProduct">
                                <div class="conImg">
                                    <img width="200px" height="200px" src="<%= basePath %>/statics/layui/images/noProduct.png" alt=""/>
                                    <span>您还没有收藏任何商品，快去逛逛吧</span>

                                    <a href="<%= basePath %>/beforePage/toIndex">
                                        <i class="glyphicon glyphicon-chevron-right"></i>去购物
                                    </a>
                                </div>
                            </div>
                            <table class="collectListTable">
                                <thead>
                                <tr>
                                    <th class="product_remove">移除</th>
                                    <th class="product_thumb">商品图片</th>
                                    <th class="product_name">商品名称</th>
                                    <th class="product-price">商品价格</th>
                                    <th class="product_quantity">库存状态</th>
                                    <th class="product_total">加入购物车</th>
                                </tr>
                                </thead>

                                <tbody>


                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>

        </form>


        <div id="demo2" class="pageFoot"></div>

    </div>
</div>
<!--wishlist area end -->

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
<script src="https://www.layuicdn.com/layui-v2.5.5/layui.js" charset="utf-8"></script>
<!-- Main JS -->
<script src="<%= basePath %>/statics/prefix/assets/js/main.js"></script>
<script src="<%= basePath %>/statics/prefix/assets/js/head.js"></script>
<script src="<%= basePath %>/statics/prefix/assets/js/product/collectList.js"></script>


</body>
</html>
