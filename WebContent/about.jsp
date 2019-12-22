<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
		
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>关于我</title>
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
		</c:when>
		<c:otherwise>
			<a href="login.html" style="margin-left:40px;">登录</a>
		</c:otherwise>
		</c:choose>
	    <ul id="starlist">
	      <li><a href="index.jsp">网站首页</a></li>
	      <li><a href="AxisServlet">归档</a></li>
	      <li><a href="SortServlet?get=all">分类</a></li>
	      <li><a href="AddServlet">写日志</a></li>
	      <li><a href="#"  style="color:red">关于我</a></li>
	     
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

<div class="blank"></div>
<article>
  <div class="leftbox">
    <div class="infos">
      <div class="newsview">
        <h2 class="intitle">您现在的位置是：<a href="/">网站首页</a>&nbsp;&gt;&nbsp;<a href="/">关于我</a></h2>
        <div class="news_infos">
                    
          <p>
                        李杰贵，目前就读于湖南吉首大学，一名"不顾正业"的程序猿，所属软件工程工程专业，程序小白一名，沉迷于Java后端技术开发，
                        梦想着进入bat，也将一直为此不断努力着。<br>
                        <br>
                        正宗98后，爱编程。喜欢旅行、摄影、爱生活。非宅男，不掉发，追求不平淡的生活，梦想着和那个傻姑娘养一只猫一只狗，有着一间属于我们自己的爱情小屋。<br>
                        <br>
                        梁思成曾经问过林徽因这么一句话：“有一句话，我只问一次，以后都不会再问了，为什么是我？”
                        她回答道“答案很长，我得用一生去告诉你，准备好听我说了吗？”<br><br>
                        (๑′ᴗ‵๑)Ｉ Lᵒᵛᵉᵧₒᵤ❤
          </p>
          <div>
           	兴趣爱好
          <blockquote style="padding: 10px 18px">
                                
              <ul>
                  <li>擅长编程：沉迷于Java开发，专注于Web后端技术，追求新技术探索；</li>
                  <li>喜欢旅游：喜欢风景和文艺之地，也争取未来远离"颈椎"的困扰；</li>
                  <li>喜欢吉他：唯一喜欢的音乐，民谣，触不着一爱字，却处处见情深；</li>
                  <li>喜欢电影：英雄类大片、煽情类爱情片、校园类青春片，哈哈，都喜欢；</li>
                  <li>喜欢看书：喜欢明朝两百多年历史，以及林徽因徐志摩的个人传记；</li>
                  <li>喜欢女朋友，想要一起逗猫喂狗顺便撒撒狗粮，开心每一天；</li>
              </ul>
          </blockquote>
          </div>
          <br>
          <br>
          <p>我就是这样的我，不求伟大，却又不甘于平凡，</p>
          <p> 人生就是一个得与失的过程，而我却是一个幸运者，得到的永远比失去的多....</p>
          <p> 喜欢一句话“冥冥中该来则来，无处可逃”。</p>
        </div>
      </div>
    </div>
    <div class="news_pl">
      <h2>我要留言</h2>
       <ul>
		
		</ul>
    </div>
  </div>
  <div class="rightbox">
   <div class="aboutme">
      <h2 class="ab_title">关于我</h2>
      <div class="avatar"><img src="images/b04.jpg" /></div>
      <div class="ab_con">
        <p>网名：笃行</p>
        <p>职业：java开发 </p>
        <p>籍贯：湖南省-永州市</p>
        <p>邮箱：1952175699@qq.com</p>
      </div>
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
