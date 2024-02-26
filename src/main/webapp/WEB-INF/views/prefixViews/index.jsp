<%--
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/8
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>在线商城|首页 </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
<%--    <link rel="shortcut icon" type="image/x-icon" href="<%= basePath %>/statics/prefix/assets/img/lssg.ico">--%>

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
    <link rel="stylesheet" type="text/css" href="<%= basePath %>/statics/layer-v3.1.1/layer/mobile/need/layer.css">

   <%-- <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>--%>
    <!--modernizr min js here-->
    <script src="<%= basePath %>/statics/prefix/assets/js/vendor/modernizr-3.7.1.min.js"></script>

</head>

<body>
<jsp:include page="/beforePage/toHead"/>


<!--slider area start-->
<section class="slider_section">
    <div class="slider_area owl-carousel noticeList">

    </div>
</section>
<!--slider area end-->

<!--shipping area start-->
<div class="shipping_area">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="single_shipping">
                    <div class="shipping_icone">
                        <img src="<%= basePath %>/statics/prefix/assets/img/about/shipping1.jpg" alt="">
                    </div>
                    <div class="shipping_content">
                        <h3>免运费</h3>
                        <p>所有美国订单或200美元以上订单免费送货</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single_shipping col_2">
                    <div class="shipping_icone">
                        <img src="<%= basePath %>/statics/prefix/assets/img/about/shipping2.jpg" alt="">
                    </div>
                    <div class="shipping_content">
                        <h3>支持 24/7</h3>
                        <p>每周7天，每天24小时与我们联系</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single_shipping col_3">
                    <div class="shipping_icone">
                        <img src="<%= basePath %>/statics/prefix/assets/img/about/shipping3.jpg" alt="">
                    </div>
                    <div class="shipping_content">
                        <h3>30天内返回</h3>
                        <p>只要在30天内退换就可以了</p>

                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single_shipping col_4">
                    <div class="shipping_icone">
                        <img src="<%= basePath %>/statics/prefix/assets/img/about/shipping4.jpg" alt="">
                    </div>
                    <div class="shipping_content">
                        <h3>100%付款安全</h3>
                        <p>我们保证用PEV安全付款</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--shipping area end-->

<!--product area start-->
<div class="product_area  mb-64">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="product_header">
                    <div class="section_title">
                        <p>最近增加了我们的商店</p>
                        <h2>最新产品</h2>
                    </div>
                    <div class="product_tab_btn">
                        <ul class="nav" role="tablist">
                            <li>
                                <a class="active" data-toggle="tab" href="#plant1" role="tab" aria-controls="plant1" aria-selected="true">
                                    蔬菜
                                </a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#plant2" role="tab" aria-controls="plant2" aria-selected="false">
                                    水果
                                </a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#plant3" role="tab" aria-controls="plant3" aria-selected="false">
                                    色拉
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="product_container">
            <div class="row">
                <div class="col-12">
                    <div class="tab-content">

                        <div class="tab-pane fade show active" id="plant1" role="tabpanel">
                            <div class="product_carousel product_column5 owl-carousel productList" id="productList">


                            </div>
                        </div>

                        <div class="tab-pane fade" id="plant2" role="tabpanel">
                            <div class="product_carousel product_column5 owl-carousel productList" id="productList2">


                            </div>
                        </div>

                        <div class="tab-pane fade" id="plant3" role="tabpanel">
                            <div class="product_carousel product_column5 owl-carousel productList" id="productList3">

                            </div>
                        </div>







                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--product area end-->

<!--banner area start-->
<div class="banner_area">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6">
                <div class="single_banner">
                    <div class="banner_thumb">
                        <a href="<%= basePath %>/beforePage/toFruitsList?productClassId=2"><img src="<%= basePath %>/statics/prefix/assets/img/bg/banner1.jpg" alt=""></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="single_banner">
                    <div class="banner_thumb">
                        <a href="<%= basePath %>/beforePage/toFruitsList?productClassId=1"><img src="<%= basePath %>/statics/prefix/assets/img/bg/banner2.jpg" alt=""></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--banner area end-->

<!--product area start-->
<div class="product_area product_deals mb-65">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <%--<div class="section_title">
                    <p>最近增加了我们的商店 </p>
                    <h2>每周的交易</h2>
                </div>--%>
            </div>
        </div>
        <div class="product_container">
            <div class="row">
                <div class="col-12">
                    <div class="product_carousel product_column5 owl-carousel">
                        <article class="single_product">
                            <figure>
                                <div class="product_thumb">
                                    <a class="primary_img" href="<%= basePath %>/beforePage/toProductDetails"><img src="<%= basePath %>/statics/prefix/assets/img/product/product14.jpg" alt=""></a>
                                    <div class="label_product">
                                        <span class="label_sale">销售</span>
                                        <span class="label_new">新鲜的</span>
                                    </div>
                                    <div class="product_timing">
                                        <div data-countdown="2021/12/15"></div>
                                    </div>
                                    <div class="action_links">
                                        <ul>
                                            <li class="add_to_cart"><a href="<%= basePath %>/beforePage/toCart" title="Add to cart"><span class="lnr lnr-cart"></span></a></li>
                                            <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <span class="lnr lnr-magnifier"></span></a></li>
                                            <li class="wishlist"><a href="wishlist.jsp" title="Add to Wishlist"><span class="lnr lnr-heart"></span></a></li>
                                            <li class="compare"><a href="#" title="Add to Compare"><span class="lnr lnr-sync"></span></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <figcaption class="product_content">
                                    <h4 class="product_name"><a href="<%= basePath %>/beforePage/toProductDetails">Mauris Vel Tellus</a></h4>
                                    <p><a href="#">水果</a></p>
                                    <div class="price_box">
                                        <span class="current_price">$48.00</span>
                                        <span class="old_price">$257.00</span>
                                    </div>
                                </figcaption>
                            </figure>
                        </article>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--product area end-->

<!--banner fullwidth area satrt-->
<div class="banner_fullwidth">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="banner_full_content">
                    <p>黑色星期五!</p>
                    <h2>销售50%<span>所有蔬菜产品</span></h2>
                    <a href="<%= basePath %>/beforePage/toNotices">发现现在</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!--banner fullwidth area end-->

<!--product banner area satrt-->
<div class="product_banner_area mb-65">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section_title">
                    <%--<p>最近增加了我们的商店</p>--%>
                    <h2>畅销商品</h2>
                </div>
            </div>
        </div>
        <div class="product_banner_container">
            <div class="row">
                <div class="col-lg-4 col-md-5">
                    <div class="banner_thumb">
                        <a href="<%= basePath %>/beforePage/toNotices"><img src="<%= basePath %>/statics/prefix/assets/img/bg/banner4.jpg" alt=""></a>
                    </div>
                </div>

                <div class="col-lg-8 col-md-7">
                    <div class="small_product_area product_column2 owl-carousel" id="pList">


                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<!--product banner area end-->

<!--product area start-->
<div class="product_area mb-65">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section_title">
                    <p>最近增加了我们的商店</p>
                    <h2>特价产品</h2>
                </div>
            </div>
        </div>
        <div class="product_container">
            <div class="row">
                <div class="col-12">
                    <div class="product_carousel product_column5 owl-carousel" id="pList2">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--product area end-->



<!--custom product area start-->
<div class="custom_product_area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section_title">
                    <p>最近增加了我们的商店 </p>
                    <h2>特色产品</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="small_product_area product_carousel product_column3 owl-carousel" id="p3List">




                </div>
            </div>
        </div>
    </div>
</div>
<!--custom product area end-->

<!--brand area start-->
<!--brand area start-->
<div class="brand_area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="brand_container owl-carousel ">
                    <div class="single_brand">
                        <a href="#"><img src="<%= basePath %>/statics/prefix/assets/img/brand/brand1.jpg" alt=""></a>
                    </div>
                    <div class="single_brand">
                        <a href="#"><img src="<%= basePath %>/statics/prefix/assets/img/brand/brand2.jpg" alt=""></a>
                    </div>
                    <div class="single_brand">
                        <a href="#"><img src="<%= basePath %>/statics/prefix/assets/img/brand/brand3.jpg" alt=""></a>
                    </div>
                    <div class="single_brand">
                        <a href="#"><img src="<%= basePath %>/statics/prefix/assets/img/brand/brand4.jpg" alt=""></a>
                    </div>
                    <div class="single_brand">
                        <a href="#"><img src="<%= basePath %>/statics/prefix/assets/img/brand/brand2.jpg" alt=""></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--brand area end-->
<!--brand area end-->


<jsp:include page="/beforePage/toFoot"/>

<!-- modal area start-->
<div class="modal fade" id="modal_box" tabindex="-1" role="dialog"  aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true"><i class="icon-x"></i></span>
            </button>
            <div class="modal_body">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5 col-md-5 col-sm-12">
                            <div class="modal_tab">
                                <div class="tab-content product-details-large">
                                    <div class="tab-pane fade show active" id="tab1" role="tabpanel" >
                                        <div class="modal_tab_img">
                                            <a href="#"><img src="<%= basePath %>/statics/prefix/assets/img/product/productbig1.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab2" role="tabpanel">
                                        <div class="modal_tab_img">
                                            <a href="#"><img src="<%= basePath %>/statics/prefix/assets/img/product/productbig2.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab3" role="tabpanel">
                                        <div class="modal_tab_img">
                                            <a href="#"><img src="<%= basePath %>/statics/prefix/assets/img/product/productbig3.jpg" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="tab4" role="tabpanel">
                                        <div class="modal_tab_img">
                                            <a href="#"><img src="<%= basePath %>/statics/prefix/assets/img/product/productbig4.jpg" alt=""></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal_tab_button">
                                    <ul class="nav product_navactive owl-carousel" role="tablist">
                                        <li >
                                            <a class="nav-link active" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="false"><img src="<%= basePath %>/statics/prefix/assets/img/product/product1.jpg" alt=""></a>
                                        </li>
                                        <li>
                                            <a class="nav-link" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="false"><img src="<%= basePath %>/statics/prefix/assets/img/product/product6.jpg" alt=""></a>
                                        </li>
                                        <li>
                                            <a class="nav-link button_three" data-toggle="tab" href="#tab3" role="tab" aria-controls="tab3" aria-selected="false"><img src="<%= basePath %>/statics/prefix/assets/img/product/product2.jpg" alt=""></a>
                                        </li>
                                        <li>
                                            <a class="nav-link" data-toggle="tab" href="#tab4" role="tab" aria-controls="tab4" aria-selected="false"><img src="<%= basePath %>/statics/prefix/assets/img/product/product7.jpg" alt=""></a>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-7 col-md-7 col-sm-12">
                            <div class="modal_right">
                                <div class="modal_title mb-10">
                                    <h2>Donec Ac Tempus</h2>
                                </div>
                                <div class="modal_price mb-10">
                                    <span class="new_price">$64.99</span>
                                    <span class="old_price" >$78.99</span>
                                </div>
                                <div class="modal_description mb-15">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia iste laborum ad impedit pariatur esse optio tempora sint ullam autem deleniti nam in quos qui nemo ipsum numquam, reiciendis maiores quidem aperiam, rerum vel recusandae </p>
                                </div>
                                <div class="variants_selects">
                                    <div class="variants_size">
                                        <h2>种类</h2>
                                        <select class="select_option">
                                            <option selected value="1">s</option>
                                            <option value="1">m</option>
                                            <option value="1">l</option>
                                            <option value="1">xl</option>
                                            <option value="1">xxl</option>
                                        </select>
                                    </div>
                                    <div class="variants_color">
                                        <h2>颜色</h2>
                                        <select class="select_option">
                                            <option selected value="1">紫色</option>
                                            <option value="1">紫罗兰色</option>
                                            <option value="1">黑色</option>
                                            <option value="1">粉色</option>
                                            <option value="1">橙色</option>
                                        </select>
                                    </div>
                                    <div class="modal_add_to_cart">
                                        <form action="#">
                                            <input min="1" max="100" step="2" value="1" type="number">
                                            <button type="submit">加入购物车</button>
                                        </form>
                                    </div>
                                </div>
                                <div class="modal_social">
                                    <h2>分享这个产品</h2>
                                    <ul>
                                        <li class="facebook"><a href="#"><i class="fa fa-facebook"></i></a></li>
                                        <li class="twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                                        <li class="pinterest"><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                        <li class="google-plus"><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                        <li class="linkedin"><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- modal area end-->





<!-- JS
============================================ -->

<!--jquery min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/vendor/jquery-3.4.1.min.js"></script>
<!--popper min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/popper.js"></script>
<!--bootstrap min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/bootstrap.min.js"></script>
<script src="<%= basePath %>/statics/layer-v3.1.1/layer/layer.js"></script>


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
<script src="<%= basePath %>/statics/prefix/assets/js/notice/indexNotice.js"></script>

<!-- Main JS -->
<script src="<%= basePath %>/statics/prefix/assets/js/main.js"></script>

<script src="<%= basePath %>/statics/prefix/assets/js/index.js"></script>
<script src="<%= basePath %>/statics/prefix/assets/js/head.js"></script>
<script src="<%= basePath %>/statics/prefix/assets/js/product/collect.js"></script>
</body>
</html>
