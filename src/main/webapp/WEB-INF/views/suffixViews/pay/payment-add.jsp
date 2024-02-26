<%--
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/7
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <meta charset="utf-8">
    <title>
        新增支付方式
    </title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">

    <link rel="stylesheet" href="<%= basePath %>/statics/suffix/css/font.css">
    <link rel="stylesheet" href="<%= basePath %>/statics/suffix/css/index.css">
    <script src="<%=basePath%>/statics/suffix/js/jquery.min.js"></script>
    <script src="<%= basePath %>/statics/easyui/jquery.easyui.min.js"></script>
    <script src="<%= basePath %>/statics/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%= basePath %>/statics/suffix/js/index.js"></script>
    <script src="<%=basePath%>/statics/js/common.js"></script>
</head>
<body>
<div class="layui-card">
    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">

        <div class="layui-tab-content" >
            <div class="layui-tab-item layui-show">
                <form class="layui-form layui-form-pane" action="" id="payment">
                    <%--<div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class='x-red'>*</span>文章类型
                        </label>
                        &lt;%&ndash;<div class="layui-input-block">
                            <select name="pid">
                                <option value="0">--顶级分类--</option>
                                <option value="1">小说</option>

                            </select>
                        </div>&ndash;%&gt;
                    </div>--%>
                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class='x-red'>*</span>支付方式
                        </label>
                        <div class="layui-input-block">
                            <input type="text" name="paymentName" autocomplete="off" placeholder=""
                                   class="layui-input" lay-verify="required">
                        </div>
                    </div>
                    <%--<div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class='x-red'>*</span>排序
                        </label>
                        <div class="layui-input-block">
                            <input type="text" name="sort" autocomplete="off" placeholder="请输入数字"
                                   class="layui-input" lay-verify="number">
                        </div>
                    </div>--%>
                    <div class="layui-form-item">
                        <label class="layui-form-label">状态</label>
                        <div class="layui-input-block">
                            <input type="radio" name="paymentState" value="0" title="启用" >
                            <div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon layui-anim-scaleSpring"></i>
                                <div>启用</div>
                            </div>
                            <input type="radio" name="paymentState" value="1" title="禁用" >
                            <div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i>
                                <div>禁用</div>
                            </div>
                        </div>
                    </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">
                                <span class="x-red">*</span>收款码
                            </label>
                            <div class="layui-input-inline uploadHeadImage" id="headImg">
                                <i class="layui-icon"></i>
                                <input type="hidden" id="imgPath" name="paymentImg">
                                <img id="imgUrl" src="<%= basePath %>/statics/layui/images/upload.jpg" alt="暂无图片" width="125px"
                                     height="182px"/>
                            </div>
                        </div>


                    <div class="layui-form-item">
                        <button class="layui-btn" lay-submit="" lay-filter="paymentForm">
                            保存
                        </button>
                    </div>
                </form>
                <div style="height:100px;"></div>
            </div>

        </div>
    </div>
</div>


<script>

    layui.use(["jquery", "upload",'layer', 'form', "element"], function () {
        var $ = layui.$,
            element = layui.element,
            layer = layui.layer,
            upload = layui.upload,
            form = layui.form;

        //拖拽上传
        var uploadInst = upload.render({
            elem: '#headImg',
            url: '<%=basePath%>/upload/addPath',
            size: 10000,
            before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#imgUrl').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }

                //上传成功
                //打印后台传回的地址: 把地址放入一个隐藏的input中, 和表单一起提交到后台, 此处略..

                $("#imgPath").val(res.path1);
                var demoText = $('#demoText');
                demoText.html('<span style="color: #8f8f8f;">上传成功!!!</span>');

            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });

        element.init();


        //监听提交
        form.on('submit(paymentForm)', function () {
           /* var name = $("input[name=name]").val();
            if(name ==""){
                layer.msg("文章分类名称不能为空！",{icon:5,time:2000});return false;
            }*/

            //1.获取数据
            var obj = serializeArrayToObject('payment');
            console.log(obj);
            //2提交ajax请求修改信息
            $.ajax({
                type: 'post',
                url: "<%=basePath%>/payment/addPayment",
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                cache: true,
                data: JSON.stringify(obj),
                //请求成功的回调
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
</html>
