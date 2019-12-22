<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="blog.service.CommentService" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>评论管理</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="../css/style.css">
	<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="../plugins/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../plugins/select2/select2.css" />
    <link rel="stylesheet" href="../plugins/select2/select2-bootstrap.css" />
    <script src="../plugins/select2/select2.min.js" type="text/javascript"></script>

</head>

<%
	//获取评论
	CommentService as =  CommentService.getInstance();
	List commentList = as.getComment();
%>
<body class="hold-transition skin-red sidebar-mini" >
  <!-- .box-body -->
                
                    <div class="box-header with-border">
                        <h3 class="box-title">评论管理</h3>
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
                   
			                  <!--数据列表-->
			                  <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
			                      <thead>
			                          <tr>
			                            
										  <th class="sorting_asc">ID</th>
									      <th class="sorting">nickname</th>
									      <th class="sorting">评论内容</th>
									      <th class="sorting">时间</th>									     
									      <th class="sorting">点赞</th>													     						
					                      <th class="text-center">操作</th>
			                          </tr>
			                      </thead>
			                      <tbody>
			                      	  <c:forEach var="comment" items="<%=commentList %>">
			                          <tr>                            
				                          <td>${comment.article_id }</td>
									      <td>${comment.nickname }</td>
									      <td>${comment.content }</td>
									      <td>${comment.time }</td>									 
									      <td>${comment.star }</td>		                                                                  
		                                  <td class="text-center">                                           
		                                 	  <button type="button" class="btn bg-olive btn-xs" data-toggle="modal" data-target="#editModal" onclick="deleteComment(${comment.id })">删除</button>                                           
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
<script type="text/javascript">      
//删除友链
function deleteComment(id) {
	$.ajax({
		type:"get",
		url:"/Blog/CMDeleServlet",
		data:{"id":id}, 
		success:function(data) {
			var json = eval('(' + data + ')');
			alert(json.msg);	
		}
	});
} 
</script>     
</body>

</html>