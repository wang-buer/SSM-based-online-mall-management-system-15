<%--
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/4/2
  Time: 11:51
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=basePath%>/statics/layui/css/layui.css" media="all">
    <script src="<%=basePath%>/statics/suffix/js/jquery.min.js"></script>
    <script src="<%=basePath%>/statics/layui/layui.js"></script>

</head>

<body>

<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">订单管理</a>
            <a>
              <cite>订单列表</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
    <div class="">
        <div class="demoTable" style="padding: 15px; ">
            <%--<input type="text"  style="width: 250px; height:30px;padding-left: 5px;" name="query" id="query" required  placeholder="请输"/>--%>

                    <div class="layui-input-inline layui-show-xs-block">
                        <input class="layui-input" placeholder="开始日" name="start" id="start"></div>
                    <div class="layui-input-inline layui-show-xs-block">
                        <input class="layui-input" placeholder="截止日" name="end" id="end"></div>


                    <div class="layui-input-inline layui-show-xs-block">
                        <form class="layui-form">
                        <select name="lssgPayment.paymentName" id="payment">
                            <option value="">请选择支付方式</option>
                        </select>
                        </form>
                    </div>


                    <div class="layui-input-inline layui-show-xs-block">
                        <form class="layui-form">
                        <select name="contrller" id="orderStatus">
                            <option value="">请选择订单状态</option>
                            <option value="3">待支付</option>
                            <option value="4">待发货</option>
                            <option value="5">待收货</option>
                            <option value="2">已取消</option>
                            <option value="1">已完成</option>
                        </select>
                    </form>
                    </div>

                    <div class="layui-input-inline layui-show-xs-block">
                        <input type="text"  name="orderId" placeholder="请输入订单号" autocomplete="off" class="layui-input orderId"></div>
                    <button class="layui-btn layui-btn-small orderBtn" lay-even="search" id="searchByquery">
                        <i class="layui-icon">&#xe615;</i> 搜索
                    </button>


        </div>
        <%--表头--%>
        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-sm" lay-event="getCheckData">批量删除</button>
            </div>
        </script>
            <%--表体--%>
            <table id="demo" lay-filter="test"></table>
        <style type="text/css">
            .layui-table-cell{
                /*text-align:center;*/
                height: auto;
                white-space: normal;
            }
            .layui-table img{
                max-width:100px
            }
        </style>
            <%--表每行操作--%>
        <script type="text/html" id="barDemo">
            {{#  if(d.lssgOrderAction.orderStatus ==4){ }}
            <a class="layui-btn layui-btn-primary layui-btn-xs " href="javascript:void(0)" lay-event="view">查看订单</a>
            <a class="layui-btn layui-btn-xs layui-btn-primary  sendOrder" href="javascript:void(0)" lay-event="send">订单发货</a>

            {{# }if(d.lssgOrderAction.orderStatus ==1) { }}
            <a class="layui-btn layui-btn-primary layui-btn-xs " href="javascript:void(0)" lay-event="view">查看订单</a>
            <a class="layui-btn layui-btn-warm layui-btn-xs " href="javascript:void(0)" lay-event="del">关闭订单</a>
            {{# }if(d.lssgOrderAction.orderStatus ==2) { }}
            <a class="layui-btn layui-btn-primary layui-btn-xs " href="javascript:void(0)" lay-event="view">查看订单</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs " href="javascript:void(0)" lay-event="delete">删除订单</a>
            {{# }if(d.lssgOrderAction.orderStatus ==3) { }}
            <a class="layui-btn layui-btn-primary layui-btn-xs " href="javascript:void(0)" lay-event="view">查看订单</a>
            <a class="layui-btn layui-btn-xs layui-btn-normal " href="javascript:void(0)" lay-event="delete">订单跟踪</a>
            {{# }if(d.lssgOrderAction.orderStatus ==5) { }}
            <a class="layui-btn layui-btn-primary layui-btn-xs " href="javascript:void(0)" lay-event="view">查看订单</a>
            <a class="layui-btn layui-btn-xs layui-btn-normal" href="javascript:void(0)" lay-event="look">订单跟踪</a>
            {{#  } }}
        </script>

        <script>

            layui.use(["jquery", "upload", "form", "layer", "element"], function () {
                var $ = layui.$,
                    element = layui.element,
                    layer = layui.layer,
                    upload = layui.upload,
                    form = layui.form;

                //得到所有的支付类别信息，并绑定到下拉选择框中
                var obj = new Object();
                getAllClass(obj);
                function getAllClass(object) {
                    $.ajax({
                        type: 'post',
                        url: "<%=basePath%>/payment/findAllPayment",
                        dataType: 'json',
                        async:false,
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify(object),
                        // 请求成功的回调
                        success: function (data) {

                            //绑定类别下拉框
                            if (data != null)
                                for (var i = 0; i < data.length; i++) {
                                    console.log("data[i].paymentId"+data[i].paymentId);
                                    $("#payment").append("<option value='" + data[i].paymentId + "'>" + data[i].paymentName + "</option>");
                                }
                            layui.use(['form'], function () {
                                var form = layui.form;
                                form.render('select'); //刷新select选择框渲染
                            });
                        }
                    })
                }
            });


            layui.use(['table','util'], function(){
                var table = layui.table;
                var util = layui.util;
                //默认查询所有订单信息
                var orderStatus0 = getQueryVariable("orderStatus");
                console.log("orderStatus0---->"+orderStatus0);
                if(orderStatus0==2){
                    renderTable('','','','',2);
                }else if(orderStatus0==4){
                    renderTable('','','','',4);
                }else{
                    renderTable('');
                }



                $("#searchByquery").on("click",function(){
                    var paymentId = $('#payment option:selected').val();
                    var statTime = $('#start').val();
                    var endTime = $('#end').val();
                    var orderId = $('.orderId').val();
                    var orderStatus = $('#orderStatus option:selected').val();
                    console.log("paymentId--->"+paymentId);
                    console.log("statTime--->"+statTime);
                    console.log("orderId--->"+orderId);
                    console.log("orderStatus--->"+orderStatus);
                    renderTable(paymentId,statTime,endTime,orderId,orderStatus);
                });
                /**
                 * 分页显示图书信息
                 * */
                function renderTable(paymentId,statTime,endTime,orderId,orderStatus){
                    var s = 7;
                    //第一个实例
                    table.render({
                        elem: '#demo'
                       /* ,height : 195*s*/
                        ,url: '<%=basePath%>/order/showOrderPage'//数据接口
                        , method: 'post'
                        , contentType: 'application/json'
                        , toolbar: '#toolbarDemo'
                        , title: '用户数据表'
                        , request: {
                            pageName: 'curr' //页码的参数名称，默认：page
                            , limitName: 'nums' //每页数据量的参数名，默认：limit
                        }
                        ,where:{
                            "paymentId":paymentId,
                            "orderId":orderId,
                            "statTime":statTime,
                            "endTime":endTime,
                            "orderStatus":orderStatus
                        }
                        ,page: true //开启分页
                        ,cols: [[ //表头
                            {type: 'checkbox'}
                            , {field: 'orderId', title: '订单号', width: 80}
                            , {field: 'lssgAddress.addressUserName', title: '收货人', width: 100,templet:function (d) {
                                    return '<span style="color:green;">'+d.lssgAddress.addressUserName+'</span>'
                                    }
                                }
                            , {field: 'lssgAddress.addressTel', title: '电话号码', width: 120,templet:function (d) {
                                    return '<span style="color:green;">'+d.lssgAddress.addressTel+'</span>'
                                }}
                            , {field: 'orderTotalPrice', title: '应付金额', width: 150}
                            , {field: 'orderStatus', title: '订单状态', width: 80,templet:function (d) {
                                if(d.lssgOrderAction.orderStatus==1){
                                    return '<span style="color:green;">已完成</span>'
                                }else if(d.lssgOrderAction.orderStatus==2){
                                    return '<span style="color:red;">已取消</span>'
                                }else if(d.lssgOrderAction.orderPayStatus=='未支付'){
                                    return '<span style="color:brown;">待支付</span>'
                                }else if(d.lssgOrderAction.shoppingStatus=="未发货"){
                                    return '<span style="color:darkmagenta;">待发货</span>'
                                }else if(d.lssgOrderAction.orderStatus==5){
                                    return '<span style="color:orange;">待收货</span>'
                                }

                                }}
                            , {field: 'lssgOrderAction.orderPayStatus', title: '支付状态', width: 100,templet:function (d) {
                                    return '<span style="color:green;">'+d.lssgOrderAction.orderPayStatus+'</span>'
                                }}
                            , {field: 'lssgOrderAction.shoppingStatus', title: '发货状态', width: 120,templet:function (d) {
                                return '<span style="color:green;">'+d.lssgOrderAction.shoppingStatus+'</span>'
                                }}
                            , {field: 'lssgPayment.paymentName', title: '支付方式', width: 150,templet:function (d) {
                                    return '<span style="color:green;">'+d.lssgPayment.paymentName+'</span>'
                                }}
                            , {field: 'doOrderTime', title: '下单时间', width: 150,templet: function(d){
                                    if (d.doOrderTime == null)
                                    {
                                        return "暂无数据";
                                    }
                                    return "<span>"+ showTime(d.doOrderTime) +"</span>";
                                }}
                            , {title: '操作', toolbar: '#barDemo', width: 200}
                        ]],
                        limit: s,
                        limits: [s, 2*s, 3*s, 4*s, 5*s, 6*s, 7*s, 8*s, 9*s, 10*s]
                    });
                }

                //头工具栏事件
                table.on('toolbar(test)', function (obj) {
                    //获取所有选中行。
                    var checkStatus = table.checkStatus(obj.config.id);
                    switch (obj.event) {
                        case 'getCheckData':
                            var data = checkStatus.data;
                            console.log("data--->"+data);
                            var list = [];
                            for(var i in data){
                                console.log("i---->"+i+"\tdata-->"+data[i].orderId);
                                list.push(data[i].orderId)
                            }
                            console.log("list--->"+list);
                            layer.confirm('真的删除选中行么', function (index) {
                                deleteRows(list);
                                //layer.close(index);
                            });
                            break;
                        case 'getCheckLength':
                            var data = checkStatus.data;
                            layer.msg('选中了：' + data.length + ' 个');
                            break;
                        case 'isAll':
                            layer.msg(checkStatus.isAll ? '全选' : '未全选');
                            break;
                        case 'add':
                            var tourl = "<%=basePath%>/book/addBookPage";
                            layer.open({
                                type: 2,//Layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                                content: tourl,//这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                                title: '用户信息新增',//弹出层标题
                                area: ['100%', '100%']  //弹出层宽高
                            })
                    }
                });


                /**
                 * 删除一行数据
                 * */
                function deleteRow(object) {
                    $.ajax({
                        type: 'post',
                        url: "<%=basePath%>/order/delOneOrder",
                        dataType: 'json',
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify(object),

//               请求成功的回调
                        success: function (data) {
                            console.log("data--->"+data);
                            if (data > 0) {
                                table.reload('demo');
                            }
                        }
                    })
                }

                /**
                 * 删除选中行数据
                 * */
                function deleteRows(list){
                    $.ajax({
                        url:"<%=basePath%>/order/deleteSelectOrders",
                        data:JSON.stringify(list),
                        type: 'post',
                        traditional: true,
                        dataType: "JSON",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            console.log("data--->"+data);
                            if (data > 0) {
                                layer.msg("您已经成功删除"+data+"条记录！", {
                                    icon: 1,
                                    time: 1000,
                                    end: function () {
                                        table.reload('demo');
                                    }
                                });
                            }
                        }
                    });
                }

                /**
                 * 订单发货
                 * */
                function sendOrder(id,status){
                    $.ajax({
                        type: 'post',
                        url: "<%=basePath%>/order/sendOneOrder",
                        dataType: 'json',
                        data:{
                            "orderId":id,
                            "status":status
                        } ,

//               请求成功的回调
                        success: function (data) {
                            console.log("data--->"+data);
                            if (data > 0) {
                                table.reload('demo');
                            }
                        }
                    })
                }

                /**
                 *
                 * */
                //监听行工具事件
                table.on('tool(test)', function (obj) {
                    var data = obj.data;
                    console.log("data--->"+data);
                    for(var i in data){
                        console.log("i---->"+i+"\tdata-->"+data[i]);
                    }
                    //执行删除操作
                    if (obj.event === 'del') {
                        layer.confirm('真的删除行么', function (index) {
                            console.log("data.orderId--->"+data.orderId);
                            deleteRow(data.orderId);
                            layer.close(index);
                        });
                    } else if (obj.event === 'view') {
                        var orderId= data.orderId;

                        console.log("orderId---->"+orderId);

                        var tourl = "<%=basePath%>/page/toOrderDetails?orderId="+orderId;
                        layer.open({
                            type: 2,
                            content: tourl,
                            title: '用户信息修改',
                            area: ['100%', '100%']
                        })
                        //执行修改操作

                    }else if (obj.event === 'send'){
                        layer.confirm('确定发货吗', function (index) {
                            console.log("data.orderId--->"+data.orderId);
                            sendOrder(data.orderId,"已发货");
                            layer.close(index);
                        });
                    }


                });


                function countAction(orderStatus) {
                    var object = {"orderStatus":orderStatus};
                    $.ajax({
                        type: 'post',
                        url: "http://localhost:8080/order/countOrderActionByMap",
                        dataType: 'json',
                        async:false,
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify(object),
                        // 请求成功的回调
                        success: function (data){
                            if(data>0&&orderStatus==4){
                                $(".sendOrder").append("<span class=\"pull-right badge badge-success\">+"+data+"</span>");
                            }
                            if(data>0&&orderStatus==2){
                                $(".noOrder").append("<span class=\"pull-right badge badge-info\">+"+data+"</span>");
                            }
                        }
                    });

                }

                //时间转换函数
                function showTime(tempDate)
                {
                    var d = new Date(tempDate);
                    var year = d.getFullYear();
                    var month = d.getMonth();
                    month++;
                    var day = d.getDate();
                    var hours = d.getHours();

                    var minutes = d.getMinutes();
                    var seconds = d.getSeconds();
                    month = month<10 ? "0"+month:month;
                    day = day<10 ? "0"+day:day;
                    hours = hours<10 ? "0"+hours:hours;
                    minutes = minutes<10 ? "0"+minutes:minutes;
                    seconds = seconds<10 ? "0"+seconds:seconds;

                    var time = year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds;
                    // var time = year+"-"+month+"-"+day;
                    return time;
                }
            });

            layui.use(['laydate', 'form'],
                function() {
                    var laydate = layui.laydate;
                    //执行一个laydate实例
                    laydate.render({
                        elem: '#start' //指定元素
                    });

                    //执行一个laydate实例
                    laydate.render({
                        elem: '#end' //指定元素
                    });
                });


            /**
             * 获取地址栏上的参数
             * */
            function getQueryVariable(variable)
            {
                var query = window.location.search.substring(1);
                var vars = query.split("&");
                for (var i=0;i<vars.length;i++) {
                    var pair = vars[i].split("=");
                    if(pair[0] == variable){return pair[1];}
                }
                return(false);
            }
        </script>
    </div>
</body>
</html>
