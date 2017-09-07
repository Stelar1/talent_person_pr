<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>简历预览</title>
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
        .edu p:nth-child(2){
            padding-left:30px;
            padding-right:30px;
        }
        .edu p:last-child{
            font-weight:bolder;
        }
        .tech p:first-child{
            font-weight:bolder;
        }
        .tech p:last-child{
            padding-left:30px;
        }
        .pro p:last-child{
            margin-left:30px;
        }
        .pro p:first-child{
            font-weight:bolder;
        }
    </style>
<script>
$(function(){
	var email = '<%=request.getSession().getAttribute("email") %>';
	var inf = '<%=request.getSession().getAttribute("inf") %>';
	var name = '<%=request.getSession().getAttribute("name") %>';
	if(email=="null"){
		$('#denglu').show();
		$('#zhuce').show();
		$('#user').hide();
		$('#out').hide();
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
		
		$('#out').show();
	}
	if(inf=="noinf"&&name=="null"){
		alert("您还没填写基本信息，请填写！");
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
    <a href="user/showUserInf.jsp" id="user" class="mytitle"></a><a href="user/loginout" id="out" class="mytitle">退出</a>
</div>
<div id="showresume" class="span24 offset7">
    <div class="row" style="text-align:center;margin-bottom:30px;margin-top:40px;">
        <h1 style="font-size:30px">个人简历</h1>
    </div>
    <div class="row">
        <div class="span24 offset2">
            <h1>基本信息：</h1>
        </div>
    </div>
    <div class="row">
        <div class="span8 pcss offset4">
            <P style="font-weight:bolder">姓名：</P>
            <p id="uname"></p><br/>
            <p style="font-weight:bolder">性别：</p>
            <p id="usex"></p><br/>
            <p style="font-weight:bolder">手机：</p>
            <p id="uphone"></p><br/>
            <p style="font-weight:bolder">出生年月日：</p>
            <p id="ubirth"></p><br/>
        </div>
        <div class="span12">
            <img  id="img" width="140" height="140">
        </div>
    </div>
    <div class="row">
        <div class="span8 basecss pcss offset4">
            <p>学历：</p>
            <p id="xueli"></p>
        </div>
        <div class="span12 basecss pcss">
            <p>期望工作：</p>
            <p id="ujob"></p>
        </div>
    </div>
    <div class="row">
        <div class="span8 basecss pcss offset4">
            <p>家庭住址：</p>
            <p id="hp"></p>
        </div>
        <div class="span12 basecss pcss">
            <p>期望工作地址：</p>
            <p id="wp"></p>
        </div>
    </div>
    <!--教育经历-->
    <div id="edu">
        <div class="row">
            <div class="span24 offset2">
                <h1>教育经历：</h1>
            </div>
        </div>
    </div>
    <!--教育经历结束-->
    <!--专业技能-->
    <div id="tech">
        <div class="row">
            <div class="span24 offset2">
                <h1>专业技能：</h1>
            </div>
        </div>
    </div>
    <!--专业技能结束-->
    <!--项目经验-->
    <div id="pro">
        <div class="row">
            <div class="span24 offset2">
                <h1>项目经验：</h1>
            </div>
        </div>
    </div>
    <!--项目经验结束-->
    <!--个人评价-->
    <div class="row">
        <div class="span24 offset2">
            <h1>自我评价：</h1>
        </div>
    </div>
    <div class="span17 offset4">
        <p id="desc" style='line-height:30px;height:30px'></p>
    </div>
    <!--个人评价结束-->
</div>
</body>
<script>
    $(function() {
        $.get("resume/getresume",function(data) {
            console.log(data);
            var _data=JSON.parse(data);
            loadEdu(_data.edu);
            loadTech(_data.tech);
            loadPro(_data.pro);
            loadDesc(_data.desc);
        });
        //加载基本信息
        $.get("userinf/getuersInf",function(userinf){
        	var _data=JSON.parse(userinf);
        	$('#uname').text(_data.uname);
        	$('#usex').text(_data.usex);
        	$('#uphone').text(_data.uphone);
        	$('#ubirth').text(_data.ubirth);
        	$('#xueli').text(_data.uedu);
        	$('#ujob').text(_data.ujob);
        	$('#hp').text(_data.uhomePlace);
        	$('#wp').text(_data.uworkPlace);
        	//$('#img').text(_data.uimag);
        	$('#img').attr("src",(_data.uimag=="null"||_data.uimag=="")?"res/img/defualtUserImg.gif":_data.uimag);
        	
        });
    });
//    加载教育经历
    function loadEdu(data){
        var html;
        var f = $('#edu');
        $.each(data,function(index,item) {
           html = "<div class='row'><div class='edu pcss span20 offset4'><p>"+item.data+"</p>" +
                   "<p>"+item.place+"</p><p>"+item.shoolname+"</p></div></div>";
            f.append(html);
        });
    }
//    加载专业技能
    function loadTech(data) {
        var html;
        var f = $('#tech div.row');
        $.each(data,function(index,item) {
            html = "<div class='tech pcss span20 offset4'><p>"+item.type+"</p><p>"+item.content+"</p></div>";
            f.append(html);
        });
    }
//    加载项目经验
    function loadPro(data) {
        var html;
        var f = $('#pro');
        $.each(data,function(index,item) {
            html = "<div class='pro pcss span20 offset4' style='margin-top:20px'><p>"+item.name+"</p>" +
                    "<p>"+item.type+"</p></div><div class='span16 offset5'><p style='line-height:30px;height:30px'>"+item.content+"</p></div>";
            f.append(html);
        });
    }
//    加载个人描述
    function loadDesc(data) {
        $("#desc").text(data);
    }
</script>
</html>