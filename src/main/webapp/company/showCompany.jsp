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
          <a href="#">公司信息</a> <span class="divider">/</span>
        </li>
        <li class="active">详情页</li>
      </ul>
      <div class="form-links">
        <ul class="nav-tabs">
          <li ><a href="#">详情页</a></li>
        </ul>
      </div>
      <h3 align="center">公司详情</h3>
      <hr>

<form action="" class="form-horizontal form-horizontal-simple">
        <div class="control-group">
          <label class="control-label">公司编号：</label>
          <div class="controls">
          <span class="control-text" id="c_id"></span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">公司email：</label>
          <div class="controls">
          <span class="control-text" id="email"></span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">名称：</label>
          <div class="controls">
          <span class="control-text" id="c_name"></span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">公司地点：</label>
          <div class="controls">
          <span class="control-label" style="text-align: left;" id="c_place"></span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">公司类型：</label>
          <div class="controls">
          <span class="control-text" id="c_type"></span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">公司阶段：</label>
          <div class="controls">
          <span class="control-text" id="c_level"></span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">公司描述：</label>
          <div class="controls" style="width: 700px;">
          <span class="control-text" id="c_desc"></span>
          </div>
        </div>
        
 </form>
    
   </div>
   </div>   
	
	<script type="text/javascript" src="../assets/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="../assets/js/bui-min.js"></script>
	<script type="text/javascript" src="../assets/js/config-min.js"></script>
	<script type="text/javascript">
	$(function(){
		$.get("../company/showCompany",function(data,status){
			var inf = JSON.parse(data);
			$('#c_id').text(inf.c_id);
			$('#email').text(inf.email);
			$('#c_name').text(inf.c_name);
			$('#c_place').text(inf.c_place);
			$('#c_type').text(inf.c_type);
			$('#c_level').text(inf.c_level);
			$('#c_desc').text(inf.c_desc);
		});
	});
	</script>
<body>
</html>
