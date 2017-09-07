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
	<title>考题详情</title>
	<link href="../assets/css/bs3/dpl.css" rel="stylesheet" type="text/css" />
	<link href="../assets/css/bs3/bui.css" rel="stylesheet" type="text/css" />
	<link href="../assets/css/page-min.css" rel="stylesheet" type="text/css" />
</head>




<body>

<div class="demo-content">
 
<!-- 简单详情页 ================================================== -->
    <div class="doc-content">
    
       
<form action="" class="form-horizontal form-horizontal-simple">
        <div class="control-group">
          <label class="control-label">考题ID：</label>
          <div class="controls">
          <span class="control-text">${subject.subjectID}</span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">题目：</label>
          <div class="controls">
          <span class="control-text">${subject.subjectTitle}</span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">选项A：</label>
          <div class="controls">
          <span class="control-text">${subject.subjectOptionA}</span>
          </div>
        </div>
        
        <div class="control-group">
          <label class="control-label">选项B：</label>
          <div class="controls">
          <span class="control-text">${subject.subjectOptionB}</span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">选项C：</label>
          <div class="controls">
          <span class="control-text">${subject.subjectOptionC}</span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">选项D：</label>
          <div class="controls">
          <span class="control-text">${subject.subjectOptionD}</span>
          </div>
        </div>
        
        <div class="control-group">
          <label class="control-label">答案：</label>
          <div class="controls">
          <span class="control-text">${subject.subjectAnswer}</span>
          </div>
        </div>
        <div class="control-group">
          <label class="control-label">解析：</label>
          <div class="controls">
          <span class="control-text">${subject.subjectParse}</span>
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
