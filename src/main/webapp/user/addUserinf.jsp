<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>修改信息</title>
<script type="text/javascript" src="assets/js/jquery-2.1.1.min.js"></script>
<link href="assets/css/bs3/dpl.css" rel="stylesheet" type="text/css" />
<link href="assets/css/bs3/bui.css" rel="stylesheet" type="text/css" />
<link href="res/css/head.css" rel="stylesheet" type="text/css" />

<script src="http://g.alicdn.com/bui/seajs/2.3.0/sea.js"></script>
<script src="http://g.alicdn.com/bui/bui/1.1.21/config.js"></script>
<script type="text/javascript" src="res/js/city.js"></script>
<link href="res/css/userinfCommon.css" rel="stylesheet" type="text/css">
<!--图片上传的js-->
<script src="res/js/ajaxfileupload.js"></script>
    <!-- 头部信息样式 -->
    <style>
       #img{
            position: absolute;
            top: 320px;
            /* z-index: 0; */
            border-style: none;
            background-color: white;
            opacity: 0.7;
            color: red;
        }
        .inputclass{
        	margin: 10px 5px;
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
            <div class="panel-body offset2">
            
            
            	<form id="imgform" method="post" enctype="multipart/form-data">
                    <input name="img" id="img" accept="image/png,image/gif,image/jpg" type="file" value="上传头像">
                </form>
                
                
                <form method="post" action="userinf/update" onsubmit="return checkall()">
                    <div class="row">
                        <div class="span5">
                            <img id="showimg" name="showing" src="res/img/defualtUserImg.gif" width="180px" height="180px">
                        </div>
                   		
                       <div class="span6">
                       <input type="hidden" name="imgsrc" id="imgsrc">
                            输入昵称：<input class="inputclass" type="text" style="height:25px;width:145px;" name="uname" id="name" required><br/>
                            输入手机：<input class="inputclass" type="text" style="height:25px;width:145px;" name="uphone" id="phone"><br/>
                            性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;男&nbsp;&nbsp;
                            <input type="radio" checked name="usex" value="男">&nbsp;&nbsp;&nbsp;&nbsp;
                            女&nbsp;&nbsp;<input type="radio" name="usex" value="女"><br/>
                            选择学历：
                            <select class="inputclass" style="height:25px;width:142px;" id="edu" name="uedu">
                                <option value="中学">中学</option>
                                <option value="高中">高中</option>
                                <option value="大专">大专</option>
                                <option value="本科" selected>本科</option>
                                <option value="研究生">研究生</option>
                                <option value="博士">博士</option>
                                <option value="其他">其他</option>
                            </select><br/>
                            期待工作：<input class="inputclass" style="height:25px;width:145px;" type="text" name="ujob">
                        </div>
                    </div>
                    <div class="row">
                        家庭住址：
                        <select  name="province" id="province" style="width: 100px;"></select>
                        <select  name="city" id="city"></select>
                        <select  name="county" id="county"></select>
                    </div>
                    <div class="row">
                        期待工作住址：
                        <select  name="wprovince" id="wprovince" style="width: 110px;"></select>
                        <select  name="wcity" style="width: 150px;" id="wcity"></select>
                        <select  name="wcounty" style="width: 150px;" id="wcounty"></select>
                    </div>
                    <div class="row">
                        出生年月：<input type="date" name="ubirth" id="birth">
                        <span id="warring" style="color:red;margin-left:100px;"></span>
                    </div>
                    <div class="row" style="margin-left:140px">
                        <input type="submit" class="button button-success button-large" value="保存">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="reset" class="button button-success button-large" value="取消">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div>
</div>
</body>
<script>
    //上出图片，展示图片
   $(function() {
        $("#img").change(function(){
        	//获得图片在本地的地址
            var objUrl = getObjectURL(this.files[0]) ;
            console.log("objUrl = "+objUrl) ;
            if (objUrl) {
                $("#showimg").attr("src", objUrl) ;
            }
            $.ajaxFileUpload({
                url:'userinf/uploadimg',
                secureuri:false,
                fileElementId:'img',//file标签的id
                dataType: 'text',//返回数据的类型
                data:{name:'logan'},//一同上传的数据
                success: function (data, status) {
                    if(data=="0"){
                    	alert("头像上传失败！");
                    }else{
                    	$('#imgsrc').attr("value",data);
                    }
                },
                error: function (data, status, e) {
                    alert(e);
                }
            });
        });
    });
     //获得图片在本地的地址
    function getObjectURL(file) {
        var url = null ;
        if (window.createObjectURL!=undefined) { // basic
            url = window.createObjectURL(file) ;
        } else if (window.URL!=undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file) ;
        } else if (window.webkitURL!=undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file) ;
        }
        return url ;
    }
    function checkall() {
        var name = $('#name').val();
        var sw = $('#warring');
        if(name==""){
            sw.text("昵称不能为空！");
            return false;
        }
        var phone = $('#phone').val();
        if(phone!=""){
            var reg = /^1[3578]{1}[0-9]{9}$/;
            if(!reg.test(phone)){
                sw.text("手机号不合法！！");
                return false;
            }
        }
         //日期检测
//        var birth = $('#birth').val();
//        var inputdate = birth.split('-');
//        var date = new Data();
//        alert(date.getFullYear());
        return true;
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
    $(function() {
        setup();
        setupw();
    });
</script>
</html>