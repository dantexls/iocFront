<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<title>城市智慧中心</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/AdminLTE.css">
<link rel="stylesheet" type="text/css"
	href="css/jquery.mCustomScrollbar.min.css" />
<!-- 自定义样式 -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/ui.fancytree.css">
<script src="js/jQuery-2.1.4.min.js" type="text/javascript"></script>
<script src="js/jquery-ui.custom.js" type="text/javascript"></script>
<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/sample.js" type="text/javascript"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"
	type="text/javascript"></script>
<script src="js/app.min.js" type="text/javascript"></script>
<script src="js/jquery.fancytree.js" type="text/javascript"></script>
<script src="js/newcommon.js" type="text/javascript"></script>
</head>
<body class="bodyBox" scroll="no">
	<div class="wrapper">
		<header class="main-header">
			<a href="#" class="logo"></a>
			<nav class="navbar navbar-static-top" role="navigation">
				<div class="tools">
					<ul class="ul01">
						<!-- 
                    <li>
                        <a href="#">
                            <span></span>
                            <i>图片</i>
                        </a>
                        <ul class="ul02">
                            <li>
                                <a href="#">
                                    <span></span>
                                    <i>图片</i>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span></span>
                                    <i>图片</i>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span></span>
                                    <i>图片</i>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">
                            <span class="span01"></span>
                            <i>视频</i>
                        </a>
                        <ul class="ul02">
                            <li>
                                <a href="#">
                                    <span></span>
                                    <i>图片</i>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span></span>
                                    <i>图片</i>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span></span>
                                    <i>图片</i>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">
                            <span class="span02"></span>
                            <i>Web页面</i>
                        </a>
                    </li> -->
						<li><a href="#"> <span class="span03"></span> <i>地图</i>
						</a></li>
						<li><a href="#"> <span class="span04"></span> <i>常规图标</i>
						</a></li>
						<li><a href="#"> <span class="span05"></span> <i>指标</i>
						</a></li>
						<li><a href="#"> <span class="span06"></span> <i>文字</i>
						</a></li>
						<li><a href="#"> <span class="span07"></span> <i>辅助图形</i>
						</a></li>
					</ul>
				</div>
				<div class="navbar-custom-menu">
					<div class="search">
						<span></span> <input type="text" placeholder="搜索" />
					</div>
				</div>
			</nav>
		</header>
		<aside class="main-sidebar" style="background: #20335D;">
			<section class="sidebar">
				<ul class="sidebar-menu" id="subnav">
					<li class="treeview active"><a href="#"> <i class="icon_i"></i>
							<span>模板</span> <i class="fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<!-- 子导航 -->
							<li class="active"><a class="item"
								href="publicSense.jsp?scenesId=8a90e5a05d4f5271015d4fb5e694001c"
								target="_blank"> <i class="fa-circle-o"></i>-&nbsp;&nbsp;模版一
							</a></li>
							<li><a class="item"
								href="publicSense.jsp?scenesId=8a90e5a05d4f5271015d4fbf6a6e0025"
								target="_blank"> <i class="fa fa-circle-o"></i>-&nbsp;&nbsp;模版二
							</a></li>
							<li><a class="item"
								href="publicSense.jsp?scenesId=8a90e5a05d4f5271015d4fc6cd49002c"
								target="_blank"> <i class="fa fa-circle-o"></i>-&nbsp;&nbsp;模板三
							</a></li>

							<!-- /子导航 -->
						</ul></li>
					<li class="treeview"><a href="#"> <i
							class="icon_i icon_i01"></i> <span>智库场景</span> <i
							class="fa-angle-left pull-right"></i>
					</a>

						<div id="tree" class="treeview-menu">
							<ul id="level_1"></ul>
						</div> <!-- <ul class="treeview-menu">
                        <li class="item">
                            <a class="item">
                                <i class="fa-circle-o"></i>-&nbsp;&nbsp;交通</a>
                        </li>
                        <li>
                            <a class="item">
                                <i class="fa fa-circle-o"></i>-&nbsp;&nbsp;安防
                            </a>
                        </li>
                        <li>
                            <a class="item">
                                <i class="fa fa-circle-o"></i>-&nbsp;&nbsp;城管
                            </a>
                        </li>
                    </ul> --></li>
					<li class="treeview"><a href="#"> <i
							class="icon_i icon_i02"></i> <span>业务库</span> <i
							class="fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<!-- 子导航 -->
							<li class="item"><a class="item"
								href="editSceneTemplate.jsp"> <i class="fa-circle-o"></i>-&nbsp;&nbsp;城管管控中心
							</a></li>
							<li><a class="item"> <i class="fa fa-circle-o"></i>-&nbsp;&nbsp;城市体征管控中心
							</a></li>
							<li><a class="item"> <i class="fa fa-circle-o"></i>-&nbsp;&nbsp;园区管控中心
							</a></li>
							<!-- /子导航 -->
						</ul></li>
					<li class="treeview"><a href="#"> <i
							class="icon_i icon_i03"></i> <span>页面资源</span> <i
							class="fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu" id="webDiv">
							<!-- 子导航 -->
							<li class="item"><a class="item" href="javascript:void(0)"
								onclick="createWeb()"> <i class="fa-circle-o"></i>-&nbsp;&nbsp;添加Web页面资源
							</a></li>
							<li><a class="item" href="addResource.jsp"> <i
									class="fa fa-circle-o"></i>-&nbsp;&nbsp;添加页面资源
							</a></li>
							<li><a class="item"> <i class="fa fa-circle-o"></i>-&nbsp;&nbsp;ofoGIS
							</a></li>
							<!-- /子导航 -->
						</ul></li>
					<li class="treeview"><a href="#"> <i
							class="icon_i icon_i04"></i> <span>Agent代理</span> <i
							class="fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu" id="agentDiv">
							<!-- 子导航 -->
							<li class="item"><a class="item" href="javascript:void(0)"
								onclick="createAgent()"> <i class="fa-circle-o"></i>-&nbsp;&nbsp;添加Agent
							</a></li>
							<li><a class="item"> <i class="fa fa-circle-o"></i>-&nbsp;&nbsp;agent资源1
							</a></li>

							<!-- /子导航 -->
						</ul></li>
					<li class="treeview"><a href="#"> <i
							class="icon_i icon_i05"></i> <span>常规图表</span> <i
							class="fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<!-- 子导航 -->
							<li class="item"><a class="item" href="javascript:void(0)"
								onclick="reportinit('pillar')"> <i class="fa-circle-o"></i>-&nbsp;&nbsp;基本柱图
							</a></li>
							<li><a class="item" href="javascript:void(0)"
								onclick="reportinit('cake')"> <i class="fa fa-circle-o"></i>-&nbsp;&nbsp;基本饼图
							</a></li>
							<li><a class="item" href="javascript:void(0)"
								onclick="reportinit('line')"> <i class="fa fa-circle-o"></i>-&nbsp;&nbsp;基本折线图
							</a></li>

							<!-- /子导航 -->
						</ul></li>
					<li class="treeview"><a href="#"> <i
							class="icon_i icon_i06"></i> <span>图片</span> <i
							class="fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<!-- 子导航 -->
							<li class="item"><a class="item"> <i class="fa-circle-o"></i>-&nbsp;&nbsp;图片1
							</a></li>
							<li><a class="item"> <i class="fa fa-circle-o"></i>-&nbsp;&nbsp;图片2
							</a></li>
							<li><a class="item"> <i class="fa fa-circle-o"></i>-&nbsp;&nbsp;图片3
							</a></li>

							<!-- /子导航 -->
						</ul></li>

				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>
		<div class="content-wrapper">
			<section class="content">
				<div class="col-md-12 contentBox">
					<div class="assortment">
						<ul>
							<li><a href="categoryAdd.jsp"> <span></span> <i>场景分类添加</i>
							</a></li>
							<li><a href="categoryTypeAdd.jsp"> <span
									class="spanimg1"></span> <i>资源分类添加</i>
							</a></li>
							<li><a href="addResource.jsp"> <span class="spanimg2"></span>
									<i>资源添加</i>
							</a></li>
						</ul>
					</div>
					<div>
						<div class="addBox">
							<div class="plus_li">
								<a href="createTemplate.jsp"> <span><img
										src="images/index/plus.png" alt="" /></span> <i>新建可视化</i>
								</a>
							</div>
							<!-- <div class="plus_li">
                            <a href="#">
                                <span><img src="images/index/plus.png" alt=""/></span>
                                <i>新建可视化</i>
                            </a>
                        </div> -->
							<div class="moduleList"
								style="margin-left: -25px; height: 230px; width: 196px;">
								<ul>
									<li><img src="images/index/img1.png" alt="" />
										<p class="edit">
											<a href="#"></a>test1
										</p>
										<p class="tool_P">
											<a href="#"><span></span><i>复制</i></a> <a href="#"><span
												class="span1"></span><i>预览</i></a> <a href="#"><span
												class="span2"></span><i>发布</i></a>
										</p></li>
								</ul>
							</div>
						</div>
						<div class="moduleList">
							<ul>
								<li><img src="images/index/img1.png" alt="" />
									<p class="edit">
										<a href="#"></a>test1
									</p>
									<p class="tool_P">
										<a href="#"><span></span><i>复制</i></a> <a href="#"><span
											class="span1"></span><i>预览</i></a> <a href="#"><span
											class="span2"></span><i>发布</i></a>
									</p></li>
								<li><img src="images/index/img1.png" alt="" />
									<p class="edit">
										<a href="#"></a>test1
									</p>
									<p class="tool_P">
										<a href="#"><span></span><i>复制</i></a> <a href="#"><span
											class="span1"></span><i>预览</i></a> <a href="#"><span
											class="span2"></span><i>发布</i></a>
									</p></li>
								<li><img src="images/index/img1.png" alt="" />
									<p class="edit">
										<a href="#"></a>test1
									</p>
									<p class="tool_P">
										<a href="#"><span></span><i>复制</i></a> <a href="#"><span
											class="span1"></span><i>预览</i></a> <a href="#"><span
											class="span2"></span><i>发布</i></a>
									</p></li>
								<li><img src="images/index/img1.png" alt="" />
									<p class="edit">
										<a href="#"></a>test1
									</p>
									<p class="tool_P">
										<a href="#"><span></span><i>复制</i></a> <a href="#"><span
											class="span1"></span><i>预览</i></a> <a href="#"><span
											class="span2"></span><i>发布</i></a>
									</p></li>
							</ul>
							<ul>
								<li><img src="images/index/img1.png" alt="" />
									<p class="edit">
										<a href="#"></a>test1
									</p>
									<p class="tool_P">
										<a href="#"><span></span><i>复制</i></a> <a href="#"><span
											class="span1"></span><i>预览</i></a> <a href="#"><span
											class="span2"></span><i>发布</i></a>
									</p></li>
								<li><img src="images/index/img1.png" alt="" />
									<p class="edit">
										<a href="#"></a>test1
									</p>
									<p class="tool_P">
										<a href="#"><span></span><i>复制</i></a> <a href="#"><span
											class="span1"></span><i>预览</i></a> <a href="#"><span
											class="span2"></span><i>发布</i></a>
									</p></li>
								<li><img src="images/index/img1.png" alt="" />
									<p class="edit">
										<a href="#"></a>test1
									</p>
									<p class="tool_P">
										<a href="#"><span></span><i>复制</i></a> <a href="#"><span
											class="span1"></span><i>预览</i></a> <a href="#"><span
											class="span2"></span><i>发布</i></a>
									</p></li>
								<li><img src="images/index/img1.png" alt="" />
									<p class="edit">
										<a href="#"></a>test1
									</p>
									<p class="tool_P">
										<a href="#"><span></span><i>复制</i></a> <a href="#"><span
											class="span1"></span><i>预览</i></a> <a href="#"><span
											class="span2"></span><i>发布</i></a>
									</p></li>
							</ul>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<footer class="main-footer1">
		<div>Copyright © 2002-2017 isoftstone. All rights reserved.</div>
	</footer>

	<script>
		(function($) {
			$(window).load(function() {
				$(".main-sidebar").mCustomScrollbar({
					axis : "y",
					theme : "dark-3"
				});
			});
		})(jQuery);

		$(document).ready(function() {

		})
		//设置top menu的显示
		setTopMenu();
		
		//alert(document.documentElement.clientHeight);
		function setBrowserHeight(){
			var clientHeight = document.documentElement.clientHeight-1;
			var footerHeight = $(".main-footer1").css("height");
			var wrapperHeight = clientHeight - parseInt(footerHeight);
			$(".wrapper").css("height", wrapperHeight);
		}
		
		setBrowserHeight();
	</script>
</body>
</html>