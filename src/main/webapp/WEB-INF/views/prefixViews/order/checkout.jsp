<%--
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/8
  Time: 11:28
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
    <title>在线商城|核实订单</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
<%--    --%>

    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/city/city.css">
    <link rel="stylesheet" type="text/css" href="<%= basePath %>/statics/layer-v3.1.1/layer/mobile/need/layer.css">
    <!-- CSS
    ========================= -->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!--bootstrap min css-->
    <!--<link rel="stylesheet" href="assets/css/bootstrap.min.css">-->
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
    <!--css地址 css-->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/css.css">
    <!--modernizr min js here-->
    <script src="<%= basePath %>/statics/prefix/assets/js/vendor/modernizr-3.7.1.min.js"></script>


    <style>
        .realpay .box .box__wrapper {
            display: inline-block;
            border: 1px solid #ff0036;
        }
        .realpay .box {
            text-align: right;
            margin-top: 15px;
        }

        .goods-price{
            font-weight: bold;
            color:rgb(255,68,0);
            font-size:14px;
        }

        .realpay .realpay--price {
            color: #ff0036;
            font: 700 26px tahoma;
        }
        .realpay .realpay--price-symbol {
            font-size: 26px;
            margin-right: 4px;
            color: #999;
        }


        #remarks-cont {
            width: 500px;
            max-width: 500px;
            min-height: 44px;
            max-height: 52px;
            line-height: 44px;
            vertical-align: text-top;
            resize: none;
            outline: 0;
            border: 1px solid #e6e6e6;
            padding: 3px 5px;
            font-size: 12px;
            display: inline-block!important;
            overflow: auto;
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
                    <h3>结帐</h3>
                    <ul>
                        <li><a href="<%= basePath %>/beforePage/toIndex">家园</a></li>
                        <li>结帐</li>
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

<!-- 模态框（Modal） 新增地址-->
<div class="modal fade"  id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop>
    <div class="modal-dialog">
        <div class="modal-content" style="width: 700px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    新增收货地址
                </h4>
            </div>
            <div class="modal-body">
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

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" data-dismiss="modal" class="btn btn-primary addBtn">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!--Checkout page section-->
<div class="Checkout_section mt-70" >
    <div class="container">
        <div class="row">
            <div class="col-12">

                <!--地址-->
                <div class="Caddress">
                    <div style="margin-bottom: 10px;font-size: 20px">填写并核对订单信息</div>
                    <div class="open_new">
                        <span style="float: left"><b>收货人地址</b></span>
                        <a  data-toggle="modal" data-target="#myModal" style="color: #005ea7;">使用新地址</a>
                    </div>
                    <div class="addrList">

                    </div>
                </div>

                <!---->



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
                                    <span class="span_style" >收货人姓名：</span>
                                    <input class="input_style" type="text" name="" id="name" value="" placeholder="" />
                                </div>
                                <div class="col-xs-12">
                                    <span class="span_style" >地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;区：</span>
                                    <input class="input_style" type="text" name="" id="city1" value="" placeholder="" />
                                </div>
                                <div class="col-xs-12">
                                    <span class="span_style" >详细地址：</span>
                                    <input class="input_style" type="text" name="" id="addrs" value="" placeholder="" />
                                </div>
                                <div class="col-xs-12">
                                    <span class="span_style" >手机号码：</span>
                                    <input class="input_style" type="text" name="" id="phone" value="" placeholder="" />
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
        </div>

        <div class="checkout_form">

            <div class="row" style="width: auto;height: 40px;line-height: 40px;text-align: right;" >
                <span style="display: flow;float: left"><b>送货清单</b></span>
                <a href="<%=basePath%>/beforePage/toCart" style="color: #005ea7;">返回修改购物车</a>
            </div>
            <div class="row">
                <form action="#">
                    <!--<h3>Your order</h3>-->
                    <div class="order_table table-responsive">
                        <table>
                            <thead>
                            <tr>
                                <th>商品</th>
                                <th>单价</th>
                                <th>数量</th>
                                <th>库存</th>
                                <th>小计</th>

                            </tr>
                            </thead>
                            <tbody>
                            <%--<tr>
                                <td>红心火龙果</td>
                                <td>8.00</td>
                                <td>5</td>
                                <td>有货</td>
                                <td class="goods-price"> 40.00</td>
                            </tr>--%>

                            </tbody>

                            <tfoot>

                            <tr class="footTr">
                                <td rowspan="2" colspan="3">
                                    <div class="remarks-item">
                                        <span class="remarks-tit" >留言:</span>
                                        <label>
                                            <textarea style="height: 44px" maxlength="45" id="remarks-cont" rows="1" placeholder="建议留言前先与商家沟通确认" onfocus="setRemarkWrite(this)" onblur="fitRemark(this)" oninput="setNum(this)" blur=""></textarea>
                                        </label>
                                        <em class="remarks-limits remarks-limits-new error hide">45</em>
                                    </div>
                                </td>
                                <td><b>总计</b></td>
                                <td class="goods-price"></td>
                            </tr>
                            <tr>
                                <td rowspan="2"><b>运费</b></td>
                                <td rowspan="2" class="devPrice">0.00</td>
                            </tr>
                            <!-- <tr class="order_total">

                             </tr>-->
                            </tfoot>
                        </table>
                    </div>

                    <div class="payment_method">
                        <div data-halo-id="realPayPC_1" data-halo-type="realPay">
                            <div class="realpay order-payInfo" id="realPayPC_1">
                                <div class="box">
                                    <div class="box__wrapper">
                                        <div class="box__shadow" data-spm-anchor-id="a210c.1.0.i4.79791debAR7VWi">
                                            <span class="addId" hidden></span>
                                            <div><span class="realpay--title">实付款：</span><span class="realpay--price-symbol">¥</span><span class="realpay--price" style="color: rgb(255, 80, 0);"></span>
                                            </div><div class="order-confirmAddr">
                                            <div class="confirmAddr-addr"><span class="confirmAddr-title">寄送至：</span>
                                                <span class="confirmAddr-addr-bd"> </span>
                                            </div>
                                            <div class="confirmAddr-addr-user"><span class="confirmAddr-title">收货人：</span><span class="confirmAddr-addr-name"></span></div>
                                        </div><div class="order-confirm-eticket"></div>
                                        </div></div></div></div></div>


                        <div class="row" style="width: auto;height: 40px;line-height: 40px;text-align: right;">
                            <span style="display: flow;float: left"><b>支付方式</b></span>
                        </div>
                        <div class="paymentList">

                        </div>


                        <div class="order_button" style="float: right;margin-top: 30px">
                            <button class="orderSubmitBtn" type="button">提交订单</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>
<!--Checkout page section end-->


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
<script src="<%= basePath %>/statics/prefix/assets/js/order/order.js"></script>

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
<script src="<%= basePath %>/statics/prefix/assets/js/head.js"></script>
</body>
</html>
