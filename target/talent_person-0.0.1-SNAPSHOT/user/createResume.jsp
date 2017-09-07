<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <script type="text/javascript" src="../res/js/jquery-1.11.3.min.js"></script>
	<link href="../res/css/dpl.css" rel="stylesheet" type="text/css" />
	<link href="../res/css/bui.css" rel="stylesheet" type="text/css" />


	<link href="../res/css/head.css" rel="stylesheet" type="text/css" />
	<link href="../res/css/userinfCommon.css" rel="stylesheet" type="text/css">

	<script src="../res/js/ajaxfileupload.js"></script>
	<script src="http://g.alicdn.com/bui/seajs/2.3.0/sea.js"></script>
	<script src="http://g.alicdn.com/bui/bui/1.1.21/config.js"></script>
    
    <title>创建简历</title>
	<style>
	    /*教育经历的样式*/

        .title{
            margin-top:20px;
            margin-left:10px;
        }

        .title h2{
            display:inline-block;
            background-color:#414DA7;
            height:35px;
            line-height:35px;
            font-size:16px;
            font-weight:bold;
            color:#ffffff;
            border-top-left-radius:10%;
            border-top-right-radius:10%;
        }

        .title hr{
            margin-top:0px;
            border-top:1px solid #414DA7;
        }

        .title > a{
            float:right;
            margin-right:5px;
            margin-top:15px;
            background-color:#414DA7;
            color:white;
            font-size:16px;
            padding:2px;
            border-radius:10%;
            text-decoration:none;
        }

        .edudesc{
            margin:10px 25px;
        }

        p{
            margin:0px;
        }

        .edudesc p:first-child, p:nth-child(2), p:nth-child(3){
            display:inline-block;
            padding:5px 15px;
            font-size:16px;
        }

        input.input-small, select.input-small, textarea.input-small, select.input-small{
            width:57px;
        }

        .bui-dialog{
            border-style:none;
            background-color:white;
        }

        .bui-dialog .bui-stdmod-header{
            background-color:#414DA7;
        }

        .bui-dialog .bui-stdmod-body{
            border-style:none;
            background-color:white;

        }

        .button-primary{
            background:#414DA7;
        }

        .button-primary:hover{
            background:#0a6a6a;
        }

        .row{
            margin-top:0px;
            margin-bottom:15px;
        }

        .bui-dialog .bui-stdmod-footer{
            margin-bottom:20px;
        }

        #tech{
            margin-bottom:20px;
        }

        .tech{
            display:inline-block;
            margin-left:50px;
            margin-bottom:10px;
            width:100%;
        }

        .tech p:first-child{
            font-size:16px;
            font-weight:bolder;
        }

        .tech p{
            padding:0px 10px;
            display:inline-block;
        }
        /*项目经验样式*/
        .pro_desc{
            width: 500px;
            margin-left: 40px;
            font-size: 14px;
            line-height: 24px;
            margin-top:15px;
        }
        .tech{
            margin-top:10px;
        }
        .pre_desc{
            width: 520px;
            margin-left: 70px;
        }
        .pre_desc p{
            font-size: 14px;
            line-height: 22px;
        }
        #body a{
            text-decoration:none;
            cursor:pointer;
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
    <a href="../index.jsp" class="mytitle" style="float:left;text-decoration:none">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首页</a>
    <a href="../regist.jsp" id="denglu" class="mytitle">注册</a><span style="float:right;" class="mytitle">|&nbsp;&nbsp;</span>
    <a href="../login.jsp" id="zhuce" class="mytitle">登录</a>
    <a href="../user/showUserInf.jsp" id="user" class="mytitle"></a><a href="user/loginout" id="out" class="mytitle">退出</a>
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
        <div id="body" class="panel span17">
            <div class="panel-header" style="background:#414DA7;color:white;">
                <p>信息展示</p>
            </div>
            <!--以下都是内容区-->
            <!-- 学历 -->
            <div id="edu" class="title">
                <h2>教育经历</h2>
                <a href="javascript:showAddEdu();" style="float:right">添加</a>
                <hr/>
            </div>
            <!-- 学历结束 -->
            <!--专业技能 -->
            <div id="tech" class="title">
                <h2>专业技能</h2>
                <a href="javascript:addtech();" style="float:right">添加</a>
                <hr/>
            </div>
            <!--专业技能 -->
            <div id="pro" class="title">
                <h2>项目经验</h2>
                <a href="javascript:addpro();" style="float:right">添加</a>
                <hr/>
            </div>
            <!--项目经验结束-->
            <!--个人描述-->
            <div id="per" class="title" style="margin-bottom:30px">
                <h2>个人介绍</h2>
                <a href="javascript: perShow();" style="float:right">修改</a>
                <hr/>
                <div class="pre_desc">
                    <p id="preContent">这个人很懒，什么都没说。</p>
                </div>
            </div>
            <!--个人描述结束-->
            <!--上传附件-->
            <div style="background-color: #414DA7;padding:10px 100px;">
           		 <!-- 
                <span style="font-size:14px;color:white">添加附件：</span>
                <form method="post" enctype="multipart/form-data">
					<input type="file" name="file" id="file">
				</form>
				 -->
                <button onclick="save();">保存修改</button>
            </div>
            <!--上传结束-->
            <!--内容区结束-->
        </div>
    </div>
</div>
<div>
    <!--学历的弹出框-->
    <div id="edu_content" style="visibility:hidden">
        <div class="form-horizontal">
            <div class="row">
                <div class="control-group span24">
                    <label class="control-label">时&nbsp;间&nbsp;段：</label>
                    <div class="controls">
                        <input id="fdate" class="input-small control-text" type="text"><label>&nbsp;-&nbsp;</label>
                        <input id="tdate" class="input-small control-text" type="text">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="control-group span24">
                    <label class="control-label">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点：</label>
                    <div class="controls">
                        <input id="place" type="text" class="input-normal control-text">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="control-group span24">
                    <label class="control-label">学校名称：</label>
                    <div class="controls">
                        <input id="schoolName" type="text" class="input-normal control-text">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--学历的弹出框结束-->
    <!--添加专业技能-->
    <div id="major_content" style="visibility:hidden">
        <div class="form-horizontal">
            <div class="row">
                <div class="control-group span24" style="margin-bottom:20px">
                    <div class="controls">
                        <select id="option" class="input-small">
                            <option value="精通">精通</option>
                            <option value="熟悉">熟悉</option>
                            <option value="了解">了解</option>
                        </select>
                        <input id="content" type="text" class="input-normal control-text">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--添加专业技能结束-->
    <!--项目经验-->
    <div id="pro_content" style="visibility:hidden" class="form-horizontal well">
        <div class="control-group">
            <label class="control-label">项目名称：</label>
            <div class="controls">
                <select id="protype"  style="width:100px;">
                    <option value="集体项目">集体项目</option>
                    <option value="个人项目">个人项目</option>
                </select>
                <input id="proname" placeholder="项目名称" class="control-text" style="width:175px;" type="text">
            </div>
        </div>
        <div class="control-group" style="margin-top:20px">
            <label class="control-label">项目描述：</label>
            <div class="controls  control-row24">
                <textarea id="prodesc" style="width:280px;height:120px"></textarea>
            </div>
        </div>
    </div>
    <!--项目经验结束-->
    <!--个人描述界面-->
    <div id="pre_content" style="visibility:hidden">
        <h2 style="text-align:center">自我评价</h2><textarea id="perdesc" style="width:280px;height:120px"></textarea>
    </div>
    <!--个人描述界面结束-->
</div>

</body>
<!--上传简历-->
<script>
    function savedata(json) {
    	console.log(json);
        $.ajax({
            type: 'POST',
            url: "../resume/upload",
            dataType: 'text',
            data: {"json":json},
            success: function(data){
                if(data=="ok"){
                    alert("保存成功！");
                }else if(data=="error") {
                    alert("保存失败！");
                }
            },
            error: function(xhr, type){
                alert('数据加载失败');
            }
        });
    }
    //获得教育经历
    function getEdu() {
        //存放教育经历
        var edus=[],geteud=null;  
        //存放长度
        var edulen;
        //获得学历信息
        var eduElement=$('#edu').children("div.edudesc");
        edulen = eduElement.length;
        var element = null;
        for(var i=0;i<edulen;i++){
            geteud = new Object();
            element = eduElement.eq(i);
            geteud.data = element.children("p").eq(0).text();
            geteud.place= element.children("p").eq(1).text();
            geteud.shoolname = element.children("p").eq(2).text();
            edus[i]=geteud;
        }
        console.log(edus);
        return edus;
    }
    //获得专业技能
    function getTech() {
        //存放专业技能经历
        var techs=[],gettech=null;
        //存放长度
        var techlen;
        //获得学历信息
        var techElement=$('#tech').children("div.tech");
        techlen = techElement.length;
        var element = null;
        for(var i=0;i<techlen;i++){
            gettech = new Object();
            element = techElement.eq(i);
            gettech.type = element.children("p").eq(0).text();
            gettech.content= element.children("p").eq(1).text();
            techs[i]=gettech;
        }
        console.log(gettech);
        return techs;
    }
    //得到项目经验
    function getPro() {
        //存放专业技能经历
        var pros=[],getpro=null;
        //存放长度
        var prolen;
        //获得学历信息
        var proElement=$('#pro').children("div.pro");
        prolen = proElement.length;
        var element = null;
        for(var i=0;i<prolen;i++){
            getpro = new Object();
            element = proElement.eq(i);
            getpro.name = element.children("p").eq(0).text();
            getpro.type= element.children("p").eq(1).text();
            getpro.content=element.find("span").text();
            pros[i]=getpro;
        }
        console.log(getpro);
        return pros;
    }
    //得到个人介绍
    function getpredesc() {
        return $('#preContent').text();
    }
    //上传文件
    function save(){
        var data = new Object();
        data.edu=getEdu();
        data.tech=getTech();
        data.pro=getPro();
        data.desc=getpredesc();
        savedata(JSON.stringify(data));
        return;
        if($('#file').val()==""){
            savedata(JSON.stringify(data));
        }else{
        	/* 
        	console.log("上传文件");
            $.ajaxFileUpload({
                url:'../resume/uploadfile',
                secureuri:false,
                fileElementId:'file',//file标签的id
                dataType: 'text',//返回数据的类型
                success: function (data, status) {
                    //alert(data);
                    console.log(data);
                    if(data=="error"){
                        alert("文件上传出错！");
                        return false;
                    }else{
                    	console.log("上传文件成功！");
                        data.filePath=data;
                        console.log(JSON.stringify(data));
                        savedata(JSON.stringify(data));
                    }
                },
                error: function (data, status, e) {
                    alert("文件上传出错！");
                    console.log(e);
                }
            });
            */
        	/* 
        	var fd = new FormData();
        	fd.append( "file", $("#file").files[0]);
        	 $.ajax({
        	      type: "POST",
        	      url: "../resume/uploadfile",
        	      data: fd,
        	      contentType: false,
        	      processData: false,
        	      cache: false,
      			  success:function (result) {                        
        	      		console.log(result);
        	      },
        	      error: function (result) {
        	          console.log(result.responseText);
        	      }
        	 }); 
        	 */
        }
    }
</script>
<!--上传简历结束-->
<!--简历弹出框-->
<script type="text/javascript">
    var edudialog;
    var _eduobj = null;//标志是否是修改
    var educf = false;
    BUI.use(['bui/overlay','bui/form'],function(Overlay) {
        var ft = $('#fdate');
        var tt = $('#tdate');
        var pc = $('#place');
        var sn = $('#schoolName');
        edudialog = new Overlay.Dialog({
            title:'添加教育经历',
            width:400,
            height:150,
            contentId:'edu_content',
            success:function() {
                addEdu(ft.val(),tt.val(),pc.val(),sn.val());
                $('#fdate').val("");
                $('#tdate').val("");
                $('#place').val("");
                $('#schoolName').val("");
                if(educf){
                    delte(_eduobj);
                    _eduobj=null;
                    educf=false;
                }
                this.close();
            },
            cancel:function() {
                _eduobj=null;
                ft.val("");
                tt.val("");
                pc.val("");
                sn.val("");
            }
        });
        // dialog.show();
    });
    //点击编辑，弹出添加栏
    function showAddEdu() {
        $('#edu_content').show();
        edudialog.show();
    }
    //将信息添加到主体中
    function addEdu(ft,tt,pc,sn) {
        var html = "<div class='edudesc'><p>" + ft + "至" + tt + "</p><p>" + pc + "</p><p>" + sn + "</p>" +
                "<a onclick=\"editEdu(this)\">编辑</a>&nbsp;&nbsp;<a onclick=\"delte(this);\">删除</a></div>";
        $('#edu').append(html);
    }
    //删除信息
    //该方法在页面加载完后事件就绑定完，所以在后面添加的节点，就不具有该事件
    //    $(function() {
    //        $('div.edudesc a:last-child').on("click",function() {
    //            var l = $(this).parent();
    //            l.remove();
    //        });
    //    });
    function delte(obj) {
        var f = $(obj).parent();
        f.remove();
    }
//    修改信息
    function editEdu(obj){
        _eduobj = obj;
        educf = true;
        var f = $(obj).parent().children("p");
        var sp = f.eq(0).text();
        $('#fdate').val(sp.split("至")[0]);
        $('#tdate').val(sp.split("至")[1]);
        $('#place').val(f.eq(1).text());
        $('#schoolName').val(f.eq(2).text());
        edudialog.show();
    }
</script>
<!--简历弹出框结束-->
<!--专业技能-->
<script type="text/javascript">
    var techdialog,_techobj=null,techcf=false;
    BUI.use('bui/overlay',function(Overlay) {
        techdialog = new Overlay.Dialog({
            title:'添加技能',
            width:260,
            height:40,
            contentId:'major_content',
            success:function() {
                var t = $('#option');
                var c = $('#content');
                var html = "<div class='tech'><p>" + t.val() + ":</p><P>" + c.val() + "</P>" +
                        "<a onclick=\"edittech(this)\">编辑</a>&nbsp;&nbsp;<a onclick=\"delte(this);\">删除</a><br/></div>";
                $('#tech').append(html);
                if(techcf){
                    delte(_techobj);
                    _techobj=null;
                    techcf=false;
                }
                this.close();
                c.val("");
            },
            cancel:function() {
                _techobj=null;
                $('#content').val("");
            }
        });
    });
    function addtech() {
        techdialog.show();
    }
    function edittech(obj) {
        _techobj = obj;
        var f = $(obj).parent().children("p");
        //$('#option').text(f.eq(0).text().split(":")[1]);
        $('#content').val(f.eq(1).text());
        techcf=true;
        techdialog.show();
    }
</script>
<!--专业技能结束-->
<!--项目经验-->
<script type="text/javascript">
    var prodialog,_proobj=null,procf=false;
    BUI.use('bui/overlay',function(Overlay) {
        prodialog = new Overlay.Dialog({
            title:'添加项目',
            width:340,
            height:260,
            contentId:'pro_content',
            success:function() {
                var pt = $('#protype');
                var pn = $('#proname');
                var pd = $('#prodesc');
                var c= huanhang(pd.val());
                var html = "<div class='pro tech'><p>"+pn.val()+"</p><P>"+pt.val()+"</P><a onclick=\"editPro(this)\">编辑</a>&nbsp;&nbsp;"
                    +"<a onclick=\"delte(this);\">删除</a><hr><div class='pro_desc'><span>"+c+"</span></div></div>";
                $('#pro').append(html);
                if(procf){
                    delte(_proobj);
                    _proobj=null;
                    procf=false;
                }
                this.close();
                pt.val("");
                pn.val("");
                pd.val("");
            },
            cancel:function() {
                _proobj=null;
               $('#protype').val("");
               $('#proname').val("");
               $('#prodesc').val("");
            }
        });
    });
    function addpro() {
        prodialog.show();
    }
    function editPro(obj) {
        _proobj = obj;
        var f = $(obj).parent().children("p").eq(0).text();
        $('#proname').val(f);
        $('#prodesc').val($(obj).parent().find("span").text());
        procf=true;
        prodialog.show();
    }
//    textarea的内容直接添加到页面不会有换行，需要将\n换为<br>
    function huanhang(str) {
        var reg=new RegExp("\n","g");
        return str.replace(reg,"<br/>");
    }
</script>
<!--项目经验结束-->
<!-- 个人描述 -->
<script type="text/javascript">
    var perdialog;
    BUI.use('bui/overlay',function(Overlay){
        perdialog  = new Overlay.Dialog({
            title:'模态窗口',
            width:340,
            height:200,
            contentId:'pre_content',
            success:function () {
                var con = huanhang($('#perdesc').val());
                $('#preContent').html(con);
                perdialog.close();
                $('#perdesc').val("");
            },
            cancel:function() {
                $('#perdesc').val("");
            }
        });
    });
    function perShow() {
        var t = $('#preContent').text();
        $("#perdesc").val(t);
        perdialog.show();
    }
</script>
<!-- 个人描述结束 -->
<!-- 导航栏 -->
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
                     {id:'code',text:'查看信息',href:'../user/showUserInf.jsp'},
                     {id:'main-menu',text:'修改信息',href:'../user/addUserinf.jsp'}
                ]
                },
                {
                    id:'2',text:'简历管理',expanded:true,children:[
                    {id:'quick',text:'修改简历',href:'../user/createResume.jsp'},
                    {id:'quick1',text:'预览简历',href:'../user/showresume.jsp'},
                    {id:'quick2',text:'简历投送进度',href:'../user/RecruitInf.jsp'}

                ]
                },
                {
                    text:'安全中心',expanded:true,children:[
                    {id:'resource',text:'修改密码',href:'../user/updatePwd.jsp'},
                    {id:'loader',text:'修改密保',href:'../user/userSafe.jsp'}
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
<!-- 导航栏结束 -->
</html>