<%--
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/7
  Time: 21:43
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
    <title>商品列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="<%= basePath %>/statics/suffix/css/font.css">
    <link rel="stylesheet" href="<%= basePath %>/statics/suffix/css/index.css">
    <script src="<%= basePath %>/statics/suffix/lib/layui/layui.js" charset="utf-8"></script>
    <script src="<%=basePath%>/statics/suffix/js/jquery.js"></script>
    <script src="<%= basePath %>/statics/easyui/jquery.easyui.min.js"></script>
    <script src="<%=basePath%>/statics/js/common.js"></script>
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
                        <input type="text"  style="width: 250px; height:30px;padding-left: 5px;" name="query" id="query" required  placeholder="请输入关键字"/>
                        <button class="layui-btn layui-btn-small" id="searchByquery">
                            <i class="layui-icon">&#xe615;</i> 搜索
                        </button>
                    </div>
                    <script type="text/html" id="toolbarDemo">
                            <button class="layui-btn layui-btn-danger" lay-event="dels">批量删除</button>
                            <button class="layui-btn" lay-event="add">添加</button>
                    </script>
                    <div class="layui-card-body layui-table-body layui-table-main">
                    <table class="layui-table layui-form" id="member" lay-filter="test"></table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .layui-table img{
        max-width:100px
    }
    .layui-table-cell {
        height: auto;
        white-space: normal;
    }

</style>
<script type="text/html" id="barDemo">
    <a style="text-decoration:none" title="停用">
        <i class="layui-icon">&#xe601;</i>
    </a>
    <a title="编辑" class="layui-btn layui-btn-xs" style="text-decoration:none" lay-event="edit" >
        <i class="layui-icon">&#xe642;</i>
    </a>
    <a title="删除" style="text-decoration:none" class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">
        <i class="layui-icon">&#xe640;</i>
    </a>
</script>

<script type="text/html" id="barDemo1">
    <span class="layui-btn layui-btn-danger " > 已禁用 </span>
</script>

<script type="text/html" id="photoImg1">
    {{#  if(null!=d.productPhoto&&d.productPhoto.length >20){ }}
    <img src="<%=basePath%>/uploadfiles/productImg/{{d.productPhoto}}" alt="{{d.productPhoto}}">
    {{#  } else { }}
    <img src="<%=basePath%>/statics/layui/images/upload.jpg" alt="谁叫你不上传的">
    {{#  } }}
</script>
<script type="text/html" id="photoImg2">
{{#  if(null!=d.smallPhoto&&d.smallPhoto.length >20){ }}
<img src="<%=basePath%>/uploadfiles/productImg/{{d.smallPhoto}}" alt="{{d.smallPhoto}}">
{{#  } else { }}
<img src="<%=basePath%>/statics/layui/images/upload.jpg" alt="谁叫你不上传的">
{{#  } }}
</script>
<script type="text/html" id="photoImg3">
{{#  if(null!=d.bigPhoto&&d.bigPhoto.length >20){ }}
<img src="<%=basePath%>/uploadfiles/productImg/{{d.bigPhoto}}" alt="{{d.bigPhoto}}">
{{#  } else { }}
<img src="<%=basePath%>/statics/layui/images/upload.jpg" alt="谁叫你不上传的">
{{#  } }}
</script>






<script>
    layui.use(['table', 'layer', 'form'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        //重新刷新表单
        function reloadData() {
            table.reload('');
        }
        //删除一行数据
        function deleteRow(object) {
            $.ajax({
                type: 'post',
                url: "<%=basePath%>/LssgProduct/delete",
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(object),
//               请求成功的回调
                success: function (data) {
                    if (data > 0) {
                        table.reload('member');
                    }
                }
            })
        }
        /**
         * 删除选中行数据
         * */
        function deleteRows(object) {
            $.ajax({
                type: 'post',
                url: "<%=basePath%>/LssgProduct/deletes",
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(object),
//               请求成功的回调
                success: function (data) {
                    if (data > 0) {
                        layer.msg("您已经成功删除记录！", {
                            icon: 1,
                            time: 1300,
                            end: function () {
                                table.reload('member');
                            }
                        });
                    }
                }
            })
        }

        renderTable('');
        $("#searchByquery").on("click",function(){
            var query=$("#query").val();
            renderTable(query);
        });
        function renderTable(query) {
            //渲染table数据
            table.render({
                elem: '#member'
                , url: '<%=basePath%>/LssgProduct/findByPage?query=' +query
                , method: 'post'
                , contentType: 'application/json'
                , toolbar: '#toolbarDemo'
                , title: '用户数据表'
                , request: {
                    pageName: 'curr' //页码的参数名称，默认：page
                    , limitName: 'nums' //每页数据量的参数名，默认：limit
                }
                , cols: [[
                    {type: 'checkbox'}
                    , {field: 'productId', title: '商品ID', width: 120, fixed: 'right'}
                    , {field: 'productName', title: '商品名称', width: 120}
                    , {field: 'productUpTime', title: '上市时间', width: 120, templet: function(d){
                            if (d.productUpTime == null)
                            {
                                return "暂无数据";
                            }
                            return "<span>"+ showTime(d.productUpTime) +"</span>";
                        }
                    }
                    , {field: 'productDownTime', title: '下市时间', width: 120, templet: function(d){
                            if (d.productDownTime == null)
                            {
                                return "暂无数据";
                            }
                            return "<span>"+ showTime(d.productDownTime) +"</span>";
                        }
                    }
                    , {field: 'productPhoto', title: '图片路径',  templet: '#photoImg1',width: 120}
                    , {field: 'smallPhoto', title: '大图路径', templet: '#photoImg2',width: 120}
                    , {field: 'bigPhoto', title: '小图路径', templet: '#photoImg3',width: 120}
                    , {field: 'productMarketPrice', title: '市场价格', width: 120}
                    , {field: 'productMallPrice', title: '商城价格', width: 120}
                    , {field: 'productNum', title: '商品库存', width: 120}
                    , {field: 'isState', title: '是否下架', width: 120,templet: function(d){
                            if (d.isState == 0)
                            {
                                return "<input type=\"checkbox\" name=\"zzz\" id=\"stateBtn\" lay-filter=\"switchProductClass\" lay-skin=\"switch\"\n" +
                                    "           switch_payment_id=\""+d.productId+"\" switch_payment_state='"+d.isState+"' lay-text=\"上架|下架\" checked>";
                            }
                            return "<input type=\"checkbox\" name=\"zzz\" id=\"stateBtn\" lay-filter=\"switchProductClass\" lay-skin=\"switch\"\n" +
                                "            switch_payment_state='"+d.isState+"' lay-text=\"上架|下架\" switch_payment_id='"+d.productId+"'>";
                        }}
                    , {field: 'productAddr', title: '商品产地', width: 120}
                    , {field: 'productNotes', title: '备注', width: 120}
                    , {
                        field: 'lssgProductClass.productClassId', title: '商品类别', width: 200, templet: function (d) {
                            return '<span style="color: #c00;">' + d.lssgProductClass.productClassName + '</span>'
                        }
                    }
                    , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 150}
                ]]
                , page: true,
                limit: 5,
                limits: [5, 10, 20]
            });
        }
        //监听行具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            //执行删除操作
            if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    deleteRow(data.productId);
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                var productId= data.productId;
                var tourl = "<%=basePath%>/LssgProduct/toUpdate?productId="+productId;
                layer.open({
                    type: 2,
                    content: tourl,
                    title: '用户信息修改',
                    area: ['100%', '100%']
                })
            }
            //执行修改操作
        });
        //头工具栏事件
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            //table选中行的数据对象 checked
            switch (obj.event) {
                case 'dels':
                    var data = checkStatus.data;
                    console.log("data--->"+data);
                    var list = [];
                    for(var i in data){
                        console.log("i---->"+i+"\tdata-->"+data[i].productId);
                        list.push(data[i].productId)
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
                case  "search":
                    //对于事件的处理，重新渲染table的数据
                    table.reload('member',{
                        url: '<%=basePath%>/LssgProduct/findByPage'
                        ,where: {username: $("#name").val()}
                    })
                    break;
                case 'add':
                    var tourl = "<%=basePath%>/LssgProduct/toAdd";
                    layer.open({
                        type: 2,
                        content: tourl,
                        title: '用户信息新增',
                        area: ['100%', '100%']
                    })

            }
        });

        form.on('switch(switchProductClass)',function (data) {
            //开关是否开启，true或者false
            var checked = data.elem.checked;
            //获取所需属性值
            var productId = data.elem.attributes['switch_payment_id'].nodeValue;
            var isState = data.elem.attributes['switch_payment_state'].nodeValue;

            console.log(checked);
            console.log(productId);
            //TODO 此时进行ajax的服务器访问，如果返回数据正常，则进行后面代码的调用

            console.log("isState---->"+isState);
            if(isState==1){
                var data1 = {"isState":0,"productId":productId};
                $.ajax({
                    url:"<%=basePath%>/LssgProduct/update",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(data1),
                    type: 'post',
                    dataType: "JSON",
                    success: function (result) {
                        console.log("result--->"+result);
                        if (result > 0) {
                            data.elem.checked = checked;

                            form.render('select'); //刷新select选择框渲染
                            table.reload('member');
                            layer.msg('已启用!',{icon: 1,time:1000});
                        }
                    }
                });

            }else{
                var data2 = {"isState":1,"productId":productId};
                $.ajax({
                    url:"<%=basePath%>/LssgProduct/update",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(data2),
                    type: 'post',
                    dataType: "JSON",
                    success: function (result) {
                        console.log("result--->"+result);
                        if (result > 0) {
                            data.elem.checked = !checked;

                            form.render('select'); //刷新select选择框渲染
                            table.reload('member');
                            layer.msg('已禁用!',{icon: 5,time:1000});

                        }
                    }
                });

            }

        });

    });

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
        var time = year+"年"+month+"月"+day+"日"+hours+"时"+minutes+"分"+seconds+"秒";
        return time;
    }


    function delAll (argument) {
        var ids = [];

        // 获取选中的id
        $('tbody input').each(function(index, el) {
            if($(this).prop('checked')){
                ids.push($(this).val())
            }
        });

        layer.confirm('确认要删除吗？'+ids.toString(),function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }

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
</script>
</body>
</html>
