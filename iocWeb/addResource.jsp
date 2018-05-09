<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>数据可视化管理平台</title>
<!-- Bootstrap core CSS -->
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="css/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css" />
<link href="css/css.css" rel="stylesheet" type="text/css">
<link href="gridly/stylesheets/jquery.gridly.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-3.1.0.min.js" type="text/javascript"></script>
<script src="js/common.js" type="text/javascript"></script>
<script type="text/javascript">
	function addResource() {
		var formobj = document.getElementById("dataform");
		var formdata = new FormData(formobj);
		var ajaxurl = '/Cm-pom/dispatcher/fileupload/doUpload';
		$.ajax({
			url : ajaxurl,
			type : 'POST',
			cache : false,
			data : formdata,
			processData : false,
			contentType : false,
			success : function(msg) {
				alert("资源添加成功！");
				window.location.reload();
			}
		})
	}
</script>
<script src="gridly/javascripts/jquery.gridly.js" type="text/javascript"></script>
<style type="text/css">
.gridly {
	position: relative;
	width: 960px;
}

.brick.small {
	width: 60px;
	height: 60px;
}

.brick.large {
	width: 140px;
	height: 110px;
}
</style>
</head>
<body>
	<div class="wapr">
		<%@ include file="top.jsp" %>
		<div class="mt15">
			<div style="width: 100%">
				<%@ include file="newleftPage.jsp"%>
				<div id="div2">
					<div class="m_position f18 bold">
						<div class="w2 pull-left">添加资源</div>
						<div style="clear: both;"></div>
					</div>
					<div class="mt10"
						style="padding-left: 20px; padding-top: 20px; background-color: white; height: 680px;">
						<form id="dataform" enctype="multipart/form-data"
							class="form-horizontal">
							<div class="form-group">
								<label class="col-sm-1 control-label">资源名称</label>
								<div class="col-sm-3">
							    <input id="ResourceName" name="ResourceName" type="text" class="form-control" placeholder="资源名称" />
								</div>
								<label class="col-sm-1 control-label">所属分类</label>
								<div class="col-sm-3">
								<input id="typeId" name="typeId" type="text" value="" class="form-control" placeholder="所属分类" />
								<input id="typeIdval" name="typeIdval" type="hidden" value=""/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-1 control-label">分类</label>
								<div id="addtypetree" class="col-sm-2"
									style="background-color: #39414A">
									<ul id="addtypelevel">
									</ul>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-1 control-label">上传文件</label>
								<div class="col-sm-3">
								<input id="file" type="file" name="file" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-1 control-label">网页链接</label>
								<div class="col-sm-3">
								<input type="text" name="linkAddress" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-1 control-label">默认宽度</label>
								<div class="col-sm-3">
								<input type="text" name="linkAddress" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-1 control-label">默认高度</label>
								<div class="col-sm-3">
								<input type="text" name="linkAddress" class="form-control" />
								</div>
							</div>
							<div style="padding-left: 15px;">
								<button class="btn btn-primary" type="button"
									onclick="addResource()">添加资源</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script language="javascript" type="text/javascript">
		var div2Width;
		window.onload = function() {
			div2Width = document.getElementById("div2")
			div2Width.style.width = (document.body.clientWidth - 230) + "px"
		}
		window.onresize = function() {
			div2Width.style.width = (document.body.clientWidth - 230) + "px"
		}
	</script>
	<script src="js/index.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

