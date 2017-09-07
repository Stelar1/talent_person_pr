<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>找回密码</title>
    <script type="text/javascript" src="res/js/jquery-1.11.3.min.js"></script>
	<link href="res/css/dpl.css" rel="stylesheet" type="text/css" />
	<link href="res/css/bui.css" rel="stylesheet" type="text/css" />


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
            margin-top:50px;
            background-color:white;
        }
        #title{
            font-size:30px;
        }
        #input label{
            font-size:16px;
        }
        .input{
            height:30px;
            border:1px solid #414DA7;
            margin-top:20px;
        }
        #getEmail{
            border:none;
            height:25px;
            background-color:#414DA7;
            border-radius:5%;
            color:white;
            width:85px;
        }
        #getEmail:hover{
            background-color:#0a6a6a;
        }
        #reset{
            height:30px;
            width:250px;
            background-color:#414DA7;
            border:none;
            color:white;
            font-size:14px;
            border-radius:2%;
        }
        #reset:hover{
            background-color:#0a6a6a;
        }
        #bySafeCode div label{
            font-size:16px;
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
<div id="body" class="span24 offset6" >
    <div  class="panel span24">
        <div class="page-header">
            <h1 id="title">找回密码</h1>
        </div>
        <div class="panel-body">
            <div id="type" class="row offset1">
                <button onclick="byemail()" class="button button-success">邮箱找回</button>
                <button onclick="bysafecode()" class="button button-success">密保找回</button>
            </div>
            <div class="row">
                <div id="input" class="offset8">
                    <div class="offset2" style="height:20px">
                        <span id="msg" style="color:red;display:none">输入不合法</span>
                    </div>
                    <label>输&nbsp;入&nbsp;邮&nbsp;箱：</label>
                    <input onblur="checkEmail()" class="input" required type="text" id="email"><br/>
                    <label>输入新密码：</label>
                    <input onblur="checkpwd1()" class="input" required type="password" id="pwd"><br/>
                    <label>确认新密码：</label>
                    <input onblur="checkpwd2()" class="input" required type="password" id="pwd1">
                </div>
            </div>
            <!--通过邮箱获取验证码-->
            <div id="byEmail" class="row">
                <div class="offset8">
                    <input class="input" type="text" id="code" required style="width: 133px;" placeholder="输入6位验证码">&nbsp;&nbsp;&nbsp;&nbsp;
                    <button onclick="getcode();" id="getEmail">获取验证码</button>
                </div>
            </div>
            <!--通过密保修改密码-->
            <div id="bySafeCode" class="row">
                <div class="offset7">
                    <label id="q0">这是一个密保问题：</label><input class="input" type="text" required id="a0"><br>
                    <label id="q1">这是一个密保问题：</label><input class="input" type="text" required id="a1"><br>
                    <label id="q2">这是一个密保问题：</label><input class="input" type="text" required id="a2"><br>
                </div>
            </div>
            <div class="row" style="margin-top:20px;margin-bottom:50px">
                <div class="offset8">
                    <button onclick="resetpwd()" id="reset">重置密码</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    var isemail = true;
    var byem = $("#byEmail");
    var bycode = $("#bySafeCode");
    $(function() {
        bycode.hide();
    });
    function byemail() {
        bycode.hide();
        byem.show();
        isemail = true;
    }
    function bysafecode() {
        bycode.show();
        byem.hide();
        isemail = false;
    }
    var m = $('#msg');
    function showmsg(b, msg) {
        if (b) {
            m.hide();
        } else {
            m.text(msg).show();
        }
        return b;
    }
//    检查邮箱
    function checkEmail() {
        var reg = /^[0-9a-zA-Z]+@[0-9a-zA-Z.]+[0-9a-zA-Z]+$/;
        var em = $('#email').val().trim();
        var f = showmsg(reg.test(em), "邮箱不合法！");
        if (f) {
            $.get("user/checkmail?email=" + em, function(data, status) {
                if (data != "no") {
                    f = showmsg(false, "该邮箱还未注册！");
                } else {
                    f = showmsg(true, "");
                }
            });
        }
        console.log("email:"+f);
        return f;
    }
    var reg = /[a-z0-9A-Z._*-,?]{6,12}/;
    function checkpwd1() {
        var p1 = $('#pwd').val().trim();
        return showmsg(reg.test(p1), "密码不合法！");
    }
    function checkpwd2() {
        var p1 = $('#pwd').val().trim();
        var p2 = $('#pwd1').val().trim();
        var f = showmsg(reg.test(p2), "密码不合法！");
        if(f){
            if (p1 != p2) {
                f = showmsg(false, "两次输入不一样！");
            } else {
                f = showmsg(true, "");
            }
        }
        console.log("pw2:"+f);
        return f;
    }
</script>
<script>
   // <!--邮箱找回密码-->
    function doregist() {
        var code = $('#surenum').val().trim();
        var r = /^[0-9]{6}$/;
        if(r.test(code)) {
            return true;
        } else {
            showmsg(false,"验证码不合法！");
            return false;
        }
    }
    var hascode = false;
    var t = 30;
    function getcode() {
        if (checkEmail()) {
            var mail = $('#email').val().trim();
            var lable = $('#getEmail');
            lable.attr("disabled", "disabled");
            lable.css("background-color","#c2c2c2");
            $.get("user/findpassword?email=" + mail, function(data, status) {
                // alert("Data: " + data + "nStatus: " + status);
                console.log(data);
                if (status !== "success") {
                    alert("网络错误！");
                }
                if (data != "ok") {
                    alert(data);
                }else{
                	//resetPassword
                	hascode=true;
                }
            });
            var ti = window.setInterval(function() {
                if (t == 0) {
                    lable.val("获取验证码");
                } else {
                    lable.val(t + "s后再获取！");
                    t--;
                }
            }, 1000);
            window.setTimeout(function() {
                window.clearInterval(ti);
                lable.removeAttr("disabled");
                lable.css("background-color","#414DA7");
                t = 30;
            }, 31100);
        }
    }
    function resetpwd() {
        if(isemail){
            if(hascode){
                var inputcode = $('#code').val().trim();
                var mail = $('#email').val().trim();
                var p2 = $('#pwd1').val().trim();
                var r = /^[0-9]{6}$/;
                if(r.test(inputcode)&&checkEmail()&&checkpwd2()){
                    $.ajax({
                        type: 'POST',
                        url: "user/resetPassword",
                        data: {"code":inputcode,"email":mail,"pwd":p2},
                        success: function(data){
                            if(data!="ok"){
                                alert(data);
                            }else{
                            	alert("找回密码成功！");
                            }
                        },
                        error: function(xhr, type){
                            alert('数据加载失败');
                        }

                    });
                }else{
                    showmsg(false,"请输入六位数验证码！");
                }
            }else{
                showmsg(false,"未获取到验证码！");
                return false;
            }
        }else{
            alert("模块还没开发！");
        }
    }
</script>
</html>