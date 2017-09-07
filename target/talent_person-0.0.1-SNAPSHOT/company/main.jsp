<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta charset="UTF-8">
	<title>人才服务平台网</title>
	<!-- 引入BUI所需的外部CSS样式 -->
	<link href="../assets/css/bs3/dpl.css" rel="stylesheet" type="text/css" />
	<link href="../assets/css/bs3/bui.css" rel="stylesheet" type="text/css" />
	<link href="../assets/css/main-min.css" rel="stylesheet" type="text/css" />

</head>

<body>
	<!-- 系统页面的头部内容 -->
	<div class="header">
		<!-- 头部左侧title部分 -->
		<div class="dl-title">
			<a href="#" title="BUI">
				<span class="lp-title-port">人才服务平台</span>
				<span class="dl-title-text">人才服务平台</span>
			</a>
		</div>
		<!-- 头部右侧用户信息及功能 -->
		<div class="dl-log">
			欢迎您，
			<span class="dl-log-user"><%=request.getSession().getAttribute("email") %></span>
			<a href="../company/loginout" title="退出系统" class="dl-log-quit">[退出]</a>
			<a  title="人才服务平台" target="_blank" class="dl-log-quit">人才服务平台</a>
		</div>
	</div>

	<!-- 系统页面的正文内容 -->
	<div class="content">
		<div class="dl-main-nav">
			<!-- 背景样式 -->
			<div class="dl-inform">
				<div class="dl-inform-title"></div>
			</div>
			<!-- 顶部导航 -->
			<ul id="J_Nav" class="nav-list ks-clear">
				<li class="nav-item dl-selected">
					<div class="nav-item-inner nav-home">首页</div>
				</li>
				
			</ul>
		</div>
		<ul id="J_NavContent" class="dl-tab-conten"></ul>
	</div>

	<!-- 系统页面的底部信息 -->
	<div style="text-align:center">
		<p>
			<a  target="_blank"></a>
		</p>
	</div>

	<!-- 引入BUI所需的外部JS文件 -->
	<script type="text/javascript" src="../assets/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="../assets/js/bui.js"></script>
	<script type="text/javascript" src="../assets/js/config.js"></script>
	<script type="text/javascript">
	
	/*引入框架页首页代码*/
		BUI.use('common/main', function() {
			// 菜单模块，按顺序对应导航菜单
			var config = [{
				id : 'main',
				// homePage : 'grid',
				// 二级菜单的集合
				menu : [{
					text : '招贤',
					collapsed: true,
					items : [
								{id:'index', text:'搜索人才', href:'../company/selectTalent.html', closeable : false}
							]
				}, {
					text : '招聘信息',
					collapsed: true,
					// 三级菜单集合
					items : [
						{id:'recruit', text:'招聘信息列表', href:'../company/recruitList.jsp'},

					]
				}, {
					text : '简历',
					collapsed: true,
					// 三级菜单集合
					items : [
						{id:'recruit', text:'简历管理', href:'../company/comresume.html'},

					]
				},{
					text : '完善公司信息',
					collapsed: true,
					items : [
						{id:'company', text:'完善公司信息', href:'../company/addcom.jsp'},
						{id:'showcompany', text:'查看公司信息', href:'../company/showCompany.jsp'},
					]
				},]
			}
			
			];
			// 初始化主页菜单
			new PageUtil.MainPage({
				modulesConfig : config
			});
		});

	</script>

</body>
</html>