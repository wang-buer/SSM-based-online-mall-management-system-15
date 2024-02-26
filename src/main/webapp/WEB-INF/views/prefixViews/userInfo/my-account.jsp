<%--
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/8
  Time: 11:37
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
    <title>在线商城|我的帐户</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->


    <!-- CSS
    ========================= -->
    <!--bootstrap min css-->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/city/city.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath %>/statics/layer-v3.1.1/layer/mobile/need/layer.css">
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


    <!--my_account_order css-->
    <link rel="stylesheet" type="text/css" href="<%= basePath %>/statics/prefix/assets/css/my_account_order.css"/>
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/style.css">
    <!--taber css-->
    <link rel="stylesheet" type="text/css" href="<%= basePath %>/statics/prefix/assets/css/taber.css"/>
    <!--em css-->
    <link rel="stylesheet" type="text/css" href="<%= basePath %>/statics/prefix/assets/css/em.css"/>
    <!--css地址 css-->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/css.css">

    <link rel="stylesheet" href="<%= basePath %>/statics/layui/css/layui.css">
    <style>
        .social-footer {
            border-top: 1px solid #e7eaec;
            padding: 10px 15px;
            background: #f9f9f9;
        }
        .social-avatar img{
            width:40px;
            height:40px;
        }
    </style>


</head>

<body>


<jsp:include page="/beforePage/toHead"/>
<!--breadcrumbs area start-->
<div class="breadcrumbs_area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb_content">
                    <h3>个人中心</h3>
                    <ul>
                        <li><a href="<%= basePath %>/beforePage/toIndex">家园</a></li>
                        <li>个人中心</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--breadcrumbs area end-->

<!--修改地址表单遮盖-->
<div class="shade" hidden="hidden">
</div>

<!-- my account start  -->
<section class="main_content_area">
    <div class="container">
        <div class="account_dashboard">
            <div class="row">
                <div class="col-sm-12 col-md-3 col-lg-3">
                    <!-- Nav tabs -->
                    <div class="dashboard_tab_button">
                        <ul role="tablist" class="nav flex-column dashboard-list">
                            <li><a href="#mymessage" data-toggle="tab" class="nav-link active">个人信息</a></li>
                            <li><a href="#orders" data-toggle="tab" class="nav-link">我的交易</a></li>
                            <li><a href="#addr" data-toggle="tab" class="nav-link">收货地址</a></li>
                            <li><a href="#account-details" data-toggle="tab" class="nav-link">消息中心</a></li>

                        </ul>
                    </div>
                </div>
                <div class="col-sm-12 col-md-9 col-lg-9">
                    <!-- Tab panes -->
                    <div class="tab-content dashboard_content">
                        <div class="tab-pane fade show active" id="mymessage">

                            <div class="price">
                                <h2>个人信息</h2>
                                <div class="category">
                                    <ul style="width:848px">
                                        <li class="active">基本信息</li>
                                        <li>头像照片</li>
                                        <li>
                                            修改密码
                                        </li>

                                    </ul>

                                </div>
                                <div class="cont active">
                                    <div class="login">
                                        <div class="login_form_container">
                                            <h2>登入名：<shiro:principal/></h2>
                                            <div class="account_login_form">
                                                <form class="userInfo">
                                                    <input class="userInfoId" hidden>
                                                    <div class="input-radio">
                                                        <span class="custom-radio"><input type="radio" value="男" name="id_gender" checked> 男</span>
                                                        <span class="custom-radio"><input type="radio" value="女" name="id_gender"> 女</span>
                                                    </div>
                                                    <label>真实姓名</label>
                                                    <input type="text" name="user_realname" class="userRealname">

                                                    <label>Email</label>
                                                    <input type="text" name="user_email" class="userEmail">
                                                    <label>手机号码</label>
                                                    <input type="text" name="user_tel" class="userTel">
                                                    <label>家庭地址<span style="color: #8D8D8D"><i>例：江西省抚州市乐安县万崇镇</i></span></label>
                                                    <input type="text" name="user_addr" class="userAddr">

                                                    <div class="save_button primary_btn default_button">
                                                        <button type="button" class="userInfoBtn">保存</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="cont">
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">上传封面</label>
                                        <div class="layui-input-inline uploadHeadImage" id="headImg">
                                            <i class="layui-icon"></i>
                                            <input type="hidden" id="imgPath" name="img">
                                            <img id="imgUrl" class="getgold_top_head_img" src="<%= basePath %>/statics/layui/images/upload.jpg" style="width: 100px;height: 100px;" alt="暂无图片"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="cont">
                                    <ul>
                                        <li>

                                            <div class="cont_main">

                                                <form class="form-horizontal" role="form">

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">旧密码：</label>
                                                        <div class="col-sm-10">
                                                            <input class="form-control" id="password" type="password"  value="">
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">新密码：</label>
                                                        <div class="col-sm-10">
                                                            <input class="form-control" id="newPassword" type="password"  value="">
                                                        </div>
                                                    </div>
                                                    <button type="button" class="btn btn-default userPwdBtn">提交</button>
                                                    <button type="reset" class="btn btn-default">重置</button>

                                                </form>
                                            </div>

                                        </li>
                                    </ul>
                                </div>



                            </div>

                        </div>

                        <div class="tab-pane fade" id="orders">

                            <!--订单 -->
                            <div class="m-order">
                                <div class="s-bar">
                                    <i class="s-icon"></i>我的订单
                                    <a class="i-load-more-item-shadow" href="<%= basePath %>/beforePage/toOrder#allOrders">全部订单</a>
                                    <!-- <hr style="margin-top: 5px">-->
                                </div>

                                <ul class="ordersInfo">
                                    <li><a href="<%= basePath %>/beforePage/toOrder#noPayLi"><i><img src="<%= basePath %>/statics/prefix/assets/img/order/pay.png" height="64" width="64"/></i><span>待付款</span></a></li>
                                    <li><a href="<%= basePath %>/beforePage/toOrder#noSendLi"><i><img src="<%= basePath %>/statics/prefix/assets/img/order/send.png"/></i><span>待发货</span></a></li>
                                    <li><a href="<%= basePath %>/beforePage/toOrder#noComplLi"><i><img src="<%= basePath %>/statics/prefix/assets/img/order/receive.png"/></i><span>待收货</span></a></li>
                                    <li><a href="<%= basePath %>/beforePage/toOrder#"><i><img src="<%= basePath %>/statics/prefix/assets/img/order/comment.png"/></i><span>待评价</span></a></li>
                                    <li><a href="<%= basePath %>/beforePage/toOrder"><i><img src="<%= basePath %>/statics/prefix/assets/img/order/refund.png"/></i><span>退换货</span></a></li>
                                </ul>
                            </div>

                            <!--订单发货最新信息 -->
                            <div class="m-logistics">
                                <div class="s-bar">
                                    <i class="s-icon"></i>订单最新信息
                                </div>
                                <div class="s-content" id="s1" style="height: 97px;">
                                    <ul class="lg-list orderInfo">



                                    </ul>

                                </div>

                            </div>


                        </div>

                        <div class="tab-pane" id="addr">
                            <!--地址-->
                            <div class="Caddress">
                                <div style="margin-bottom: 10px;font-size: 20px">填写并核对订单信息</div>
                                <div class="open_new">
                                    <span style="float: left"><b>收货人地址</b></span>
                                    <br/>
                                </div>
                                <div class="addrList">

                                </div>
                            </div>
                            <br/>

                            <div class="col-sm-12 col-md-9 col-lg-9">
                                <h3>新增收货地址</h3>
                                <form class="form-horizontal" role="form">

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">收货人姓名：</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="addressUserName" type="text"  value="">
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">地区：</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="city" type="text"  value="">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">详细地址：</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="addressAddr" type="text"  value="">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">电话号码：</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="addressTel" type="text"  value="">
                                        </div>
                                    </div>


                                    <button type="button" class="btn btn-default addBtn">提交</button>
                                    <button type="reset" class="btn btn-default">重置</button>

                                </form>
                            </div>

                            <div class="shade_content" hidden="hidden">
                                <div class="col-xs-12 shade_colse">
                                    <button onclick="onclick_close();">x</button>
                                </div>

                                <div class="nav shade_content_div">
                                    <div class="col-xs-12 shade_title">
                                        修改收货地址
                                    </div>
                                    <div class="col-xs-12 shade_from">
                                        <form action="" method="post" >
                                            <span class="addressId" hidden></span>
                                            <div class="col-xs-12">
                                                <span class="span_style">收货人姓名：</span>
                                                <input class="input_style" type="" name="" id="name" value="" placeholder="&nbsp;&nbsp;请输入您的所在地区" />
                                            </div>
                                            <div class="col-xs-12">
                                                <span class="span_style" >地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;区：</span>
                                                <input class="input_style" type="" name="" id="city1" value="" placeholder="&nbsp;&nbsp;请输入您的详细地址" />
                                            </div>
                                            <div class="col-xs-12">
                                                <span class="span_style">详细地址：</span>
                                                <input class="input_style" type="" name="" id="addrs" value="" placeholder="&nbsp;&nbsp;请输入您的邮政编号" />
                                            </div>
                                            <div class="col-xs-12">
                                                <span class="span_style" class="span_sty">手机号码：</span>
                                                <input class="input_style" type="" name="" id="phone" value="" placeholder="&nbsp;&nbsp;请输入您的姓名" />
                                            </div>
                                            <div class="col-xs-12">
                                                <input class="btn_remove" type="button" id="" onclick="javascript:onclick_close();" value="取消" />
                                                <input type="button" class="sub_set" id="sub_setID" value="提交" />
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="account-details">
                            <h3>消息中心 </h3>

                            <div class="context">
                                <ul id="myTab" class="nav nav-tabs">
                                    <li class="active">
                                        <a href="#home" onclick="chang1();" class="ordersInfo" id="countReply" data-toggle="tab" >
                                            收到的评论
                                        </a>
                                    </li>
                                    <li><a href="#ios" onclick="chang2();" class="ordersInfo" data-toggle="tab">我的反馈</a></li>
                                    <!--<li><a href="#jmeter" tabindex="-1" data-toggle="tab">收到的赞<em>3</em></a></li>-->
                                </ul>

                                <div id="myTabContent" class="tab-content">
                                    <!-- 收到的评论内容 -->
                                    <div class="tab-pane con fade in active" id="home">


                                    </div>
                                    <!-- 收到的回复内容 -->
                                    <div class="tab-pane con fade" id="ios">

                                    </div>
                                </div>
                            </div>
                            <div id="demo2"></div>
                            <div id="demo3" hidden></div>
                        </div>
                    </div>



                </div>
            </div>
        </div>
    </div>
</section>
<!-- my account end   -->

<jsp:include page="/beforePage/toFoot"/>
<!-- JS
============================================ -->



<!--jquery min js-->
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    $(function(){
        //选项卡切换
        $('.category ul li').click(function(){
            indexC = $(this).index();
            $(this).addClass('active').siblings().removeClass('active');
            $('.cont').eq(indexC).addClass('active').siblings().removeClass('active');
        });

        //选项卡切换
        $('.context ul li').click(function(){
            indexC = $(this).index();
            $(this).addClass('active').siblings().removeClass('active');
            $('.con').eq(indexC).addClass('active').siblings().removeClass('active');
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
<!--bootstrap min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/bootstrap.min.js"></script>
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

<script src="<%= basePath %>/statics/prefix/assets/js/city/Popt.js"></script>
<script src="<%= basePath %>/statics/prefix/assets/js/city/cityJson.js"></script>
<script src="<%= basePath %>/statics/prefix/assets/js/city/citySet.js"></script>
<script type="text/javascript">
    $("#city").click(function (e) {
        SelCity(this,e);
        console.log("inout",$(this).val(),new Date())
    });

    $("#city1").click(function (e) {
        SelCity(this,e);
        console.log("inout",$(this).val(),new Date())
    });
</script>
<script src="<%= basePath %>/statics/layer-v3.1.1/layer/layer.js"></script>
<script src="<%= basePath %>/statics/layui/layui.js"></script>
<script src="<%= basePath %>/statics/prefix/assets/js/myAccount/myAccount.js"></script>
<script src="<%= basePath %>/statics/prefix/assets/js/head.js"></script>
</body>
</html>
