<%--
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/31
  Time: 9:27
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
    <title>在线商城|首页</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
<!--header area start-->

<!--offcanvas menu area start-->
<div class="off_canvars_overlay">

</div>
<div class="offcanvas_menu">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="canvas_open">
                    <a href="javascript:void(0)"><i class="icon-menu"></i></a>
                </div>
                <div class="offcanvas_menu_wrapper">
                    <div class="canvas_close">
                        <a href="javascript:void(0)"><i class="icon-x"></i></a>
                    </div>

                    <div class="call-support">
                        <p><a href="tel:(08)23456789">(08) 23 456 789</a> 用户支持</p>
                    </div>

                   <%-- <div id="menu" class="text-left ">
                        <ul class="offcanvas_main_menu">
                            <li class="menu-item-has-children active">
                                <a href="<%= basePath %>/beforePage/toIndex">Home</a>
                            </li>
                            <li class="menu-item-has-children">
                                <a href="<%= basePath %>/beforePage/toFruitsList?productClassId=2">Shop</a>

                            </li>
                            <li class="menu-item-has-children">
                                <a href="<%= basePath %>/beforePage/toFruitsList?productClassId=1">blog</a>

                            </li>
                            <li class="menu-item-has-children">
                                <a href="<%= basePath %>/beforePage/toServices">pages </a>
                            </li>
                            <li class="menu-item-has-children">
                                <a href="<%= basePath %>/beforePage/toMyAccount">my account</a>
                            </li>
                            <li class="menu-item-has-children">
                                <a href="<%= basePath %>/beforePage/toAbout">about Us</a>
                            </li>
                            <li class="menu-item-has-children">
                                <a href="contact.html"> Contact Us</a>
                            </li>
                        </ul>
                    </div>--%>


                    <div class="offcanvas_footer">
                        <span><a href="#"><i class="fa fa-envelope-o"></i> info@yourdomain.com</a></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--offcanvas menu area end-->

<header>
    <div class="main_header">
        <div class="header_top">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-6">

                        <div class="language_currency">
                            <ul>
                                <li class="language">
                                    <a href="<%= basePath %>/beforePage/toIndex"> 欢迎来到绿色蔬果商城</a>
                                </li>

                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="language_currency text-right">
                            <ul>
                                <li><a href="<%= basePath %>/beforePage/toOrder">我的订单</a></li>
                                <li><a href="<%= basePath %>/beforePage/toWishList">我的收藏</a></li>
                                <li><a href="#">网站导航</a></li>
                                <shiro:notAuthenticated>
                                    <li><a href="<%= basePath %>/beforePage/toLogin"><span style="color:red;font-family: Consolas">亲，请登录</span></a></li>
                                </shiro:notAuthenticated>

                                <shiro:authenticated>
                                    <li class="currency"><a href="#"> <shiro:principal/> <i class="icon-right ion-ios-arrow-down"></i></a>
                                        <ul class="dropdown_currency">
                                            <li>
                                                <div class="img_div">
                                                    <a href="<%= basePath %>/beforePage/toMyAccount">
                                                        <img class="user-head getgold_top_head_img" src="<%= basePath %>/statics/layui/images/no-img.jpg" alt="正方形的原始图片" />
                                                    </a>
                                                    <div class="userLoginName">
                                                        <a href="<%= basePath %>/beforePage/toMyAccount">
                                                            <shiro:principal/>
                                                        </a>
                                                    </div>
                                                    <div class="logout">
                                                        <a href="<%= basePath %>/logout">
                                                            退出
                                                        </a>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </li>

                                </shiro:authenticated>
                                <li><a href="<%= basePath %>/beforePage/toRegist">免费注册</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="header_middle">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-2">
                        <div class="logo">
                        </div>
                    </div>
                    <div class="col-lg-10">
                        <div class="header_right_info">
                            <div class="search_container">
                                <form action="#">
                                    <div class="hover_category">
                                        <%--<select class="select_option" name="select" id="categori2">
                                            <option selected value="1">选择一个类别</option>
                                            <option value="2">附件</option>

                                        </select>--%>
                                    </div>
                                    <div class="search_box">
                                        <input class="productName" placeholder="请输入商品名称..." type="text">
                                        <button type="button" class="queryProduct"><span class="lnr lnr-magnifier"></span></button>
                                    </div>
                                </form>
                            </div>
                            <div class="header_account_area">
                                <div class="header_account_list register">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </div>
                                <div class="header_account_list header_wishlist">
                                    <a href="<%= basePath %>/beforePage/toWishList"><span class="lnr lnr-heart"></span></a>
                                </div>
                                <div class="header_account_list  mini_cart_wrapper">
                                    <a href="<%= basePath %>/beforePage/toCart"><span class="lnr lnr-cart"></span></a>
                                    <!--mini cart-->
                                    <%--<div class="mini_cart">
                                        &lt;%&ndash;<div class="cart_gallery">
                                            <div class="cart_item">
                                                <div class="cart_img">
                                                    <a href="#"><img src="<%= basePath %>/statics/prefix/assets/img/s-product/product.jpg" alt=""></a>
                                                </div>
                                                <div class="cart_info">
                                                    <a href="#">Primis In Faucibus</a>
                                                    <p>1 x <span> $65.00 </span></p>
                                                </div>
                                                <div class="cart_remove">
                                                    <a href="#"><i class="icon-x"></i></a>
                                                </div>
                                            </div>
                                            <div class="cart_item">
                                                <div class="cart_img">
                                                    <a href="#"><img src="<%= basePath %>/statics/prefix/assets/img/s-product/product2.jpg" alt=""></a>
                                                </div>
                                                <div class="cart_info">
                                                    <a href="#">Letraset Sheets</a>
                                                    <p>1 x <span> $60.00 </span></p>
                                                </div>
                                                <div class="cart_remove">
                                                    <a href="#"><i class="icon-x"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mini_cart_table">
                                            <div class="cart_table_border">
                                                <div class="cart_total">
                                                    <span>共计:</span>
                                                    <span class="price">$125.00</span>
                                                </div>
                                                <div class="cart_total mt-10">
                                                    <span>总计:</span>
                                                    <span class="price">$125.00</span>
                                                </div>
                                            </div>
                                        </div>&ndash;%&gt;
                                        &lt;%&ndash;<div class="mini_cart_footer">
                                            <div class="cart_button">
                                                <a href="<%= basePath %>/beforePage/toCart"><i class="fa fa-shopping-cart"></i> 购物车</a>
                                            </div>
                                            <div class="cart_button">
                                                <a href="<%= basePath %>/beforePage/toCheckout"><i class="fa fa-sign-in"></i> 结账</a>
                                            </div>

                                        </div>&ndash;%&gt;
                                    </div>--%>
                                    <!--mini cart end-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="header_bottom sticky-header">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-3">
                        <div class="categories_menu">
                            <div class="categories_title">
                                <h2 class="categori_toggle">所有类别</h2>
                            </div>
                            <div class="categories_menu_toggle">
                                <ul class="productClassList">

                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <!--main menu start-->
                        <div class="main_menu menu_position">
                            <nav>
                                <ul>
                                    <li><a class="active"  href="<%= basePath %>/beforePage/toIndex">首页</a>

                                    </li>
                                    <li><a href="<%= basePath %>/beforePage/toFruitsList?productClassId=2">蔬菜专区</a>

                                    </li>
                                    <li><a href="<%= basePath %>/beforePage/toFruitsList?productClassId=1">水果专区</a></li>

                                    <li><a href="<%= basePath %>/beforePage/toServices">服务中心</a></li>
                                    <li><a href="<%= basePath %>/beforePage/toMyAccount">我的账号</a></li>


                                    <li><a href="#">网站导航<i class="fa fa-angle-down"></i></a>
                                        <ul class="sub_menu pages">
                                            <li><a href="<%= basePath %>/beforePage/toAbout">关于我们</a></li>
                                            <li><a href="<%= basePath %>/beforePage/toFaq">网站常识</a></li>
                                            <li><a href="<%= basePath %>/beforePage/to404">错误 404</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        <!--main menu end-->
                    </div>
                    <div class="col-lg-3">
                        <div class="call-support">
                            <p><a href="tel:(08)23456789">(08) 23 456 789</a> 用户支持</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!--header area end-->


</body>
</html>
