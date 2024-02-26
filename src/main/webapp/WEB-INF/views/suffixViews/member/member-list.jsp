<%--
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/7
  Time: 21:55
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
    <title>公告列表</title>
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
            <a href="">演示</a>
            <a>
              <cite>导航元素</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>

<div class="demoTable" style="padding: 15px; ">
    <div class="layui-inline layui-show-xs-block">
        <input type="text" name="userName"  placeholder="请输入登入名" autocomplete="off" class="layui-input userName">
    </div>
    <button class="layui-btn layui-btn-small" lay-even="search" id="searchByquery">
        <i class="layui-icon">&#xe615;</i> 搜索
    </button>
</div>

<%--表头--%>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-danger" lay-event="getCheckData"><i class="layui-icon"></i>批量删除</button>
    </div>
</script>

<%--表体--%>
<table id="demo" lay-filter="test"></table>


<script type="text/html" id="barDemo">

    <a class="layui-btn layui-btn-xs layui-btn-warm edit" lay-event="edit">更改用户状态</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<style type="text/css">
    .layui-table-cell{
        /*text-align:center;*/
        height: auto;
        white-space: normal;
    }
    .layui-table img{
        /*max-width:100px*/
        height: 60px;
        width: 60px;
        border-radius:50%;
        -webkit-border-radius:50%;
        -moz-border-radius:50%;
        margin-top: 15px;
        display: inline-block;
    }

</style>
<%--特殊列的模板--%>
<script type="text/html" id="photoImg">
    {{#  if(null!=d.userImg&&d.userImg.length >20){ }}
    <img src="<%=basePath%>/uploadfiles/userImg/{{d.userImg}}" alt="{{d.userImg}}">
    {{#  } else { }}
    <img src="<%=basePath%>/statics/layui/images/upload.jpg" alt="谁叫你不上传的">
    {{#  } }}
</script>

<script>

    layui.use(['jquery','table','util'], function(){
        var table = layui.table;
        var $ = layui.$;
        var util = layui.util;
        //默认查询所有学生信息
        renderTable('');

        $("#searchByquery").on("click",function(){
            var userName = $('.userName').val();

            console.log("userName------>"+userName);
            renderTable(userName);
        });
        /**
         * 分页显示图书信息
         * */
        function renderTable(userName){
            var s = 6;
            //第一个实例
            table.render({
                elem: '#demo'
                ,url: '<%=basePath%>/userInfo/findAllByMapWithPage' //数据接口
                , method: 'post'
                , contentType: 'application/json'
                , toolbar: '#toolbarDemo'
                , title: '用户数据表'
                , request: {
                    pageName: 'curr' //页码的参数名称，默认：page
                    , limitName: 'nums' //每页数据量的参数名，默认：limit
                }
                ,where:{
                    "userName":userName
                }
                ,page: true //开启分页
                ,cols: [[ //表头
                    {type: 'checkbox'}
                    , {field: 'userInfoId', title: '用户ID', width: 80}
                    , {field: 'userRealname', title: '用户姓名', width: 100,templet: function(d){
                            if (d.userRealname == null)
                            {
                                return "暂无数据";
                            }
                            return "<span>"+ d.userRealname +"</span>";
                        }}
                    , {field: 'lssgUserLogin.userName', title: '登入名', width: 85,templet:function (d) {
                            return '<span style="color:green;">'+d.lssgUserLogin.userName+'</span>'
                        }

                    }
                    , {field: 'userSex', title: '性别', width: 120,templet: function(d){
                            if (d.userSex == null)
                            {
                                return "暂无数据";
                            }
                            return "<span>"+ d.userSex +"</span>";
                        }}
                    , {field: 'userTel', title: '电话号码', width: 120,templet: function(d){
                            if (d.userTel == null)
                            {
                                return "暂无数据";
                            }
                            return "<span>"+ d.userTel +"</span>";
                        }}
                    , {field: 'lssgUserLogin.registTime', title: '注册时间', width: 130,templet: function(d){
                            if (d.lssgUserLogin.registTime == null)
                            {
                                return "暂无数据";
                            }
                            return "<span>"+ showTime(d.lssgUserLogin.registTime) +"</span>";
                        }
                    }
                    , {field: 'lssgUserLogin.userState', title: '账户状态', width: 100,templet: function(d){
                            if (d.lssgUserLogin.userState == 0)
                            {
                                return "<span class=\"layui-btn layui-btn-normal openSpan\" >可用</span>";
                            }
                            return "<span class=\"layui-btn layui-btn-normal layui-btn-disabled stopSpan\">不可用</span>";
                        }}


                    , {field: 'userEmail', title: 'email', width: 135,templet: function(d){
                            if (d.userEmail == null)
                            {
                                return "暂无数据";
                            }
                            return "<span>"+ d.userEmail +"</span>";
                        }}
                    , {field: 'userImg', title: '用户头像', width: 135,templet:'#photoImg'
                    }
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
                        console.log("i---->"+i+"\tdata-->"+data[i].userInfoId);
                        list.push(data[i].userInfoId)
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
            }


        });


        /**
         * 删除一行数据
         * */
        function deleteRow(object) {
            $.ajax({
                type: 'post',
                url: "<%=basePath%>/userInfo/delOneUserInfo",
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
                url:"<%=basePath%>/userInfo/delAllBySelected",
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
                    console.log("data.userInfoId--->"+data.userInfoId);
                    deleteRow(data.userInfoId);
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                var userInfoId= data.userInfoId;
                console.log("userInfoId---->"+userInfoId);
                console.log("data.lssgUserLogin.userState---->"+data.lssgUserLogin.userState);
                member_stop(this,userInfoId,data.lssgUserLogin.userState)
            }
            //执行修改操作

        });

        /*用户-停用*/
        function member_stop(obj,id,state){
            layer.confirm('确认更改吗？',{icon:3,title:'提示信息'},function(index){

                if(state==1){
                    $.ajax({
                        url:"<%=basePath%>/userInfo/UpdateOneUserState",
                        data:{
                            "userState":0,
                            "userInfoId":id
                        },
                        type: 'post',
                        dataType: "JSON",
                        success: function (data) {
                            console.log("data--->"+data);
                            if (data > 0) {
                                $(obj).text("禁用");
                                //发异步把用户状态进行更改
                                $(obj).attr('title','停用');
                                $(obj).find('i').html('&#xe62f;');
                                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                                table.reload('demo');
                                layer.msg('已解除封号!',{icon: 1,time:1000});
                            }
                        }
                    });


                }else{
                    $.ajax({
                        url:"<%=basePath%>/userInfo/UpdateOneUserState",
                        data:{
                            "userState":1,
                            "userInfoId":id
                        },
                        type: 'post',
                        dataType: "JSON",
                        success: function (data) {
                            console.log("data--->"+data);
                            if (data > 0) {
                                $(obj).text("启用");

                                //发异步把用户状态进行更改
                                $(obj).find('i').html('&#xe601;');
                                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                                table.reload('demo');
                                layer.msg('已封号!',{icon: 5,time:1000});
                            }
                        }
                    })

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
</script>
</body>
</html>
