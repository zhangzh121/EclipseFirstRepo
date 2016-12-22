<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ext js 快速入门</title>
<!-- extjs的样式表 -->
<link type="text/css" href="extjs/resources/css/ext-all.css" rel="stylesheet" />
<!-- extjs的核心文件 
	先引入核心文件 ,再引入语言包-->
<script type="text/javascript" src="extjs/ext-all-debug.js"></script>
<script type="text/javascript" src="extjs/ext-lang-zh_CN.js"></script>
<script type="text/javascript">
	<%-- 下拉列表的实现--%>
	Ext.onReady(function(){
		// The data store containing the list of states
		var states = Ext.create('Ext.data.Store', {
		    fields: ['id', 'name'],
		    //fields: ['abbr', 'name'],
		    //静态数据
		    /* data : [
		        {"abbr":"AL", "name":"Alabama"},
		        {"abbr":"AK", "name":"Alaska"},
		        {"abbr":"AZ", "name":"Arizona"}
		        //...
		    ] */
		    //动态加载
		    proxy: {
		    	//异步请求
		        type: 'ajax',
		        //后台请求url地址
		        url : 'http://localhost:8080/jf-Exe/user/selectAll',
		        reader :{
		        	//解析返回数据格式
		        	type:'json'
		        }
		    },
		   // autoLoad: true
		    
		});
	
		// Create the combo box, attached to the states data store
		Ext.create('Ext.form.ComboBox', {
			//下拉框前面的文本
		    fieldLabel: 'Choose State',
		    store: states,
		    //本地的数据模型
		   /*  queryMode: 'local', */
		    displayField: 'name',
		    valueField: 'id',
		    renderTo: "Ext.form.ComboBox",
		    //监听选择并作出回应
		    listeners: {
		    	select : function(){
		    	alert(this.getValue());
		    }
		   }
		});
		
		
		////////////////////
		//使用Extjs 表格的生成1、静态表格生成、2、根据url远程加载生成表格
		var dataTable = Ext.create('Ext.data.Store', {
		    fields:['name', 'email', 'phone'],
		    data:{'items':[
		        { 'name': 'Lisa',  "email":"lisa@simpsons.com",  "phone":"555-111-1224"  },
		        { 'name': 'Bart',  "email":"bart@simpsons.com",  "phone":"555-222-1234" },
		        { 'name': 'Homer', "email":"home@simpsons.com",  "phone":"555-222-1244"  },
		        { 'name': 'Marge', "email":"marge@simpsons.com", "phone":"555-222-1254"  }
		    ]},
		    proxy: {
		        type: 'memory',
		        reader: {
		            type: 'json',
		            root: 'items'
		        }
		    }
		});
		
		Ext.create('Ext.grid.Panel', {
		    title: 'Simpsons',
		    store: dataTable,
		    columns: [
		        { header: 'Name',  dataIndex: 'name' },
		        { header: 'Email', dataIndex: 'email', flex: 1 },
		        { header: 'Phone', dataIndex: 'phone' }
		    ],
		    height: 200,
		    width: 400,
		    renderTo: 'form'
		});
		
		var dataTableDymai = Ext.create('Ext.data.Store', {
		    fields:['userId','userName', 'userGender', 'userAge'],
/* 		    fields:['编号','姓名', '性别', '年龄'], */
		  /*   data:{'items':[
		        { 'name': 'Lisa',  "email":"lisa@simpsons.com",  "phone":"555-111-1224"  },
		        { 'name': 'Bart',  "email":"bart@simpsons.com",  "phone":"555-222-1234" },
		        { 'name': 'Homer', "email":"home@simpsons.com",  "phone":"555-222-1244"  },
		        { 'name': 'Marge', "email":"marge@simpsons.com", "phone":"555-222-1254"  }
		    ]}, */
		    pageSize:5,
		    proxy: {
		        type: 'ajax',
		        url:'http://localhost:8080/jf-Exe/user/selectAllTable',
		        reader: {
		            type: 'json',
		            root: 'items',
		            totalProperty:'total'
		        }
		    },
		    autoLoad: true
		});
		
		Ext.create('Ext.grid.Panel', {
		    title: 'Simpsons',
		    store: dataTableDymai,
		    columns: [
		        { header: 'Id',  dataIndex: 'userId' },
		        { header: 'Name',  dataIndex: 'userName' },
		        { header: 'Gender', dataIndex: 'userGender', renderer:function(value){
		        	//通过renderer重新渲染列
		        	var str="";
		        	if(value=='1'){
		        		str='男';
		        	}else{
		        		str='女';
		        	}
		        	return str;
		        } },
		        { header: 'Age', dataIndex: 'userAge' }
		    ],
		    dockedItems: [{
		        xtype: 'pagingtoolbar',
		        store: dataTableDymai,   // GridPanel中使用的数据
		        dock: 'bottom',
		        displayInfo: true
		    }],
		    height: 200,
		    width: 400,
		    renderTo: 'formDym'
		});
		
	})
</script>
</head>
<body>
	<h1>测试Extjs的下拉框</h1>
	<div id="Ext.form.ComboBox"></div>
	<hr>
	<h1>测试Extjs静态的表格</h1>
	<div id="form"></div>
	<hr>
	<h1>测试Extjs动态加载的表格</h1>
	<div id="formDym"></div>
</body>
</html>