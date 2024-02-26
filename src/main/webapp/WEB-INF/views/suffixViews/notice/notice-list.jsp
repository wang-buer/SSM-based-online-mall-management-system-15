<%--
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/7
  Time: 21:57
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
            <a href="">公告管理</a>
            <a>
              <cite>公告列表</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>

<div class="demoTable" style="padding: 15px; ">
    <div class="layui-inline layui-show-xs-block">
        <input class="layui-input"  autocomplete="off" placeholder="开始日" name="start" id="start">
    </div>
    <div class="layui-inline layui-show-xs-block">
        <input class="layui-input"  autocomplete="off" placeholder="截止日" name="end" id="end">
    </div>


    <div class="layui-input-inline layui-show-xs-block">
        <form class="layui-form">
            <select name="lssgPublicInfo.lssgPublicClassName" id="publicClassName">
                <option value="">请选择公告类别</option>
            </select>
        </form>

    </div>
    <div class="layui-inline layui-show-xs-block">
        <input type="text" name="publicInfoName"  placeholder="请输入公告主题" autocomplete="off" class="layui-input publicInfoName">
    </div>
    <button class="layui-btn layui-btn-small" lay-even="search" id="searchByquery">
        <i class="layui-icon">&#xe615;</i> 搜索
    </button>
</div>
<%--表头--%>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-danger" lay-event="getCheckData"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn layui-btn-sm" onclick="xadmin.open('添加公告类型','<%= basePath %>/page/toNoticeAdd',800,600)" lay-event="add">
            <i class="layui-icon"></i>添加</button>
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
    <a style="text-decoration:none" href="javascript:;" title="" lay-event="state">
        <i class="layui-icon">&#xe601;</i>
    </a>
    &nbsp;&nbsp;&nbsp;
    <a title="编辑" href="javascript:;" class="ml-5" style="text-decoration:none" lay-event="edit">
        <i class="layui-icon">&#xe642;</i>
    </a>
    &nbsp;&nbsp;&nbsp;
    <a title="删除" href="javascript:;" lay-event="del" style="text-decoration:none">
        <i class="layui-icon">&#xe640;</i>
    </a>
</script>

<%--特殊列的模板--%>
<script type="text/html" id="photoImg">
    {{#  if(null!=d.publicInfoImg&&d.publicInfoImg.length >20){ }}
    <img src="<%=basePath%>/uploadfiles/notice/{{d.publicInfoImg}}" alt="{{d.publicInfoImg}}">
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

        //得到所有的支付类别信息，并绑定到下拉选择框中
        var obj = new Object();
        getAllClass(obj);
        function getAllClass(object) {
            $.ajax({
                type: 'post',
                url: "<%=basePath%>/publicClass/selectAllPublicClass",
                dataType: 'json',
                async:false,
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(object),
                // 请求成功的回调
                success: function (data) {

                    //绑定类别下拉框
                    if (data != null)
                        for (var i = 0; i < data.length; i++) {
                            console.log("data[i].publicClassId"+data[i].publicClassId);
                            $("#publicClassName").append("<option value='" + data[i].publicClassId + "'>" + data[i].publicClassName + "</option>");
                        }
                    layui.use(['form'], function () {
                        var form = layui.form;
                        form.render('select'); //刷新select选择框渲染
                    });
                }
            })
        }
    });

    layui.use(['table','util'], function(query){
        var table = layui.table;
        var util = layui.util;
        //默认查询所有学生信息
        renderTable('');

        $("#searchByquery").on("click",function(){
            var publicInfoName = $('.publicInfoName').val();
            var statTime = $('#start').val();
            var endTime = $('#end').val();
            var publicClassName = $('#publicClassName option:selected').val();
            console.log("publicInfoName------>"+publicInfoName);
            console.log("statTime------>"+statTime);
            console.log("endTime------>"+endTime);
            console.log("publicClassName------>"+publicClassName);
            renderTable(publicInfoName,statTime,endTime,publicClassName);
        });
        /**
         * 分页显示图书信息
         * */
        function renderTable(publicInfoName,statTime,endTime,publicClassName){
            var s = 7;
            //第一个实例
            table.render({
                elem: '#demo'
                /* ,height : 195*s*/
                ,url: '<%=basePath%>/publicInfo/findAllByMapWithPage' //数据接口
                , method: 'post'
                , contentType: 'application/json'
                , toolbar: '#toolbarDemo'
                , title: '用户数据表'
                , request: {
                    pageName: 'curr' //页码的参数名称，默认：page
                    , limitName: 'nums' //每页数据量的参数名，默认：limit
                }
                ,where:{
                    "publicInfoName":publicInfoName,
                    "statTime":statTime,
                    "endTime":endTime,
                    "publicClassName":publicClassName
                }
                ,page: true //开启分页
                ,cols: [[ //表头
                    {type: 'checkbox'}
                    , {field: 'publicInfoId', title: '公告id', width: 80}
                    , {field: 'publicInfoTitle', title: '公告标题', width: 100}
                    , {field: 'lssgPublicClass.publicClassName', title: '公告类别', width: 85,templet:function (d) {
                            return '<span style="color:green;">'+d.lssgPublicClass.publicClassName+'</span>'
                        }

                    }
                    , {field: 'publicInfoUser', title: '发布人', width: 120}
                    , {field: 'publicInfoTime', title: '发布时间', width: 130,templet: function(d){
                            if (d.publicInfoTime == null)
                            {
                                return "暂无数据";
                            }
                            return "<span>"+ showTime(d.publicInfoTime) +"</span>";
                        }
                    }
                    , {field: 'publicInfoState', title: '公告状态', width: 100,templet: function(d){
                            if (d.publicInfoState == 0)
                            {
                                return "<span class=\"layui-btn layui-btn-normal openSpan\" >已启用</span>";
                            }
                            return "<span class=\"layui-btn layui-btn-normal layui-btn-disabled stopSpan\">已停用</span>";
                        }}


                    , {field: 'publicInfoImg', title: '缩略图片', width: 135,templet:'#photoImg'/*function(d){

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
                        console.log("i---->"+i+"\tdata-->"+data[i].publicInfoId);
                        list.push(data[i].publicInfoId)
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
                url: "<%=basePath%>/publicInfo/delOnePublicInfoById",
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
                url:"<%=basePath%>/publicInfo/deleteSelectInfos",
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
                    console.log("data.publicInfoId--->"+data.publicInfoId);
                    deleteRow(data.publicInfoId);
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                var publicInfoId1= data.publicInfoId;
                console.log("publicInfoId1---->"+publicInfoId1);
                var tourl = "<%=basePath%>/page/toNoticeEdit?publicInfoId="+publicInfoId1;
                layer.open({
                    type: 2,
                    content: tourl,
                    title: '公告信息修改',
                    area: ['100%', '100%']
                })
            }else if (obj.event === 'state') {
                var publicInfoId= data.publicInfoId;
                console.log("publicInfoId---->"+publicInfoId);
                member_stop(this,publicInfoId,data.publicInfoState)
            }
            //执行修改操作
        });

        /*用户-停用*/
        function member_stop(obj,id,state){
            layer.confirm('确认更改吗？',{icon:3,title:'提示信息'},function(index){

                if(state==1){
                    $.ajax({
                        url:"<%=basePath%>/publicInfo/UpdateOnePublicInfoState",
                        data:{
                            "infoState":0,
                            "publicInfoId":id
                        },
                        type: 'post',
                        traditional: true,
                        dataType: "JSON",
                        success: function (data) {
                            console.log("data--->"+data);
                            if (data > 0) {
                                //发异步把用户状态进行更改
                                $(obj).attr('title','停用');
                                $(obj).find('i').html('&#xe62f;');
                                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                                table.reload('demo');
                                layer.msg('已启用!',{icon: 1,time:1000});
                            }
                        }
                    });


                }else{
                    $.ajax({
                        url:"<%=basePath%>/publicInfo/UpdateOnePublicInfoState",
                        data:{
                            "infoState":1,
                            "publicInfoId":id
                        },
                        type: 'post',
                        traditional: true,
                        dataType: "JSON",
                        success: function (data) {
                            console.log("data--->"+data);
                            if (data > 0) {
                                //发异步把用户状态进行更改
                                $(obj).attr('title','启用');
                                $(obj).find('i').html('&#xe601;');
                                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                                table.reload('demo');
                                layer.msg('已停用!',{icon: 5,time:1000});
                            }
                        }
                    })

                }

            });
        }



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
