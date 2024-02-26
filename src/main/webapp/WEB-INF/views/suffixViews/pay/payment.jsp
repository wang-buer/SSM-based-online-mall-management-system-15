<%--
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/7
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>友情连接列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="<%= basePath %>/statics/suffix/css/font.css">
    <link rel="stylesheet" href="<%= basePath %>/statics/suffix/css/index.css">
    <script src="<%= basePath %>/statics/suffix/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%= basePath %>/statics/suffix/js/index.js"></script>

</head>
<body>
<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">支付管理</a>
            <a>
              <cite>支付列表</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">

                        <%--<div class="layui-inline layui-show-xs-block">
                            <input type="text" id="paymentName" name="paymentName"  placeholder="请输入支付方式" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                        </div>--%>

                </div>

                <table id="demo" lay-filter="test"></table>

            </div>
        </div>
    </div>
</div>
</body>
<%--表头--%>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-danger" lay-event="getCheckData"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="xadmin.open('添加用户','<%= basePath %>/page/toPaymentAdd',800,600)"><i class="layui-icon"></i>添加</button>
    </div>
</script>

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
    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<%--特殊列的模板--%>
<script type="text/html" id="photoImg">
    {{#  if(null!=d.paymentImg&&d.paymentImg.length >20){ }}
    <img src="<%=basePath%>/uploadfiles/notice/{{d.paymentImg}}" alt="{{d.paymentImg}}">
    {{#  } else { }}
    <img src="<%=basePath%>/statics/layui/images/upload.jpg" alt="谁叫你不上传的">
    {{#  } }}
</script>
<script>

    layui.use(['table',"form",'util'], function(){
        var table = layui.table;
        var util = layui.util;
        var form = layui.form;
        //默认查询所有学生信息
        renderTable('');

        $("#searchByquery").on("click",function(){
            var paymentName = $('#paymentName').val();

            console.log("paymentName------>"+paymentName);
            renderTable(paymentName);
        });
        /**
         * 分页显示图书信息
         * */
        function renderTable(paymentName){
            var s = 7;
            //第一个实例
            table.render({
                elem: '#demo'
                /* ,height : 195*s*/
                ,url: '<%=basePath%>/payment/findAllByMapWithPage' //数据接口
                , method: 'post'
                , contentType: 'application/json'
                , toolbar: '#toolbarDemo'
                , title: '用户数据表'
                , request: {
                    pageName: 'curr' //页码的参数名称，默认：page
                    , limitName: 'nums' //每页数据量的参数名，默认：limit
                }
                ,where:{
                    "paymentName":paymentName
                }
                ,page: true //开启分页
                ,cols: [[ //表头
                    {type: 'checkbox'}
                    , {field: 'paymentId', title: 'ID', width: 115}
                    , {field: 'paymentName', title: '支付方式', width: 200}
                    , {field: 'paymentState', title: '账号状态', width: 260,templet: function(d){
                            if (d.paymentState == 0)
                            {
                                return "<input type=\"checkbox\" name=\"zzz\" id=\"stateBtn\" lay-filter=\"switchPayment\" lay-skin=\"switch\"\n" +
                                    "           switch_payment_id=\""+d.paymentId+"\" switch_payment_state='"+d.paymentState+"' lay-text=\"启用|禁用\" checked>";
                            }
                            return "<input type=\"checkbox\" name=\"zzz\" id=\"stateBtn\" lay-filter=\"switchPayment\" lay-skin=\"switch\"\n" +
                                "            switch_payment_state='"+d.paymentState+"' lay-text=\"启用|禁用\" switch_payment_id='"+d.paymentId+"'>";
                        }}
                    , {field: 'paymentImg', title: '收钱码', width: 367,templet:'#photoImg'/*function(d){

                                    return '<div><img src="'+d.img+'" alt="" width="" height=""></a></div>';
                                }*/

                    }
                    , {title: '操作', toolbar: '#barDemo', width:251}
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
                        console.log("i---->"+i+"\tdata-->"+data[i].paymentId);
                        list.push(data[i].paymentId)
                    }
                    console.log("list--->"+list);
                    layer.confirm('真的删除选中行么', function (index) {
                        deleteRows(list);
                        //layer.close(index);
                    });
                    break;
            }


        });


        /**
         * 删除一行数据
         * */
        function deleteRow(object) {
            $.ajax({
                type: 'post',
                url: "<%=basePath%>/payment/delOnePayment",
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
                url:"<%=basePath%>/payment/delAllBySelected",
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
                    console.log("data.paymentId--->"+data.paymentId);
                    deleteRow(data.paymentId);
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                var paymentId= data.paymentId;
                console.log("paymentId---->"+paymentId);
                var tourl = "<%=basePath%>/page/toPaymentEdit?paymentId="+paymentId;
                layer.open({
                    type: 2,
                    content: tourl,
                    title: '公告信息修改',
                    area: ['100%', '100%']
                })
            }
            //执行修改操作

        });


            form.on('switch(switchPayment)',function (data) {
                //开关是否开启，true或者false
                var checked = data.elem.checked;
                //获取所需属性值
                var paymentId = data.elem.attributes['switch_payment_id'].nodeValue;
                var paymentState = data.elem.attributes['switch_payment_state'].nodeValue;
                //console.log("paymentState---->"+paymentState);
                console.log(checked);
                console.log(paymentId);
                //TODO 此时进行ajax的服务器访问，如果返回数据正常，则进行后面代码的调用
               //var paymentState =  checked ?'0':'1';
                console.log("paymentState---->"+paymentState);
                if(paymentState==1){
                    var data1 = {"paymentState":0,"paymentId":paymentId};
                    $.ajax({
                        url:"<%=basePath%>/payment/changeOnePayment",
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify(data1),
                        type: 'post',
                        dataType: "JSON",
                        success: function (result) {
                            console.log("result--->"+result);
                            if (result > 0) {
                                data.elem.checked = checked;

                                form.render('select'); //刷新select选择框渲染
                                table.reload('demo');
                                layer.msg('已启用!',{icon: 1,time:1000});
                            }
                        }
                    });

                }else{
                    var data2 = {"paymentState":1,"paymentId":paymentId};
                    $.ajax({
                        url:"<%=basePath%>/payment/changeOnePayment",
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify(data2),
                        type: 'post',
                        dataType: "JSON",
                        success: function (result) {
                            console.log("result--->"+result);
                            if (result > 0) {
                                data.elem.checked = !checked;

                                form.render('select'); //刷新select选择框渲染
                                table.reload('demo');
                                layer.msg('已禁用!',{icon: 5,time:1000});

                            }
                        }
                    });

                }

            });
    });
</script>

</html>
