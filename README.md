# 基于servlet+jsp个人博客系统
## 系统功能需求
### 一.  项目概述
##### 1.1 项目描述
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;人日志系统是基于我个人需要开发的，采用JSP＋Servlet＋JavaBean开发模式进行底层设计，前端采用h5前端框架和JavaScript的Ajax库进行前台页面设计,在持久层采用==C3P0==数据库连接池框架将数据库存入mysql。这个系统功能包括==登录注册，导航栏，搜索栏，个人信息，标签，热门日志，友链，音乐播放==等功能，然后实现平台的功能及测试。
<br>
##### 1.2 项目需求
**1 基本功能：**

 - 日志的增、删、查、改。
 - 分类。
 - 阅读排行榜。
 - 后台管理。 
 - 日志评论。
 - 音乐播放
 - 后台管理


**2  项目知识点覆盖：**
 - HTML5+css3 
 - Ajax异步加载。 
 - C3p0 
 - JSON存储技术
 - 	Session维持登录状态。
 - 调用poi导出Excel 
 - 多媒体播放。
<br><br>
### 二.  项目概览
**1、站点主页：**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;主要展示文章，个人信息，导航栏，搜索框以及下面的阅读排行榜和友链显示，实现简单分页处理。
 ![在这里插入图片描述](https://img-blog.csdnimg.cn/20191222154058999.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQxMjE2NzQz,size_16,color_FFFFFF,t_70)
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191222154544142.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQxMjE2NzQz,size_16,color_FFFFFF,t_70)
<br>
**2、归档页：** 对文章就行排序分年份显示
 
![在这里插入图片描述](https://img-blog.csdnimg.cn/2019122215471624.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQxMjE2NzQz,size_16,color_FFFFFF,t_70)


**3、日志编辑：** 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;此页面只有登录才能进入，使用了Markdown 编辑器，用户可以通过键盘快捷键和工具栏按钮来使用或者移除 Markdown 各种语法格式，支持自定义配色方案、字体、大小和布局 、即时HTML预览、HTML和PDF导出，被很多人称赞为 Windows 平台最好用的 Markdown 编辑器，实用性强。
 
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191222154744606.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQxMjE2NzQz,size_16,color_FFFFFF,t_70)

**4、后台管理主页：**  统计文章数量、标签个数、分类总类、访问量
 
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191222154901239.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQxMjE2NzQz,size_16,color_FFFFFF,t_70)

**5、后台管理日志：** 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;对日志就行展示，可编辑历史文章、删除历史日志，还可导出Excel表。

![在这里插入图片描述](https://img-blog.csdnimg.cn/20191222154947160.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQxMjE2NzQz,size_16,color_FFFFFF,t_70)

**6、后台管理友链：** 对友链的增删改，便于前台的展示和实时性
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191222155044458.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQxMjE2NzQz,size_16,color_FFFFFF,t_70)

**7、登录注册页：**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;使用模态框完成登录注册，右边即是音乐播放功能
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191222155209862.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQxMjE2NzQz,size_16,color_FFFFFF,t_70)

**其它实现功能省略**
<br>
### 三.  课程设计总结
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;通过这次课程设计，学会了javaweb很多知识，在课程设计期间，本来是打算直接用springboot+H5+CSS+vue.js实现所有页面的，但是老师说不能使用框架，然后就使用了原始的jsp、servlet、AJAX知识，然后找了一些好看的前端素材才完成所有的页面。
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;实现编辑日志的时候自己也是陷入误区了，自己应该请教老师或者学长，问问他们去调用哪个开发商的编辑器，导致自己看了很多个编辑器推荐才实现这个功能，这里浪费了一天的时间，导致后面很多功能没有实现。这次博客系统采用的是==JSP＋Servlet＋JavaBean==开发模式，没有用到框架，同时也有很多功能没有实现，比如说日志收藏，用户管理。
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这次实训的不足之处是自己也不了解JAVAWEB开发流程，随便做功能，不分主次，使得自己浪费了很多时间。这次课程设计自己也意识到自己对于JAVA深层的东西不了解，比如C3P0为什么会出现连接池死锁问题。
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;综上，自己开发类的书籍看少了，学的少了,没有建立知识结构体系,争取在后期的学习中,要更加深入bootstrap和jquery学习，再用springboot做这个项目, 相信有这次经验，开发过程时间应该会缩短很多，同时功能也将更加完善。


<br>
<br>
<br>

**喜欢的句子之一：**

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;青春的代价就是什么都想要，什么都想试试看

<br>

