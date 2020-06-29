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
<link rel="stylesheet" type="text/css" href="${basePath}/lib/layui/css/layui.css" media="all" />
<!--[if IE 6]>
<script type="text/javascript" src="${basePath}/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>到店入住</title>
</head>
<body>
<article class="page-container">
	<form action="${basePath}/sys/checkin/addbookingcheckin.action" method="post" class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>该房型可选房间：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select id="room" name="roomid" class="select">
				</select>
				</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">房卡号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" name="accesscardID" required>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">备注：</label>
			<div class="formControls col-xs-6 col-sm-6">
				<textarea name="notes" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入2个字符" required></textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/255</p>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<a onclick="addcustomer();" class="btn btn-primary-outline radius" >增加顾客</a>
				<a onclick="deletecustomer();" class="btn btn-danger-outline radius" >删除</a>
			</div>
		</div>
		<div class="row cl">
			<div class="formControls col-xs-10 col-xs-offset-1">
				<div class="Huialert Huialert-info"><i class="Hui-iconfont">&#xe6a6;</i>入住顾客信息，请如实填写</div>
				<table id="customertable" class="layui-table">
					<colgroup>
						<col width="10%">
						<col width="10%">
						<col width="15%">
						<col width="35%">
						<col>
					</colgroup>
					<thead>
					<tr>
						<th>姓名</th>
						<th>性别</th>
						<th>手机</th>
						<th>身份证</th>
						<th>地址</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td><input type="text" class="input-text" value="" placeholder="姓名" name="customerName" required></td>
						<td><select name="customerSex">
							<option value ="男">男</option>
							<option value ="女">女</option>
						</select></td>
						<td><input type="text" class="input-text" value="" placeholder="手机" name="customerPhone" required></td>
						<td><input type="text" class="input-text" value="" placeholder="身份证" name="customerCard" required></td>
						<td><input type="text" class="input-text" value="" placeholder="地址" name="customerAddress" required></td>
					</tr>
					</tbody>
				</table>
			</div>
		</div>
		<input type="hidden" name="vipphone" value="<s:property value="#vipphone" />" />
		<input type="hidden" name="bookingid" value="<s:property value="#bookingid" />" />
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 入住</button>
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
        var room = $("#room");
        $.ajax({
            type: "post",//请求方式
            url: '${basePath}/sys/room/getonetyperooms.action?roomTypeId=<s:property value="#roomTypeId" />',//地址，就是json文件的请求路径
            dataType: "json",//数据类型可以为 text xml json  script  jsonp
            success: function(jsondata){//返回的参数就是 action里面所有的有get和set方法的参数
                data = jsondata.data;
                for(var i=0;i<data.length;i++){
                    $("<option value='" + data[i].id + "'>" + data[i].roomName + "</option>").appendTo(room)//动态添加Option子项
                }
            }
        });
    });

    function addTr(tab, row, trHtml){
        //获取table最后一行 $("#tab tr:last")
        //获取table第一行 $("#tab tr").eq(0)
        //获取table倒数第二行 $("#tab tr").eq(-2)
        var $tr=$("#"+tab+" tr").eq(-1);
        if($tr.size()==0){
            alert("指定的table id或行数不存在！");
            return;
        }
        $tr.after(trHtml);
    }

    function deletecustomer() {
        if($("#customertable tr").length>2){
            $("#customertable tr:last").remove();
        };
    }

    function addcustomer() {
        var addContent = '<tr>' +
            '<td><input type="text" class="input-text" value="" placeholder="姓名" name="customerName" required></td>' +
            '<td><select name="customerSex">' +
            '<option value ="男">男</option>' +
            '<option value ="女">女</option>' +
            '</select></td>' +
            '<td><input type="text" class="input-text" value="" placeholder="手机" name="customerPhone" required></td>' +
            '<td><input type="text" class="input-text" value="" placeholder="身份证" name="customerCard" required></td>' +
            '<td><input type="text" class="input-text" value="" placeholder="地址" name="customerAddress" required></td>' +
            '</tr>';
		addTr('customertable', 0, addContent);
    }
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>