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


<link href="res/css/head.css" rel="stylesheet" type="text/css" />
<link href="res/css/userinfCommon.css" rel="stylesheet" type="text/css">


<script src="http://g.alicdn.com/bui/seajs/2.3.0/sea.js"></script>
<script src="http://g.alicdn.com/bui/bui/1.1.21/config.js"></script>
<meta http-equiv="pragma" content="no-cache">
<style>
  /*弹出框样式*/
        .bui-dialog{
            border-style: none;
            background-color:white;
        }

        .bui-dialog .bui-stdmod-header{
            background-color:#414DA7;
        }
        .bui-dialog .bui-stdmod-body {
            border-style:none;
            background-color:white;
        }
        .form-horizontal .control-label{
        	line-height: 22px;
    		font-weight: bold;
        }
        .form-horizontal .control-label {
    		line-height: 22px;
    		font-weight: bold;
    		font-size: 16;
		}
		p{
		 font-size: 16;
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
    <p class="mytitle">人才招聘系统</p>
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
                <p>信息展示</p>
            </div>
            <!--以下都是内容区-->
            <div class="row">
                <div class="span17 doc-content">
                	<div id="no" class="form-horizontal well" style="background-color:white;text-align:center">
                        <p>你还没设置密保！</p>
                    </div>
                    <div id="show" class="form-horizontal well" style="background-color:white">
                        <div class="row" >
                            <div class="row" style="float:right">

                            </div>
                            <div class="control-group span8">
                                <label class="control-label">密保问题1：</label>
                                <div class="controls">
                                    <p id="f1"></p>
                                </div>
                            </div>
                            <div class="control-group span8">
                                <label class="control-label">答案：</label>
                                <div class="controls">
                                    <input type="text" id="fa1" placeholder="长度在2~6" class="control-text">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="control-group span8">
                                <label class="control-label">密保问题2：</label>
                                <div class="controls">
                                    <p id="f2"></p>
                                </div>
                            </div>
                            <div class="control-group span8">
                                <label class="control-label">答案：</label>
                                <div class="controls">
                                    <input type="text" id="fa2" placeholder="长度在2~6" class="control-text">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="control-group span8">
                                <label class="control-label">密保问题3：</label>
                                <div class="controls">
                                    <p id="f3"></p>
                                </div>
                            </div>
                            <div class="control-group span8">
                                <label class="control-label">答案：</label>
                                <div class="controls">
                                    <input type="text" id="fa3" placeholder="长度在2~6" class="control-text">
                                </div>
                            </div>
                        </div>
						<div class="row" id="showContent" style="text-align:center;display:none"><span id="inputinf" style="color:red;"></span></div>
                    </div>
                    <div class="row">
                        <div class="form-actions offset7">
                            <button id="up" onclick="upcheck()"  class="button button-primary"></button>
                        </div>
                    </div>
                </div>
            </div>
            <!--内容区结束-->
        </div>
    </div>
</div>
<div>
</div>
</body>
<!--弹出框-->
<script type="text/javascript">
	//创建数组来保存问题
	var qs = [];
    $(function() {
    	$.get("user/getUserSafe",function(data,status){
    		if(data=="no"){
    			$('#show').hide();
    			$('#no').show();
    			$('#up').text("新增");
    		}else{
    			$('#no').hide();
    			$('#up').text("修改");
    			var ss = JSON.parse(data);
    			console.log(ss);
    			for(var i=0;i<3;i++){
    				//取得问题答案
    				$("#f"+(i+1)).text(ss["q"+[i]]);
    				qs[i]= ss["q"+[i]];
    			}
    		}
    	});
    });
    var dialog;
    BUI.use('bui/overlay',function(Overlay){
        dialog = new Overlay.Dialog({
            title:'密保设置',
            width:500,
            height:250,
            bodyContent:'<div id="dialog" style="text-align:center"><h2>设置密保问题</h2><br/>'+
                        '输入密保问题1：<input id="q1" placeholder="长度在2~15" type="text" class="input-block-level">'+
                        '&nbsp;&nbsp;&nbsp;&nbsp;答案：<input id="a1" placeholder="长度在2~6" class="input-block-level" type="text"><br/><br/>'+
                        '输入密保问题2：<input id="q2" placeholder="长度在2~15" type="text" class="input-block-level">'+
                        '&nbsp;&nbsp;&nbsp;&nbsp;答案：<input id="a2" placeholder="长度在2~6" class="input-block-level" type="text"><br/><br/>'+
                        '输入密保问题3：<input id="q3" placeholder="长度在2~15" type="text" class="input-block-level">'+
                        '&nbsp;&nbsp;&nbsp;&nbsp;答案：<input id="a3" placeholder="长度在2~6" class="input-block-level" type="text"><br><br/>'+
                        '<span style="color:red;display:none" id="newinputinf"></span></div>',
            success:function () {
                //alert('确认');
                var safe =[];
                var s = null;
                for(var i=0;i<3;i++){
                    //动态地为JavaScript对象添加属性，然后转换为json传给后台
                    s = new Object();
                    //数据验证，后期在做吧
                    s.question=$('#q'+(i+1)).val();
                    s.answer=$('#a'+(i+1)).val();
                    //console.log(s);
                    safe[i]=s;
                }
                //console.log(safe);
                //将JavaScript对象转换为json字符串
                var json = JSON.stringify(safe);
                //console.log(json);
                //关闭对话框
				uploadJson(json,safe);
                this.close();
            }
        });
        
    });
    function uploadJson(json,safe) {
        $.ajax({
            type: 'POST',
            url: "user/setUserSafe",
            dataType: 'text',
            data: {json:json},
            success: function(data){
            	console.log("updata:"+data);
                if(data=="ok"){
                	for(var i=0;i<3;i++){
                		location.replace(location.href);
                	}
                }
            },
            error: function(xhr, type){
		        alert('数据加载失败');
		    }
        });
    }
    //用户的输入密保后需要上传到服务检查密保是否合法
    //麻烦的事又来了，但是又不能把密保问题答案传到浏览器，要不密保就形同虚设、
    //烦死了
    function upcheck() {
		//先判断是否为空
		var fa0 = $('#fa1').val().trim();
		var fa1 = $('#fa2').val().trim();
		var fa2 = $('#fa3').val().trim();
		if(checkAnsLength(fa0)){
			if(checkAnsLength(fa1)){
				if(checkAnsLength(fa2)){
					$('#showContent').hide();
					checkAns(fa0,fa1,fa2);
				}
			}
		}else{
			$('#showContent').show();
			$('#inputinf').text("请正确填写密保！");
		}
    }
    //检查输入数据的长度，如果太长的话就返回false
    function checkAnsLength(str){
    	//或许可以用正则
    	var reg = /.{2,6}/;
    	return reg.test(str);
    }
    //将问题答案上传服务器，验证是否正确
    function checkAns(a0,a1,a2){
    	var q = [qs[0],qs[1],qs[2]];
    	var a = [a0,a1,a2];
    	console.log(q);
    	console.log(a);
    	$.ajax({
            type: 'POST',
            url: "user/checkQs",
            dataType: 'text',
            data: {"qs":JSON.stringify(q),"as":JSON.stringify(a)},
            success: function(data){
            	if(data=="no"){
            		$('#showContent').show();
        			$('#inputinf').text("密保验证错误!");
            	}else if(data=="ok"){
            		$('#showContent').hide();
            		dialog.show();
            	}
            },
            error: function(xhr, type){
		        alert('数据加载失败');
		    }
        });
    }
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