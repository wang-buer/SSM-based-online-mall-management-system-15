<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>Title</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!--要改成本机静态资源存放的的地址-->
    <link rel="stylesheet" href="<%= basePath %>/statics/suffix/css/font.css">
    <link rel="stylesheet" href="<%= basePath %>/statics/suffix/css/index.css">
    <script src="<%=basePath%>/statics/suffix/js/jquery.min.js"></script>
    <script src="<%= basePath %>/statics/easyui/jquery.easyui.min.js"></script>
    <script src="<%= basePath %>/statics/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%= basePath %>/statics/suffix/js/index.js"></script>
    <script src="<%=basePath%>/statics/js/common.js"></script>

    <%--引入ueditor插件--%>
    <script src="<%=basePath%>/statics/ueditor/ueditor.config.js" charset="utf-8"></script>
    <script src="<%=basePath%>/statics/ueditor/ueditor.all.min.js" charset="utf-8"></script>
</head>
<body>
<form class="layui-form" id="ff"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>商品基本信息</legend>
    </fieldset>
    <div class="layui-form-item">
        <label class="layui-form-label">商品名称</label>
        <div class="layui-input-block">
            <input type="text" id="productName" name="productName" autocomplete="off" class="layui-input">
        </div>
    </div>
            <%--类别--%>

    <div class="layui-form-item">
        <label class="layui-form-label">所有类别</label>
        <div class="layui-input-block">
            <select name="lssgProductClass.productClassId" id="productSelect">
            </select>
        </div>
    </div>

        <%--上市时间--%>
    <div class="layui-form-item">
        <label class="layui-form-label">上市时间</label>
        <div class="layui-input-block">
            <input type="text" id="productUpTime" name="productUpTime" autocomplete="off" class="layui-input" placeholder="选择上市时间">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">下市时间</label>
        <div class="layui-input-block">
            <input type=text id="productDownTime" name="productDownTime" autocomplete="off" class="layui-input" placeholder="选择下市时间">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">产品原图</label>
        <div class="layui-input-inline uploadHeadImage">
            <div class="layui-upload-drag" id="headImg">
                <i class="layui-icon"></i>
                <p>点击上传图片，或将图片拖拽到此处</p>
            </div>
        </div>
        <div class="layui-input-inline">
            <div class="layui-upload-list">
                <img class="layui-upload-img headImage" src="http://t.cn/RCzsdCq" id="demo1">
                <p id="demoText"></p>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">大图路径</label>
        <div class="layui-input-inline uploadHeadImage">
            <div class="layui-upload-drag" id="smallPhoto">
                <i class="layui-icon"></i>
                <p>点击上传图片，或将图片拖拽到此处</p>
            </div>
        </div>
        <div class="layui-input-inline">
            <div class="layui-upload-list">
                <img class="layui-upload-img headImage" src="http://t.cn/RCzsdCq" id="demo2">
                <p id="demoText2"></p>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">小图路劲</label>
        <div class="layui-input-inline uploadHeadImage">
            <div class="layui-upload-drag" id="bigPhoto">
                <i class="layui-icon"></i>
                <p>点击上传图片，或将图片拖拽到此处</p>
            </div>
        </div>
        <div class="layui-input-inline">
            <div class="layui-upload-list">
                <img class="layui-upload-img headImage" src="http://t.cn/RCzsdCq" id="demo3">
                <p id="demoText3"></p>
            </div>
        </div>
    </div>




    <input type="hidden" id="imgPath1" name="productPhoto">
    <input type="hidden" id="imgPath2" name="smallPhoto">
    <input type="hidden" id="imgPath3" name="bigPhoto">

    <div class="layui-form-item">
        <label class="layui-form-label">市场价格</label>
        <div class="layui-input-block">
            <input type="text" id="productMarketPrice" name="productMarketPrice" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">商城价格</label>
        <div class="layui-input-block">
            <input type="text" id="productMallPrice" name="productMallPrice" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">库存数量</label>
        <div class="layui-input-block">
            <input type="text" id="productNum" name="productNum" autocomplete="off" class="layui-input">
        </div>
    </div>

   <%-- <div class="layui-form-item">
        <label class="layui-form-label">已售数量</label>
        <div class="layui-input-block">
            <input type="text" id="soldNum" name="soldNum" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">商品质量</label>
        <div class="layui-input-block">
            <input type="text" id="productWeight" name="productWeight" autocomplete="off" class="layui-input">
        </div>
    </div>
--%>
    <%--<div class="layui-form-item">
        <label class="layui-form-label">活动价格</label>
        <div class="layui-input-block">
            <input type="text" id="promotePrice" name="password" autocomplete="off" class="layui-input" placeholder="">
        </div>
    </div>
--%>



    <div class="layui-form-item">
        <label class="layui-form-label">商品产地</label>
        <div class="layui-input-block">
            <input type="text" id="productAddr" name="productAddr" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <input type="text" id="productNotes" name="productNotes" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">商品介绍</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" id="myEditor" required name="productEffect"
                      class="layui-textarea" style="width: 97%;height: 240px;"></textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="userForm">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>


<%--上传图片--%>
<script type="text/javascript">

    UE.getEditor('myEditor',{initialFrameWidth:600,initialFrameHeight:400});

    layui.use(["jquery", "upload", "form", "layer", "element"], function () {
        var $ = layui.$,
            element = layui.element,
            layer = layui.layer,
            upload = layui.upload,
            form = layui.form;
        //拖拽上传
        var uploadInst = upload.render({
            elem: '#headImg',
            url: '<%=basePath%>/LssgProduct/addPath',
            size: 10000,
            before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }

                //上传成功
                //打印后台传回的地址: 把地址放入一个隐藏的input中, 和表单一起提交到后台, 此处略..

                $("#imgPath1").val(res.path1);
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

    });
</script>
<script type="text/javascript">
    layui.use(["jquery", "upload", "form", "layer", "element"], function () {
        var $ = layui.$,
            element = layui.element,
            layer = layui.layer,
            upload = layui.upload,
            form = layui.form;
        //拖拽上传
        var uploadInst = upload.render({
            elem: '#smallPhoto',
            url: '<%=basePath%>/LssgProduct/addPath',
            size: 10000,
            before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo2').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }

                //上传成功
                //打印后台传回的地址: 把地址放入一个隐藏的input中, 和表单一起提交到后台, 此处略..

                $("#imgPath2").val(res.path1);
                var demoText = $('#demoText2');
                demoText.html('<span style="color: #8f8f8f;">上传成功!!!</span>');

            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText2');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });

        element.init();
    });
</script>
<script type="text/javascript">
    layui.use(["jquery", "upload", "form", "layer", "element"], function () {
        var $ = layui.$,
            element = layui.element,
            layer = layui.layer,
            upload = layui.upload,
            form = layui.form;
        //拖拽上传
        var uploadInst = upload.render({
            elem: '#bigPhoto',
            url: '<%=basePath%>/LssgProduct/addPath',
            size: 10000,
            before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo3').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }

                //上传成功
                //打印后台传回的地址: 把地址放入一个隐藏的input中, 和表单一起提交到后台, 此处略..

                $("#imgPath3").val(res.path1);
                var demoText = $('#demoText3');
                demoText.html('<span style="color: #8f8f8f;">上传成功!!!</span>');

            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText3');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });

        element.init();

        var object = new Object();
        getAllClass(object);

        function getAllClass(object) {
            $.ajax({
                type: 'post',
                url: "<%=basePath%>/LssgProductClass/findByAll",
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(object),
                // 请求成功的回调
                success: function (data) {
                    //绑定班级下拉框
                    if (data != null)
                        for (var i = 0; i < data.length; i++) {
                            console.log("data[i].productClassId--->"+data[i].productClassId);
                            $("#productSelect").append("<option value='" + data[i].productClassId + "'>" + data[i].productClassName + "</option>");
                        }
                    layui.use(['form'], function () {
                        var form = layui.form;
                        form.render('select'); //刷新select选择框渲染
                    });
                }
            })

        }

            form.on('submit(userForm)', function () {
                //1.获取数据
                var obj = serializeArrayToObject('ff');
                console.log(obj);
                //2提交ajax请求修改信息
                $.ajax({
                    type: 'post',
                    url: "<%=basePath%>/LssgProduct/add",
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

    });

    layui.use('laydate', function(){
        var laydate = layui.laydate;

        laydate.render({
            elem: '#productUpTime'
            ,type: 'datetime'
        });
        laydate.render({
            elem: '#productDownTime'
            ,type: 'datetime'
        });
        laydate.render({
            elem: '#prometeStartDate'
            ,type: 'datetime'
        });
        laydate.render({
            elem: '#promoteEndDate'
            ,type: 'datetime'
        });
    });
</script>
</body>