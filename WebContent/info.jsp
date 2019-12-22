<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>${article.title}</title>
	<link href="css/base.css" rel="stylesheet">
	<link href="css/index.css" rel="stylesheet">
	<link href="css/m.css" rel="stylesheet">
	<script src="js/jquery.min.js" type="text/javascript"></script>
	<script src="js/article.js" type="text/javascript"></script>
	<!-- 引入editormd相关 -->
	<script src="editormd/js/zepto.min.js"></script>
	<script src="editormd/js/editormd.js"></script>
	
	<script src="editormd/js/jquery.min.js"></script>
	<script src="editormd/lib/marked.min.js"></script>
	<script src="editormd/lib/prettify.min.js"></script>
	<script src="editormd/lib/raphael.min.js"></script>
	<script src="editormd/lib/underscore.min.js"></script>
	<script src="editormd/lib/sequence-diagram.min.js"></script>
	<script src="editormd/lib/flowchart.min.js"></script>
	<script src="editormd/lib/jquery.flowchart.min.js"></script>
	<script src="editormd/editormd.js"></script>
	<!--[if lt IE 9]>
	<script src="js/modernizr.js"></script>
	<![endif]-->
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
      <li><a href="index.jsp">网站首页</a></li>
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
			oH2.className = style.display == "block" ? "open" : "";
		}
	}
	</script> 
</header>
<div class="line46"></div>
<div class="blank"></div>
<article>
  <div class="leftbox">
    <div class="infos">
      <div class="newsview">
        <h2 class="intitle">您现在的位置是：<a href="/">网站首页</a>&nbsp;&gt;&nbsp;<a href="/">日志页</a></h2>
        <h3 class="news_title">${article.title}</h3>
        <div class="news_author">
	        <span class="au01">${article.author}</span>
	        <span class="au02">${article.time}</span>
	        <span class="au03">访问量：<b>${article.visit}</b></span>
        </div>
        <div class="tags">
        	<c:forEach var="t" items="${article_tags}">
	        <a href="/">${t.tag}</a> 
	        </c:forEach>
	  
        </div>
        <div class="news_about"><strong>简介</strong>非学，无以质疑；非问，无以广识</div>
        <div class="news_infos">
        	<div id="mdView">  	
			  <textarea id="article_content"  >${article.content}</textarea>   
			</div>  
			<br>
        </div>
      </div>
      <div class="share">
      <p class="diggit">
      <span class="btn btn-default" style="color:white;"  onclick="love_article(${article.id})" >很赞喔！</span>
      </p>
      <p class="dasbox"><a href="javascript:void(0)" onclick="dashangToggle()" class="dashang" title="打赏，支持一下">打赏本站</a></p>
      <div class="hide_box" style="display: none;"></div>
      <div class="shang_box" style="display: none;"> <a class="shang_close" href="javascript:void(0)" onclick="dashangToggle()" title="关闭">关闭</a>
        <div class="shang_tit">
          <p>感谢您的支持，我会继续努力的!</p>
        </div>
        <div class="shang_payimg"> <img src="images/alipayimg.jpg" alt="扫码支持" title="扫一扫"> </div>
        <div class="pay_explain">扫码打赏，你说多少就多少</div>
        <div class="shang_payselect">
          <div class="pay_item checked" data-id="alipay"> <span class="radiobox"></span> <span class="pay_logo"><img src="images/alipay.jpg" alt="支付宝"></span> </div>
          <div class="pay_item" data-id="weipay"> <span class="radiobox"></span> <span class="pay_logo"><img src="images/wechat.jpg" alt="微信"></span> </div>
        </div>
        <script type="text/javascript">
    $(function(){
    	$(".pay_item").click(function(){
    		$(this).addClass('checked').siblings('.pay_item').removeClass('checked');
    		var dataid=$(this).attr('data-id');
    		$(".shang_payimg img").attr("src","images/"+dataid+"img.jpg");
    		$("#shang_pay_txt").text(dataid=="alipay"?"支付宝":"微信");
    	});
    });
    function dashangToggle(){
    	$(".hide_box").fadeToggle();
    	$(".shang_box").fadeToggle();
    }
    </script> 
      </div>
    </div>
    <!--share end-->
    <div class="zsm">
	    <p>打赏本站，你说多少就多少</p>
	    <img src="images/zsm.jpg"></div>
    </div>
    <div class="nextinfo">
    <c:choose>
	  <c:when test="${article_pre!=null}">
      <p>上一篇：<a href="/Blog/ArticleServlet?id=${article_pre.id}" >${article_pre.title}</a></p>
      </c:when>
      <c:otherwise>
			<p>没有更早的文章了</p>
	  </c:otherwise>					
	</c:choose>
	<c:choose>
	  <c:when test="${article_next!=null}">
      <p>下一篇：<a href="/Blog/ArticleServlet?id=${article_next.id}" >${article_next.title}</a></p>
      </c:when>
      <c:otherwise>
			<p>没有更多的文章了</p>
	  </c:otherwise>					
	</c:choose>
      
    </div>
   
    <div class="whitebg gbook">
      <h2 class="htitle">文章评论</h2>
      <ul>
		<!-- 评论 开始 -->
		<div class="pinglun">
		<div class="pl-520am" data-id="874" data-classid="11" data-showhot="0">
		   <div class="pl-area-post">
		   		<form action="/Blog/NewCommentServlet?id=${article.id}" method="post">
		        <div class="pl-post">
		          <div class="pl-textarea">
		          <textarea name="w_content"class="pl-post-word" id="pl-520am-f-saytext" placeholder="写下你想说的，开始我们的对话"></textarea>
		          </div>
		          <div class="pl-tools">
		             <ul>
		               <li class="pl-tools-lastchild">
		               		<button class="pl-submit-btn" id="pl-submit-btn-main" type="submit">发 布</button>
		               </li>
		               <li class="username">
		               		<input type="text" id="pl-username" class="pl-key" size="15" placeholder="你的昵称" name="w_nickname">
		               </li>
		             </ul>
		          </div>
		        
		        </div>
		        </form>
		   </div>
		 
		    <div class="pl-header">
			    <em id="pl-joinnum">43220</em>人参与，<em id="pl-totalnum">2</em>条评论
			    <span class="pl-userinfo" id="pl-userinfo"></span>
		    </div>
		    <!-- 加载文章评论 -->	
			<c:if test="${comment!=null}">
			<c:forEach var="comm" varStatus="status" items="${comment}">
		    <div class="pl-show-list" id="pl-show-all">
		      <div class="pl-area pl-show-box" id="pl-show-box-462">
		        <div class="pl-area-userpic">
		          <img id="pl-userpic" src="https://www.yangqq.com/e/extend/lgyPl/assets/userpic/user_07.jpg">
		        </div>
		        <div class="pl-area-post">
		            <div class="pl-show-title"><span>${comm.nickname}</span> <span class="pl-show-time pl-fr">${comm.time}8</span></div>
		            <div class="pl-show-saytext">${comm.content }<img src="https://www.yangqq.com/e/data/face/wx.gif" border="0"></div>
		            <div class="pl-show-replay"></div>
		        </div>
		        <div class="pl-clr"></div>
		      </div>
		     </div>
		      </c:forEach>
			</c:if>
		</div>
		   <script type="text/javascript" src="https://www.yangqq.com/e/extend/lgyPl/api.js"></script>
		</div>
		
		<!-- 评论 结束 -->
	</ul>
    </div>
    
  </div>
  <div class="rightbox">
    <div class="search">
      <form action="searchServlet" method="post" name="searchform" id="searchform">
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
<script type="text/javascript">
	$(function mdToHtml() {		
		//获取要显示的内容
		//var content = $("#article_content").text();			
		editormd.markdownToHTML("mdView", {
			htmlDecode : "style,script,iframe", 
			emoji : true,
			taskList : true,
			tex : true, // 默认不解析
			flowChart : true, // 默认不解析
			sequenceDiagram : true, // 默认不解析			
		});
	});	
</script>
</body>
</html>
