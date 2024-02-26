<%--
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/7
  Time: 21:58
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
    <title>公告类型</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="<%= basePath %>/statics/suffix/css/font.css">
    <link rel="stylesheet" href="<%= basePath %>/statics/suffix/css/index.css">
    <script src="<%= basePath %>/statics/suffix/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%= basePath %>/statics/suffix/js/index.js"></script>

</head>
<body>
<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">公告类型</a>
            <a>
              <cite>公告类型列表</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>

<div class="demoTable" style="padding: 15px; ">
    <input type="text"  style="width: 250px; height:30px;padding-left: 5px;" name="query" id="query" required  placeholder="请输"/>
    <button class="layui-btn layui-btn-small" lay-even="search" id="searchByquery">
        <i class="layui-icon">&#xe615;</i> 搜索
    </button>
</div>
<%--表头--%>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-danger" lay-event="getCheckData"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn layui-btn-sm" onclick="xadmin.open('添加公告类型','<%= basePath %>/page/toNoticeTypeAdd',800,600)" lay-event="add">
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
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    <%--<a title="删除" href="javascript:;" lay-event="del" style="text-decoration:none">
        <i class="layui-icon">&#xe640;</i>
    </a>--%>
</script>

<%--特殊列的模板--%>
<script type="text/html" id="photoImg">
    {{#  if(null!=d.publicClassImg&&d.publicClassImg.length >20){ }}
    <img src="<%=basePath%>/uploadfiles/notice/{{d.publicClassImg}}" alt="{{d.publicClassImg}}">
    {{#  } else { }}
    <img src="<%=basePath%>/statics/layui/images/upload.jpg" alt="谁叫你不上传的">
    {{#  } }}
</script>

<script>
    layui.use(['table','util'], function(query){
        var table = layui.table;
        var util = layui.util;
        //默认查询所有学生信息
        renderTable('');

        $("#searchByquery").on("click",function(){
            var publicClassName=$("#query").val();
            renderTable(publicClassName);
        });
        /**
         * 分页显示图书信息
         * */
        function renderTable(publicClassName){
            var s = 7;
            //第一个实例
            table.render({
                elem: '#demo'
                /* ,height : 195*s*/
                ,url: '<%=basePath%>/publicClass/findAllPublicClass' //数据接口
                , method: 'post'
                , contentType: 'application/json'
                , toolbar: '#toolbarDemo'
                , title: '用户数据表'
                , request: {
                    pageName: 'curr' //页码的参数名称，默认：page
                    , limitName: 'nums' //每页数据量的参数名，默认：limit
                }
                ,where:{
                    "publicClassName":publicClassName
                }
                ,page: true //开启分页
                ,cols: [[ //表头
                    {type: 'checkbox'}
                    , {field: 'publicClassId', title: '类别ID', width: 80}
                    , {field: 'publicClassName', title: '公告类型', width: 100}
                    , {field: 'publicDescription', title: '公告描述', width: 130}
                    , {field: 'publicClassLocation', title: '类型位置', width: 130}
                    ,{field: 'publicClassState', title: '公告类型状态', width: 130,templet: function(d){
                            if (d.publicClassState == 0)
                            {
                                return "<span class=\"layui-btn layui-btn-normal openSpan\" >已启用</span>";
                            }
                            return "<span class=\"layui-btn layui-btn-normal layui-btn-disabled stopSpan\">已停用</span>";
                        }}
                    , {field: 'publicClassImg', title: '类型图片', width: 135,templet:'#photoImg'/*function(d){

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
                        console.log("i---->"+i+"\tdata-->"+data[i].publicClassId);
                        list.push(data[i].publicClassId)
                    }
                    console.log("list--->"+list);
                    if(list.length>0){
                        layer.confirm('真的删除选中行么', function (index) {
                            deleteRows(list);
                            //layer.close(index);
                        });
                    }else{
                        layer.msg('请选择需要删除的数据!',{icon: 0,time:1000});
                    }
                    break;
            }
        });


        /**
         * 删除一行数据
         * */
        function deleteRow(object) {
            $.ajax({
                type: 'post',
                url: "<%=basePath%>/publicClass/delOneById",
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
                url:"<%=basePath%>/publicClass/deleteSelectPublicClass",
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
                    console.log("data.publicClassId--->"+data.publicClassId);
                    deleteRow(data.publicClassId);
                    layer.close(index);
                });
            } else if (obj.event === 'state') {
                var publicClassId= data.publicClassId;
                console.log("publicClassId---->"+publicClassId);
                member_stop(this,publicClassId,data.publicClassState);
                table.reload('demo');
            }
            //执行修改操作
        });

        /*用户-停用*/
        function member_stop(obj,id,state){
            layer.confirm('确认更改吗？',{icon:3,title:'提示信息'},function(index){

                if(state==1){
                    $.ajax({
                        url:"<%=basePath%>/publicClass/UpdateOnePublicClassState",
                        data:{
                            "classState":0,
                            "publicClassId":id
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
                        url:"<%=basePath%>/publicClass/UpdateOnePublicClassState",
                        data:{
                            "classState":1,
                            "publicClassId":id
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

            // var time = year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds;
            var time = year+"-"+month+"-"+day;
            return time;
        }
    });
</script>
</body>
<script>
    layui.use(['laydate','form'], function(){
        var laydate = layui.laydate;
        var  form = layui.form;


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

    /*用户-添加*/
    function member_add(title,url,id,w,h){

        xadmin.open(title,url,id,w,h);
    }



    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',{icon:3,title:'提示信息'},function(index){
            //发异步删除数据
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }



    function delAll (argument) {
        var ids = [];

        // 获取选中的id
        $('tbody input').each(function(index, el) {
            if($(this).prop('checked')){
                ids.push($(this).val())
            }
        });

        layer.confirm('确认要删除吗？'+ids.toString(),{icon:3,title:'提示信息'},function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }
</script>
</html>
