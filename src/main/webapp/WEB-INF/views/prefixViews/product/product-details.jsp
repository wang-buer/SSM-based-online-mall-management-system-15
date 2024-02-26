<%@ page import="com.lianwei.lssg.entity.LssgUserLogin" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/8
  Time: 11:36
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
    <title>在线商城|商品详情</title>
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
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/jquery.sinaEmotion.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath %>/statics/layer-v3.1.1/layer/mobile/need/layer.css">
    <link rel="stylesheet" href="<%= basePath %>/statics/layui/css/layui.css">

    <!--modernizr min js here-->
    <script src="<%= basePath %>/statics/prefix/assets/js/vendor/modernizr-3.7.1.min.js"></script>
    <script src="<%= basePath %>/statics/prefix/assets/js/jquery-3.1.1.js"></script>
    <%--<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>--%>
    <script src="<%= basePath %>/statics/layer-v3.1.1/layer/layer.js"></script>
    <script src="<%= basePath %>/statics/layui/layui.js"></script>

    <script src="<%= basePath %>/statics/prefix/assets/js/jquery.sinaEmotion.js"></script>

    <%
        LssgUserLogin lssgUserLogin = (LssgUserLogin) request.getSession().getAttribute("lssgUserLogin");
    %>
</head>

<body>

<jsp:include page="/beforePage/toHead"/>
<!--breadcrumbs area start-->
<div class="breadcrumbs_area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb_content">
                    <ul>
                        <li><a href="<%= basePath %>/beforePage/toIndex">首页</a></li>
                        <li>产品细节</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--breadcrumbs area end-->

<!--product details start-->
<div class="product_details mt-70 mb-70">
    <div class="container">
        <div class="row" id="productDetails">



        </div>
    </div>
</div>
<!--product details end-->

<!--product info start-->
<div class="product_d_info mb-65">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="product_d_inner">
                    <div class="product_info_button">
                        <ul class="nav" role="tablist">
                            <li >
                                <a class="active" data-toggle="tab" href="#info" role="tab" aria-controls="info" aria-selected="false">商品作用</a>
                            </li>
                            <li>
                                <a data-toggle="tab" id="comentLi" href="#reviews" role="tab" aria-controls="reviews" aria-selected="false"></a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-content">

                        <div class="tab-pane fade show active" id="info" role="tabpanel" >
                            <div class="product_info_content">

                            </div>
                        </div>



                        <div class="tab-pane fade" id="reviews" role="tabpanel">
                            <div class="reviews_wrapper">
                                <span hidden id="username"><shiro:principal/></span>
                                <h2>顾客反馈</h2>
                                <div class="messageContentList">


                                </div>
                                <div id="demo2"></div>




                            <div class="commentDiv">
                                <div class="comment_title">
                                    <h2>发表您的宝贵意见 </h2>
                                    <p>您的电子邮件地址将不会被公布,必填字段已标记.</p>
                                </div>
                                <div id="star">
                                    <span>商品评分</span>
                                    <ul>
                                        <li><a href="javascript:;">1</a></li>

                                        <li><a href="javascript:;">2</a></li>

                                        <li><a href="javascript:;">3</a></li>

                                        <li><a href="javascript:;">4</a></li>

                                        <li><a href="javascript:;">5</a></li>

                                    </ul>
                                    <span id="pingfeng"></span>
                                    <p></p>
                                </div>
                                <div class="product_review_form">
                                    <form>
                                        <div class="row">
                                            <div class="col-12">
                                                <label for="review_comment">你的评论</label>
                                                <textarea name="comment" id="review_comment" ></textarea>
                                            </div>

                                        </div>
                                        <button type="button" id="commentBtn">提交</button>
                                    </form>
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--product info end-->

<!--product area start-->
<section class="product_area related_products">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section_title">
                    <h2>相关产品</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="product_carousel product_column5 owl-carousel" id="likeProduct">

                </div>
            </div>
        </div>
    </div>
</section>
<!--product area end-->

<!--product area start-->
<section class="product_area upsell_products">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section_title">
                    <h2>热销的产品</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="product_carousel product_column5 owl-carousel" id="hotProduct">

                </div>
            </div>
        </div>
    </div>
</section>
<!--product area end-->

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
<!--<script src="assets/js/vendor/jquery-3.4.1.min.js"></script>-->
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
<script src="<%= basePath %>/statics/prefix/assets/js/head.js"></script>
<script src="<%= basePath %>/statics/prefix/assets/js/main.js"></script>

<script src="<%= basePath %>/statics/prefix/assets/js/index.js"></script>
<script src="<%= basePath %>/statics/prefix/assets/js/product/collect.js"></script>
<script src="<%= basePath %>/statics/prefix/assets/js/comment/comment.js"></script>

</body>
</html>
