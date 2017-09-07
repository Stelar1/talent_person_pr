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
	<title>招聘信息详情</title>
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
        <li>
          <a href="#">招聘信息列表</a> <span class="divider">/</span>
        </li>
        <li class="active">详情页</li>
      </ul>
      <div class="form-links">
        <ul class="nav-tabs">
          <li class="#"><a href="#">公司信息</a></li>
          <li><a href="active">招聘信息列表</a></li>
          <li ><a href="#">详情页</a></li>
        </ul>
      </div>
      <h3 align="center">招聘详情</h3>
      <hr>

<form action="" class="form-horizontal form-horizontal-simple">
        <div class="control-group">
          <label class="control-label">招聘信息编号：</label>
          <div class="controls">
          <span class="control-text">${rid}</span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">公司email：</label>
          <div class="controls">
          <span class="control-text">${recruit.email}</span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">招聘标题：</label>
          <div class="controls">
          <span class="control-text">${recruit.rtitle}</span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">工作类型：</label>
          <div class="controls">
          <span class="control-label">
		<c:choose>
			<c:when test="${recruit.rtype == 0}">全职</c:when>
			<c:when test="${recruit.rtype == 1}">实习</c:when>
			<c:when test="${recruit.rtype == 1}">兼职</c:when>
		</c:choose>
			</span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">教育程度：</label>
          <div class="controls">
          <span class="control-text">${recruit.redu}</span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">职位名：</label>
          <div class="controls">
          <span class="control-text">${recruit.rjob}</span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">工作经验：</label>
          <div class="controls">
          <span class="control-text">${recruit.rexper}</span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">薪水：</label>
          <div class="controls">
          <span class="control-text">${recruit.rsalary}</span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">工作地点：</label>
          <div class="controls">
          <span class="control-text">${recruit.rplace}</span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">所需人数：</label>
          <div class="controls">
          <span class="control-text">${recruit.rnum}</span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">职位描述：</label>
          <div class="controls">
          <span class="control-text">${recruit.rdesc}</span>
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
