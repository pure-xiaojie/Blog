<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="blog.service.TagService" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>标签管理</title>
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="../css/style.css">
	<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="../plugins/bootstrap/js/bootstrap.min.js"></script>
    
</head>

<%
	//传所有的标签
	TagService ts = TagService.getInstance();
	List list = ts.getAllTags();
%>
<body class="hold-transition skin-red sidebar-mini" >
  <!-- .box-body -->                
                    <div class="box-header with-border">
                        <h3 class="box-title">标签管理</h3>
                    </div>
                    <div class="box-body">
                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                      
                                        <button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"><i class="fa fa-refresh"></i> 刷新</button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-tools pull-right">
                                <div class="has-feedback">
							                    规格名称：<input  >									
									<button class="btn btn-default" >查询</button>                                    
                                </div>
                            </div>
                            <!--工具栏/-->
			                  <!--数据列表-->
			                  <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
			                      <thead>
			                          <tr>
			                             
										  <th class="sorting_asc">文章ID</th>
									      <th class="sorting">标签名</th>									     												
					                      <th class="text-center">操作</th>
			                          </tr>
			                      </thead>
			                      <tbody>
			                      	  <c:forEach var="tag" items="<%= list %>">
			                          <tr >		                              
				                          <td>${tag.id }</td>
									      <td>${tag.tag }</td>
		                                  <td class="text-center">                                           
		                                 	  <button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#editModal" onclick='editTag("${tag.id }","${tag.tag }")'>修改</button> 
		                                 	  <button type="button" class="btn bg-olive btn-xs" data-target="#editModal" onclick='deleteTag("${tag.id }","${tag.tag }")'>删除</button>                                               
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
			<h3 id="myModalLabel">标签编辑</h3>
		</div>
		<div class="modal-body">							
			
			<table class="table table-bordered table-striped"  width="800px">
				
		      	<tr>
		      		<td>id</td>
		      		<td><input  id="edit_id" disabled="disabled" class="form-control" placeholder="id" >  </td>
		      	</tr>
			    <tr>
		      		<td>tag</td>
		      		<td><input  id="edit_tagName" class="form-control" placeholder="tag" >  </td>
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

var oldTag;

//修改tag
function editTag(id,tag) {
	$("#edit_id").val(id);
	$("#edit_tagName").val(tag);
	oldTag = tag;
} 

//保存
function save() {
	//alert($("#edit_linkName").val());
	
    var tagId= $("#edit_id").val();
    var tagName = $("#edit_tagName").val();
    
	$.ajax({
		type:"post",
		url:"/Blog/TagsServlet",
		data:{"id":tagId,"newTag":tagName,"oldTag":oldTag}, 
		success:function(data) {
			var json = eval('(' + data + ')');
			
			alert(json.result);	
		}
	});
} 

//删除友链
function deleteTag(id,tag) {
	$.ajax({
		type:"get",
		url:"/Blog/TagsServlet",
		data:{"id":id,"tag":tag}, 
		success:function(data) {
			var json = eval('(' + data + ')');
			alert(json.result);	
		}
	});
} 
</script> 
</body>

</html>