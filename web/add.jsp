<%@ page contentType="text/html; charset=utf8" language="java" errorPage="" %>
<!DOCTYPE HTML PUBLIC "_//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import ="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<title>添加联系人</title>
<link rel="stylesheet" href="layui/css/layui.css"  media="all">
</head>

<body>

<form action="add1.jsp" method="post" accpet-charset="utf-8">
<div class="layui-form-item">
    <label class="layui-form-label">联系人</label>
    <div class="layui-input-block">
      <input type="text" name="user" lay-verify="title" autocomplete="off" placeholder="请输入要添加的账号" class="layui-input">
    </div>
  </div>

<input type="submit" class="layui-btn" value="添加"/>
</from>
</body>
</html>