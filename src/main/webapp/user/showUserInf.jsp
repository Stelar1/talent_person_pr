<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>查看个人信息</title>
<script type="text/javascript" src="assets/js/jquery-2.1.1.min.js"></script>
<link href="assets/css/bs3/dpl.css" rel="stylesheet" type="text/css" />
<link href="assets/css/bs3/bui.css" rel="stylesheet" type="text/css" />


<link href="res/css/head.css" rel="stylesheet" type="text/css" />
<link href="res/css/userinfCommon.css" rel="stylesheet" type="text/css">


<script src="http://g.alicdn.com/bui/seajs/2.3.0/sea.js"></script>
<script src="http://g.alicdn.com/bui/bui/1.1.21/config.js"></script>
<meta http-equiv="pragma" content="no-cache">
<style>
.showinf p {
	font-size: 16px;
	display: inline-block;
	padding: 0px 5px;
}

.showinf p:first-child {
	font-weight: bold;
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
    <p class="mytitle">人才招聘系统平台</p>
    <a href="index.jsp" class="mytitle" style="float:left;text-decoration:none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首页</a>
    <a href="regist.jsp" id="denglu" class="mytitle">注册</a><span style="float:right;" class="mytitle">|&nbsp;&nbsp;</span>
    <a href="login.jsp" id="zhuce" class="mytitle">登录</a>
    <a href="user/showUserInf.jsp" id="user" class="mytitle"></a><a href="user/loginout" id="out" class="mytitle">退出</a>
</div>
	<div>
		<div id="main" class="span24 offset8 row">
			<div class="panel span6">
				<div class="panel-header" style="background:#414DA7;color:white;">
					<p>个人中心</p>
				</div>
				<div class="panel-body" style="height:500px">
					<div id="t1"></div>
				</div>
			</div>

			<div class="panel span17">
				<div class="panel-header" style="background:#414DA7;color:white;">
					<p>信息展示</p>
				</div>
				<!--以下都是内容区-->
				<div class="panel-body offset2">
					<div class="row">
						<div class="span5">
							<img id="showimg" src="res/img/defualtUserImg.jpg"  width="180px" height="180px" alt="图片暂时无法显示" >
						</div>
						<div class="span6">
							<div class="showinf">
								<P>昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</P>
								<p id="name"></p>
							</div>
							<div class="showinf">
								<P>手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</P>
								<p id="phone"></p>
							</div>
							<div class="showinf">
								<P>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</P>
								<p id="sex"></p>
							</div>
							<div class="showinf">
								<P>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历：</P>
								<p id="edu"></p>
							</div>
							<div class="showinf">
								<P>期待工作：</P>
								<p id="work"></p>
							</div>
						</div>
					</div>
					<div class="row showinf">
						<P>家庭住址：</P>
						<p id="hplace"></p>
					</div>
					<div class="row showinf">
						<P>期待工作住址：</P>
						<p id="wplace"></p>
					</div>
					<div class="row showinf">
						<P>出生年月日：</P>
						<p id="birth"></p>
					</div>
					<div class="row" style="margin-left:140px">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" onclick="javascript:window.location.href='user/addUserinf.jsp'" class="button button-success button-large" value="更改">
					</div>
				</div>
				<!--内容区结束-->
			</div>
		</div>
	</div>
	<div>
	</div>
</body>
<script>
$(function(){
	$.get("userinf/getuersInf",function(data,status){
		var inf = JSON.parse(data);
		$('#name').text(inf.uname);
		$('#phone').text(inf.uphone);
		$('#sex').text(inf.usex);
		$('#edu').text(inf.uedu);
		$('#work').text(inf.ujob);
		$('#hplace').text(inf.uhomePlace);
		$('#wplace').text(inf.uworkPlace);
		$('#birth').text(inf.ubirth);
		//如果没有头像，显示默认头像
		console.log(inf.uimag);
		$('#showimg').attr("src",(inf.uimag=="null"||inf.uimag=="")?"res/img/defualtUserImg.gif":inf.uimag);
	});
});
</script>
<script type="text/javascript">
    BUI.use('bui/tree',function(Tree) {
        //利用侧边菜单的样式来构造树形菜单
        var menu = new Tree.TreeMenu({
            render:'#t1',
            elCls:'bui-side-menu',  // BUI默认未提供树形菜单的样式，可以自己覆写样式或者传入选项的模板
            itemCls:'bui-menu-item',
            expandAnimate:true,
            showIcons:false,
            dirTpl:'<li class="menu-second"><div class="bui-menu-title"><s></s><span class="bui-menu-title-text">{text}</span></div></li>',
            leafTpl:'<li class="menu-leaf"><a href="{href}"><em>{text}</em></a></li>',
            nodes:[
                {
                    id:'1',text:'基本信息',expanded:true,children:[
                    {id:'code',text:'查看信息',href:'user/showUserInf.jsp'},
                    {id:'main-menu',text:'修改信息',href:'user/addUserinf.jsp'}
                ]
                },
                {
                    id:'2',text:'简历管理',expanded:true,children:[
                    {id:'quick',text:'修改简历',href:'user/createResume.jsp'},
                    {id:'quick1',text:'预览简历',href:'user/showresume.jsp'},
                    {id:'quick2',text:'简历投送进度',href:'user/RecruitInf.jsp'}

                ]
                },
                {
                	 text:'安全中心',expanded:true,children:[
                	 {id:'resource',text:'修改密码',href:'user/updatePwd.jsp'},
                	 {id:'loader',text:'修改密保',href:'user/userSafe.jsp'}
                   

                ]
                },
                {
                    text:'考核中心',expanded:true,children:[
                    {id:'exam',text:'开始考试',href:'user/exam.html'},
                ]
                }
            ]
        });
        menu.render();
        menu.on('itemclick',function(ev) {
            $('.log').text(ev.item.text);
        });
    });
</script>
</html>