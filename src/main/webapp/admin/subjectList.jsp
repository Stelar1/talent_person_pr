<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>考题列表</title>
	<link href="../assets/css/bs3/dpl.css" rel="stylesheet" type="text/css" />
	<link href="../assets/css/bs3/bui.css" rel="stylesheet" type="text/css" />
	<link href="../assets/css/page-min.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="container">
		
		<!-- 数据表格 -->
		<div class="search-grid-container">
			<div id="grid"></div>
		</div>
	</div>
	<!-- 隐藏的Dialog内容 -->
	<div id="content" class="hide">
		<form id="J_Form" class="form-horizontal">
			<input type="hidden" name="rid" value="1">
			<div class="row">
				<div class="control-group span8">
					<label class="control-label"><s>*</s>题&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;目：</label>
					<div class="controls">
						<input name="subjectTitle" type="text" data-rules="{required:true}" class="input-normal control-text"/>
					</div>
				</div>
			</div>
			
				
			<div class="row">
				<div class="control-group span8">
					<label class="control-label"><s>*</s>选项A：</label>
					<div class="controls">
						<input name="subjectOptionA" type="text" data-rules="{required:true}" class="input-normal control-text"/>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="control-group span8">
					<label class="control-label"><s>*</s>选项B：</label>
					<div class="controls">
						<input name="subjectOptionB" type="text" data-rules="{required:true}" class="input-normal control-text"/>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="control-group span8">
					<label class="control-label"><s>*</s>选项C：</label>
					<div class="controls">
						<input name="subjectOptionC" type="text" data-rules="{required:true}" class="input-normal control-text"/>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="control-group span8">
					<label class="control-label"><s>*</s>选项D：</label>
					<div class="controls">
						<input name="subjectOptionD" type="text" data-rules="{required:true}" class="input-normal control-text"/>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="control-group span8">
					<label class="control-label"><s>*</s>答案：</label>
					<div class="controls">
						<input name="subjectAnswer" type="text" data-rules="{required:true}" class="input-normal control-text"/>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="control-group span8">
					<label class="control-label"><s>*</s>解析：</label>
					<div class="controls">
						<input name="subjectParse" type="text" class="input-normal control-text"/>
					</div>
				</div>
			</div>
			
		</form>
	</div>
	<script type="text/javascript" src="../assets/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="../assets/js/bui-min.js"></script>
	<script type="text/javascript" src="../assets/js/config-min.js"></script>
	<script type="text/javascript">
	
	</script>
	<script type="text/javascript">
		BUI.use(['common/search','common/page'],
			function(Search) {
				
				// 表格列
				var columns = [{
							title : '编号（点击查看）',
							dataIndex : 'subjectID',
							width : 120,	
								 renderer : function(v) {
									return Search.createLink({
										id : 'detail' + v,
										title : '考题详细信息',
										text : v,
										href : '../subject/showSubjectById?subjectID=' + v
									}); 
								}
						}, {
							title : '题目',
							dataIndex : 'subjectTitle',
							width : 100
						}, 	{
							title : '选项A',
							dataIndex : 'subjectOptionA',
							width : 100
						},
						 {
							title : '选项B',
							dataIndex : 'subjectOptionB',
							width : 100
						},  {
							title : '选项C',
							dataIndex : 'subjectOptionC',
							width : 100
						},{
							title : '选项D',
							dataIndex : 'subjectOptionD',
							width : 100,
							
						}, {
							title : '答案',
							dataIndex : 'subjectAnswer',
							width : 100
						},  {
							title : '解析',
							dataIndex : 'subjectParse',
							width : 100
						},      
						 {
							title : '操作',
							width : 120,
							renderer : function(value, obj) {
								editStr = '<span class="grid-command btn-edit" title="编辑用户信息">编辑</span>', 
								delStr = '<span class="grid-command btn-del" title="删除用户信息"></span>';
								return editStr + delStr;
							}
						}];
				
				// 数据源对象 
				var store = Search.createStore('../subject/getSubjectPager', { // 分页查找
									proxy : {
										pageStart : 1, // 修改pageIndex-第几页
										method : 'POST'
									},
									autoSync : true, // 保存数据后，自动更新
									pageSize : 8 // 修改limit-单页多少条记录
							});
							
				// 弹出新建/编辑窗口
				var editing = new BUI.Grid.Plugins.DialogEditing({
					contentId : 'content', // 设置隐藏的Dialog内容
					autoSave : true, // 添加数据或者修改数据时，自动保存
					triggerCls : 'btn-edit',
					editor : {
						title : '考题',
						success : function() {
							var edtor = this;
							var form = edtor.get('form');
							var editType = editing.get('editType'); // add 或 edit
							if(editType == 'add') {
								url = '../subject/addSubject'; // 新增请求
							} else {
								url = '../subject/editSubject'; // 编辑请求
							}
							form.valid();
							if(form.isValid()) {
								// 表单异步提交
								form.ajaxSubmit({
									url : url,
									type : 'post',
									success : function(data) {
										if(data.code == 0) { // 成功
											if(editType == 'add') {
												BUI.Message.Alert("添加成功！");
											} else {
												BUI.Message.Alert("修改成功！");
											}
											editing.cancel(); // 隐藏弹出层
											search.load(); // 刷新表格
										} else {
											BUI.Message.Alert(data.message);
										}
									},
									error : function() {
										BUI.Message.Alert("请求失败，请重试！");
									}
								});
							}
						}
					}
				});
				
				// 配置列信息及工具栏
				var gridCfg = Search.createGridCfg(columns, {
									tbar : {
										// 工具栏的项
										items : [{
													// xclass : 'bar-item-button' // 按钮(bar-item-button)-默认、 文本(bar-item-text)、分隔符(bar-item-separator)或自定义项
													text : '<i class="icon-plus"></i>添加试题',
													btnCls : 'button button-small',
													handler : addFunction
												},
												{
													text : '<i class="icon-accout"></i>查看试题',
													btnCls : 'button button-small',
													handler : showFunction
												},{
													text : '<i class="icon-remove"></i>删除',
													btnCls : 'button button-small',
													handler : delFunction
												} ]
									}, plugins : [
											editing,
											BUI.Grid.Plugins.CheckSelection, // 选择行插件
											BUI.Grid.Plugins.AutoFit ] // 自适应宽度
								});

				var search = new Search({
					/* formId : 'searchForm', */ // 表单的id，默认为：searchForm
					/* btnId : 'btnSearch', */ // 提交按钮的id，默认为：btnSearch
					/* gridId : 'grid', */ // 表格容器的id，默认为：grid
					/* autoSearch : true, */ // 页面显示后，是否自动进行查询，默认为：true
					store : store,
					gridCfg : gridCfg
					/* formCfg : 表单的配置项 */
				});
				
				// 获取表格控件
				var grid = search.get('grid');
				
				// 新建操作
				function addFunction() {
					
						var newData = {
								isNew : true
							};
							editing.add(newData);
					
					
				}
				
				 // 编辑操作
				function editFunction() {
					
						// 只能选择一行编辑
							var selections = grid.getSelection();
							
							if(selections.length == 1) {
								// 弹窗编辑
								editing.edit(selections[0]);
							} else {
								BUI.Message.Alert("请选择一个要编辑的行！");
							}
					
				} 
				
				//显示详细页面操作
				function showFunction(){
					// 只能选择一行编辑
					var selections = grid.getSelection();
					if(selections.length == 1) {
						//BUI.Message.Alert(selections[0]);
						//console.log(selections[0].rid);
						window.location.href="../subject/showSubjectById?subjectID="+selections[0].subjectID;
					} else {
						BUI.Message.Alert("请选择一个要查看的行！");
					}
				}
				
				// 删除操作 -- 支持批量删除
				function delFunction() {
					// 获取选择项
					var selections = grid.getSelection();
					if(selections.length > 0) {
						// 删除
						delItems(selections);
					} else {
						BUI.Message.Alert("请选择要删除的数据！");
					}
				}
				
				
				
				// 执行删除的方法
				function delItems(items) {
					var subjectIDs = [];
					BUI.each(items, function(item) {
						// item即为每一行的一条用户信息
						subjectIDs.push(item.subjectID);
					});
					if(subjectIDs.length) {
						BUI.Message.Confirm('确认要删除选中的记录吗？', function() {
							// 点击确认删除，发送删除的请求到后台，删除数据库数据
							$.ajax({
								url : '../subject/delSubject',
								data : {subjectIDs : subjectIDs},
								dataType : 'json',
								success : function(data) {
									if(data.code == 0) { // 删除成功
										BUI.Message.Alert("删除成功！");
										search.load(true); // 重新加载页码
									} else {
										BUI.Message.Alert(data.message);
									}
								}
							});
						}, 'question');
					}
				}
				
				
				
			});
	</script>
<body>
</html>
