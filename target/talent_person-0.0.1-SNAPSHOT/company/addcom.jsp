<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<title>公司信息</title>
<!-- 此文件为了显示Demo样式，项目中不需要引入 -->


<link href="../assets/css/bs3/dpl.css" rel="stylesheet">
<link href="../assets/css/bs3/bui.css" rel="stylesheet">
<script type="text/javascript" src="../assets/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="../assets/js/city.js"></script>
</head>
<body>
	<script type="text/javascript">

</script>
	<div class="demo-content">

		<!-- 简单表单页 ================================================== -->
		<div class="row">
			<div class="span24">
				<ul class="breadcrumb">
					<li><a href="#">首页</a> <span class="divider">/</span></li>
					<li><a href="#">公司信息管理</a> <span class="divider">/</span></li>
				</ul>


				<form name="myform" action="add" method="post" onsubmit="return checkall()" class="form-horizontal">
					<div class="form-links">
						<ul class="nav-tabs">
							<li class="active"><a href="#">添加公司信息</a></li>

						</ul>
					</div>
					<div class="control-group">
						<label class="control-label"><s>*</s>公司名称：</label>
						<div class="controls">
							<input type="text" id="c_name" class="input-large" name="c_name" style="height: 30px">
						</div>
					</div>


					<div class="control-group">
						<label class="control-label">城市：</label>
						<div class="controls">
							<select class="input-normal" id="sf" name="province" onchange="changecity()">
								<option selected>选择省份</option>
								<option value="江苏省">江苏省</option>
								<option value="北京">北京</option>
								<option value="天津">天津</option>
								<option value="上海">上海</option>
								<option value="重庆">重庆</option>
								<option value="广东省">广东省</option>
								<option value="浙江省">浙江省</option>
								<option value="福建省">福建省</option>
								<option value="湖南省">湖南省</option>
								<option value="湖北省">湖北省</option>
								<option value="山东省">山东省</option>
								<option value="辽宁省">辽宁省</option>
								<option value="吉林省">吉林省</option>
								<option value="云南省">云南省</option>
								<option value="四川省">四川省</option>
								<option value="安徽省">安徽省</option>
								<option value="江西省">江西省</option>
								<option value="黑龙江省">黑龙江省</option>
								<option value="河北省">河北省</option>
								<option value="陕西省">陕西省</option>
								<option value="海南省">海南省</option>
								<option value="河南省">河南省</option>
								<option value="山西省">山西省</option>
								<option value="内蒙古">内蒙古</option>
								<option value="广西">广西</option>
								<option value="贵州省">贵州省</option>
								<option value="宁夏">宁夏</option>
								<option value="青海省">青海省</option>
								<option value="新疆">新疆</option>
								<option value="西藏">西藏</option>
								<option value="甘肃省">甘肃省</option>
								<option value="台湾省">台湾省</option>
								<option value="香港">香港</option>
								<option value="澳门">澳门</option>
								<option value="国外">国外</option>
							</select> 城市： <SELECT class="input-normal" name="city">
								<OPTION>==所在城市==</OPTION>
							</SELECT>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">行业领域：</label>
						<div class="controls  control-row-auto">
							<select name="c_type" class="input">
								<option value="移动互联网">移动互联网</option>
								<option value="电子商务">电子商务</option>
								<option value="金融">金融</option>
								<option value="教育">教育</option>
								<option value="游戏">游戏</option>
								<option value="其他">其他</option>
							</select>&nbsp;&nbsp;
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">融资阶段：</label>
						<div class="controls  control-row-auto">
							<select name="c_level" class="input">
								<option value="未融资">未融资</option>
								<option value="天使轮">天使轮</option>
								<option value="A轮">A轮</option>
								<option value="B轮">B轮</option>
								<option value="C轮">C轮</option>
								<option value="D轮级以上">D轮级以上</option>
								<option value="上市公司">上市公司</option>
								<option value="其他">其他</option>
							</select>&nbsp;&nbsp;
						</div>
					</div>
					<div class="control-group">
						<label class="control-label"><s>*</s>公司描述：</label>
						<div class="controls  control-row-auto">
							<textarea id="c_desc" name="c_desc" style="width: 310px; height: 150px;"></textarea>
						</div>
					</div>
					<div class="row" style="text-align: center;">
						<span style="color:red" id="warring"></span>
					</div>
					<div class="row actions-bar">
						<div class="form-actions span13 offset3">
							<button type="submit" class="button button-primary">保存</button>
							<button type="reset" class="button">重置</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<script>
  //上出图片，展示图片
  
  function checkall() {
        var name = $('#c_name').val();
        console.log(name);
        var sw = $('#warring');
        if(name==""){
            sw.text("公司名不能为空！");
            return false;
        }
        var desc=$('#c_desc').val();
        if(desc==""){
        	sw.text("公司描述不能为空！");
        	return false;
        }if(desc.length>=200){
        	sw.text("公司描述应该小于200字");
        	return false;
        }
        return true;
        
  }
    $(function() {
        $("#c_imag").change(function(){
            var objUrl = getObjectURL(this.files[0]) ;
            console.log("objUrl = "+objUrl) ;
            if (objUrl) {
                $("#showimg").attr("src", objUrl) ;
            }
            $.ajaxFileUpload({
                url:'userinf/uploadimg',
                secureuri:false,
                fileElementId:'c_imag',//file标签的id
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
    
    </script>
		<!-- script end -->
	</div>
</body>
</html>
