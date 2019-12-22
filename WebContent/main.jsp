<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>笃行</title>
	<link href="css/base.css" rel="stylesheet">
	<link href="css/index.css" rel="stylesheet">
	<link href="css/m.css" rel="stylesheet">
	<script src="js/page.js"></script>
</head>
<body>
<header>
  <div id="mnav">
    <div class="logo"><a href="#">笃行日志</a></div>
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
      <li><a href="index.jsp" style="color:red">网站首页</a></li>
      <li><a href="AxisServlet">归档</a></li>
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
<img src="img/bg01.jpg"> 
</div>

<article>
 
  <div class="blank"></div>
  <div class="leftbox">
    
    <div class="newblogs" style="margin-top:0px">
      <h2 class="hometitle">最新文章</h2>
      <ul id="list" style="display:none;">
      	<c:forEach var="article"   items="${article_list}">
        <li>
          <h3 class="blogtitle"><a href="/Blog/ArticleServlet?id=${article.id}">${article.title}</a></h3>
          <div class="bloginfo"><span class="blogpic"><a href="/" title=""><img src="images/t0${article.id%4+1}.jpg"  /></a></span>
            <p>${article.content}</p>
          </div>
          <div class="autor"><span class="lm f_l">
	         <a href="SortServlet?get=${article.sort}">${article.sort}</a></span><span class="dtime f_l">${article.time}</span>
	         <span class="viewnum f_l">浏览（<a href="/">${article.visit}</a>）</span>
	         <span class="pingl f_l">喜欢（<a href="/">${article.star}</a>）</span>
	         <span class="pingl f_l">评论（${article.comment}）</span>
	         <span class="f_r"><a href="/Blog/ArticleServlet?id=${article.id}" class="more">阅读原文</a></span>
          </div>
        </li>
        </c:forEach>
		<!-- 初始化文章列表完成 -->
        
      </ul>
      <ul id="list2">
      </ul>
      <script src="js/page2.js"></script> 
    </div>
  </div>
  
  <div class="rightbox">
    <div class="aboutme">
      <h2 class="ab_title">关于我</h2>
      <div class="avatar"><img src="images/b04.jpg" /></div>
      <div class="ab_con">
        <p>网名：${user.user_name}</p>
        <p>职业：${user.user_work}</p>
        <p>籍贯：${user.user_place}</p>
        <p>邮箱：${user.user_email}</p>
      </div>
    </div>
    <div class="blank"></div>
    <div class="search">
      <form action="searchServlet" method="post" name="searchform" id="searchform">
        <input name="keyboard" id="keyboard" class="input_text" value="请输入关键字" style="color: rgb(153, 153, 153);" onfocus="if(value=='请输入关键字'){this.style.color='#000';value=''}" onblur="if(value==''){this.style.color='#999';value='请输入关键字'}" type="text">
        <input name="Submit" class="input_submit" value="搜索" type="submit">
      </form>
    </div>
    <div class="cloud">
      <h2 class="hometitle">标签云</h2>
       <ul>
       	<c:forEach var="tag"  items="${tag_list}">
  		<a href="#">${tag.tag}</a> 
  		 </c:forEach>
	   </ul>
    </div>
    <div class="paihang">
      <h2 class="ab_title"><a href="/">点击排行</a></h2>
      <ul>
      	
        <c:forEach begin="1" end="5" var="a"  items="${visit_rank}">
        <li><b><a href="/Blog/ArticleServlet?id=${a.id}">${a.title}</a></b>
          <p>阅读数:${a.visit}</p>
        </li>
        </c:forEach>
      </ul>
    </div>
    <div class="links">
      <h2 class="ab_title">友情链接</h2>
      <ul>
      	<c:forEach var="link"   items="${link_list}"> 
        <li><a href="${link.url}" target="_blank">${link.name}</a></li>
        </c:forEach>
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
	<p>网站访问量：${visited}</p>
  <p>Design by <a href="/">笃行日志</a> <a href="/">永ICP备11002373号-1</a></p>
</footer>
</body>
</html>
