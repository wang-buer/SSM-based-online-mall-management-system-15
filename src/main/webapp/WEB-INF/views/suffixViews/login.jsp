<%--
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/7
  Time: 21:52
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
    <title>管理登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="<%= basePath %>/statics/suffix/css/font.css">
    <link rel="stylesheet" href="<%= basePath %>/statics/suffix/css/login.css">
    <link rel="stylesheet" href="<%= basePath %>/statics/suffix/css/index.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="<%= basePath %>/statics/suffix/lib/layui/layui.js" charset="utf-8"></script>

</head>
<body class="login-bg">

<div class="login layui-anim layui-anim-up">
    <div class="message">管理登录</div>
    <div id="darkbannerwrap"></div>

    <form method="post" class="layui-form" >
        <input name="adminName" placeholder="用户名"  type="text" lay-verify="required" class="layui-input adminName">
        <hr class="hr15">
        <input name="adminPwd" lay-verify="required" placeholder="密码"  type="password" class="layui-input adminPwd">
        <hr class="hr15">
        <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
        <hr class="hr20" >
    </form>
</div>

<script>
    $(function  () {
        layui.use('form', function(){
            var form = layui.form;
            // layer.msg('玩命卖萌中', function(){
            //   //关闭后的操作
            //   });
            //监听提交
            form.on('submit(login)', function(data){
                // alert(888)
                console.log("data.field---->"+data.field);
                $.ajax({
                    url:"<%=basePath%>/admin/login",
                    data:JSON.stringify(data.field),
                    type: 'post',
                    traditional: true,
                    dataType: "JSON",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        console.log("data--->"+data);
                        if (data > 0) {
                            layer.msg("登入成功！", {
                                icon: 1,
                                time: 1000,
                                end: function () {
                                    location.href='/page/toIndex'
                                }
                            });
                        }else{
                            layer.msg("登入失败！", {
                                icon: 2,
                                time: 1000,
                                end: function () {
                                    location.href='/admin/toLogin'
                                }
                            });
                        }
                    }
                });
                return false;
            });
        });
    })
</script>
<!-- 底部结束 -->
</body>
</html>
