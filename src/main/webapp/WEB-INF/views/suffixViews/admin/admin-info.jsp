<%@ page import="com.lianwei.lssg.entity.LssgAdmin" %><%--
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/7
  Time: 21:59
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
        个人信息
    </title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="<%= basePath %>/statics/suffix/css/index.css" media="all">
    <script type="text/javascript" src="<%= basePath %>/statics/suffix/lib/layui/layui.js" charset="utf-8"></script>
    <script src="<%=basePath%>/statics/js/common.js"></script>
    <style>
        .imgs{display: none;}
        input[type="file"]{
            width: 50px;
            height:50px;
            border-radius: 100%;
            opacity:0;
            cursor:pointer;
            border: 1px solid red;
            position: absolute;
        }
    </style>
        <%
            LssgAdmin lssgAdmin = (LssgAdmin)request.getSession().getAttribute("lssgAdmin");
            Integer adminId = lssgAdmin.getAdminId();
        %>
</head>
<body>
<style>
    .uploadHeadImage img{
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
<div class="x-body">
    <form class="layui-form layui-form-pane" action="" id="add">
        <blockquote class="layui-elem-quote">
                <%--<input class="layui-upload " type="file" accept="undefined" id="previewImg" name="images"  onchange="upload(this,8)">
                <img src="<%= basePath %>/statics/suffix/images/tp.jpg" class="layui-circle" style="width:50px;height:50px;float:left" id="pimages" name="pimages"   alt="个人头像" >
                <input id="avatar"   name="image" required="" type="hidden" value="./images/tx.jpg" >--%>
                    <div class="layui-input-inline uploadHeadImage" id="headImg">
                        <i class="layui-icon"></i>
                        <input type="hidden" id="imgPath" name="adminImg">
                        <img id="imgUrl" src="<%= basePath %>/statics/layui/images/upload.jpg" alt="暂无图片" width="125px"
                             height="182px"/>
                    </div>
                    <dl style="margin-left:80px; color:#019688">
                        <dt class="userName"><span >xiyuan</span> <span ></span></dt>
                        <dd style="margin-left:0">这家伙很懒，什么也没有留下</dd>
                    </dl>

        </blockquote>

        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">


            <div class="layui-tab-content" >
                <div class="layui-tab-item layui-show">

                    <input type="text" hidden id="adminId" value="<%=adminId%>">
                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class='x-red'>*</span>用户名
                        </label>
                        <div class="layui-input-block">
                            <input type="text" name="adminName" id="adminName" autocomplete="off" readonly="readonly"
                                   class="layui-input" value="">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class='x-red'>*</span>密码
                        </label>
                        <div class="layui-input-block">
                            <input type="password" name="oldAdminPwd" id="oldAdminPwd" value="" autocomplete="off" placeholder=""
                                   class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class='x-red'>*</span>新密码
                        </label>
                        <div class="layui-input-block">
                            <input type="password" name="adminPwd" id="adminPwd" value="" autocomplete="off" placeholder="新密码为空则不修改"
                                   class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <button class="layui-btn" type="button" lay-filter="update" lay-submit="">
                            保存
                        </button>
                    </div>
                    <!--</form>-->
                    <div style="height:100px;"></div>
                </div>



            </div>

        </div>
    </form>
</div>

<%--<script src="<%= basePath %>/statics/suffix/js/x-layui.js" charset="utf-8"></script>--%>
<script>
    layui.use(["jquery", "upload", "form", "layer", "element"], function () {
        var $ = layui.$,
            element = layui.element,
            layer = layui.layer,
            upload = layui.upload,
            form = layui.form;

        //拖拽上传
        var uploadInst = upload.render({
            elem: '#headImg',
            url: '<%=basePath%>/upload/addAdminPath',
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

        //得到所有的支付类别信息，并绑定到下拉选择框中
        var adminId = $('#adminId').val();
        var obj = {"adminId":adminId};
        getAllClass(obj);
        function getAllClass(object) {
            $.ajax({
                type: 'post',
                url: "<%=basePath%>/admin/findOneById",
                dataType: 'json',
                async:false,
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(object),
                // 请求成功的回调
                success: function (data) {
                    console.log("data--->"+data);
                    $('.userName').text(data.adminName);
                    $('#adminName').val(data.adminName);
                    //特殊数据单独绑定,绑定照片信息
                    $("#imgUrl").attr("src", "<%=basePath%>/uploadfiles/admin/" + data.adminImg);
                }
            })
        }

        $('input').eq(4).blur(function () {
            var adminPwd = $("#oldAdminPwd").val();
            var adminName = $('#adminName').val();
            var lssgAdmin = {"adminId":adminId,"adminPwd":adminPwd,"adminName":adminName};
            $.ajax({
                type: 'post',
                url: "<%=basePath%>/admin/oldPwdAndNewPwd",
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(lssgAdmin),

//               请求成功的回调
                success: function (data) {
                    console.log("data--->"+data);
                    if (data>0) {

                    } else {
                        alert("原密码不正确！");

                    }
                }
            });
        });

        //监听提交
        form.on('submit(update)', function () {
            //1.获取数据
            var adminPwd = $("#adminPwd").val();
            var adminImg = $("#imgPath").val();
            var adminName = $('#adminName').val();
            var obj = {"adminImg":adminImg,"adminPwd":adminPwd,"adminId":adminId,"adminName":adminName};
            console.log(obj);
            //2提交ajax请求修改信息
            $.ajax({
                type: 'post',
                url: "<%=basePath%>/admin/updateOneAdmin",
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                cache: true,
                data: JSON.stringify(obj),
                //请求成功的回调
                success: function (data) {
                    if (data>0){
                        //修改成功，弹出提示
                        layer.msg("您已经成功修改！", {
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
</script>
<%--<script>
    layui.use(['element','layer','form'], function(){
        $ = layui.jquery;//jquery
        lement = layui.element();//面包导航
        layer = layui.layer;//弹出层
        form = layui.form()



        //图片上传接口
        /*layui.upload({
          url: './upload.json' //上传接口
          ,success: function(res){ //上传成功后的回调
              console.log(res);
            $('#LAY_demo_upload').attr('src',res.url);
          }
        });*/


        //监听提交
        form.on('submit(add)', function(data){
            var name=$("input[name='name']").val();

            if(name==""){
                layer.msg('用户名不能为空',{icon:5,time:2000});return false;
            }

            var data=data.field;
            $.ajax({
                type:"post",
                url:"xxx",
                data:data,
                dataType:"json",
                success:function(data)
                {
                    //alert(1);
                    if(data.status==1)
                    {
                        layer.msg(data.info, {icon: 6,time:2000},function () {
                            window.parent.location.reload();
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);
                        });
                        return false;

                    }
                    else{
                        layer.msg(data.info,{icon:5,time:2000});return false;
                    }
                }

            });

        });

    })
</script>
<!--栏目缩略图上传-->
<script>
    function upload(obj,id){
        var formData = new FormData();
        formData.append('images', $('#previewImg')[0].files[0]);
        formData.append('id', id);
        layer.msg('图片上传中', {icon: 16});
        $.ajax({
            type:"post",
            processData: false,
            contentType: false,
            url:"xxx",
            data:formData,
            success:function(data){
                if(data.status == 1){
                    console.log(data.image_name);
                    layer.closeAll('loading');
                    //layer.msg(data.info,{icon:1,time:1000});
                    $("#pimages").attr('src',data.image_name);
                    $("#avatar").val(data.image_name);
                    $(".imgs").show();
                    return false;
                }else{
                    layer.msg(data.info,{icon:2,time:1000});
                }
            }
        });
    }
</script>--%>

</body>
</html>
