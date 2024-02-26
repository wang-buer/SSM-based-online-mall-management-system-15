<%--
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/7
  Time: 21:42
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
    <title>管理员列表</title>
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
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <div class="demoTable" style="padding: 15px; ">
                        <input type="text"  style="width: 250px; height:30px;padding-left: 5px;" name="query" id="adminName" required  placeholder="请输"/>
                        <button class="layui-btn layui-btn-small" lay-even="search" id="searchByquery">
                            <i class="layui-icon">&#xe615;</i> 搜索
                        </button>
                    </div>
                </div>

                <%--<div class="layui-card-body ">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" name="" lay-filter="checkall" lay-skin="primary">
                            </th>
                            <th>ID</th>
                            <th>登录名</th>
                            <th>手机</th>
                            <th>邮箱</th>
                            <th>角色</th>
                            <th>加入时间</th>
                            <th>状态</th>
                            <th>操作</th>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                <input type="checkbox" name=""  lay-skin="primary">
                            </td>
                            <td>1</td>
                            <td>admin</td>
                            <td>123456789</td>
                            <td>123456789@qq.com</td>
                            <td>超级管理员</td>
                            <td>2017-01-01 11:11:42</td>
                            <td class="td-status">
                                <span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span></td>
                            <td class="td-manage">
                                <a onclick="member_stop(this,'10001')" href="javascript:;"  title="启用">
                                    <i class="layui-icon">&#xe601;</i>
                                </a>
                                <a title="编辑"  onclick="xadmin.open('编辑','admin-edit.html')" href="javascript:;">
                                    <i class="layui-icon">&#xe642;</i>
                                </a>
                                <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
                                    <i class="layui-icon">&#xe640;</i>
                                </a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="layui-card-body ">
                    <div class="page">
                        <div>
                            <a class="prev" href="">&lt;&lt;</a>
                            <a class="num" href="">1</a>
                            <span class="current">2</span>
                            <a class="num" href="">3</a>
                            <a class="num" href="">489</a>
                            <a class="next" href="">&gt;&gt;</a>
                        </div>
                    </div>
                </div>--%>
                <%--表体--%>
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
        <button class="layui-btn" onclick="xadmin.open('添加用户','<%= basePath %>/page/toAdminAdd',600,400)"><i class="layui-icon"></i>添加</button>
    </div>
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
<%--表每行操作--%>
<script type="text/html" id="barDemo">

    <a class="layui-btn layui-btn-xs layui-btn-warm edit" lay-event="edit">更改状态</a>
    <%--<input type="checkbox" name="zzz" id="stateBtn" lay-skin="switch" value="{{d.userInfoId}}" lay-text="启用|禁用" checked>--%>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<%--特殊列的模板--%>
<script type="text/html" id="photoImg">
    {{#  if(null!=d.adminImg&&d.adminImg.length >20){ }}
    <img src="<%=basePath%>/uploadfiles/admin/{{d.adminImg}}" alt="{{d.adminImg}}">
    {{#  } else { }}
    <img src="<%=basePath%>/statics/layui/images/upload.jpg" alt="谁叫你不上传的">
    {{#  } }}
</script>
<script>

    layui.use(["jquery", "upload", "form", "layer", "element"], function () {
        var $ = layui.$,
            element = layui.element,
            layer = layui.layer,
            upload = layui.upload,
            form = layui.form;

    });

    layui.use(['table',"form",'util'], function(){
        var table = layui.table;
        var util = layui.util;
        var form = layui.form;
        //默认查询所有学生信息
        renderTable('');

        $("#searchByquery").on("click",function(){
            var adminName = $('#adminName').val();

            console.log("adminName------>"+adminName);
            renderTable(adminName);
        });
        /**
         * 分页显示图书信息
         * */
        function renderTable(adminName){
            var s = 7;
            //第一个实例
            table.render({
                elem: '#demo'
                /* ,height : 195*s*/
                ,url: '<%=basePath%>/admin/findAllByMapWithPage' //数据接口
                , method: 'post'
                , contentType: 'application/json'
                , toolbar: '#toolbarDemo'
                , title: '用户数据表'
                , request: {
                    pageName: 'curr' //页码的参数名称，默认：page
                    , limitName: 'nums' //每页数据量的参数名，默认：limit
                }
                ,where:{
                    "adminName":adminName
                }
                ,page: true //开启分页
                ,cols: [[ //表头
                    {type: 'checkbox'}
                    , {field: 'adminId', title: '管理员ID', width: 80}
                    , {field: 'adminName', title: '管理员姓名', width: 100}
                    , {field: 'adminPwd', title: '密码', width: 85}
                    , {field: 'adminEmail', title: 'email', width: 120,templet: function(d){
                            if (d.adminEmail == null)
                            {
                                return "暂无数据";
                            }
                            return "<span>"+ d.adminEmail +"</span>";
                        }}
                    , {field: 'adminRegistTime', title: '注册时间', width: 130,templet: function(d){
                            if (d.adminRegistTime == null)
                            {
                                return "暂无数据";
                            }
                            return "<span>"+ showTime(d.adminRegistTime) +"</span>";
                        }
                    }
                    , {field: 'adminLastLoginTime', title: '最后登入时间', width: 100,templet: function(d){
                            if (d.adminLastLoginTime == null)
                            {
                                return "暂无数据";
                            }
                            return "<span>"+ showTime(d.adminLastLoginTime) +"</span>";
                        }}


                    , {field: 'adminState', title: '账号状态', width: 135,templet: function(d){
                            if (d.adminState == 0)
                            {
                                return "<span class=\"layui-btn layui-btn-normal openSpan\" >可用</span>";
                            }
                            return "<span class=\"layui-btn layui-btn-normal layui-btn-disabled stopSpan\">不可用</span>";
                        }}
                    , {field: 'adminImg', title: '管理员头像', width: 135,templet:'#photoImg'/*function(d){

                                    return '<div><img src="'+d.img+'" alt="" width="" height=""></a></div>';
                                }*/

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
                        console.log("i---->"+i+"\tdata-->"+data[i].adminId);
                        list.push(data[i].adminId)
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
                url: "<%=basePath%>/admin/delOneAdmin",
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
                url:"<%=basePath%>/admin/delAllBySelected",
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
                    console.log("data.adminId--->"+data.adminId);
                    deleteRow(data.adminId);
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                var adminId= data.adminId;
                console.log("adminId---->"+adminId);
                console.log("data.adminState---->"+data.adminState);
                member_stop(this,adminId,data.adminState)
            }
            //执行修改操作

        });

        /*用户-停用*/
        function member_stop(obj,id,state){
            layer.confirm('确认更改吗？',{icon:3,title:'提示信息'},function(index){

                if(state==1){
                    var data = {"adminState":0,"adminId":id};
                    $.ajax({
                        url:"<%=basePath%>/admin/updateAdminState",
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify(data),
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
                    var data = {"adminState":1,"adminId":id};
                    $.ajax({
                        url:"<%=basePath%>/admin/updateAdminState",
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify(data),
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
<%--<script>
    layui.use(['laydate','form'], function(){
        var laydate = layui.laydate;
        var form = layui.form;
        // 监听全选
        form.on('checkbox(checkall)', function(data){

            if(data.elem.checked){
                $('tbody input').prop('checked',true);
            }else{
                $('tbody input').prop('checked',false);
            }
            form.render('checkbox');
        });
        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
    });

    /*用户-停用*/
    function member_stop(obj,id){
        layer.confirm('确认要停用吗？',function(index){

            if($(obj).attr('title')=='启用'){

                //发异步把用户状态进行更改
                $(obj).attr('title','停用')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!',{icon: 5,time:1000});

            }else{
                $(obj).attr('title','启用')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!',{icon: 5,time:1000});
            }

        });
    }

    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }



    function delAll (argument) {

        var data = tableCheck.getData();

        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }
</script>--%>

</html>
