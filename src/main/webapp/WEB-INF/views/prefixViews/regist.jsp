<%--
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/8
  Time: 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <meta charset="utf-8" />
    <title>注册</title>
    <script src="<%= basePath %>/statics/prefix/assets/js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="<%= basePath %>/statics/prefix/assets/css/regist.css"/>
</head>
<body>
<header>
    <a href="#" class="logo"></a>
    <div class="desc">欢迎注册</div>
</header>
<section>
    <form>
        <div class="register-box">
            <label for="username" class="username_label">用 户 名
                <input maxlength="20" id="username" type="text" placeholder="您的用户名和登录名"/>
            </label>
            <div class="tips username_div">

            </div>
        </div>
        <div class="register-box">
            <label for="password" class="other_label">设 置 密 码
                <input maxlength="20" id="password" type="password" placeholder="建议至少使用两种字符组合"/>
            </label>
            <div class="tips">

            </div>
        </div>
        <div class="register-box">
            <label for="repassword" class="other_label">确 认 密 码
                <input maxlength="20" id="repassword" type="password" placeholder="请再次输入密码"/>
            </label>
            <div class="tips">

            </div>
        </div>
        <%--<div class="register-box">
            <label for="username" class="other_label">
                <span>中国 0086∨</span>
                <input class="phone" maxlength="20" type="text" placeholder="建议使用常用手机"/>
            </label>
            <div class="tips">

            </div>
        </div>--%>
        <div class="register-box">
            <label for="vcode" class="other_label">验 证 码
                <input maxlength="20" id="vcode" type="text" placeholder="请输入验证码"/>
            </label>
            <span id="code"></span>
            <div class="tips">

            </div>
        </div>
        <div class="arguement">
            <input type="checkbox" id="xieyi"/>
            阅读并同意
            <a href="#">《lssg用户注册协议》</a>
            <a href="#">《隐私政策》</a>
            <div class="tips">

            </div>
        </div>
        <div class="submit_btn">
            <button type="button" id="submit_btn">立 即 注 册</button>
        </div>
    </form>
</section>
<script src="<%= basePath %>/statics/prefix/assets/js/regist.js" type="text/javascript" charset="utf-8"></script>
<script src="<%= basePath %>/statics/prefix/assets/js/jquery.tips.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>
