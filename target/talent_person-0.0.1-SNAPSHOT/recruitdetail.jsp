<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查看招聘信息</title>
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
        <h1 style="font-size:30px">${re.rtitle}</h1>
    </div>
    <div class="row">
        <div class="span24 offset2">
            <h1>职位描述：</h1>
        </div>
    </div>
    <div class="row">
        <div class="span8 pcss offset4">
            <P style="font-weight:bolder">职位名称：</P>
            <p>${re.rjob}</p><br/>
            <P style="font-weight:bolder">工作地点：</P>
            <p>${re.rplace}</p><br/>
            <p style="font-weight:bolder">薪水：</p>
            <p>${re.rsalary}</p><br/>
            <p style="font-weight:bolder">联系人：</p>
            <p>${re.email}</p><br/>
        </div>
    </div>

    <div class="row">
        <div class="span24 offset2">
            <h1>职位要求：</h1>
        </div>
    </div>
    <div class="row">
        <div class="span8 pcss offset4">
            <P style="font-weight:bolder">经验要求：</P>
            <p>${re.rexper}</p><br/>
            <P style="font-weight:bolder">学历：</P>
            <p>${re.redu}</p><br/>
            <p style="font-weight:bolder">职位描述：</p>
            <p>${re.rdesc}</p><br/>
        </div>
    </div>
    <div class="row offset8">
        <button class="button button-success button-large" onclick="recruit();">投个简历</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <button class="button button-success button-large" onclick="javascript:history.go(-1);">返&nbsp;&nbsp;&nbsp;&nbsp;回</button>
    </div>
</div>
</body>
<script>
		var email=null;
		
    	$(function(){
    		 email= '<%=request.getSession().getAttribute("email") %>';
    		var name = '<%=request.getSession().getAttribute("name") %>';
    		if(email=="null"||email==null){
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
    	
    	function recruit(){
    		
    		if(email==null||email=="null"){
    			alert("您还没有登录！!!1");
    		}/* else if(${re.rjob}==null||${re.rjob}=="null"){
    			alert("您！");
    		} */
    		else{
    			var cid = ${re.cid};
    			var rid = ${re.rid};
    			
    			var cemail ="${re.email}";
    			 $.ajax({
    	                type:"POST",
    	                url:"selectcruit/recruit",
    	                dataType:"text",
    	                data:{"cid":cid,"rid":rid,"cemail":cemail},
    	                success:function(data) {
    	                    //console.log(data);
    	                    if(data=="ok"){
    	                    	alert("简历投送成功！");
    	                    }else{
    	                    	alert("简历投送失败！");
    	                    }
    	                },
    	                error:function(e){
    	                	alert("连接失败！");
    	                }
    	            });
    		}
    	}
    </script>
</html>