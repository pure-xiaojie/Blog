<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="blog.service.LinkService" %>		
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>笃行</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="../css/style.css">
	<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="../plugins/bootstrap/js/bootstrap.min.js"></script>
    
</head>
<%
	//初始化友链
	LinkService link = LinkService.getInstance();
	List link_list =  link.getLinkList();
%>

<body class="hold-transition skin-red sidebar-mini">
  <!-- .box-body -->
                
                    <div class="box-header with-border">
                        <h3 class="box-title">友链管理</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default" title="新建" data-toggle="modal" data-target="#editModal" ><i class="fa fa-file-o"></i> 新建</button>
                                        <button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新</button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-tools pull-right">
                                <div class="has-feedback">
							                                  
                                </div>
                            </div>
                            <!--工具栏/-->

			                  <!--数据列表-->
			                  <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
			                      <thead>
			                          <tr>
			                        	 <th class="sorting_asc">友链ID</th>
									      <th class="sorting">友链name</th>   
									      <th class="sorting">URL</th>		
									      <th class="sorting">图片</th>	
									      <th class="sorting">操作</th>	
			                          </tr>
			                      </thead>
			                      <tbody>
			                      	
			                      	<c:forEach var="link"   items="<%=link_list %>">
			                          <tr valign="middle">
			          					  <td>${link.id}</td>
									      <td>${link.name}</td>
									      <td>${link.url}</td>
									      <td>
									      	<img src="../img/${link.image}" width="100px" height="50px">
									      </td>
									      									     								     
		                                  <td class="text-center" >                                           
		                                 	  <a type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#editModal" onclick="editLink(${link.id})">修改</a> 
		                                 	  <a type="button" class="btn bg-olive btn-xs" data-target="#editModal" onclick="deleteLink(${link.id})">删除</a>                                          
		                                  </td>
			                          </tr>
			                         </c:forEach>
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
			<h3 id="myModalLabel">友链编辑</h3>
		</div>
		<div class="modal-body">							
			
			<table class="table table-bordered table-striped"  width="800px">
				
		      	<tr>
		      		<td>友链name</td>
		      		<td><input  id="edit_linkName" class="form-control" placeholder="name" >  </td>
		      	</tr>
			    <tr>
		      		<td>友链URL</td>
		      		<td><input  id="edit_linkUrl" class="form-control" placeholder="URL" >  </td>
		      	</tr>	
		      			      	
		      	<tr>
		      		<td>友链头像</td>
		      		<td>
						<table>
							<tr>
								<td>
								<input type="file" id="file" />				                
					               
					            </td>
								
							</tr>						
						</table>
		      		</td>
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
//修改友链
var updateId = 0;

function editLink(id) {
	//alert(id);
	updateId = id;
	$.ajax({
		type:"get",
		url:"/Blog/LinkServlet",
		data:{"id":id,"methods":"init"}, 
		success:function(data) {
			var json = eval('(' + data + ')');
			$("#edit_linkName").val(json.name);
			$("#edit_linkUrl").val(json.url);
			$("#file").val(json.image); 
			//alert(data);	
		}
	});
} 

//保存
function save() {
	//alert($("#edit_linkName").val());
	
    var linkName = $("#edit_linkName").val();
    var linkUrl = $("#edit_linkUrl").val();
    var linkImage = $("#file").val();
    
	$.ajax({
		type:"post",
		url:"/Blog/LinkServlet",
		data:{"id":updateId,"linkName":linkName,"linkUrl":linkUrl,"linkImage":linkImage}, 
		success:function(data) {
			var json = eval('(' + data + ')');
			
			alert(json.result);	
		}
	});
} 

//删除友链
function deleteLink(id) {
	$.ajax({
		type:"get",
		url:"/Blog/LinkServlet",
		data:{"id":id,"methods":"delete"}, 
		success:function(data) {
			var json = eval('(' + data + ')');
			alert(json.result);	
		}
	});
} 
</script>  
</body>

</html>