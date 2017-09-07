<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>个人信息</title>
	<link href="../assets/css/bs3/dpl.css" rel="stylesheet" type="text/css" />
	<link href="../assets/css/bs3/bui.css" rel="stylesheet" type="text/css" />
	<link href="../assets/css/page-min.css" rel="stylesheet" type="text/css" />
</head>




<body>

<div class="demo-content">
 
<!-- 简单详情页 ================================================== -->
    <div class="doc-content">
      <ul class="breadcrumb">
        <li>
          <a href="#">首页</a> <span class="divider">/</span>
        </li>
        
        <li class="active">个人信息页</li>
      </ul>
      <div class="form-links">
        <ul class="nav-tabs">
  
          <li><a href="active">详情页</a></li>
        
        </ul>
      </div>
      <h3 align="center">个人信息</h3>
      <hr>

<form action="" class="form-horizontal form-horizontal-simple">
        <div class="control-group">
          <label class="control-label">email：</label>
          <div class="controls">
          <span class="control-text">${userinf.email}</span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">期望工作地点：</label>
          <div class="controls">
          <span class="control-text">${userinf.uworkPlace}</span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">期待职位：</label>
          <div class="controls">
          <span class="control-text">${userinf.ujob}</span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">姓名：</label>
          <div class="controls">
          <span class="control-label"  style="text-align: left;">${userinf.uname}</span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">教育程度：</label>
          <div class="controls">
          <span class="control-text">${userinf.uedu}</span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">出生日期：</label>
          <div class="controls">
          <span class="control-text">${userinf.ubirth}</span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">现在住址：</label>
          <div class="controls">
          <span class="control-text">${userinf.uhomePlace}</span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">教育程度：</label>
          <div class="controls">
          <span class="control-text">${userinf.uedu}</span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">电话：</label>
          <div class="controls">
          <span class="control-text">${userinf.uphone}</span>
          </div>
        </div>
        
 </form>
    
   </div>
   </div>   
	
	<script type="text/javascript" src="../assets/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="../assets/js/bui-min.js"></script>
	<script type="text/javascript" src="../assets/js/config-min.js"></script>
	<script type="text/javascript">
		BUI.use('common/page');
	</script>
<body>
</html>
