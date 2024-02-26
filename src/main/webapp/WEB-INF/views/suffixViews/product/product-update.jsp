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
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">

    <link rel="stylesheet" href="<%= basePath %>/statics/suffix/css/font.css">
    <link rel="stylesheet" href="<%= basePath %>/statics/suffix/css/index.css">

    <script src="<%= basePath %>/statics/suffix/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%= basePath %>/statics/suffix/js/index.js"></script>
    <script src="<%=basePath%>/statics/suffix/js/jquery.min.js"></script>
    <script src="<%= basePath %>/statics/easyui/jquery.easyui.min.js"></script>
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
        <input type="hidden" id="productId" name="productId">
        <label class="layui-form-label">商品名称</label>
        <div class="layui-input-block">
            <input type="text" id="productName" name="productName" autocomplete="off" class="layui-input">
        </div>
    </div>
    <%--类别--%>
    <div class="layui-form-item">
        <label class="layui-form-label">类别</label>
        <div class="layui-input-block">
            <select name="lssgProductClass.productClassId" id="productSelect">
            </select>
        </div>
    </div>




    <div class="layui-form-item">
        <label class="layui-form-label">商品原图</label>
        <div class="layui-input-inline uploadHeadImage" id="headImg">
            <i class="layui-icon"></i>
            <input type="hidden" id="imgPath" name="productPhoto">
            <img id="productPhoto" src="<%= basePath %>/statics/layui/images/upload.jpg" alt="暂无图片" width="125px"
                 height="182px"/>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">大图</label>
        <div class="layui-input-inline uploadHeadImage" id="headImg2">
            <i class="layui-icon"></i>
            <input type="hidden" id="imgPath2" name="smallPhoto">
            <img id="smallPhoto" src="<%= basePath %>/statics/layui/images/upload.jpg" alt="暂无图片" width="125px"
                 height="182px"/>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">小图</label>
        <div class="layui-input-inline uploadHeadImage" id="headImg3">
            <i class="layui-icon"></i>
            <input type="hidden" id="imgPath3" name="bigPhoto">
            <img id="bigPhoto" src="<%= basePath %>/statics/layui/images/upload.jpg" alt="暂无图片" width="125px"
                 height="182px"/>
        </div>
    </div>





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
    </div>--%>

   <%-- <div class="layui-form-item">
        <label class="layui-form-label">活动价格</label>
        <div class="layui-input-block">
            <input type="text" id="promotePrice" name="promotePrice" autocomplete="off" class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">活动开始时间</label>
        <div class="layui-input-block">
            <input type="text" id="prometeStartDate" name="prometeStartDate" autocomplete="off" class="layui-input" placeholder="选择活动开始时间">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">活动结束时间</label>
        <div class="layui-input-block">
            <input type="text" id="promoteEndDate" name="promoteEndDate" autocomplete="off" class="layui-input" placeholder="选择活动结束时间">
        </div>
    </div>
--%>

    <div class="layui-form-item">
        <label class="layui-form-label">
            <span class='x-red'>*</span>精品推荐
        </label>
        <div class="layui-input-block">
            <input type="radio" name="isBest" id="isBest0" value="0" title="是" checked>
            <div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon layui-anim-scaleSpring"></i>
                <div>是</div>
            </div>
            <input type="radio" name="isBest" id="isBest1" value="1" title="否" >
            <div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i>
                <div>否</div>
            </div>
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">
            <span class='x-red'>*</span>新品上市
        </label>
        <div class="layui-input-block">
            <input type="radio" name="isNew" id="isNew0"  value="0" title="是" checked>
            <div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon layui-anim-scaleSpring"></i>
                <div>是</div>
            </div>
            <input type="radio" name="isNew" id="isNew1" value="1" title="否" >
            <div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i>
                <div>否</div>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">
            <span class='x-red'>*</span>热门商品
        </label>
        <div class="layui-input-block">
            <input type="radio" name="isHot" value="0" title="是" checked>
            <div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon layui-anim-scaleSpring"></i>
                <div>是</div>
            </div>
            <input type="radio" name="isHot" value="1" title="否" >
            <div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i>
                <div>否</div>
            </div>
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">
            <span class='x-red'>*</span>特价商品
        </label>
        <div class="layui-input-block">
            <input type="radio" name="isSpecial" value="0" title="是" checked>
            <div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon layui-anim-scaleSpring"></i>
                <div>是</div>
            </div>
            <input type="radio" name="isSpecial" value="1" title="否" >
            <div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i>
                <div>否</div>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">
            <span class='x-red'>*</span>是否下架
        </label>
        <div class="layui-input-block">

            <input type="radio" name="isState" value="0" title="否" checked>
            <div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i>
                <div>否</div>
            </div>

            <input type="radio" name="isState" value="1" title="是">
            <div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon layui-anim-scaleSpring"></i>
                <div>是</div>
            </div>

        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">商品产地</label>
        <div class="layui-input-block">
            <input type="text" id="productAddr" name="productAddr" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <label for="productNotes"></label><textarea id="productNotes" name="productNotes" class="layui-textarea"></textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">商品介绍</label>
        <div class="layui-input-block" id="productEffect">
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

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script type="text/javascript">

    UE.getEditor('myEditor',{initialFrameWidth:600,initialFrameHeight:400,});

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
                    $('#productPhoto').attr('src', result); //图片链接（base64）
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
                var demoText = $('#productPhoto');
                demoText.html('<span style="color: #8f8f8f;">上传成功!!!</span>');

            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#productPhoto');
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
            elem: '#headImg2',
            url: '<%=basePath%>/LssgProduct/addPath',
            size: 10000,
            before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#smallPhoto').attr('src', result); //图片链接（base64）
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
                var demoText = $('#smallPhoto');
                demoText.html('<span style="color: #8f8f8f;">上传成功!!!</span>');

            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#smallPhoto');
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
            elem: '#headImg3',
            url: '<%=basePath%>/LssgProduct/addPath',
            size: 10000,
            before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#bigPhoto').attr('src', result); //图片链接（base64）
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
                var demoText = $('#bigPhoto');
                demoText.html('<span style="color: #8f8f8f;">上传成功!!!</span>');

            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#bigPhoto');
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

        function getMessage(object) {
            $.ajax({
                type: 'post',
                url: "<%=basePath%>/LssgProduct/findOne",
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(object),
//               请求成功的回调
                success: function (data) {
                    /*  alert(JSON.stringify(data));*/
                    /* $('#ff').form('load',data);//easyui里面的jquery.form.js里面的方法*/

                    $('#ff').form('load',{
                        productId:data.productId,
                        productName:data.productName,
                        productUpTime:showTime(data.productUpTime),
                        productDownTime:showTime(data.productDownTime),
                        productPhoto:data.productPhoto,
                        smallPhoto:data.smallPhoto,
                        bigPhoto:data.bigPhoto,
                        productMarketPrice:data.productMarketPrice,
                        productMallPrice:data.productMallPrice,
                        productNum:data.productNum,
                        soldNum:data.soldNum,
                        productWeight:data.productWeight,
                        promotePrice:data.promotePrice,
                        promoteStartDate:showTime(data.promoteStartDate),
                        promoteEndDate:data.promoteEndDate,
                        isBest:data.isBest,
                        isNew:data.isNew,
                        isHot:data.isHot,
                        isSpecial:data.isSpecial,
                        isState:data.isState,
                        productAddr:data.productAddr,
                        productNotes:data.productNotes,
                        productEffect:data.productEffect

                    });
                    $('.productEffect').html(data.productEffect);
                    $("#myEditor").val(data.productEffect);




                    //特殊数据单独绑定,绑定照片信息
                    if(data.productPhoto.length>5) $("#productPhoto").attr("src", "<%=basePath%>/uploadfiles/productImg/" + data.productPhoto);
                    else $("#imgUrl").attr("src", "<%=basePath%>/statics/layui/images/upload.jpg");

                    if(data.smallPhoto.length>5) $("#smallPhoto").attr("src", "<%=basePath%>/uploadfiles/productImg/" + data.smallPhoto);
                    else $("#smallPhoto").attr("src", "<%=basePath%>/statics/layui/images/upload.jpg");

                    if(data.bigPhoto.length>5) $("#bigPhoto").attr("src", "<%=basePath%>/uploadfiles/productImg/" + data.bigPhoto);
                    else $("#bigPhoto").attr("src", "<%=basePath%>/statics/layui/images/upload.jpg");

                    //让下拉选中指定的商品类别
                    /*  console.log("data.kind.kid--->类别id"+data.LssgProductClass.prodcutClassId);*/
                    $("#productSelect").find("option[value='"+data.lssgProductClass.productClassId+"']").attr("selected","selected");
                    layui.use(['form'], function () {
                        var form = layui.form;
                        form.render("select"); //刷新select选择框渲染
                    });
                }
            })
        }



        getMessage(getURLParamValue('productId'));

        form.on('submit(userForm)', function () {
                //1.获取数据
                var obj = serializeArrayToObject('ff');
                console.log(obj);
                //2提交ajax请求修改信息
                $.ajax({
                    type: 'post',
                    url: "<%=basePath%>/LssgProduct/update",
                    dataType: 'json',
                    contentType: "application/json; charset=utf-8",
                    cache: true,
                    data: JSON.stringify(obj),

//                请求成功的回调
                    success: function (data) {
                        //alert(JSON.stringify(data));
                        if (data>0){
                            //修改成功，弹出提示
                            layer.msg("您已经成功修改记录！", {
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
</script>

<script>
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
