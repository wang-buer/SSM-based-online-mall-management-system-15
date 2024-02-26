<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>Title</title>
    <!--要改成本机静态资源存放的的地址-->
    <link href="<%= basePath %>/statics/layui/css/layui.css" rel="stylesheet" media="all"/>
    <script src="<%=basePath%>/statics/suffix/js/jquery.js"></script>
    <script src="<%= basePath %>/statics/layui/layui.js" charset="utf-8"></script>
    <script src="<%=basePath%>/statics/js/common.js"></script>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>
<body>
<form class="layui-form" id="ff"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>类别基本信息</legend>
    </fieldset>
    <div class="layui-form-item">
        <label class="layui-form-label">商品类型</label>
        <div class="layui-input-block">
            <input type="text" id="productClassName" name="productClassName" autocomplete="off" class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">
            状态
        </label>
        <div class="layui-input-block">
            <input type="radio" name="productIsShow" id="state0" value="0" title="显示" checked>
            <div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon layui-anim-scaleSpring"></i>
                <div>显示</div>
            </div>
            <input type="radio" name="productIsShow" id="state1" value="1" title="隐藏" >
            <div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i>
                <div>隐藏</div>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <input type="text" id="productDescription" name="productDescription" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="userForm">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>



<script type="text/javascript">
    layui.use(["jquery", "upload", "form", "layer", "element"], function () {
        var $ = layui.$,
            element = layui.element,
            layer = layui.layer,
            upload = layui.upload,
            form = layui.form;

        element.init();

    });
</script>



<script>
    layui.use(['layer', 'form'], function () {
        var form = layui.form;
        var layer = layui.layer;
        form.on('submit(userForm)', function () {
            //1.获取数据
            var obj = serializeArrayToObject('ff');
            console.log(obj);
            //2提交ajax请求修改信息
            $.ajax({
                type: 'post',
                url: "<%=basePath%>/LssgProductClass/add",
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                cache: true,
                data: JSON.stringify(obj),
//                请求成功的回调
                success: function (data) {
                    if (data>0){
                        //修改成功，弹出提示
                        layer.msg("您已经成功新增记录！", {
                            icon: 1,
                            time: 1300,
                            end: function () {
                                //获取当前窗口索引
                                var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
                                //关闭当前窗口
                                parent.layer.close(index);
                                // 父页面刷新
                                parent.location.reload();
                            }
                        });
                    }
                }
            });
            return false;
        })
    })
</script>
</body>