<%@page import="blog.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
		
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>个人信息管理</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="../css/style.css">
	<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="../plugins/bootstrap/js/bootstrap.min.js"></script>

</head>

<body class="hold-transition skin-red sidebar-mini" >
  <!-- .box-body -->
                
                    <div class="box-header with-border">
                        <h3 class="box-title">个人信息</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">                         
                                        <button type="button" class="btn btn-default" title="刷新" ><i class="fa fa-refresh"></i> 刷新</button>
                                    </div>
                                </div>
                            </div>
                            

			                  <!--数据列表-->
			                  <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
			                      <thead>
			                          <tr>
										  <th class="sorting_asc">用户ID</th>
									      <th class="sorting">用户名</th>
									      <th class="sorting">职业</th>
									      <th class="sorting">籍贯</th>
									      <th class="sorting">email</th>
									      <th class="sorting">手机号</th>								     						
					                      <th class="text-center">操作</th>
			                          </tr>
			                      </thead>
			                      <tbody>
			                          <tr>		                              
				                          <td>${user.user_id }</td>
									      <td>${user.user_name }</td>
									      <td>${user.user_work }</td>
									      <td>${user.user_place }</td>
									      <td>${user.user_email }</td>
									      <td>${user.user_phone }</td>                                  
		                                  <td class="text-center">                                          
		                                 	  <button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#editModal" onclick='editUser("${user.user_id }","${user.user_name }","${user.user_work }","${user.user_place }","${user.user_email }","${user.user_phone }")'>修改</button>                    
		                                  </td>
			                          </tr>
									 
			                      </tbody>
			                  </table>
			                  <!--数据列表/-->                        
							  
							 
                        </div>
                        <!-- 数据表格 /-->
                        
                        
                     </div>
                    <!-- /.box-body -->
      <!-- 编辑窗口 -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" >
	<div class="modal-content">
	   
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="myModalLabel">个人信息编辑</h3>
		</div>
		<div class="modal-body">							
			
			<table class="table table-bordered table-striped"  width="800px">
				
		      	<tr>
		      		<td>用户ID</td>
		      		<td><input  id="edit_id" disabled="disabled" class="form-control" placeholder="name" >  </td>
		      	</tr>
			    <tr>
		      		<td>用户名</td>
		      		<td><input  id="edit_name" class="form-control" placeholder="URL" >  </td>
		      	</tr>
		      	<tr>
		      		<td>职业</td>
		      		<td><input  id="edit_work" class="form-control" placeholder="name" >  </td>
		      	</tr>
			    <tr>
		      		<td>籍贯</td>
		      		<td><input  id="edit_place" class="form-control" placeholder="URL" >  </td>
		      	</tr>
		      	<tr>
		      		<td>email</td>
		      		<td><input  id="edit_email" class="form-control" placeholder="name" >  </td>
		      	</tr>
		      	<tr>
		      		<td>手机号</td>
		      		<td><input  id="edit_phone" class="form-control" placeholder="name" >  </td>
		      	</tr>
			 </table>				
			
		</div>
		<div class="modal-footer">						
			<button onclick="save()" class="btn btn-success" data-dismiss="modal" aria-hidden="true">保存</button>
			<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
		</div>
	
	  </div>
	</div>
</div>

<script type="text/javascript">  

//修改user
function editUser(id,name,work,place,email,phone) {
	$("#edit_id").val(id);
	$("#edit_name").val(name);
	$("#edit_work").val(work);
	$("#edit_place").val(place);
	$("#edit_email").val(email);
	$("#edit_phone").val(phone);
} 

//保存
function save() {

	$.ajax({
		type:"post",
		url:"/Blog/admin/UserServlet",
		data:{"id":$("#edit_id").val(),"name":$("#edit_name").val(),"work":$("#edit_work").val(),
			"place":$("#edit_place").val(),"email":$("#edit_email").val(),"phone":$("#edit_phone").val()}, 
		success:function(data) {
			var json = eval('(' + data + ')');
			
			alert(json.msg);	
		}
	});
} 
 
</script>   
</body>

</html>