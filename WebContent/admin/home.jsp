<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="blog.service.ArticleService" %>
<%@ page import="blog.service.TagService" %>
<%@ page import="blog.db.VisitorDB" %>		
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>日志后台管理</title>
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
	//统计文章数量
	ArticleService as = ArticleService.getInstance();
	int articleNum = as.getArticle().size();
	
	//分类个数
	int sortNum = as.getAllSort().size();
	
	//标签个数
	TagService ts = TagService.getInstance();
	int tagNum = ts.getAllTag().size();
	
	//访问量
	int visitNum = VisitorDB.totalVisit();
%>
<body class="hold-transition skin-blue sidebar-mini">

   <!-- 内容区域 -->


            <!-- 内容头部 -->
            <section class="content-header">
                <h1>
                    控制面板
                    <small>首页</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="all-admin-index.html"><i class="fa fa-dashboard"></i> 首页</a></li>
                </ol>
            </section>
            <!-- 内容头部 /-->

            <!-- 正文区域 -->
            <section class="content">


                <!-- 统计数值 -->
                <div class="row">
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-aqua">
                            <div class="inner">
                                <h3><%= articleNum %></h3>

                                <p>文章数量</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-bag"></i>
                            </div>
                            <a href="all-order-manage-list.html" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-green">
                            <div class="inner">
                                <h3><%=tagNum %></h3>

                                <p>标签个数</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-stats-bars"></i>
                            </div>
                            <a href="all-ad-statistics-list.html" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-yellow">
                            <div class="inner">
                                <h3><%=sortNum %></h3>

                                <p>分类数量</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-person-add"></i>
                            </div>
                            <a href="all-member-manage-list.html" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-red">
                            <div class="inner">
                                <h3><%=visitNum %></h3>

                                <p>网站访问量</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-pie-graph"></i>
                            </div>
                            <a href="all-ad-statistics-list.html" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                </div>
                <!-- /.row -->
            </section>
            <!-- 正文区域 /-->

        <!-- 内容区域 /-->
</body>

</html>