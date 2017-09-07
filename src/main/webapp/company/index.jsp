<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <meta charset="UTF-8">
	<title>可编辑表格</title>
	<link href="assets/css/bs3/dpl.css" rel="stylesheet" type="text/css" />
	<link href="assets/css/bs3/bui.css" rel="stylesheet" type="text/css" />
	<link href="assets/css/page-min.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="container">
		<div id="grid"></div><br/>
		<div>
			<button id="btnSave" class="button button-primary">提交</button>
		</div><br/>
		<hr>
		<h2>提交结果</h2>
		<div class="row">
			<div id="log" class="well span17"></div>
		</div>
	</div>
	<script type="text/javascript" src="assets/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="assets/js/bui-min.js"></script>
	<script type="text/javascript" src="assets/js/config-min.js"></script>
	<script type="text/javascript">
		BUI.use('common/page');
		BUI.use(['bui/grid', 'bui/data'], function(Grid, Data) {
			// 列配置
			var columns = [{
				title : '学校名称',
				dataIndex : 'school',
				editor : {
					xtype : 'text', // 编辑器
					rules : {
						required : true
					}
				}
			}, {
				title : '入学日期',
				dataIndex : 'enter',
				editor : {
					xtype : 'date', // 编辑器
					rules : {
						required : true
					}
				},
				renderer : Grid.Format.dateRenderer
			}, {
				title : '毕业日期',
				dataIndex : 'outter',
				editor : {
					xtype : 'date',
					rules : {
						required : true
					},
					validator : function(value, obj) {
						if (obj.enter && value && obj.enter > value) {
							return '毕业日期不能早于入学日期！'
						}
					}
				},
				renderer : Grid.Format.dateRenderer
			}, {
				title : '备注',
				dataIndex : 'memo',
				width : 200,
				editor : {
					xtype : 'text'
				}
			}];
			//默认的数据
			var data = [{
				id : '111',
				school : '厦门第一中学',
				enter : 936144000000,
				outter : 999561600000,
				memo : '表现优异，多次评为三好学生'
			}, {
				id : '112',
				school : '双十中学',
				enter : 999561600000,
				outter : 1057017600000,
				memo : '表现优异，多次评为三好学生'
			}];
			// 数据源配置
			var store = new Data.Store({
				data : data
			});
			// 可编辑单元格插件初始化
			var editing = new Grid.Plugins.CellEditing();
			// 表格初始化
			var grid = new Grid.Grid({
						render : '#grid',
						columns : columns,
						width : 700,
						forceFit : true,
						store : store,
						plugins : [Grid.Plugins.CheckSelection, editing],
						tbar : {
							items : [{
								btnCls : 'button button-small',
								text : '<i class="icon-plus"></i>添加',
								listeners : {
									'click' : addFunction
								}
							}, {
								btnCls : 'button button-small',
								text : '<i class="icon-remove"></i>删除',
								listeners : {
									'click' : delFunction
								}
							}]
						}

					});
			// 渲染表格
			grid.render();
			// 添加操作
			function addFunction() {
				var newData = {
					school : '请输入学校名称'
				};
				store.add(newData);
				editing.edit(newData, 'school'); //添加记录后，直接编辑列
			}
			// 删除选中行
			function delFunction() {
				var selections = grid.getSelection();
				if(selections.length > 0) {
					store.remove(selections);
				} else {
					BUI.Message.Alert('请选择要删除的数据！');
				}
			}
			// 提交结果显示
			$('#btnSave').on('click', function() {
				if (editing.isValid()) {
					var records = store.getResult();
					$('#log').text(BUI.JSON.stringify(records));
				}
			});
		});
	</script>
<body>
</html>
