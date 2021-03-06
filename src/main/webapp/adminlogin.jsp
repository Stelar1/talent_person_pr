<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="assets/js/jquery-2.1.1.min.js"></script>
	<link href="assets/css/bs3/dpl.css" rel="stylesheet" type="text/css" />
	<link href="assets/css/bs3/bui.css" rel="stylesheet" type="text/css" />
	<link href="res/css/head.css" rel="stylesheet" type="text/css" />
    <title>管理员登录</title>
    <style>
        *{
            margin:0px;
            padding:0px;
        }

        body{
            overflow:hidden;
        }

        #top{
            width:100%;
            height:0px;
            background-color:#414DA7;
            color:white;
            text-align:center;
        }

        #top p{
            position:absolute;
            font-size:50px;
            height:50px;
            line-height:50px;
        }

        #top p:first-child{
            top:120px;
            left:-30%;
        }

        #top p:last-child{
            top:170px;
            right:-30%;
        }

        #main{
            position:absolute;
            top:270px;
        }

        #myform{
            text-align:center;
        }

        #myform input{
            height:30px;
            margin-top:10px;
            margin-bottom:10px;
            width:250px;
        }

        #myform button{
            background-color:#414DA7;
            margin-top:10px;
            border-style:none;
            height:30px;
            width:260px;
            color:white;
            font-size:16px;
            font-weight:bold;
        }

        #myform button:hover{
            background-color:#0a6a6a;
        }
    </style>
</head>
<body>
<div id="head">
    <p class="mytitle">人才招聘系统</p>
    <a href="index.jsp" class="mytitle" style="float:left;text-decoration:none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首页</a>
    <a href="regist.jsp" class="mytitle">注册</a><span style="float:right;" class="mytitle">|&nbsp;&nbsp;</span>
    <a href="login.jsp" class="mytitle">登录</a>
</div>
<div id="top">
    <p>人才招聘系统</p>
    <p>管理人员登录</p>
</div>
<div id="main" class="span8 offset15">
    <div class="panel" style="background-color:white">
        <div class="page-header">
            <h1 style="text-align:center">登录</h1>
        </div>
        <div class="panel-body">
            <form id="myform" method="post">
                <input type="text" id="id" name="name" placeholder="输入账号" required autofocus>
                <input type="password" id="password" name="password" placeholder="输入密码" required>
                <button onclick="dologin();">&nbsp;&nbsp;登&nbsp;录&nbsp;&nbsp;</button>
            </form>
            <!-- <div style="width:100%;text-align:right;margin-top:10px">
                <a href="#">找回密码</a>
            </div> -->
        </div>
    </div>
</div>
</body>
<script>
    $(function() {
        $('#top').animate({height:"400px"});
        showin();
    });
    function showin() {
        $('#top p:eq(0)').animate({
            left:"30%"
        },1000);
        $('#top p:eq(1)').animate({
            right:"30%"
        },1000);
    }
    function dologin() {
        var id =$('#id').val();
        var password = $('#password').val();
        var reg = /[0-9a-zA-Z]{5,12}/;
        if(reg.test(id)&&password.trim()!=""){
            $("#myform").attr("action","admin/login").submit();
        }else{
            alert("账号不合法");
            return false;
        }
    }
</script>
</html>