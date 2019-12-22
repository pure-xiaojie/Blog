<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>笃行</title>
	<link href="css/base.css" rel="stylesheet">
	<link href="css/index.css" rel="stylesheet">
	<link href="css/m.css" rel="stylesheet">
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
      <li><a href="#"  style="color:red">归档</a></li>
      <li><a href="SortServlet?get=all">分类</a></li>
      <li><a href="AddServlet">写日志</a></li>
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
<div class="pagebg">
<img src="img/bg01.jpg" alt="时间轴">
</div>

  <div class="blank"></div>
<article>
  <div class="leftbox">
    <main>
    <h2 class="place">您现在的位置是：<a href="/">首页</a>&nbsp;&gt;&nbsp;<a href="/time/">时间轴</a></h2>
    <div class="timebox">
       <!-- 这里初始化时间轴 -->		
	<c:forEach var="axis" varStatus="status" items="${axis_list}">
		<c:choose>
			<c:when test="${axis.id==0}">
		      <h3>${axis.year}</h3>
		      <ul>
		    </c:when>
		    <c:otherwise>
		      
			   <li><span>${axis.year}-${axis.month}-${axis.day}</span><i><a href="/Blog/ArticleServlet?id=${axis.id}">${axis.title}</a></i></li>
			  
			</c:otherwise>
			
		</c:choose>
		</ul>
	</c:forEach>
    </div>
   </div>  
  </main>
  <div class="rightbox">
    <div class="search">
      <form action="/e/search/index.php" method="post" name="searchform" id="searchform">
        <input name="keyboard" id="keyboard" class="input_text" value="请输入关键字" style="color: rgb(153, 153, 153);" onfocus="if(value=='请输入关键字'){this.style.color='#000';value=''}" onblur="if(value==''){this.style.color='#999';value='请输入关键字'}" type="text">
        <input name="show" value="title" type="hidden">
        <input name="tempid" value="1" type="hidden">
        <input name="tbname" value="news" type="hidden">
        <input name="Submit" class="input_submit" value="搜索" type="submit">
      </form>
    </div>
    <div class="paihang">
      <h2 class="ab_title"><a href="/">点击排行</a></h2>
      <ul>
<li><b><a href="/jstt/css3/2018-03-20/808.html" target="_blank">十条设计原则教你学会如何设计网页布局!...</a></b>
          <p><i><img src="images/b01.png"></i>网页常见的布局有很多种,单列布局,多列布局.其中单列布局是国外很多网站比较常用的.咱们很多站长以及门户...</p>
        </li>
        <li><b><a href="/" target="_blank">教你怎样用欠费手机拨打电话</a></b>
          <p><i><img src="images/b02.jpg"></i>对于刚毕业的学生来说，想学习建网站，掌握一技之长，最简单的入门...</p>
        </li>
        <li><b><a href="/" target="_blank">原来以为，一个人的勇敢是，删掉他的手机号码</a></b>
          <p><i><img src="images/b03.jpg"></i>先前发表过一篇文章《如果要学习web前端开发，需要学习什么？》</p>
        </li>
        <li><b><a href="/" target="_blank">手机的16个惊人小秘密，据说99.999%的人都不知</a></b>
          <p><i><img src="images/b04.jpg"></i>对于刚毕业的学生来说，.需要学习什么？》</p>
        </li>
        <li><b><a href="/" target="_blank">你面对的是生活而不是手机</a></b>
          <p><i><img src="images/b05.jpg"></i>最简单的入门无非就是学会html和css，先前发表过一篇文章...</p>
        </li>
      </ul>
    </div>
    <div class="links">
      <h2 class="ab_title">友情链接</h2>
      <ul>
        <li><a href="/">杨青个人博客</a></li>
        <li><a href="/">个人博客模板</a></li>
        <li><a href="/">优秀个人博客</a></li>
      </ul>
    </div>
    <div class="weixin">
      <h2 class="ab_title">微信关注</h2>
      <ul>
        <img src="images/wx.jpg">
      </ul>
    </div>
  </div>
</article>
<footer>
  <p>Design by <a href="/">杨青个人博客</a> <a href="/">蜀ICP备11002373号-1</a></p>
</footer>
</body>
</html>
