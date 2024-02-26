<%--
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/8
  Time: 11:35
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
    <title>在线商城|关于我们</title>
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
                    <h3>关于我们</h3>
                    <ul>
                        <li><a href="<%= basePath %>/beforePage/toIndex">首页</a></li>
                        <li>关于我们</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--breadcrumbs area end-->

<!--about section area -->
<section class="about_section">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <figure>
                    <div class="about_thumb">
                        <img src="<%= basePath %>/statics/prefix/assets/img/about/about1.jpg" alt="">
                    </div>
                    <figcaption class="about_content">
                        <h1>We are a digital agency focused on delivering content and utility user-experiences.</h1>
                        <p>Adipiscing lacus ut elementum, nec duis, tempor litora turpis dapibus. Imperdiet cursus odio tortor in elementum. Egestas nunc eleifend feugiat lectus laoreet, vel nunc taciti integer cras. Hac pede dis, praesent nibh ac dui mauris sit. Pellentesque mi, facilisi mauris, elit sociis leo sodales accumsan. Iaculis ac fringilla torquent lorem consectetuer, sociosqu phasellus risus urna aliquam, ornare.</p>
                        <div class="about_signature">
                            <img src="<%= basePath %>/statics/prefix/assets/img/about/about-us-signature.png" alt="">
                        </div>
                    </figcaption>
                </figure>
            </div>
        </div>
    </div>
</section>
<!--about section end-->

<!--chose us area start-->
<div class="choseus_area" data-bgimg="<%= basePath %>/statics/prefix/assets/img/about/about-us-policy-bg.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-4">
                <div class="single_chose">
                    <div class="chose_icone">
                        <img src="<%= basePath %>/statics/prefix/assets/img/about/About_icon1.png" alt="">
                    </div>
                    <div class="chose_content">
                        <h3>Creative Design</h3>
                        <p>Erat metus sodales eget dolor consectetuer, porta ut purus at et alias, nulla ornare velit amet</p>

                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="single_chose">
                    <div class="chose_icone">
                        <img src="<%= basePath %>/statics/prefix/assets/img/about/About_icon2.png" alt="">
                    </div>
                    <div class="chose_content">
                        <h3>100% Money Back Guarantee</h3>
                        <p>Erat metus sodales eget dolor consectetuer, porta ut purus at et alias, nulla ornare velit amet</p>

                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="single_chose">
                    <div class="chose_icone">
                        <img src="<%= basePath %>/statics/prefix/assets/img/about/About_icon3.png" alt="">
                    </div>
                    <div class="chose_content">
                        <h3>Online Support 24/7</h3>
                        <p>Erat metus sodales eget dolor consectetuer, porta ut purus at et alias, nulla ornare velit amet</p>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--chose us area end-->

<!--services img area-->
<div class="about_gallery_section">
    <div class="container">
        <div class="about_gallery_container">
            <div class="row">
                <div class="col-lg-4 col-md-4">
                    <article class="single_gallery_section">
                        <figure>
                            <div class="gallery_thumb">
                                <img src="<%= basePath %>/statics/prefix/assets/img/about/about2.jpg" alt="">
                            </div>
                            <figcaption class="about_gallery_content">
                                <h3>What do we do?</h3>
                                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto</p>
                            </figcaption>
                        </figure>
                    </article>
                </div>
                <div class="col-lg-4 col-md-4">
                    <article class="single_gallery_section">
                        <figure>
                            <div class="gallery_thumb">
                                <img src="<%= basePath %>/statics/prefix/assets/img/about/about3.jpg" alt="">
                            </div>
                            <figcaption class="about_gallery_content">
                                <h3>Our Mission</h3>
                                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto</p>
                            </figcaption>
                        </figure>
                    </article>
                </div>
                <div class="col-lg-4 col-md-4">
                    <article class="single_gallery_section">
                        <figure>
                            <div class="gallery_thumb">
                                <img src="<%= basePath %>/statics/prefix/assets/img/about/about4.jpg" alt="">
                            </div>
                            <figcaption class="about_gallery_content">
                                <h3>History Of Us</h3>
                                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto</p>
                            </figcaption>
                        </figure>
                    </article>
                </div>
            </div>
        </div>
    </div>
</div>
<!--services img end-->

<!--testimonial area start-->
<div class="faq-client-say-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6">
                <div class="faq-client_title">
                    <h2>What can we do for you ?</h2>
                </div>
                <div class="faq-style-wrap" id="faq-five">
                    <!-- Panel-default -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h5 class="panel-title">
                                <a id="octagon" class="collapsed" role="button" data-toggle="collapse" data-target="#faq-collapse1" aria-expanded="true" aria-controls="faq-collapse1"> <span class="button-faq"></span>Fast Free Delivery</a>
                            </h5>
                        </div>
                        <div id="faq-collapse1" class="collapse show" aria-expanded="true" role="tabpanel" data-parent="#faq-five">
                            <div class="panel-body">
                                <p>Nam liber tempor cum soluta nobis eleifend option.</p>
                                <p>Congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me.
                                </p>
                                <p> Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.</p>
                            </div>
                        </div>
                    </div>
                    <!--// Panel-default -->

                    <!-- Panel-default -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h5 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-target="#faq-collapse2" aria-expanded="false" aria-controls="faq-collapse2"> <span class="button-faq"></span>More Than 30 Years In The Business</a>
                            </h5>
                        </div>
                        <div id="faq-collapse2" class="collapse" aria-expanded="false" role="tabpanel" data-parent="#faq-five">
                            <div class="panel-body">
                                <p>Nam liber tempor cum soluta nobis eleifend option.</p>
                                <p>Congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me.
                                </p>
                                <p> Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.</p>
                            </div>
                        </div>
                    </div>
                    <!--// Panel-default -->

                    <!-- Panel-default -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h5 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-target="#faq-collapse3" aria-expanded="false" aria-controls="faq-collapse3"> <span class="button-faq"></span>100% Organic Foods</a>
                            </h5>
                        </div>
                        <div id="faq-collapse3" class="collapse" role="tabpanel" data-parent="#faq-five">
                            <div class="panel-body">
                                <p>Nam liber tempor cum soluta nobis eleifend option.</p>
                                <p>Congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me.
                                </p>
                                <p> Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.</p>
                            </div>
                        </div>
                    </div>
                    <!--// Panel-default -->

                    <!-- Panel-default -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h5 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-target="#faq-collapse4" aria-expanded="false" aria-controls="faq-collapse4"> <span class="button-faq"></span>Best Shopping Strategies</a>
                            </h5>
                        </div>
                        <div id="faq-collapse4" class="collapse" role="tabpanel" data-parent="#faq-five">
                            <div class="panel-body">
                                <p>Nam liber tempor cum soluta nobis eleifend option.</p>
                                <p>Congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me.
                                </p>
                                <p> Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.</p>
                            </div>
                        </div>
                    </div>
                    <!--// Panel-default -->
                </div>

            </div>
            <div class="col-lg-6 col-md-6">
                <!--testimonial area start-->
                <div class="testimonial_area  testimonial_about">
                    <div class="section_title">
                        <h2>What Our Customers Says ?</h2>
                    </div>
                    <div class="testimonial_container">
                        <div class="testimonial_carousel testimonial-two owl-carousel">
                            <div class="single_testimonial">
                                <div class="testimonial_thumb">
                                    <a href="#"><img src="<%= basePath %>/statics/prefix/assets/img/about/testimonial1.png" alt=""></a>
                                </div>
                                <div class="testimonial_content">
                                    <div class="testimonial_icon_img">
                                        <img src="<%= basePath %>/statics/prefix/assets/img/about/testimonials-icon.png" alt="">
                                    </div>
                                    <p>I'm so happy with all of the themes, great support, could not wish for more. These people are geniuses! Kudo's from the Netherlands!..</p>
                                    <a href="#">Lindsy Neloms</a>
                                </div>
                            </div>
                            <div class="single_testimonial">
                                <div class="testimonial_thumb">
                                    <a href="#"><img src="<%= basePath %>/statics/prefix/assets/img/about/testimonial2.png" alt=""></a>
                                </div>
                                <div class="testimonial_content">
                                    <div class="testimonial_icon_img">
                                        <img src="<%= basePath %>/statics/prefix/assets/img/about/testimonials-icon.png" alt="">
                                    </div>
                                    <p>I'm so happy with all of the themes, great support, could not wish for more. These people are geniuses! Kudo's from the Netherlands!..</p>
                                    <a href="#">Rebecka Filson</a>
                                </div>
                            </div>
                            <div class="single_testimonial">
                                <div class="testimonial_thumb">
                                    <a href="#"><img src="<%= basePath %>/statics/prefix/assets/img/about/testimonial3.png" alt=""></a>
                                </div>
                                <div class="testimonial_content">
                                    <div class="testimonial_icon_img">
                                        <img src="<%= basePath %>/statics/prefix/assets/img/about/testimonials-icon.png" alt="">
                                    </div>
                                    <p>I'm so happy with all of the themes, great support, could not wish for more. These people are geniuses! Kudo's from the Netherlands!..</p>
                                    <a href="#">Amber Laha</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--testimonial area end-->
            </div>
        </div>
    </div>
</div>
<!--testimonial area end-->

<%--<!--footer area start-->
<footer class="footer_widgets footer_border">
    <div class="container">
        <div class="footer_top">
            <div class="row">
                <div class="col-lg-4 col-md-12 col-sm-7">
                    <div class="widgets_container contact_us">
                        <div class="footer_logo">
                            <a href="index.html"><img src="<%= basePath %>/statics/prefix/assets/img/logo/logo.png" alt=""></a>
                        </div>
                        <p class="footer_desc">We are a team of designers and developers that create high quality eCommerce, WordPress, Shopify .</p>
                        <p><span>Address:</span> 4710-4890 Breckinridge USA</p>
                        <p><span>Email:</span> <a href="#">demo@hasthemes.com</a></p>
                        <p><span>Call us:</span> <a href="tel:(08)23456789">(08) 23 456 789</a> </p>
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-5">
                    <div class="widgets_container widget_menu">
                        <h3>Information</h3>
                        <div class="footer_menu">

                            <ul>
                                <li><a href="about.html">About Us</a></li>
                                <li><a href="#">Delivery Information</a></li>
                                <li><a href="#"> Privacy Policy</a></li>
                                <li><a href="#"> Terms & Conditions</a></li>
                                <li><a href="contact.html"> Contact Us</a></li>
                                <li><a href="#"> Site Map</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-4">
                    <div class="widgets_container widget_menu">
                        <h3>Extras</h3>
                        <div class="footer_menu">
                            <ul>
                                <li><a href="#">Brands</a></li>
                                <li><a href="#">  Gift Certificates</a></li>
                                <li><a href="#">Affiliate</a></li>
                                <li><a href="#">Specials</a></li>
                                <li><a href="#">Returns</a></li>
                                <li><a href="#"> Order History</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-8">
                    <div class="widgets_container widget_newsletter">
                        <h3>Sign up newsletter</h3>
                        <p class="footer_desc">Get updates by subscribe our weekly newsletter</p>
                        <div class="subscribe_form">
                            <form id="mc-form" class="mc-form footer-newsletter" >
                                <input id="mc-email" type="email" autocomplete="off" placeholder="Enter you email" />
                                <button id="mc-submit">Subscribe</button>
                            </form>
                            <!-- mailchimp-alerts Start -->
                            <div class="mailchimp-alerts text-centre">
                                <div class="mailchimp-submitting"></div><!-- mailchimp-submitting end -->
                                <div class="mailchimp-success"></div><!-- mailchimp-success end -->
                                <div class="mailchimp-error"></div><!-- mailchimp-error end -->
                            </div><!-- mailchimp-alerts end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer_bottom">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-7">
                    <div class="copyright_area">
                        <p>Copyright  © 2020  <a href="#">Safira</a>  . All Rights Reserved.Design by  <a href="#">Safira</a></p>
                    </div>
                </div>
                <div class="col-lg-6 col-md-5">
                    <div class="footer_payment">
                        <ul>
                            <li><a href="#"><img src="<%= basePath %>/statics/prefix/assets/img/icon/paypal1.jpg" alt=""></a></li>
                            <li><a href="#"><img src="<%= basePath %>/statics/prefix/assets/img/icon/paypal2.jpg" alt=""></a></li>
                            <li><a href="#"><img src="<%= basePath %>/statics/prefix/assets/img/icon/paypal3.jpg" alt=""></a></li>
                            <li><a href="#"><img src="<%= basePath %>/statics/prefix/assets/img/icon/paypal4.jpg" alt=""></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!--footer area end-->--%>
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
