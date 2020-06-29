<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	pageContext.setAttribute("basePath", basePath);
%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${basePath}/lib/html5shiv.js"></script>
<script type="text/javascript" src="${basePath}/lib/respond.min.js"></script>

<![endif]-->
<link rel="stylesheet" type="text/css" href="${basePath}/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${basePath}/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${basePath}/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${basePath}/static/h-ui.admin/css/style.css" />
<link rel="stylesheet" href="${basePath}/lib/layui/css/layui.css" media="all">
<!--[if IE 6]>
<script type="text/javascript" src="${basePath}/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>评论修改</title>
</head>
<body>
<div class="page-container">
	<form action="${basePath}/sys/comment/updatecomment.action" method="post" class="form form-horizontal">

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">评论内容：</label>
			<div class="formControls col-xs-12 col-sm-12">
				<textarea name="content" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入2个字符" required><s:property value="#comment.content" /></textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/255</p>
			</div>
		</div>
		<input type="hidden" name="id" value="<s:property value="#comment.id" />" />
		<div class="row cl">
			<div class="col-4 col-offset-8">
				<input id="button" class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
	</form>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${basePath}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${basePath}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${basePath}/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${basePath}/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script src="${basePath}/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
	//文本域字符统计
    $(".textarea").Huitextarealength({
        minlength:2,
        maxlength:255
    });
</script>
</body>
</html>