<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <meta charset="UTF-8">
	<title>首页</title>
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
       
        /*主体界面开始*/
        #main{
            margin-bottom:50px;
        }
        #body{
            margin-bottom:50px;
            }
        #toolbar{
            margin-top:50px;
            margin-bottom:10px;
            height:50px;
            background-color:#414DA7;
            text-align:center;
        }
        #toolbar button{
            color:white;
           background-color:#414DA7;
            margin-left:10px;
            margin-right:10px;
            border:none;
            width:50px;
            font-size:18px;
            line-height:50px;
        }
        #toolbar button:hover{
            background-color:#91BDE9;
        }
        .desc-job{
            margin-top:15px;
        }
        .desc-job div a{
            color:#414DA7;
            text-decoration:none;
            font-size:18px;
            font-weight:bold;
        }
        /*主体界面结束*/
        /*导航开始*/
        /*导航结束*/
        /*footer开始*/
        .footer{
            position:absolute;
            bottom:0px;
            width:100%;
            height:30px;
            background-color:#414DA7;
            text-align:center;
        }
        .footer p{
            padding-right:10px;
            padding-left:10px;
            height:30px;
            line-height:30px;
            font-size:20px;
            color:white;
            display:inline;
            z-index:-1;
        }
        /*footer结束*/
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
    <p class="mytitle">人才招聘系统</p>
    <a href="index.jsp" class="mytitle" style="float:left;text-decoration:none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首页</a>
    <a href="regist.jsp" id="denglu" class="mytitle">注册</a><span style="float:right;" class="mytitle">|&nbsp;&nbsp;</span>
    <a href="login.jsp" id="zhuce" class="mytitle">登录</a>
    <a href="user/showUserInf.jsp" id="user" class="mytitle"></a><a href="user/loginout" id="out" class="mytitle">退出</a>
</div>
    <div id="body" class="span24 offset6">
        <div class="row-fluid">
            <div id="toolbar" class="span24">
                <button onclick="window.location.href='index.jsp'">首页</button>
                <button onclick="window.location.href='selectcruit/select?type=2'">兼职</button>
                <button onclick="window.location.href='selectcruit/select?type=1'">实习</button>
                <button onclick="window.location.href='selectcruit/select?type=0'">全职</button>
                <input type="text" placeholder="输入你想查找的职位" id="search"/>
                <button onclick="findjob()">查找</button>
            </div>
        </div>
        <div class="row-fluid">
            <div id="main" class="span18" style="background-color:white">
                <div class="doc-content">
                    <div class="panel">
                        <div class="panel-header">
                            <h1>最新招聘信息</h1>
                        </div>
                        <div id="content" class="panel-body">
                            <!-- 实习职位描述 -->
                            
                            <!-- 职位描述结束 -->
                            
                        </div>
                        <div class="row-fluid" style="text-align:center;margin-bottom:10px">
                                <a href="selectcruit/select?type=4">查看更多</a>
                        </div>
                    </div>
                </div>
            </div>
            <!--**************************************************************************************************-->
            <div id="menu" class="span6" style="background-color:white">
                <div class="doc-content">
                    <div class="panel">
                        <div class="panel-header">
                            <h1>导航</h1>
                        </div>
                        <div class="panel-body menu">
                            <!-- 导航开始 -->
                            <div>
                                <h3>工作地点</h3>
                                <hr/>
                                <a href="selectcruit/select?type=4&place=北京">北京</a>&nbsp;&nbsp;
                                <a href="selectcruit/select?type=4&place=上海">上海</a>&nbsp;&nbsp;
                                <a href="selectcruit/select?type=4&place=广州">广州</a>&nbsp;&nbsp;
                                <a href="selectcruit/select?type=4&place=深圳">深圳</a>&nbsp;&nbsp;
                                <a href="selectcruit/select?type=4&place=杭州">杭州</a>&nbsp;&nbsp;
                            </div>
                            <div>
                                <hr/>
                                <h3>职位</h3>
                                <hr/>
                                <a href="selectcruit/select?type=4&job=java">java</a>&nbsp;&nbsp;
                                <a href="selectcruit/select?type=4&job=安卓">安卓</a>&nbsp;&nbsp;
                                <a href="selectcruit/select?type=4&job=c#">c#</a>&nbsp;&nbsp;
                                <a href="selectcruit/select?type=4&job=前端">前端</a>&nbsp;&nbsp;
                                <a href="selectcruit/select?type=4&job=ios">ios</a>&nbsp;&nbsp;
                                <a href="selectcruit/select?type=4&job=php">php</a>&nbsp;&nbsp;
                                <a href="selectcruit/select?type=4&job=.net">.net</a>&nbsp;&nbsp;
                                <a href="selectcruit/select?type=4&job=大数据">大数据</a>&nbsp;&nbsp;
                                <a href="selectcruit/select?type=4&job=云计算">云计算</a>&nbsp;&nbsp;
                            </div>
                            <div>
                                <hr/>
                                <h3>类型</h3>
                                <hr/>
                                <a href="selectcruit/select?type=2">兼职</a>&nbsp;&nbsp;
                                <a href="selectcruit/select?type=1">实习</a>&nbsp;&nbsp;
                                <a href="selectcruit/select?type=0">全职</a>&nbsp;&nbsp;
                            </div>
                            <!-- 导航结束 -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!--
<div class="footer">
    <P>联系我们</P>
    <p>广告合作</p>
    <p>版权所有</p>
</div>
-->
</body>
<script>
function findjob(){
    var c = $('#search').val();
    if(c!=""){
        window.location.href="selectcruit/select?type=4&job="+c;
    }else{
    	 window.location.href="selectcruit/select?type=4";
    }
}
    $.get("selectcruit/getrecruit?type=4&pagenum=1",function(data) {
        console.log(data);
        //JSON.stringify(data);
        var _data = JSON.parse(data);
        loadrecruit(_data.rows);
    });
    function loadrecruit(obj){
        var html;
        $.each(obj,function(index,item) {
            //console.log(item.rjob);
            //console.log(item.company.c_name);
            html = "<div class='row-fluid desc-job'><div class='span12'><a href='selectcruit/recruitdetail?rid="+item.rid+"'>"+item.rtitle+"</a>"+
                    "<p><spn style='color:red'>"+item.rsalary+"</spn>" +
                    "&nbsp;&nbsp;&nbsp;&nbsp;"+item.rplace+"/"+item.redu+"/"+item.rexper+"</p>"+
                    "</div><div class='span4'><a href='selectcruit/companyinf?email="+item.email+"'>"+item.company.c_name+"</a>" +
                    "<p>"+item.company.c_level+"/"+item.company.c_type+"</p>"+
                    "<hr/>";
            $("#content").append(html);
        });
    }
</script>
</html>