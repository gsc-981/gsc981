<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    pageContext.setAttribute("basePath", basePath);
%>

<html>
<head>
    <title>生日快乐！</title>
</head>
<body style="background-image: url(${basePath}/static/front/img/hb.jpg)">
</body>
</html>
