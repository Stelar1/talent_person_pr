<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>密保管理</title>
<script type="text/javascript" src="assets/js/jquery-2.1.1.min.js"></script>
<link href="assets/css/bs3/dpl.css" rel="stylesheet" type="text/css" />
<link href="assets/css/bs3/bui.css" rel="stylesheet" type="text/css" />

<script src="http://g.alicdn.com/bui/seajs/2.3.0/sea.js"></script>
<script src="http://g.alicdn.com/bui/bui/1.1.21/config.js"></script>
<link href="res/css/head.css" rel="stylesheet" type="text/css" />
<link href="res/css/userinfCommon.css" rel="stylesheet" type="text/css">
<meta http-equiv="pragma" content="no-cache">
<style>
  /*弹出框样式*/
       #content{
            margin-top:40px;
        }
        #content div{
            margin-top:10px;
            margin-bottom:10px;
        }
        #content div label{
            font-size:16px;
            line-height:20px;
            height:20px;
        }
        #content div input{
            border:1px solid #414DA7;
            height:20px;
            width:200px;
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
<div>
    <div id="main" class="span24 offset8 row">
        <div class="panel span6">
            <div class="panel-header" style="background:#414DA7;color:white;">
                <p>个人中心</p>
            </div>
            <div class="panel-body" style="height:500px">
                <div id="t1">
                </div>
            </div>
        </div>

        <div class="panel span17">
            <div class="panel-header" style="background:#414DA7;color:white;">
                <p>密码修改</p>
            </div>
            <!--以下都是内容区-->
            <div id="content" class="span10 offset5">
                <div><label>输入原密码：</label> <input type="password" placeholder="输入原密码"  id="pwd"><br/></div>
                <div><label>输入新密码：</label> <input type="password" placeholder="输入新密码" id="newpwd"><br/></div>
                <div><label>确认新密码：</label> <input type="password" placeholder="再次输入新密码" id="newpwd1"><br/></div>
                <span id="msg" class="offset3" style="color:red;display:none"></span>
                <div>
                    <button onclick="resetpwd()" class="button button-large button-success offset3">修改密码</button>
                </div>
            </div>
    </div>
</div>
<div>
</div>
</body>
<script type="text/javascript">
function resetpwd() {
    var p1 = $('#pwd').val();
    var p2 = $('#newpwd').val();
    var p3 = $('#newpwd1').val();
    var reg = /[0-9a-zA-Z,.?#%_]{6,12}/;
    if(reg.test(p1)&&reg.test(p2)&&reg.test(p3)){
        if(p2==p3){
            $('#msg').hide();
            $.ajax({
                type: 'POST',
                url: "user/updatepwd",
                dataType: 'text',
                data:{"pwd1":p1,"pwd2":p2},
                success: function(data){
                    if(data=="ok"){
                        alert('修改成功');
                      	$('#pwd').val("");
                       $('#newpwd').val("");
                       $('#newpwd1').val("");
                    }else{
                    	$('#msg').text(data).show();
                    	
                    }
                },
                error: function(xhr, type){
                    alert('数据加载失败');
                }
            });
        }else{
            $('#msg').text("两次输入不一样！").show();
        }
    }else{
        $('#msg').text("密码不合法！").show();
    }
}
</script>
<!--弹出框-->
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