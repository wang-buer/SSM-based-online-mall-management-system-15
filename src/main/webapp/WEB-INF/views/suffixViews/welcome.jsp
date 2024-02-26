<%@ page import="com.lianwei.lssg.entity.LssgAdmin" %><%--
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/7
  Time: 22:02
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
    <title>欢迎页面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <!--<link rel="stylesheet" href="./css/font.css">-->
    <link rel="stylesheet" href="<%= basePath %>/statics/suffix/css/index.css">
    <link rel="stylesheet" href="<%= basePath %>/statics/suffix/js/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="<%= basePath %>/statics/suffix/css/iconfont.css">
    <script src="<%= basePath %>/statics/suffix/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%= basePath %>/statics/suffix/js/index.js"></script>
    <script src="<%= basePath %>/statics/suffix/js/jquery.js"></script>
    <script src="<%= basePath %>/statics/suffix/js/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%= basePath %>/statics/suffix/css/x-admin.css" media="all">
    <style>
        #FontScroll{
            width: 100%;
            height: 245px;
            overflow: hidden;
        }
        #FontScroll ul li{
            height: 32px;
            width: 100%;
            color: #ffffff;
            line-height: 32px;
            overflow: hidden;
            font-size: 14px;
        }
        #FontScroll ul li i{
            color: red;
        }
        .layui-table td, .layui-table th{
            min-width: auto !important;
        }
    </style>
    <%
        LssgAdmin lssgAdmin = (LssgAdmin) request.getSession().getAttribute("lssgAdmin");

    %>

</head>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <blockquote class="layui-elem-quote">欢迎管理员：
                        <span class="x-red" ><%=lssgAdmin.getAdminName()%></span>
                        <span id="time"></span>
                    </blockquote>
                </div>
            </div>
        </div>
    </div>
</div>
<body style="height:1150px;">
<div class="container-fluid ygyd-wrapper">
    <div class="row" style="margin-top:20px;">
        <div class="col-xs-6 col-sm-4 col-md-3">
            <section class="panel">
                <div class="symbol bgcolor-blue"> <i class="fa fa-address-card"></i>
                </div>
                <div class="value tab-menu" bind="1">
                    <a href="javascript:;" data-url="user-info.html" data-parent="true" data-title="会员总数"><i class="iconfont " data-icon=""></i>
                        <h1 id="userCount"></h1>
                    </a>

                    <a href="javascript:;" data-url="user-info.html" data-parent="true" data-title="会员总数"> <i class="iconfont " data-icon=""></i><span>会员总数</span></a>

                </div>
            </section>
        </div>
        <div class="col-xs-6 col-sm-4 col-md-3">
            <section class="panel">
                <div class="symbol bgcolor-commred"> <i class="fa fa-handshake-o"></i>
                </div>
                <div class="value tab-menu" bind="1">
                    <a href="javascript:;" data-url="user-info.html" data-parent="true" data-title="用户反馈信息"> <i class="iconfont " data-icon=""></i>
                        <h1 id="messageCount"></h1>
                    </a>

                    <a href="javascript:;" data-url="user-info.html" data-parent="true" data-title="用户反馈信息"> <i class="iconfont " data-icon=""></i><span>用户反馈信息</span></a>

                </div>
            </section>
        </div>

        <div class="col-xs-6 col-sm-4 col-md-3">
            <section class="panel">
                <div class="symbol bgcolor-dark-green"> <i class="fa fa-bar-chart"></i>
                </div>
                <div class="value tab-menu" bind="1">
                    <a href="javascript:;" data-url="user-info.html" data-parent="true" data-title="订单总数"> <i class="iconfont " data-icon=""></i>
                        <h1 id="orderCount"></h1>
                    </a>
                    <a href="javascript:;" data-url="user-info.html" data-parent="true" data-title="订单总数"> <i class="iconfont " data-icon=""></i><span>订单总数</span></a>
                </div>
            </section>
        </div>

        <div class="col-xs-6 col-sm-4 col-md-3">
            <section class="panel">
                <div class="symbol bgcolor-yellow-green"> <i class="fa fa-cubes"></i>
                </div>
                <div class="value tab-menu" bind="1">
                    <a href="javascript:;" data-url="user-info.html" data-parent="true" data-title="产品数"> <i class="iconfont " data-icon=""></i>
                        <h1 id="productCount"></h1>
                    </a>
                    <a href="javascript:;" data-url="user-info.html" data-parent="true" data-title="产品数"> <i class="iconfont " data-icon=""></i><span>产品数</span></a>
                </div>
            </section>
        </div>

    </div>
    <!--相关统计-->
    <div class="row">
        <div class="col-sm-6">
            <section class="panel">
                <div class="panel-heading">热销商品统计</div>
                <div class="panel-body">
                    <div class="echarts" id="area" style="height:300px; height:350px"></div>
                </div>
            </section>
        </div>
        <div class="col-sm-6">
            <section class="panel">
                <div class="panel-heading">一周统计</div>
                <div class="panel-body">
                    <div class="echarts" id="main" style="height:300px; height:350px"></div>
                </div>
            </section>
        </div>
        <div class="col-sm-6">
            <section class="panel">
                <div class="panel-heading">年度统计</div>
                <div class="panel-body">
                    <div class="echarts" id="years" style="height:300px; height:350px"></div>
                </div>
            </section>
        </div>
        <div class="col-sm-6">
            <section class="panel">
                <div class="panel-heading">产品统计</div>
                <div class="panel-body">
                    <div class="echarts" id="product" style="height:300px; height:350px"></div>
                </div>
            </section>
        </div>
    </div>

</div>

<script src="<%= basePath %>/statics/suffix/js/welcome.js"></script>
<script src="<%= basePath %>/statics/suffix/js/echarts.min.js"></script>
<script type="text/javascript">

    // 基于准备好的dom，初始化echarts实例

    console.log(document.getElementById('main'));
    var myChart0 = echarts.init(document.getElementById('main'));
    $(function () {
        $.ajax({
            type : "post",
            async : false, //同步执行
            url : "/LssgProduct/groupWeekProduct",
            data : {},
            dataType : "json", //返回数据形式为json
            success : function(result){
                console.log("result.countEntities0----->"+result.countEntities0);
                console.log("result.daytimes---->"+result.daytimes);
                console.log("result.names---->"+result.names);
                for(var i=0;i<result.countEntities0.length;i++){
                    console.log("result.countEntities0[i].name----->"+result.countEntities0[i].name);
                    console.log("result.countEntities0[i].data----->"+result.countEntities0[i].data);
                }
                // 指定图表的配置项和数据
                var option = {
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data:result.names
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    toolbox: {
                        feature: {
                            saveAsImage: {}
                        }
                    },
                    xAxis: {
                        type: 'category',
                        boundaryGap: false,
                        data: showTime(result.daytimes)
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: result.countEntities0
                };

                // 使用刚指定的配置项和数据显示图表。
                myChart0.clear();
                myChart0.setOption(option);

            },error : function (data){
                alert("数据请求失败");
                console.log(data.responseText);

            }
        })

    });
    //时间转换函数
    function showTime(tempDate)
    {
        var times = [];
        for(var i=0;i<tempDate.length;i++){
            var d = new Date(tempDate[i]);
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

            //var time = year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds;
            var time = year+"-"+month+"-"+day;
            times.push(time);
        }

        return times;
    }

</script>
<script type="text/javascript">
    // 指定图表的配置项和数据
    var myChart1 = echarts.init(document.getElementById('area'));
    $(function () {
        $.ajax({
            type : "post",
            async : false, //同步执行
            url : "/LssgProduct/groupCountProduct",
            dataType : "json", //返回数据形式为json
            success : function(result){
                // 指定图表的配置项和数据
                var option = {
                    title: {
                        text: 'Top10热销商品统计',
                        /*subtext: '纯属虚构',*/
                        x: 'center'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    legend: {
                        orient: 'vertical',
                        left: 'left',
                        data: result.categorys
                    },
                    series: [{
                        name: '热销商品数量',
                        type: 'pie',
                        radius: '55%',
                        center: ['50%', '60%'],
                        data: result.countEntities,
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }]
                };
                // 使用刚指定的配置项和数据显示图表。
                myChart1.setOption(option);
            },error : function (data){
                alert("数据请求失败");
                console.log(data.responseText);

            }
        })

    });
    // 指定图表的配置项和数据
    /*var option = {
        title: {
            text: '地区订单统计',
            subtext: '纯属虚构',
            x: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: ['广州', '佛山', '东莞', '中山', '深圳']
        },
        series: [{
            name: '地区会员数量',
            type: 'pie',
            radius: '55%',
            center: ['50%', '60%'],
            data: [
                { value: 6335, name: '广州' },
                { value: 4310, name: '佛山' },
                { value: 2310, name: '东莞' },
                { value: 3310, name: '中山' },
                { value: 9310, name: '深圳' }
            ],
            itemStyle: {
                emphasis: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }]
    };*/
    // 使用刚指定的配置项和数据显示图表。
    //myChart.setOption(option);
</script>

<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例


    var myChart = echarts.init(document.getElementById('years'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '年度订单统计',
            subtext: '纯属虚构',
            x: 'center'
        },
        color: ['#3398DB'],
        tooltip: {
            trigger: 'axis',
            axisPointer: { // 坐标轴指示器，坐标轴触发有效
                type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: [{
            type: 'category',
            data: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
            axisTick: {
                alignWithLabel: true
            }
        }],
        yAxis: [{
            type: 'value'
        }],
        series: [{
            name: '活跃度',
            type: 'bar',
            barWidth: '60%',
            data: [0, 0, 0, 0, 0, 27, 0, 0, 0, 0, 0, 0]
        }]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>

<script type="text/javascript">

  // 基于准备好的dom，初始化echarts实例
  var myChart = echarts.init(document.getElementById('product'));
      $(function () {
          $.ajax({
              type : "post",
              async : false, //同步执行
              url : "/LssgProduct/groupCount",
              data : {},
              dataType : "json", //返回数据形式为json
              success : function(result){
                 // console.log("result.countEntities----->"+result.countEntities);
                  //console.log("result.categorys---->"+result.categorys);
                  for(var i=0;i<result.countEntities.length;i++){
                     // console.log("result.countEntities[i].name----->"+result.countEntities[i].name);
                     // console.log("result.countEntities[i].value----->"+result.countEntities[i].value);
                  }
                  // 指定图表的配置项和数据
                  var option = {
                      title: {
                          text: '产品统计比例',
                         /* subtext: '纯属虚构',*/
                          x: 'center'
                      },
                      tooltip: {
                          trigger: 'item',
                          formatter: "{a} <br/>{b} : {c} ({d}%)"
                      },
                      legend: {
                          orient: 'vertical',
                          left: 'left',
                          data:result.categorys
                      },
                      series: [{
                          name: '访问来源',
                          type: 'pie',
                          radius: '55%',
                          center: ['50%', '60%'],
                          data: result.countEntities,
                          itemStyle: {
                              emphasis: {
                                  shadowBlur: 10,
                                  shadowOffsetX: 0,
                                  shadowColor: 'rgba(0, 0, 0, 0.5)'
                              }
                          }
                      }]
                  };
                  // 使用刚指定的配置项和数据显示图表。
                  myChart.setOption(option);
              },error : function (data){
                  alert("数据请求失败");
                  console.log(data.responseText);

              }
          })

      });

</script>

</body>

<script type="text/javascript">
    function getTime(){
        var myDate = new Date();
        var myYear = myDate.getFullYear(); //获取完整的年份(4位,1970-????)
        var myMonth = myDate.getMonth()+1; //获取当前月份(0-11,0代表1月)
        var myToday = myDate.getDate(); //获取当前日(1-31)
        var myDay = myDate.getDay(); //获取当前星期X(0-6,0代表星期天)
        var myHour = myDate.getHours(); //获取当前小时数(0-23)
        var myMinute = myDate.getMinutes(); //获取当前分钟数(0-59)
        var mySecond = myDate.getSeconds(); //获取当前秒数(0-59)
        var week = ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'];
        var nowTime;

        nowTime = myYear+'-'+fillZero(myMonth)+'-'+fillZero(myToday)+'&nbsp;&nbsp;'+fillZero(myHour)+':'+fillZero(myMinute)+':'+fillZero(mySecond)+'&nbsp;&nbsp;'+week[myDay]+'&nbsp;&nbsp;';
        //console.log(nowTime);
        $('#time').html(nowTime);
    };
    function fillZero(str){
        var realNum;
        if(str<10){
            realNum	= '0'+str;
        }else{
            realNum	= str;
        }
        return realNum;
    }
    setInterval(getTime,1000);
</script>
<script src="<%= basePath %>/statics/suffix/js/fontscroll.js"></script>
</html>
