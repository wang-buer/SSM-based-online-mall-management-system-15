<%--
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/31
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>订单详情</title>
    <link rel="stylesheet" href="<%=basePath%>/statics/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="<%=basePath%>/statics/suffix/js/jquery.min.js"></script>

    <script src="<%=basePath%>/statics/layui/layui.js"></script>
</head>
<body>
    <div class="layui-box">
        <div class="layui-col-lg12 headDiv">
            <div>
                <%--<div style="margin:0 10%;color: red;float: right;">
                    当前订单状态：<span>已完成</span>
                </div>--%>
               <div style="margin:0 10%;color: red">
                   当前订单状态：<span class="orderStu">已完成</span>
               </div>
            </div>
        </div>

        <div style="margin:0 10%;">
            <i class="glyphicon glyphicon-bookmark" style="color: rgb(5,5,5); font-size: 15px;"></i>
            基本信息
        </div>
        <div class="layui-row" style="margin:2% 10%">
            <table class="layui-table" lay-even="" lay-skin="row">
                <colgroup>
                    <col width="150">
                    <col width="150">
                    <col width="200">
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th>订单编号</th>
                    <th>用户账户</th>
                    <th>支付方式</th>
                    <th>发货状态</th>
                </tr>
                </thead>
                <tbody id="orderBase">

                </tbody>
            </table>
        </div>
        <div style="margin:0 10%;">
            <i class="glyphicon glyphicon-bookmark" style="color: rgb(5,5,5); font-size: 15px;"></i>
            收货人信息
        </div>
        <div class="layui-row" style="margin:2% 10%">
            <table class="layui-table" lay-even="" lay-skin="row">
                <colgroup>
                    <col width="150">
                    <col width="150">
                    <col width="200">
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th>收货人</th>
                    <th>手机号码</th>
                    <th>地区</th>
                    <th>收货地址</th>
                </tr>
                </thead>
                <tbody id="addressInfo">

                </tbody>
            </table>
        </div>
        <div style="margin:0 10%;">
            <i class="glyphicon glyphicon-bookmark" style="color: rgb(5,5,5); font-size: 15px;"></i>
            商品信息
        </div>
        <div class="layui-row" style="margin:2% 10%">
            <table class="layui-table" lay-even="" lay-skin="row">
                <colgroup>
                    <col width="150">
                    <col width="150">
                    <col width="200">
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th>商品图片</th>
                    <th>商品名称</th>
                    <th>价格</th>
                    <th>数量</th>
                    <th>小计</th>
                </tr>
                </thead>
                <tbody id="productList">

                </tbody>
            </table>
        </div>

        <div style="margin:0 10%;">
            <i class="glyphicon glyphicon-bookmark" style="color: rgb(5,5,5); font-size: 15px;"></i>
            费用信息
        </div>
        <div class="layui-row" style="margin:2% 10%">
            <table class="layui-table" lay-even="" lay-skin="row">
                <colgroup>
                    <col width="150">
                    <col width="150">
                    <col width="200">
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th>商品合计</th>
                    <th>支付状态</th>
                    <th>订单总金额</th>
                    <th>实付款金额</th>
                </tr>
                </thead>
                <tbody id="productPrice">


                </tbody>
            </table>
        </div>
    </div>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/statics/suffix/js/orderView.js"></script>

</body>
</html>
