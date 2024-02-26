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
    <meta charset="UTF-8">
    <title>添加管理员</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="<%= basePath %>/statics/suffix/css/font.css">
    <link rel="stylesheet" href="<%= basePath %>/statics/suffix/css/index.css">
    <script type="text/javascript" src="<%= basePath %>/statics/suffix/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%= basePath %>/statics/suffix/js/index.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <script src="<%=basePath%>/statics/js/common.js"></script>

</head>
<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form" id="adminForm">
            <div class="layui-form-item">
                <label for="adminName" class="layui-form-label">
                    <span class="x-red">*</span>登录名
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="adminName" name="adminName" required="" lay-verify="required"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>将会成为您唯一的登入名
                </div>
            </div>
            <%--<div class="layui-form-item">
                <label for="phone" class="layui-form-label">
                    <span class="x-red">*</span>手机
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="phone" name="phone" required="" lay-verify="phone"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>将会成为您唯一的登入名
                </div>
            </div>--%>
            <div class="layui-form-item">
                <label for="adminEmail" class="layui-form-label">
                    <span class="x-red">*</span>邮箱
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="adminEmail" name="adminEmail" required="" lay-verify="email"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="adminPwd" class="layui-form-label">
                    <span class="x-red">*</span>密码
                </label>
                <div class="layui-input-inline">
                    <input type="password" id="adminPwd" name="adminPwd" required="" lay-verify="pass"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    6到16个字符
                </div>
            </div>
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">
                    <span class="x-red">*</span>确认密码
                </label>
                <div class="layui-input-inline">
                    <input type="password" id="L_repass" name="repass" required="" lay-verify="repass"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">
                </label>
                <button  class="layui-btn" lay-filter="add" lay-submit="">
                    增加
                </button>
            </div>
        </form>
    </div>
</div>
<script>
    layui.use(['jquery','form', 'layer'],
    function() {
       var $ = layui.jquery;
        var form = layui.form,
            layer = layui.layer;

        //自定义验证规则
        form.verify({
            nikename: function(value) {
                if (value.length < 5) {
                    return '昵称至少得5个字符啊';
                }
            },
            pass: [/(.+){6,12}$/, '密码必须6到12位'],
            repass: function(value) {
                if ($('#adminPwd').val() != $('#L_repass').val()) {
                    return '两次密码不一致';
                }
            }
        });

        $('input').eq(0).blur(function () {
            var adminName = $('#adminName').val();
            console.log("adminName--->"+adminName);
            var lssgAdmin = {"adminName":adminName};
            $.ajax({
                type: 'post',
                url: "<%=basePath%>/admin/findOneAdminByName",
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(lssgAdmin),

//               请求成功的回调
                success: function (data) {
                    console.log("data--->"+data);
                    if (data == null) {

                    } else {
                        alert("用户名已存在！");

                    }
                }
            });
        });

        //监听提交
        form.on('submit(add)',
            function(data) {
                var obj = serializeArrayToObject('adminForm');
                console.log(data);
                console.log(obj);
                //发异步，把数据提交给
                $.ajax({
                    type: 'post',
                    url: "<%=basePath%>/admin/addAdmin",
                    dataType: 'json',
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(obj),

                    //请求成功的回调
                    success: function (data) {
                        console.log("data--->"+data);
                        if (data > 0) {
                            layer.alert("增加成功", {
                                    icon: 6
                                },
                                function() {
                                    //关闭当前frame
                                    xadmin.close();

                                    // 可以对父窗口进行刷新
                                    xadmin.father_reload();
                                });
                        }
                    }
                });
                return false;
            });
    });
</script>

</body>
</html>
