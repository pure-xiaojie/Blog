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
    <div class="logo"><a href="index.jsp">笃行日志</a></div>
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
      <li><a href="index.jsp" >网站首页</a></li>
      <li><a href="AxisServlet">归档</a></li>
      <li><a href="#" style="color:red">分类</a></li>
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

<div class="line46"></div>

<article>
  <div class="leftbox">
  	<c:forEach var="map" items="${sort_article_map}">	
    <div class="newblogs">
      <h2 class="hometitle">
	      ${map.key}
      </h2>
      <ul>
      	<c:forEach var="list" items="${map.value}">
        <li>
          <h4 class="blogtitle"><a href="/Blog/ArticleServlet?id=${list.id}">${list.title}</a></h4>
          <div class="bloginfo"><span class="blogpic"><a href="/" title=""><img src="images/t0${list.id%4+1}.jpg"  /></a></span>
            <p>${list.content}</p>
          </div>
          <div class="autor">
	          <span class="lm f_l"><a href="#">${list.author}</a></span>
	          <span class="dtime f_l">${list.time}</span>
	          <span class="viewnum f_l">浏览（<a href="/">${list.visit}</a>）
	          </span><span class="pingl f_l">评论（${list.comment}）</span>
	          <span class="f_r">
	          <a href="/Blog/ArticleServlet?id=${list.id}" class="more">阅读原文>></a>
	          </span>
          </div>
        </li>
        </c:forEach>
      </ul>
    </div>
    </c:forEach>
  </div>
  
  <div class="rightbox">
  <div class="blank"></div>
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
      <h2 class="ab_title"><a href="/">本栏推荐</a></h2>
      <ul>
        <li><b><a href="/" target="_blank">住在手机里的朋友</a></b>
          <p>对于刚毕业的学生来说，想学习建网站，掌握一技之长，最简单的入门无学...</p>
        </li>
        <li><b><a href="/" target="_blank">教你怎样用欠费手机拨打电话</a></b>
          <p>对于刚毕业的学生来说，想学习建网站，掌握一技之长，最简单的入门...</p>
        </li>
        <li><b><a href="/" target="_blank">原来以为，一个人的勇敢是，删掉他的手机号码</a></b>
          <p>.先前发表过一篇文章《如果要学习web前端开发，需要学习什么？》</p>
        </li>
        <li><b><a href="/" target="_blank">手机的16个惊人小秘密，据说99.999%的人都不知</a></b>
          <p>对于刚毕业的学生来说，.需要学习什么？》</p>
        </li>
        <li><b><a href="/" target="_blank">你面对的是生活而不是手机</a></b>
          <p>.最简单的入门无非就是学会html和css，先前发表过一篇文章...</p>
        </li>
      </ul>
      <div class="ad"><img src="images/ad300x100.jpg"></div>
    </div>
    <div class="paihang">
      <h2 class="ab_title"><a href="/">点击排行</a></h2>
      <ul>
        <li><b><a href="/" target="_blank">住在手机里的朋友</a></b>
          <p>对于刚毕业的学生来说，想学习建网站，掌握一技之长，最简单的入门无学...</p>
        </li>
        <li><b><a href="/" target="_blank">教你怎样用欠费手机拨打电话</a></b>
          <p>对于刚毕业的学生来说，想学习建网站，掌握一技之长，最简单的入门...</p>
        </li>
        <li><b><a href="/" target="_blank">原来以为，一个人的勇敢是，删掉他的手机号码</a></b>
          <p>.先前发表过一篇文章《如果要学习web前端开发，需要学习什么？》</p>
        </li>
        <li><b><a href="/" target="_blank">手机的16个惊人小秘密，据说99.999%的人都不知</a></b>
          <p>对于刚毕业的学生来说，.需要学习什么？》</p>
        </li>
        <li><b><a href="/" target="_blank">你面对的是生活而不是手机</a></b>
          <p>.最简单的入门无非就是学会html和css，先前发表过一篇文章...</p>
        </li>
      </ul>
      <div class="ad"><img src="images/ad01.jpg"></div>
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
	
  <p>Design by <a href="/">笃行日志</a> <a href="/">永ICP备11002373号-1</a></p>
</footer>
</body>
</html>
