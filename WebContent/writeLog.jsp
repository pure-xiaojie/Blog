<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>write</title>
	
	
	<!-- Bootstrap core CSS -->
	<link	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Custom styles for this template -->
	<link href="signin.css" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="css/add.css" />
	
	<link rel="stylesheet" href="editormd/css/style.css" />
	<link rel="stylesheet" href="editormd/css/editormd.css" />
	<link href="css/base.css" rel="stylesheet">
	<link href="css/index.css" rel="stylesheet">
	<link href="css/m.css" rel="stylesheet">
	<script src="js/page.js"></script> 
	<script src="editormd/js/zepto.min.js"></script>
	<script src="editormd/js/editormd.js"></script>  
	
	<script src="js/add.js"></script>
	<style>
		.info2 {
	    width: 90%;
	    padding-top: 60px;
	    padding-bottom: 10px;
	    text-align: center;
	    clear: both;
	    margin: 0 auto;
		}
	</style>
</head>
<body>
	<header>
	  <div id="mnav">
	    <div class="logo"><a href="/">笃行日志</a></div>
	    <c:choose>
		   <c:when test="${sessionScope.userName != null}">
			<span style="margin-left:40px;color:red">Welcome to ${sessionScope.userName }!!</span>
			<a href="LoginOutServlet">注销</a>
			<a href="admin/index.jsp" style="margin-left:40px;">管理中心</a>
			</c:when>
		<c:otherwise>
			<a href="login.html" style="margin-left:40px;">登录</a>
		</c:otherwise>
		</c:choose>
	    <ul id="starlist">
	      <li><a href="index.jsp">网站首页</a></li>
	      <li><a href="AxisServlet">归档</a></li>
	      <li><a href="SortServlet?get=all">分类</a></li>
	      <li><a href="AddServlet"  style="color:red">写日志</a></li>
	      <li><a href="about.jsp">关于我</a></li>
	     
	    </ul>
	  </div>
	  <script>
		window.onload = function ()
		{
			var oH2 = document.getElementById("mnavh"); 
			var oUl = document.getElementById("starlist");  
			oH2.onclick = function ()
			{
				var style = oUl.style;
				style.display = style.display == "block" ? "none" : "block";
				oH2.className = style.display == "block" ? "open" : ""
			}
		}
	</script> 
	</header>
	<div class="head_line" style="width:90%"></div>
	<div class="container" id="main">		
	   <form action="/Blog/NewArticleServlet" method="post">
	   		
	   	<div class="info2" >
	   		<input type="text" class="form-control" name="title" placeholder="文章标题">
	   	</div>   		
	   		
	 
	   	<!-- content -->   
        <div class="editormd" id="mdView">                
             <textarea name="content"></textarea>
        </div>
        <div class="info" >
	   		<!-- time -->
	   		<span class="help">时间</span>
	   		<input type="text"  class="form-control" name="time" value="${time}" >
	   		<!-- author-->
	   		<span class="help">作者</span>
	   		<input type="text" class="form-control" name="author" >	
	   		<!-- sort --> 				
	   		<span class="help">分类</span><br/>
				<c:forEach var="s"  items="${sort_count}">
				<input class="btn btn-default" type="button" value="${s.key}" onclick="sort_click(this)"> &nbsp;					
				</c:forEach> 	 			
				<input type="text" class="form-control"  id="sort" name="sort">		
				
			<!-- tag -->		
	   		<span class="help">标签</span><br/>
	   		<c:forEach var="tag" items="${all_tag}">
	   		<input class="btn btn-default" type="button" value="${tag.tag}" onclick="tags_click(this)">&nbsp;
	   		</c:forEach>
	   		<input type="text" class="form-control" id="tags"  name="tags">	
	   	</div>   	
        <br/>
        <input  class="btn btn-default"  type="submit"   value="发布日志" />
     </form>
		
	</div>
	
	<footer>
 			<p>Design by <a href="/">笃行日志</a> <a href="/">永ICP备11002373号-1</a></p>
	</footer>
		
		
	<script type="text/javascript">
			var testEditor;
			var jQuery = Zepto;
            $(function() {
					testEditor = editormd("mdView", {
						width  : "90%",
						height : 720,
						path   : './editormd/lib/',
                        codeFold : true,
                        searchReplace : true,
                        saveHTMLToTextarea : true,    // 保存 HTML 到 Textarea                   
                        htmlDecode : "style,script,iframe|on*", // 开启 HTML 标签解析，为了安全性，默认不开启
                        emoji : true,
                        taskList : true,
                        tocm: true,      
                        tex : true,  
                        flowChart : true,  
                        sequenceDiagram : true,   
                        imageUpload : true,
				        imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],				        
				        imageUploadURL : "/Blog/UploadPic",
				        //后台只需要返回一个 JSON 数据				      
						onload : function() {
							//console.log("onload =>", this, this.id, this.settings);
						}
					});				
					editor.setToolbarAutoFixed(false);//工具栏自动固定定位的开启与禁用               
            });
        </script>	
	
</body>
</html>