<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	pageContext.setAttribute("basePath", basePath);
%>

<!--_meta 作为公共模版分离出去-->
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
<link rel="stylesheet" type="text/css" href="${basePath}/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${basePath}/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="${basePath}/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>新增房间</title>
</head>
<body>
<article class="page-container">
	<form action="${basePath}/sys/room/saveroom.action" method="post" class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>房间名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="<s:property value="#room.roomName" />" placeholder="" name="roomName" required>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">房间电话：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="<s:property value="#room.roomPhone" />" placeholder="" name="roomPhone" required>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>房间类型：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select id="roomtype" name="roomTypeId" class="select">
				</select>
				</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">房价：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="number" class="input-text" min="0.00" step="0.01" value="<s:property value="#room.roomPrice" />" placeholder="" name="roomPrice" required>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>房间可用：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select id="roomable" name="roomAble" class="select">
					<option value="1">可用</option>
					<option value="0">不可用</option>
				</select>
				</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">备注：</label>
			<div class="formControls col-xs-6 col-sm-6">
				<textarea name="notes" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入2个字符" required><s:property value="#room.notes" /></textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/255</p>
			</div>
		</div>
		<input type="hidden" name="id" value="<s:property value="#room.id" />" />
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 保存</button>
				<button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${basePath}/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${basePath}/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${basePath}/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${basePath}/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript">
    $(".textarea").Huitextarealength({
        minlength:2,
        maxlength:255
    });

    $(function(){
        var roomtype = $("#roomtype");
        $.ajax({
            type: "post",//请求方式
            url: "${basePath}/sys/room/getroomtypelist.action",//地址，就是json文件的请求路径
            dataType: "json",//数据类型可以为 text xml json  script  jsonp
            success: function(jsondata){//返回的参数就是 action里面所有的有get和set方法的参数
				data = jsondata.data;
                for(var i=0;i<data.length;i++){
                    $("<option value='" + data[i].id + "'>" + data[i].roomTypeName + "</option>").appendTo(roomtype)//动态添加Option子项
                }
                $("#roomable").val("<s:property value="#room.roomAble" />");
                $("#roomtype").val("<s:property value="typeid" />");
            }
        });
    });
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>