<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查看公司信息</title>
     <script src="res/js/jquery-1.11.3.min.js"></script>
    <link href="res/css/dpl.css" rel="stylesheet" type="text/css">
    <link href="res/css/head.css" rel="stylesheet" type="text/css">
  <style>
        body{
            background-color:#efefef;
        }
        #showresume{
            background-color:white;
            margin-top:20px;
            margin-bottom:60px;
            padding-bottom:100px;
        }
        p{
            font-size:16px;
           line-height:22px;
        }
        h1{
            font-size:20px;
        }
        .row{
            margin-top:10px;
        }
        .basecss p:first-child{
            font-weight:bolder;
        }
        .pcss p{
            display:inline-block;
        }
    </style>
 <script>
    	$(function(){
    		var email = '<%=request.getSession().getAttribute("email") %>';
    		var name = '<%=request.getSession().getAttribute("name") %>';
    		if(email=="null"){
    			$('#denglu').show();
    			$('#zhuce').show();
    			$('#user').hide();
    		}
    		else{
    			$('#denglu').hide();
    			$('#zhuce').hide();
    			if(name=="null"){
    				$('#user').text(email);
    			}else{
    				$('#user').text(name);
    			}
    			$('#user').show();
    		}
    	});
    </script>
</head>
<body>
<div id="head">
    <p class="mytitle">人才服务平台</p>
    <a href="index.jsp" class="mytitle" style="float:left;text-decoration:none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首页</a>
    <a href="regist.jsp" id="denglu" class="mytitle">注册</a><span style="float:right;" class="mytitle">|&nbsp;&nbsp;</span>
    <a href="login.jsp" id="zhuce" class="mytitle">登录</a>
    <a href="user/showUserInf.jsp" id="user" class="mytitle"></a>
</div>
<div id="showresume" class="span24 offset7">
    <div class="row" style="text-align:center;margin-bottom:30px;margin-top:40px;">
        <h1 style="font-size:30px">${com.c_name}</h1>
    </div>
    <div class="row">
        <div class="span8 pcss offset4">
            <P style="font-weight:bolder">公司名称：</P>
            <p>${com.c_name}</p><br/>
            <p style="font-weight:bolder">公司地址：</p>
            <p>${com.c_place}</p><br/>
            <p style="font-weight:bolder">融资阶段：</p>
            <p>${com.c_level}</p><br/>
            <p style="font-weight:bolder">所属行业：</p>
            <p>${com.c_type}</p><br/>

        </div>
        <div class="span12">
            <img src="res/img/cet.jpg" width="140" height="140">
        </div>
    </div>
    <div class="row">
        <div class="span16 offset4" >
            <p style="font-weight:bolder">公司介绍：</p>
            <p style="line-height:40px">${com.c_desc}</p><br/>
        </div>
    </div>
    <div class="row">
        <div class="span10 offset11" >
            <button onclick="javascript:history.go(-1);" class="button button-success button-large">返回</button>
        </div>
    </div>
</div>
</body>
</html>