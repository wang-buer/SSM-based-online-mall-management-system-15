<%--
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/8
  Time: 11:40
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
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>在线商城|相关问题</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->


    <!-- CSS
    ========================= -->
    <!--bootstrap min css-->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/bootstrap.min.css">
    <!--owl carousel min css-->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/owl.carousel.min.css">
    <!--slick min css-->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/slick.css">
    <!--magnific popup min css-->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/magnific-popup.css">
    <!--font awesome css-->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/font.awesome.css">
    <!--ionicons css-->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/ionicons.min.css">
    <!--linearicons css-->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/linearicons.css">
    <!--animate css-->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/animate.css">
    <!--jquery ui min css-->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/jquery-ui.min.css">
    <!--slinky menu css-->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/slinky.menu.css">
    <!--plugins css-->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/plugins.css">

    <!-- Main Style CSS -->
    <link rel="stylesheet" href="<%= basePath %>/statics/prefix/assets/css/style.css">

    <!--modernizr min js here-->
    <script src="<%= basePath %>/statics/prefix/assets/js/vendor/modernizr-3.7.1.min.js"></script>

</head>

<body>


<jsp:include page="/beforePage/toHead"/>

<!--breadcrumbs area start-->
<div class="breadcrumbs_area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb_content">
                    <ul>
                        <li><a href="<%= basePath %>/beforePage/toIndex">首页</a></li>
                        <li>频繁的问题</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--breadcrumbs area end-->

<!--faq area start-->
<div class="faq_content_area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="faq_content_wrapper">
                    <h4>以下是一些蔬菜水果的常见问题，你可以在此找到答案</h4>
                    <p>蔬菜的选购问题，蔬菜的放置问题，蔬菜的保存问题，常见水果小知识</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Accordion area-->
<div class="accordion_area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div id="accordion" class="card__accordion">
                    <div class="card card_dipult">
                        <div class="card-header card_accor" id="headingOne">
                            <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                蔬菜选购

                                <i class="fa fa-plus"></i>
                                <i class="fa fa-minus"></i>

                            </button>

                        </div>

                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                            <div class="card-body">
                                <p>看颜色：蔬菜品种繁多，营养价值各有千秋。总体上可以按照颜色分为两大类：深绿色叶菜，如菠菜、苋菜等；这些蔬菜富含胡萝卜素、维生素C、维生素B2和多种矿物质；浅色蔬菜，如大白菜、生菜等，这些蔬菜有的富含维生素C，胡萝卜素和矿物质的含量较低。有的蔬菜颜色不正常，要提高注意，如菜叶失去平常的绿色而呈墨绿色，毛豆碧绿异常等，它们在采收前可能喷洒或浸泡过甲胺磷农药，不宜选购。</p>
                                <p>看形状：形状正常的蔬菜，一般是常规栽培、未用激素等化学品处理过的，可以放心地食用。“异常”蔬菜则可能用激素处理过，如韭菜，当它的叶子特别宽大肥厚，比一般宽叶韭菜还要宽1倍时，就可能在栽培过程中用过激素。未用过激素的韭菜叶较窄，吃时香味浓郁。</p>
                                <p>看鲜度：许多消费者认为，蔬菜叶子虫洞较多，表明没打过药，吃这种菜安全。其实，这是靠不住的。蔬菜是否容易遭受虫害是由蔬菜的不同成分和气味的特异性决定的。有的蔬菜特别为害虫所青睐，出名的有青菜、大白菜、卷心菜、花菜等。不得不经常喷药防治，势必成为污染重的“多药蔬菜”。各种蔬菜施用化肥的量也不一样。氮肥（如尿素、硫酸铵等）的施用量过大，会造成蔬菜的硝酸盐污染比较严重。通过市场上蔬菜抽检后发现，硝酸盐含量由强到弱的排列是：根菜类、薯芋类、绿叶菜类、白菜类、葱蒜类、豆类、瓜类、茄果类、食用菌类。其规律是蔬菜的根、茎、叶的污染程度远远高于花、果、种子。这个规律可以指导我们正确消费蔬菜，尽可能多吃些瓜、果、豆和食用菌，如黄瓜、番茄、毛豆、香菇等。</p>
                            </div>
                        </div>
                    </div>
                    <div class="card  card_dipult">
                        <div class="card-header card_accor" id="headingTwo">
                            <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                蔬菜放置
                                <i class="fa fa-plus"></i>
                                <i class="fa fa-minus"></i>

                            </button>
                        </div>
                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                            <div class="card-body">
                                <p>有花蕾、茎尖的茎类蔬菜竖放。</p>
                                <p>一些具有花蕾、茎尖的茎类蔬菜，例如菜心、芥蓝、芦笋、大葱等，在采收后会继续生长、开花。这类蔬菜的生长方向垂直于地面，因此采收后如果平放保存5~7天，蔬菜顶部会逐渐弯曲，影响蔬菜的外观。如果竖放就没有这个问题。</p>
                                <p>结球叶菜如大白菜、结球甘蓝、结球莴苣和包心芥菜等。结球类蔬菜发生腐败均从内开始，轻微的腐败肉眼无法察觉。将结球叶菜倒置或者横着放，让根部不接触地面，外面一层叶子耐寒、耐碰，能起保护菜心的作用，吃的时候将外层变黄的叶子撕掉即可。</p>
                                <p>有些菜要特殊放。蒜黄可用鲜大白菜的叶片将其包起来，竖放在阴凉处，不沾水，可保鲜数天。</p>
                                <p>马铃薯与苹果摆在一起，放在阴凉的地方保存，苹果会释放一种使其他蔬果老化的乙烯气体，可以抑制马铃薯发芽。</p>
                                <p>芋头保存时先去除泥土，将芋头擦干后用干报纸包起来，再放在阴凉通风的地方。</p>
                                <p>老姜不适合冷藏保存，因为它本身已纤维化，容易使水分流失。可放在潮而不湿的细沙里保存。</p>
                                <p>鲜藕保存时把泥土洗掉，放入盆里，加满清水，把藕浸没，一两天换次凉水。</p>
                            </div>
                        </div>
                    </div>
                    <div class="card  card_dipult">
                        <div class="card-header card_accor" id="headingThree">
                            <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                蔬菜保存
                                <i class="fa fa-plus"></i>
                                <i class="fa fa-minus"></i>
                            </button>
                        </div>
                        <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                            <div class="card-body">
                                <p>蔬菜买回来适合竖着放而不是平放，竖着放的蔬菜生命力强，叶绿素、含水量、维生素等比平放保存得更好。蔬菜也不宜切开存放，蔬菜切开后，营养素会快速流失，还会容易氧化，同时增加了微生物入侵的机会，容易造成变质腐烂。</p>
                                <p>把不同蔬菜存放在冰箱内，这种做法不妥。因每种蔬菜对于温度、湿度要求不同。如黄瓜、苦瓜、豇豆、南瓜等喜湿蔬菜，适宜存放在10℃左右的环境中，但不能低于8℃；绝大部分叶菜喜凉，适宜存放在0℃至5℃环境中，但不能低于0℃。蔬菜适宜存放的湿度为85%左右。存放蔬菜时，可选择较薄的保鲜袋，将新鲜完好的蔬菜放入保鲜袋，并用针在袋上扎6个小洞，然后将塑料袋封口。在冰箱内用适宜的温度存放。一定要记住买来的菜要装进无毒无害（一般非聚氯乙烯）的食品袋。</p>
                            </div>
                        </div>
                    </div>
                    <div class="card  card_dipult">
                        <div class="card-header card_accor" id="headingfour">
                            <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseeight" aria-expanded="false" aria-controls="collapseeight">
                                绝招
                                <i class="fa fa-plus"></i>
                                <i class="fa fa-minus"></i>
                            </button>
                        </div>
                        <div id="collapseeight" class="collapse" aria-labelledby="headingfour" data-parent="#accordion">
                            <div class="card-body">
                                <P>去皮：蔬菜表面有蜡质，很容易吸附农药。因此，对能去皮的蔬菜，应先去皮后再食用。</P>
                                <P>水洗：一般蔬菜先用清水至少冲洗3～6遍，然后泡入淡盐水中再冲洗一遍。对包心类蔬菜，可先切开，放在清水中浸泡1～2小时，再用清水冲洗，以清除残附的农药。</P>
                                <P>碱洗：先在水中放上一小勺碱粉（无水碳酸纳）或冰碱（结晶碳酸钠）搅匀后再放入蔬菜。浸泡5～6分钟，把碱水倒出去，接着用清水漂洗干净。如没有碱粉或冰碱，可用小苏打代替，但适当延长浸泡时间，一般需15分钟左右。</P>
                                <P>用开水烫：对有些残留农药的最好清除方法是烫，如青椒、菜花、豆角、芹菜等，在下锅炒或烧前最好先用开水烫一下，据试验，可清除90%以上的残留农药。</P>
                                <P>阳光晒：利用阳光中多光谱效应，会使蔬菜中部分残留农药被分解、破坏。这样经日光照射晒干后的蔬菜，农药残留较少。据测定，鲜菜、水果在阳光下照射5分钟，有机氯、有机汞农药的残留量损失达60%。对于方便贮藏的蔬菜，最好先放置一段时间，空气中的氧与蔬菜中的色酶对残留农药有一定的分解作用。购买蔬菜后，在室温下放24个小时左右，残留化学农药平均消失率为5%。</P>
                                <P>用盐清洗：种植蔬菜的的过程中常常使用化学农药和肥料，为了消除蔬菜表皮残留农药，使用1%～3%的淡盐水洗涤蔬菜可以取得良好的效果，另外，秋季收割的蔬菜，往往在菜根部位或者菜叶背面的纹里躲藏着各种小虫，用淡水洗菜，可以轻松地将其除去。</P>
                                <P>瓜菜不宜先切后洗：有的人清洗瓜菜时喜欢先切后洗。这不对。因为瓜菜含有多种维生素和无机盐，先切后洗，这些维生素就会通过瓜菜上的切口溶于水中而损失。所以，瓜菜应当先洗后切。</P>
                                <P>此外，用淘米水洗菜能除去残留在蔬菜上的部分农药。我国目前大多用甲胺磷、辛硫磷、敌敌畏、乐果等有机磷农药杀虫，这些农药一遇酸性物质就会失去毒性。在淘米水中浸泡10分钟左右，用清水冲洗干净，就能使蔬菜残留的农药成分减少。</P>
                            </div>
                        </div>
                    </div>
                    <div class="card  card_dipult">
                        <div class="card-header card_accor" id="headingfive">
                            <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseseven" aria-expanded="false" aria-controls="collapseseven">
                                水果选购
                                <i class="fa fa-plus"></i>
                                <i class="fa fa-minus"></i>
                            </button>
                        </div>
                        <div id="collapseseven" class="collapse" aria-labelledby="headingfive" data-parent="#accordion">
                            <div class="card-body">
                                <p>1、大小：苹果、梨、桃等的个头分大、中、小型，果大说明发育正常，能体现出该品种的风味。反之，果型越小风味越差。但果子太大，肉质较松，不易贮存。另外，有些水果的品种本身就属小型，如京白梨、南丰蜜桔、无核白葡萄等个头虽小，风味甚佳。所以还应凭经验。</p>

                                    <p>2、颜色：水果成熟与否，颜色是重要标志。如桔柑，成熟后一般底色发黄，呈橙红或鲜红色。不成熟的则是全绿色或半绿色，这样的桔柑风味差。香蕉皮色青绿则说明还不太熟，而香蕉皮上呈黑点，则表明熟过头了。黄香蕉苹果、鸭梨呈金黄色时口感最好。但有些品种，如绿化三号桃、青香蕉和印度苹果，本身就是以绿色为主，则属例外。</p>

                                    <p>3、看水果表面：这是观察果实品质最直观的方法。颜色鲜艳、外型端正、细腻光滑、富有光泽的水果，一般质量较好。有些水果表面虽有果锈，但对质量无影响。果面有压伤、磕伤者不宜久存。</P>

                                    <P>4、闻香气：多数成熟的果品有较浓郁的芳香，这是果实中含挥发油的原因。毫无香气说明水果不太成熟。</p>
                            </div>
                        </div>
                    </div>

                    <div class="card  card_dipult">
                        <div class="card-header card_accor" id="headingsix">
                            <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapsefour" aria-expanded="false" aria-controls="collapsefour">
                                营养价值
                                <i class="fa fa-plus"></i>
                                <i class="fa fa-minus"></i>
                            </button>
                        </div>
                        <div id="collapsefour" class="collapse" aria-labelledby="headingsix" data-parent="#accordion">
                            <div class="card-body">
                                <p>1、降血压的水果：山楂、西瓜、梨、菠萝。</p>
                                <p>2、在各种维生素中，叶酸与dna的生成有关，怀孕初期，叶酸对细胞繁殖与修复很重要，它帮助胚胎神经系统的良好发育，预防孕妇贫血。含有叶酸的水果：苹果、香蕉、芒果、木瓜、猕猴桃。</p>
                                <p>3、减缓衰老：在常见的水果中，猕猴桃被认为是最接近完善的水果，它含有在丰富的维生素c、a、e，叶酸和微量元素钾、镁及食物纤维等营养成分，而热量却很低。这都使猕猴桃能为工作奏快、精神紧张的现代都市人注入生命的活力。另外，猕猴桃中所含的氨基酸，能帮助人体制造激素，减缓衰老。</p>
                                <p>4、减肥瘦身：有些水果中含有丰富的食物纤维，纤维是不能为小肠所消化的碳水化合物，在结肠内，纤维可提供给肠腔营养物质，这有助于促进身体的新陈代谢以及帮助抑制食欲。</p>
                                <p>5、保养皮肤：人体的面部天天暴露在外，受空气中有害物质的损伤和紫外线的照射，以至毛细血管收缩，皮脂腺分泌减少，皮肤变得干燥、脱水。水果中含丰富的抗氧化物质维生素e和微量元素，可以滋养皮肤，其美容效果可不是一般的化妆品可比的。而且如果你吸烟或发胖，那也暗示你体内脂肪组织缺乏这些重要成分。</p>
                                <p>6、癌症的天敌：平时饮食中多摄入水果，可降低患乳腺癌，前列腺癌和肺癌的几率。这是因为水果中含有人体所必需的微量元素。</p>
                            </div>
                        </div>
                    </div>
                    <div class="card  card_dipult">
                        <div class="card-header card_accor" id="headingseven">
                            <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapsefive" aria-expanded="false" aria-controls="collapsefive">
                                食用禁忌
                                <i class="fa fa-plus"></i>
                                <i class="fa fa-minus"></i>
                            </button>
                        </div>
                        <div id="collapsefive" class="collapse" aria-labelledby="headingseven" data-parent="#accordion">
                            <div class="card-body">
                                <p>1、吃水果忌不漱口：有些水果含有多种发酵糖类物质，对牙齿有较强的腐蚀性，食用后若不漱口，口腔中的水果残渣易造成龋齿。</p>
                                <p>2、忌食水果过多：过量食用水果，会使人体缺铜，从而导致血液中胆固醇增高，引起冠心病，因此不宜在短时间内进食水果过多。</p>
                                <p>3、吃水果忌不卫生：食用开始腐烂的水果，以及无防尘、防蝇设备又没彻底洗净消毒的果品，如草莓、桑椹、剖片的西瓜等，容易发生痢疾、伤寒、急性胃肠炎等消化道传染病。</p>
                                <p>4、水果忌用酒精消毒：酒精虽能杀死水果表层细菌，但会引起水果色、香、味的改变，酒精和水果中的酸作用，会降低水果的营养价值。</p>
                                <p>5、生吃水果忌不削皮：一些人认为，果皮中维生素含量比果肉高，因而食用水果时连皮一起吃。殊不知，水果发生病虫害时，往往用农药喷杀，农药会浸透并残留在果皮蜡质中，因而果皮中的农药残留量比果肉中高得多。</p>
                                <p>6、忌用菜刀削水果：因菜刀常接触肉、鱼、蔬菜，会把寄生虫或寄生虫卵带到水果上，使人感染寄生虫病。尤其是菜刀上的锈和苹果所含的鞣酸会起化学反应，使苹果的色、香、味变差。</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Accordion area end-->
<!--faq area end-->


<jsp:include page="/beforePage/toFoot"/>

<!-- JS
============================================ -->
<!--jquery min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/vendor/jquery-3.4.1.min.js"></script>
<!--popper min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/popper.js"></script>
<!--bootstrap min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/bootstrap.min.js"></script>
<!--owl carousel min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/owl.carousel.min.js"></script>
<!--slick min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/slick.min.js"></script>
<!--magnific popup min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/jquery.magnific-popup.min.js"></script>
<!--counterup min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/jquery.counterup.min.js"></script>
<!--jquery countdown min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/jquery.countdown.js"></script>
<!--jquery ui min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/jquery.ui.js"></script>
<!--jquery elevatezoom min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/jquery.elevatezoom.js"></script>
<!--isotope packaged min js-->
<script src="<%= basePath %>/statics/prefix/assets/js/isotope.pkgd.min.js"></script>
<!--slinky menu js-->
<script src="<%= basePath %>/statics/prefix/assets/js/slinky.menu.js"></script>
<!-- Plugins JS -->
<script src="<%= basePath %>/statics/prefix/assets/js/plugins.js"></script>

<!-- Main JS -->
<script src="<%= basePath %>/statics/prefix/assets/js/main.js"></script>
<script src="<%= basePath %>/statics/prefix/assets/js/head.js"></script>


</body>

</html>
