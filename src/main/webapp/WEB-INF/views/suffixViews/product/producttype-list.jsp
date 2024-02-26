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
            <a href="<%=basePath%>/page/toIndex">首页</a>
            <a href="">演示</a>
            <a>
              <cite>商品列表</cite></a>
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
                       <%-- <button class="layui-btn layui-btn-danger" lay-event="dels">批量删除</button>--%>
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

<script type="text/html" id="barDemo">
    <%--<a style="text-decoration:none" title="停用">
        <i class="layui-icon">&#xe601;</i>
    </a>--%>
    <%--<a class="layui-btn layui-btn-primary layui-btn-xs " href="javascript:void(0)" lay-event="edit">编辑</a>--%>
    <%--<a title="编辑" class="layui-btn layui-btn-xs" style="text-decoration:none" lay-event="edit" >
        <i class="layui-icon">&#xe642;</i>
    </a>--%>
    <%--<a title="删除" style="text-decoration:none" class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">
        <i class="layui-icon">&#xe640;</i>
    </a>--%>
</script>

<script type="text/html" id="barDemo1">
    <span class="layui-btn layui-btn-danger " > 已禁用 </span>
</script>

<script>
    layui.use(['table', 'layer', 'form'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        //重新刷新表单
        function reloadData() {
            table.reload('member');
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
        renderTable('');
        $("#searchByquery").on("click",function(){
            var query=$("#query").val();
            console.log("query----->"+query);
            renderTable(query);
        });
        function renderTable(query) {
            //渲染table数据
            table.render({
                elem: '#member'
                , url: '<%=basePath%>/LssgProductClass/findByPage?query=' +query
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
                    , {field: 'productClassId', title: '商品类型ID', width: 120, fixed: 'right'}
                    , {field: 'productClassName', title: '类型名称', width: 320}
                    , {field: 'productIsShow', title: '状态', width: 270,templet: function(d){
                            if (d.productIsShow == 0)
                            {
                                return "<input type=\"checkbox\" name=\"zzz\" id=\"stateBtn\" lay-filter=\"switchProductClass\" lay-skin=\"switch\"\n" +
                                    "           switch_payment_id=\""+d.productClassId+"\" switch_payment_state='"+d.productIsShow+"' lay-text=\"启用|禁用\" checked>";
                            }
                            return "<input type=\"checkbox\" name=\"zzz\" id=\"stateBtn\" lay-filter=\"switchProductClass\" lay-skin=\"switch\"\n" +
                                "            switch_payment_state='"+d.productIsShow+"' lay-text=\"启用|禁用\" switch_payment_id='"+d.productClassId+"'>";
                        }}
                    , {field: 'productDescription', title: '描述', width: 420}
                    /*, {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 150}*/
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
            //获取所有选中行。
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
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
                    });
                    break;
                case 'add':
                    var tourl = "<%=basePath%>/page/toProductClassAdd";
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
            var productClassId = data.elem.attributes['switch_payment_id'].nodeValue;
            var productIsShow = data.elem.attributes['switch_payment_state'].nodeValue;

            console.log(checked);
            console.log(productClassId);
            //TODO 此时进行ajax的服务器访问，如果返回数据正常，则进行后面代码的调用

            console.log("productIsShow---->"+productIsShow);
            if(productIsShow==1){
                var data1 = {"productIsShow":0,"productClassId":productClassId};
                $.ajax({
                    url:"<%=basePath%>/LssgProductClass/update",
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
                var data2 = {"productIsShow":1,"productClassId":productClassId};
                $.ajax({
                    url:"<%=basePath%>/LssgProductClass/update",
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



</script>
</body>
</html>
