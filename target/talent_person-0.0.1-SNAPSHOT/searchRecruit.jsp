<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>职位搜索</title>
    <script type="text/javascript" src="assets/js/jquery-2.1.1.min.js"></script>
	<link href="assets/css/bs3/dpl.css" rel="stylesheet" type="text/css" />
	<link href="assets/css/bs3/bui.css" rel="stylesheet" type="text/css" />
	<link href="res/css/head.css" rel="stylesheet" type="text/css" />
    <style>
        *{
            margin:0px;
            padding:0px;
        }
        body{
            background-color:#efefef;
        }
        #body{
            background-color:white;
            margin-top:40px;
            border:1px solid #414DA7;
            margin-bottom:50px;
        }
        #inputsearch{
           
            width:350px;
            height:30px;
            border:solid 2px #414DA7;
        }
        #search{
            height:30px;
            border-style:none;
            width:50px;
            background-color:#414DA7;
            color:white;
            font-size:16px;
            border-radius:10%;
        }
        #search:hover{
            background-color:#0a6a6a;
        }
        /*条件样式开始*/
        #option{
            margin-top:20px;
            background-color:#414DA7;
            margin-bottom:20px;
        }
        .select{
            height:30px;
            width:100px;
            font-size:12px;
            margin-left:20px;
            background-color:#414DA7;
            border:none;
        }
        .select:hover{
            background-color:#009977;
            color:#efefef;
        }
        /*选择条件样式结束*/
        #main{

        }
        #page{
            text-align:center;
        }
        #page button{
            border:none;
            background-color:#414DA7;
            height:30px;
            width:80px;
            font-size:16px;
            color:white;
            border-radius:5%;
        }
        .page{
            display:inline-block;
            margin-bottom:40px;
        }
        /*搜索结果样式*/
        .desc-job{
            margin-top:15px;
        }
        .desc-job div a{
            color:#414DA7;
            text-decoration:none;
            font-size:16px;
            font-weight:bold;
        }
        /*搜索结果样式结束*/
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
<div id="body" class="span24 offset6" style="margin-top: 50px;">
    <div class="row offset7" style="margin-top: 50px;">
        <input id="inputsearch" placeholder="输入你要查找的职位" type="text">
        <input type="button" onclick="dosearch()" id="search" value="查找">
    </div>
    <div id="option" class="row span20 offset2">
        <select id="type" name="type" class="select">
            <option value="2">兼职</option>
            <option value="0">全职</option>
            <option value="1">实习</option>
            <option value="4" selected>所有</option>
        </select>
        <select id="place" name="place" class="select">
            <option value="" selected>所有</option>
            <option value="北京">北京</option>
            <option value="上海">上海</option>
            <option value="广州">广州</option>
            <option value="深圳">深圳</option>
            <option value="杭州">杭州</option>
            <option value="厦门">厦门</option>
        </select>
        <select id="exper" name="exper" class="select">
            <option selected value="">所有</option>
           
            <option value="1年以上经验">1年以上经验</option>
            <option value="3年以上经验">3年以上经验</option>
        </select>
        <select id="edu" name="edu" class="select">
            <option selected value="">所有</option>
  
            <option value="专科及以上学历">专科</option>
            <option value="本科及以上学历">本科</option>
            <option value="研究生及以上学历">研究生及以上学历</option>
        </select>
    </div>
    <div id="main" class="row span20 offset2">
        <!-- 实习职位描述 -->
       <!-- <div class="row-fluid desc-job offset1">
            <div class="span12">
                <a href="#">中软国际实习生</a>
                <p><spn style="color:red">4000</spn>&nbsp;&nbsp;&nbsp;&nbsp;
                    福建/本科/不要求
                </p>
            </div>
            <div class="span8">
                <a href="#">中软国际</a>
                <p>互联网公司/上市公司</p>
            </div>
            <div class="span4">
                <img src="../res/img/baidu.jpg" width="40px" height="40px">
            </div>
        </div>
        <hr>-->
        <!-- 职位描述结束 -->
    </div>
    <div id="page" class="span20 offset2">
        <button id="pre" onclick="prepage()" class="page">上一页</button>&nbsp;&nbsp;
        <p class="page" id="pagenum">1</p>&nbsp;&nbsp;
        <button id="next" onclick="nextpage()" class="page">下一页</button>
    </div>
</div>
</body>
<script>
	//var option = ${condition};
	//var type = ${ctype};
	var option = '<%=request.getAttribute("condition") %>';
	var type = '<%=request.getAttribute("ctype") %>';
	var url = "selectcruit/getrecruit?pagenum=1&type=4";
	 var pagenum = 1;
	$(function(){
		console.log(type+":"+option);
		if(type!="null"&&type!="type"){
			url = "selectcruit/getrecruit?pagenum="+pagenum+"&type=4&"+type+"="+option;
		}else if(type=="type"){
			url = "selectcruit/getrecruit?pagenum="+pagenum+"&"+type+"="+option;
		}
		console.log(url);
		$.get(url,function(data) {
	        //console.log(data);
	        var _data = JSON.parse(data);
	        allcount = _data.results;
	        $("#main").empty() ;
	        loadrecruit(_data.rows);
	    });
	});
    
    function loadrecruit(obj){
        var html;
        
        $.each(obj,function(index,item) {
            //console.log(item.rjob);
            //console.log(item.company.c_name);
            html = "<div class='row-fluid desc-job offset1'><div class='span12'><a href='selectcruit/recruitdetail?rid="+item.rid+"'>"+item.rtitle+"</a>"+
                    "<p><spn style='color:red'>"+item.rsalary+"</spn>" +
                    "&nbsp;&nbsp;&nbsp;&nbsp;"+item.rplace+"/"+item.redu+"/"+item.rexper+"</p>"+
                    "</div><div class='span8'><a href='selectcruit/companyinf?email="+item.email+"'>"+item.company.c_name+"</a>" +
                    "<p>"+item.company.c_level+"/"+item.company.c_type+"</p></div>"+
                    "<div class='span4'><img src='res/img/cet.jpg' width='50px' height='50px'></div></div><hr/>";
            $("#main").append(html);
        });
    }
 
    function dosearch() {
        var edu =$('#edu').val();
        var place =$('#place').val();
        var type =$('#type').val();
        var exper =$('#exper').val();
        var job =$('#inputsearch').val();
        url = "selectcruit/getrecruit?pagenum="+pagenum+"&type="+type
        		+"&edu="+edu+"&place="+place+"&exper="+exper+"&job="+job;
        console.log(url);
        $.get(url,function(data) {
        	var _data = JSON.parse(data);
        	allcount = _data.results;
        	$("#main").empty() ;
	        loadrecruit(_data.rows);
	    });
    }
   
    var allcount ;
    var p;
    function prepage() {
        if(pagenum==1){
            $("#pre").attr("disabled","disabled");
        }else{
            pagenum--;
            $("#pagenum").text(pagenum);
            url = url.replace(/pagenum=[1-9]{1}/,"pagenum="+pagenum);
            console.log(url);
            $.get(url,function(data) {
            	console.log(data);
            	var _data = JSON.parse(data);
            	allcount = _data.results;
            	$("#main").empty() ;
    	        loadrecruit(_data.rows);
    	    });
        }
        $("#next").removeAttr("disabled");
    }
    function nextpage() {
        p=allcount%10==0?Math.floor(allcount/10):Math.floor(allcount/10+1);
        if(pagenum==p){
            $("#next").attr("disabled","disabled");
        }else{
            pagenum++;
            $("#pagenum").text(pagenum);
            var reg = /pagenum[1-9]{1}/;
            url = url.replace(/pagenum=[1-9]{1}/,"pagenum="+pagenum);
            console.log(url);
            $.get(url,function(data) {
            	console.log(data);
            	var _data = JSON.parse(data);
            	allcount = _data.results;
            	$("#main").empty() ;
    	        loadrecruit(_data.rows);
    	    });
        }
        $("#pre").removeAttr("disabled");
    }
	
</script>
</html>