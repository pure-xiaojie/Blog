<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="blog.service.ArticleService" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>文章管理</title>
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="../css/style.css">
	<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="../plugins/bootstrap/js/bootstrap.min.js"></script>

    
</head>

<%
	//文章初始化
	ArticleService as = ArticleService.getInstance();
	List list = as.getArticle();

%>
<body class="hold-transition skin-red sidebar-mini">
  <!-- .box-body -->
                    <div class="box-header with-border">
                        <h3 class="box-title">日志管理</h3>
                    </div>

                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                        <button type="button" onclick="exports()" class="btn btn-default" title="写日志" data-toggle="modal" data-target="#editModal" ><i class="fa fa-file-o"></i> 导出</button>
                                        
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
										  <th class="sorting_asc">日志ID</th>
									      <th class="sorting">日志title</th>									      
									      <th class="sorting">所属分类</th>									     				
					                      <th class="text-center">发布日期</th>
					                      <th class="text-center">评论数</th>
					                      <th class="text-center">访问量</th>
					                      <th class="text-center">操作</th>
			                          </tr>
			                      </thead>
			                      <tbody>
			                      	  <c:forEach var="article"   items="<%=list %>">
			                          <tr>		                              
				                          <td>${article.id }</td>
									      <td>${article.title }</td>									     
		                                  <td>${article.sort }</td>
		                                  <td>${article.time }</td>
									      <td>${article.comment }</td>									     
		                                  <td>${article.visit }</td>		                                 
		                                  <td class="text-center">                                           
		                                 	  <a href="/Blog/AdminDataServlet?op=edit_article&&article_id=${article.id }" class="btn bg-olive btn-xs" data-toggle="modal">修改</a>  
		                                 	  <a href="/Blog/AdminDataServlet?op=delete_article&article_id=${article.id }" class="btn bg-olive btn-xs" data-toggle="modal">删除</a>                                         
		                                  </td>
			                          </tr>
									  </c:forEach>
			                      </tbody>
			                  </table>
			                  <!--数据列表/-->                        
							  
							 
                        </div>
                        <!-- 数据表格 /-->
                        
                        
                        
                        
                     </div>

      
<script type="text/javascript">  

//保存
function exports() {

	$.ajax({
		type:"get",
		url:"/Blog/ExportServlet",
		success:function(data) {
			var json = eval('(' + data + ')');
			
			alert(json.msg);	
		}
	});
} 
 
</script>    
</body>
</html>