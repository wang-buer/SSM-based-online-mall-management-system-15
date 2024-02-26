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
    <title>后台管理系统</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="<%= basePath %>/statics/suffix/css/font.css">
    <link rel="stylesheet" href="<%= basePath %>/statics/suffix/css/index.css">
    <link rel="stylesheet" href="<%= basePath %>/statics/suffix/css/iconfont.css">
    <script src="<%= basePath %>/statics/suffix/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%= basePath %>/statics/suffix/js/index.js"></script>


</head>
<body class="index">
<!-- 顶部开始 -->
<div class="container">
    <div class="logo">
        <a href="<%= basePath %>/page/toIndex">后台管理系统</a></div>
    <div class="left_open">
        <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
    </div>

    <ul class="layui-nav right" lay-filter="">
       <%-- <li class="new-nav" id="gonggao">
            <i></i>
            <!--<dl class="layui-nav-child">-->
            <ul class="news" id="gonggaos" style="display: none;">

                <li> <a href="javascript:;" onclick="xadmin.add_tab('统计页面','<%= basePath %>/page/toNoticeList')">
                    <div class="clearfix">
                        <span class="pull-left"> <i class="btn btn-pink iconfont">&#xe6bc;</i> 系统公告 </span>
                        <span class="pull-right badge badge-info">+12</span>
                    </div> </a> </li>
                <li> <a href="javascript:;" onclick="xadmin.add_tab('统计页面','<%= basePath %>/page/toNoticeList')"> <i class="btn btn-primary iconfont">&#xe6bc;</i> 商城公告 </a> </li>

                <li> <a href="javascript:;" onclick="xadmin.add_tab('统计页面','<%= basePath %>/page/toNoticeList')">查看所有公告 <i class="iconfont">&#xe69b;</i> </a> </li>
            </ul>
            <!--</dl>-->

        </li>--%>
       <li class="new-nav" id="new-nav">
            <i></i>
            <a href="#"><i class="iconfont totalInfo">&#xe713;</i></a>
            <!--<dl class="layui-nav-child">-->
            <ul class="news" id="news" style="display: none;">
                <%--<li class="dropdown-header"><i class="iconfont">&#xe6bc;</i>8条通知</li>--%>
                <%--<li> <a href="#">
                    <div class="clearfix">
                        <span class="pull-left"> <i class="btn btn-pink iconfont">&#xe69b;</i> 新闻评论 </span>
                        <span class="pull-right badge badge-info">+12</span>
                    </div> </a> </li>--%>
                <li> <a href="javascript:;" onclick="xadmin.add_tab('订单列表','<%= basePath %>/page/toOrderList1?orderStatus=4')">
                    <div class="clearfix sendOrder">
                        <span class="pull-left"> <i class="iconfont btn btn-success">&#xe723;</i> 待发货订单数 </span>

                    </div> </a> </li>
                <li> <a href="javascript:;" onclick="xadmin.add_tab('订单列表','<%= basePath %>/page/toOrderList1?orderStatus=2')">
                    <div class="clearfix noOrder">
                        <span class="pull-left"> <i class="iconfont btn btn-info">&#xe6ba;</i> 已取消订单数 </span>

                    </div> </a> </li>
<%--                <li> <a href="javascript:;" onclick="xadmin.add_tab('统计页面','email.jsp')"> 查看所有消息 <i class="iconfont">&#xe69b;</i> </a> </li>--%>
            </ul>
            <!--</dl>-->
        </li>
        <li class="layui-nav-item">
            <a href="javascript:;">admin</a>
            <dl class="layui-nav-child">
                <!-- 二级菜单 -->
                <dd>
                    <a onclick="xadmin.open('个人信息','<%=basePath%>/page/toAdminInfo')">个人信息</a></dd>
                <dd>
                    <a href="<%= basePath %>/admin/toLogin">退出</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index">
            <a href="<%=basePath%>/beforePage/toIndex">前台首页</a></li>
    </ul>



</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;" onclick="xadmin.add_tab('我的桌面','<%= basePath %>/page/toWelcome')">
                    <i class="layui-icon left-nav-li" lay-tips="首页">&#xe68e;</i>
                    <cite>首页</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>

            </li>

            <li class="layui-nav-item">
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="商品管理">&#xe6a2;</i>
                    <cite>商品管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('商品类型列表','<%= basePath %>/page/toArticleTypeList')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>商品类型列表</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('商品列表','<%= basePath %>/page/toArticleList')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>商品列表</cite></a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="管理员管理">&#xe726;</i>
                    <cite>管理员管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('管理员列表','<%= basePath %>/page/toAdminList')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>管理员列表</cite></a>
                    </li>

                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="用户管理">&#xe6b8;</i>
                    <cite>用户管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">

                    <li>
                        <a onclick="xadmin.add_tab('用户列表','<%= basePath %>/page/toMemberList')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>用户列表</cite></a>
                    </li>

                </ul>
            </li>

            <li class="layui-nav-item">
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="公告管理">&#xe6c0;</i>
                    <cite>公告管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('公告类型','<%= basePath %>/page/toNoticeTypeList')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>公告类型</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('公告列表','<%= basePath %>/page/toNoticeList')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>公告列表</cite></a>
                    </li>
                </ul>


            </li>


            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="支付模块">&#xe636;</i>
                    <cite>支付模块</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('支付方式列表','<%= basePath %>/page/toPayment')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>支付方式列表</cite></a>
                    </li>
                </ul>
            </li>



            <li>
                <a href="javascript:;">
                    <i class="iconfont  left-nav-li" lay-tips="订单管理">&#xe604;</i>

                    <cite>订单管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('订单列表','<%= basePath %>/page/toOrderList1')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>订单列表</cite></a>
                    </li>
                    <%--<li>
                        <a onclick="xadmin.add_tab('数据库','database.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>数据库</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('备份管理','backups.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>备份管理</cite></a>
                    </li>--%>
                </ul>
            </li>

            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="留言评论管理">&#xe70c;</i>
                    <cite>留言评论管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('留言列表','<%= basePath %>/page/toContentMessageList')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>留言列表</cite></a>
                    </li>

                    <li>
                        <a onclick="xadmin.add_tab('回复列表','<%= basePath %>/page/toContentReplyList')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>回复列表</cite></a>
                    </li>
                    <%--<li>
                        <a onclick="xadmin.add_tab('留言评论审核','database.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>留言评论审核</cite></a>
                    </li>--%>

                </ul>
            </li>

        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>我的桌面</li></ul>
        <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
            <dl>
                <dd data-type="this">关闭当前</dd>
                <dd data-type="other">关闭其它</dd>
                <dd data-type="all">关闭全部</dd></dl>
        </div>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='<%=basePath%>/page/toWelcome' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
        </div>
        <div id="tab_show"></div>
    </div>
</div>
<div class="page-content-bg"></div>
<style id="theme_style"></style>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->

</body>
<script src="<%= basePath %>/statics/suffix/js/jquery.min.js"></script>
<script>
    window.onload=function () {
        var click=document.getElementById('new-nav');
        var news=document.getElementById('news');
        click.addEventListener('mousemove',function () {
            news.style.display='block';
        });
        click.addEventListener('mouseout',function () {
            news.style.display='none';
        });

        var gonggao=document.getElementById('gonggao');
        var gonggaos=document.getElementById('gonggaos');
        gonggao.addEventListener('mousemove',function () {
            gonggaos.style.display='block';
        });
        gonggao.addEventListener('mouseout',function () {
            gonggaos.style.display='none';
        });
    }



</script>
<script src="<%= basePath %>/statics/suffix/js/countIndex.js"></script>

</html>
