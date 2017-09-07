<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<script type="text/javascript" src="assets/js/jquery-2.1.1.min.js"></script>
<link href="assets/css/bs3/dpl.css" rel="stylesheet" type="text/css" />
<link href="assets/css/bs3/bui.css" rel="stylesheet" type="text/css" />
<link href="res/css/head.css" rel="stylesheet" type="text/css" />
<title>注册</title>
<style>
* {
	margin: 0px;
	padding: 0px;
}

body {
	background: url("res/img/bg.jpg");
	background-repeat: no-repeat;
	background-size: 100% auto;
	width: 100%;
	height: 100%;
	
}

.panel {
	border-radius: 5%;
	background: white;
	margin-top: 30%;
	text-align: center;
}

#myform div {
	margin-top: 10px;
	margin-bottom: 10px;
}

#myform div input {
	margin-top: 10px;
	margin-bottom: 10px;
	height: 25px;
}

#myform label {
	font-size: 18px;
}

#getnum {
	height: 25px;
	line-height: 25px;
	background-color: #414DA7;
	color: white;
}

#regist {
	border-style: none;
	font-size: 16px;
	height: 32px;
	width: 300px;
	background-color: dodgerblue;
}
 #top{
            width:100%;
            height:0px;
            background-color:green;
            color:white;
            text-align:right;
        }
  #top p{
            position:absolute;
            font-size:50px;
            height:50px;
            line-height:50px;
        }
       
        #top p:first-child{
            top:100px;
            left:20%;
        }

        #top p:last-child{
            top:200px;
            right:60%;
        }
#regist:hover {
	background-color: royalblue;
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
    <p style="top:100px;">欢迎使用</p>
    <p>人才招聘系统</p>
</div>
	<div id="main" class="span10 offset20">
		<div class="panel">
			<div class="page-header" style="text-align:center">
				<p style="font-size:30px;font-weight:bold">用户注册</p>
			</div>
			<div class="panel-body">
				<form id="myform" method="post" action="user/adduser" onsubmit="return doregist()">
					<span id="msg" hidden style="color:red"></span>
					<div>
						<label>输入邮箱：</label> <input type="email" id="email" onblur="checkEmail()" name="email" style="width:200px" class="control-text" required>

					</div>
					<div>
						<label>输入密码：</label> <input type="password" id="password" onblur="checkpwd1()" name="password" style="width:200px" class="control-text" required>
					</div>
					<div>
						<label>确认密码：</label> <input type="password" id="password2" onblur="checkpwd2()" style="width:200px" class="control-text" required>
					</div>
					<div>
						<label>选择用户类型：</label> <select name="access" style="width:170px;height:30px;">
							<option value="2">普通用户</option>
							<option value="1">企业用户</option>
						</select>
					</div>
					<div>
						<label>输入验证码：</label> <input type="text" id="surenum" name="code" style="width:115px" class="control-text input-small"> <input type="button" id="getnum" onclick="getcode()" value="获取验证码" style="border-style:none"> <br />
					</div>
					<div>
						<input type="submit" id="regist" value="注&nbsp;&nbsp;&nbsp;&nbsp;册">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script>
	var m = $('#msg');
	function showmsg(b, msg) {
		if (b) {
			m.hide();
		} else {
			m.text(msg).show();
		}
		return b;
	}
	function doregist() {
		var code = $('#surenum').val().trim();
		var r = /^[0-9]{6}$/;
		if (r.test(code)) {
			return true;
		} else {
			showmsg(false, "验证码不合法！");
			return false;
		}

	}
	function checkEmail() {
		var reg = /^[0-9a-zA-Z]+@[0-9a-zA-Z.]+[0-9a-zA-Z]+$/;
		var em = $('#email').val().trim();
		var f = showmsg(reg.test(em), "邮箱不合法！");
		if (f) {
			$.get("user/checkmail?email=" + em, function(data, status) {
				if (data == "no") {
					f = showmsg(false, "该邮箱已被注册！");
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
		var p1 = $('#password').val().trim();
		return showmsg(reg.test(p1), "密码不合法！");
	}

	function checkpwd2() {
		var p1 = $('#password').val().trim();
		var p2 = $('#password2').val().trim();
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
	var t = 30;
	function getcode() {
		if (checkEmail()) {
			var mail = $('#email').val().trim();
			var lable = $('#getnum');
			lable.attr("disabled", "disabled");
			lable.css("background-color","#c2c2c2");
			$.get("user/suremail?email=" + mail, function(data, status) {
				// alert("Data: " + data + "nStatus: " + status);
				console.log(data);
				if (status !== "success") {
					alert("网络错误！");
				}
				if (data != "ok") {
					alert("发送邮件失败！");
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
</script>
</html>