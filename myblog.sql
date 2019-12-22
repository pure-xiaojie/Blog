/*
Navicat MySQL Data Transfer

Source Server         : student
Source Server Version : 50635
Source Host           : localhost:3306
Source Database       : myblog

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2019-12-19 18:44:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `author` varchar(30) NOT NULL,
  `sort` varchar(30) NOT NULL,
  `time` datetime DEFAULT '2017-09-18 00:00:00',
  `star` int(11) DEFAULT '0',
  `comment` int(11) DEFAULT '0',
  `visit` int(11) DEFAULT '0',
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES ('13', 'Spring Boot入门小Demo', '小杰', 'JavaEE学习', '2019-12-12 08:35:45', '1', '0', '7', '##### 1.起步依赖\r\n**创建Maven工程 springboot_demo（打包方式jar）**  \r\n在pom.xml中添加如下依赖\r\n  \r\n\r\n```java\r\n<parent>\r\n    <groupId>org.springframework.boot</groupId>\r\n    <artifactId>spring-boot-starter-parent</artifactId>\r\n<version>1.4.0.RELEASE</version>\r\n  </parent>  \r\n  <dependencies>\r\n    <dependency>\r\n        <groupId>org.springframework.boot</groupId>\r\n        <artifactId>spring-boot-starter-web</artifactId>\r\n    </dependency>\r\n  </dependencies>\r\n```\r\n\r\n##### 2.引导类\r\n**只需要创建一个引导类 .**\r\n\r\n```java\r\npackage cn.itcast.demo;\r\nimport org.springframework.boot.SpringApplication;\r\nimport org.springframework.boot.autoconfigure.SpringBootApplication;\r\n@SpringBootApplication\r\npublic class Application {\r\n	public static void main(String[] args) {\r\n		SpringApplication.run(Application.class, args);\r\n	}\r\n}\r\n```\r\n\r\n> 简单解释一下:\r\n> @SpringBootApplication其实就是以下三个注解的总和 \r\n> @Configuration： 用于定义一个配置类\r\n> @EnableAutoConfiguration ：Spring Boot会自动根据你jar包的依赖来自动配置项目。\r\n> @ComponentScan： 告诉Spring 哪个packages 的用注解标识的类 会被spring自动扫描并且装入bean容器。\r\n\r\n**我们直接执行这个引导类，会发现控制台出现的这个标识**\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190520191752568.png)\r\n\r\n \r\n \r\n##### 3. Spring MVC实现Hello World输出\r\n我们现在开始使用spring MVC框架，实现json数据的输出。如果按照我们原来的做法，需要在web.xml中添加一个DispatcherServlet的配置，再添加一个spring的配置文件，配置文件中需要添加如下配置\r\n\r\n```java\r\n<!-- 使用组件扫描，不用将controller在spring中配置 -->\r\n	<context:component-scan base-package=\"cn.itcast.demo.controller\" />\r\n    <!-- 使用注解驱动不用在下边定义映射器和适配置器 -->\r\n  	<mvc:annotation-driven>\r\n	  <mvc:message-converters register-defaults=\"true\">\r\n	    <bean class=\"com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter\">  \r\n	      <property name=\"supportedMediaTypes\" value=\"application/json\"/>\r\n	      <property name=\"features\">\r\n	        <array>\r\n	          <value>WriteMapNullValue</value>\r\n	          <value>WriteDateUseDateFormat</value>\r\n	        </array>\r\n	      </property>\r\n	    </bean>\r\n	  </mvc:message-converters>  \r\n	</mvc:annotation-driven>\r\n```\r\n\r\n**但是我们用SpringBoot，这一切都省了。我们直接写Controller类**\r\n\r\n```java\r\npackage cn.itcast.demo.controller;\r\nimport org.springframework.web.bind.annotation.RequestMapping;\r\nimport org.springframework.web.bind.annotation.RestController;\r\n@RestController\r\npublic class HelloWorldController {\r\n	@RequestMapping(\"/info\")\r\n	public String info(){\r\n		return \"HelloWorld\";		\r\n	}		\r\n}\r\n```\r\n\r\n> 我们运行启动类来运行程序 在浏览器地址栏输入 http://localhost:8080/info 即可看到运行结果\r\n\r\n##### 4.修改tomcat启动端口\r\n在src/main/resources下创建application.properties\r\nserver.port=8088\r\n重新运行引导类。地址栏输入\r\nhttp://localhost:8088/info\r\n\r\n##### 5.读取配置文件信息\r\n在src/main/resources下的application.properties 增加配置\r\nurl=http://www.itcast.cn\r\n我要在类中读取这个配置信息，修改HelloWorldController  \r\n	\r\n\r\n```java\r\n	@Autowired\r\n	private Environment env;\r\n\r\n	@RequestMapping(\"/info\")\r\n	public String info(){\r\n		return \"HelloWorld~~\"+env.getProperty(\"url\");\r\n	}\r\n```\r\n\r\n##### 6.热部署\r\n我们在开发中反复修改类、页面等资源，每次修改后都是需要重新启动才生效，这样每次启动都很麻烦，浪费了大量的时间，能不能在我修改代码后不重启就能生效呢？可以，在pom.xml中添加如下配置就可以实现这样的功能，我们称之为热部署。\r\n	\r\n\r\n```java\r\n	<dependency>  \r\n	    <groupId>org.springframework.boot</groupId>  \r\n	    <artifactId>spring-boot-devtools</artifactId>  \r\n	</dependency>  \r\n```\r\n\r\n赶快试试看吧，是不是很爽。 \r\n\r\n');
INSERT INTO `t_article` VALUES ('14', 'eclipse中报错The superclass \"javax.servlet.http.HttpServlet\" was not found on the Java Build Path。', '小杰', '程序人生', '2019-12-12 08:44:19', '1', '0', '9', '今天刚引入支付宝沙箱demo后出现了build path 错误\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190521221142211.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQxMjE2NzQz,size_16,color_FFFFFF,t_70)\r\n**解决办法：**\r\n(1)： 确认eclipse中server的运行环境是否有配置，设置方法为：Window → Preferences → Server → Runtime Environments →Add → 选择Apache的版本后点Next，再填入你apache tomcat软件的安装（解压后）目录。\r\n\r\n(2)： 右击web工程 → Build Path → Configure build path... → Java Build Path → Libraries → Add Libray... → Server Runtime →Next> → Apache Tomcat Server →Finish。\r\n\r\n(3)： 切换到Java Build Path界面中的Orader and Export，勾选Tomcat。\r\n\r\n(4)： 右击web工程 → 属性 → Project Facets → 点击右侧tab选择Runtimes → 勾选tomcat → OK。\r\n\r\n**但是由于Eclipse中serverRuntime Environment中没有Tomcat选项，纠结了好久后开始换思路查找解决方法，最终发现新的解决方法：**\r\n**原因：eclipse版本不全，缺少javaee组件**\r\n在Eclipse中依次点击：\r\nhelp–>install new software–>在worhwith中选中”oxygen - http://download.eclipse.org/releases/oxygen“（oxygen为eclipse的版本号，找自己相应的版本号）\r\n选中 Web, XML, Java EE and OSGi Enterprise Development 下的 JST Server Adapters,JST Server Adapters Extentions 安装\r\n安装后重启eclipse，这时候就可以在：\r\nwindow–>preferences–>server–>Runtime Environment –>add–>这时候就可以在Apache中找到Tomcat了。\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190521222046372.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQxMjE2NzQz,size_16,color_FFFFFF,t_70)\r\n然后重复最开始的解决方法即可解决相应的问题，问题完美解决\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190521222849942.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQxMjE2NzQz,size_16,color_FFFFFF,t_70)\r\n\r\n希望能帮助到你喔！');
INSERT INTO `t_article` VALUES ('17', '乘积的最大子序列', '笃行', '数据结构', '2019-12-13 10:19:32', '0', '3', '10', '#### 题目描述：\r\n给定一个整数数组 nums ，找出一个序列中乘积最大的连续子序列（该序列至少包含一个数）。\r\n\r\n> 示例 1: 输入: [2,3,-2,4] \r\n> 输出: 6 \r\n> 解释: 子数组 [2,3] 有最大乘积 6。\r\n\r\n> 示例 2: 输入: [-2,0,-1] \r\n> 输出: 0 \r\n> 解释: 结果不能为 2, 因为 [-2,-1] 不是子数组。\r\n\r\n题目来源：力扣（LeetCode）\r\n链接：https://leetcode-cn.com/problems/maximum-product-subarray\r\n\r\n\r\n##### 解题方案：\r\n**思路**\r\n\r\n - 标签：动态规划 遍历数组时计算当前最大值，不断更新 \r\n - 令currMax为当前最大值，则当前最大值为 currMax = Math.max(n ,Math.max(m,x));\r\n - 由于存在负数，那么会导致最大的变最小的，最小的变最大的。因此还需要维护当前最小值currMin，currMin = Math.min(n,Math.min(m,x));\r\n - 时间复杂度：O(n)\r\n\r\n**代码**\r\n\r\njava版本\r\n```java\r\nclass Solution {\r\n    public int maxProduct(int[] nums) {\r\n    int len = nums.length;\r\n    if(len == 0)\r\n        return 0;\r\n    int res=nums[0], currMax = nums[0], currMin = nums[0],max,min;\r\n\r\n    for(int i = 1; i < len; i++) {\r\n        int x = nums[i];  //x赋值只是便于下面书写\r\n        //max，min解决了x为正负两种情况的最大值\r\n        max = currMax * x;   \r\n        min = currMin * x;\r\n        currMax = Math.max(max ,Math.max(min,x));\r\n        currMin = Math.min(max,Math.min(min,x));\r\n        \r\n        res = Math.max(currMax,res);\r\n    }\r\n    return res;\r\n    }\r\n}\r\n```\r\n\r\nc++版本\r\n\r\n```java\r\n#include<cstdio>\r\n#include<iostream>\r\n#include<vector>\r\n\r\nusing namespace std;\r\n\r\nint maxProduct(vector<int>& nums) {\r\n    int len = nums.size();\r\n    if(len == 0)\r\n        return 0;\r\n    int res=nums[0], currMax = nums[0], currMin = nums[0],max,min;\r\n\r\n    for(int i = 1; i < len; i++) {\r\n        int x = nums[i];\r\n        max = currMax * x;\r\n        min = currMin * x;\r\n        currMax = max(max ,max(min,x));\r\n        currMin = min(max,min(min,x));\r\n        //cout << currMax << \"   \"  << currMin << endl;\r\n        res = max(currMax,res);\r\n    }\r\n    return res;\r\n}\r\n\r\nint main()\r\n{\r\n    vector<int> a;\r\n    a.push_back(-1);\r\n    a.push_back(-2);\r\n    a.push_back(-9);\r\n    a.push_back(-6);\r\n    cout << maxProduct(a) << endl;\r\n    return 0;\r\n}\r\n\r\n```\r\n');
INSERT INTO `t_article` VALUES ('18', '非学，无以质疑', '小杰', '程序人生', '2018-09-18 00:00:00', '0', '0', '0', '十二月 09, 2019 9:05:21 下午 org.apache.catalina.startup.VersionLoggerListener log\r\n信息: Server version:        Apache Tomcat/9.0.13\r\n十二月 09, 2019 9:05:21 下午 org.apache.catalina.startup.VersionLoggerListener log\r\n信息: Server built:          Nov 2 2018 14:27:55 UTC\r\n十二月 09, 2019 9:05:21 下午 org.apache.catalina.startup.VersionLoggerListener log\r\n信息: Server number:         9.0.13.0\r\n十二月 09, 2019 9:05:21 下午 org.apache.catalina.startup.VersionLoggerListener log\r\n信息: OS Name:               Windows 10\r\n十二月 09, 2019 9:05:21 下午 org.apache.catalina.startup.VersionLoggerListener log\r\n信息: OS Version:            10.0\r\n十二月 09, 2019 9:05:21 下午 org.apache.catalina.startup.VersionLoggerListener log\r\n信息: Architecture:          amd64\r\n十二月 09, 2019 9:05:21 下午 org.apache.catalina.startup.VersionLoggerListener log\r\n信息: Java Home:             D:\\java1.8\\jre\r\n十二月 09, 2019 9:05:21 下午 org.apache.catalina.startup.VersionLoggerListener log\r\n信息: JVM Version:           1.8.0_201-b09\r\n十二月 09, 2019 9:05:21 下午 org.apache.catalina.startup.VersionLoggerListener log\r\n信息: JVM Vendor:            Oracle Corporation\r\n十二月 09, 2019 9:05:21 下午 org.apache.catalina.startup.VersionLoggerListener log\r\n信息: CATALINA_BASE:         D:\\我的程序人生\\eclipse\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\r\n十二月 09, 2019 9:05:21 下午 org.apache.catalina.startup.VersionLoggerListener log\r\n信息: CATALINA_HOME:         F:\\software\\Software\\Tomcat\r\n十二月 09, 2019 9:05:21 下午 org.apache.catalina.startup.VersionLoggerListener log\r\n信息: Command line argument: -Dcatalina.base=D:\\我的程序人生\\eclipse\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\r\n十二月 09, 2019 9:05:21 下午 org.apache.catalina.startup.VersionLoggerListener log\r\n信息: Command line argument: -Dcatalina.home=F:\\software\\Software\\Tomcat\r\n十二月 09, 2019 9:05:21 下午 org.apache.catalina.startup.VersionLoggerListener log\r\n信息: Command line argument: -Dwtp.deploy=D:\\我的程序人生\\eclipse\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\r\n十二月 09, 2019 9:05:21 下午 org.apache.catalina.startup.VersionLoggerListener log\r\n信息: Command line argument: -Djava.endorsed.dirs=F:\\software\\Software\\Tomcat\\endorsed\r\n十二月 09, 2019 9:05:21 下午 org.apache.catalina.startup.VersionLoggerListener log\r\n信息: Command line argument: -Dfile.encoding=UTF-8\r\n十二月 09, 2019 9:05:21 下午 org.apache.catalina.core.AprLifecycleListener lifecycleEvent\r\n信息: The APR based Apache Tomcat Native library which allows optimal performance in production environments was not found on the java.library.path: [D:\\java1.8\\jre\\bin;C:\\Windows\\Sun\\Java\\bin;C:\\Windows\\system32;C:\\Windows;D:/java1.8/jdk/bin/../jre/bin/server;D:/java1.8/jdk/bin/../jre/bin;D:/java1.8/jdk/bin/../jre/lib/amd64;F:\\software\\Software\\Xftp6\\;F:\\software\\Software\\Xshell\\;D:\\java1.8\\jdk\\bin;C:\\ProgramData\\Oracle\\Java\\javapath;C:\\Program Files (x86)\\Intel\\iCLS Client\\;C:\\Program Files\\Intel\\iCLS Client\\;C:\\Windows\\system32;C:\\Windows;C:\\Windows\\System32\\Wbem;C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\;F:\\software\\软件\\nodejs\\node\\;C:\\Program Files (x86)\\NVIDIA Corporation\\PhysX\\Common;C:\\Program Files (x86)\\Intel\\Intel(R) Management Engine Components\\DAL;C:\\Program Files\\Intel\\Intel(R) Management Engine Components\\DAL;C:\\Program Files (x86)\\Intel\\Intel(R) Management Engine Components\\IPT;C:\\Program Files\\Intel\\Intel(R) Management Engine Components\\IPT;C:\\Program Files\\MySQL\\MySQL Server 5.6\\bin;F:\\software\\Software\\maven\\apache-maven-3.6.0\\bin;D:\\我的程序人生\\git\\git安装\\Git\\cmd;E:\\Program Files (x86)\\Microsoft SQL Server\\100\\Tools\\Binn\\;E:\\Program Files\\Microsoft SQL Server\\100\\Tools\\Binn\\;E:\\Program Files\\Microsoft SQL Server\\100\\DTS\\Binn\\;E:\\Program Files (x86)\\Microsoft SQL Server\\100\\Tools\\Binn\\VSShell\\Common7\\IDE\\;C:\\Program Files (x86)\\Microsoft Visual Studio 9.0\\Common7\\IDE\\PrivateAssemblies\\;E:\\Program Files (x86)\\Microsoft SQL Server\\100\\DTS\\Binn\\;D:\\python3\\Scripts\\;D:\\python3\\;D:\\我的程序人生\\git\\git安装\\Git\\usr\\bin;C:\\Users\\ASUS\\AppData\\Local\\Programs\\Python\\Python37\\Scripts\\;C:\\Users\\ASUS\\AppData\\Local\\Programs\\Python\\Python37\\;C:\\Users\\ASUS\\AppData\\Local\\Microsoft\\WindowsApps;F:\\software\\WebStorm 2018.3\\bin;;C:\\Users\\ASUS\\AppData\\Roaming\\npm;D:\\我的程序人生\\java\\eclipse\\eclipse;;.]\r\n十二月 09, 2019 9:05:21 下午 org.apache.coyote.AbstractProtocol init\r\n信息: Initializing ProtocolHandler [\"http-nio-8080\"]\r\n十二月 09, 2019 9:05:21 下午 org.apache.tomcat.util.net.NioSelectorPool getSharedSelector\r\n信息: Using a shared selector for servlet write/read\r\n十二月 09, 2019 9:05:21 下午 org.apache.coyote.AbstractProtocol init\r\n信息: Initializing ProtocolHandler [\"ajp-nio-8009\"]\r\n十二月 09, 2019 9:05:21 下午 org.apache.tomcat.util.net.NioSelectorPool getSharedSelector\r\n信息: Using a shared selector for servlet write/read\r\n十二月 09, 2019 9:05:21 下午 org.apache.catalina.startup.Catalina load\r\n信息: Initialization processed in 2005 ms\r\n十二月 09, 2019 9:05:21 下午 org.apache.catalina.core.StandardService startInternal\r\n信息: Starting service [Catalina]\r\n十二月 09, 2019 9:05:21 下午 org.apache.catalina.core.StandardEngine startInternal\r\n信息: Starting Servlet Engine: Apache Tomcat/9.0.13\r\n十二月 09, 2019 9:05:26 下午 org.apache.jasper.servlet.TldScanner scanJars\r\n信息: At least one JAR was scanned for TLDs yet contained no TLDs. Enable debug logging for this logger for a complete list of JARs that were scanned but no TLDs were found in them. Skipping unneeded JARs during scanning can improve startup time and JSP compilation time.\r\n十二月 09, 2019 9:05:30 下午 org.apache.jasper.servlet.TldScanner scanJars\r\n信息: At least one JAR was scanned for TLDs yet contained no TLDs. Enable debug logging for this logger for a complete list of JARs that were scanned but no TLDs were found in them. Skipping unneeded JARs during scanning can improve startup time and JSP compilation time.\r\n十二月 09, 2019 9:05:39 下午 org.apache.jasper.servlet.TldScanner scanJars\r\n信息: At least one JAR was scanned for TLDs yet contained no TLDs. Enable debug logging for this logger for a complete list of JARs that were scanned but no TLDs were found in them. Skipping unneeded JARs during scanning can improve startup time and JSP compilation time.\r\n十二月 09, 2019 9:05:45 下午 org.apache.jasper.servlet.TldScanner scanJars\r\n信息: At least one JAR was scanned for TLDs yet contained no TLDs. Enable debug logging for this logger for a complete list of JARs that were scanned but no TLDs were found in them. Skipping unneeded JARs during scanning can improve startup time and JSP compilation time.\r\n十二月 09, 2019 9:05:45 下午 org.apache.coyote.AbstractProtocol start\r\n信息: Starting ProtocolHandler [\"http-nio-8080\"]\r\n十二月 09, 2019 9:05:46 下午 org.apache.coyote.AbstractProtocol start\r\n信息: Starting ProtocolHandler [\"ajp-nio-8009\"]\r\n十二月 09, 2019 9:05:46 下午 org.apache.catalina.startup.Catalina start\r\n信息: Server startup in 24425 ms\r\n十二月 09, 2019 9:05:47 下午 com.mchange.v2.log.MLog \r\n信息: MLog clients using java 1.4+ standard logging.\r\n十二月 09, 2019 9:05:47 下午 com.mchange.v2.c3p0.C3P0Registry \r\n信息: Initializing c3p0-0.9.5.2 [built 08-December-2015 22:06:04 -0800; debug? true; trace: 10]\r\n十二月 09, 2019 9:05:47 下午 com.mchange.v2.c3p0.impl.AbstractPoolBackedDataSource \r\n信息: Initializing c3p0 pool... com.mchange.v2.c3p0.ComboPooledDataSource [ acquireIncrement -> 5, acquireRetryAttempts -> 30, acquireRetryDelay -> 1000, autoCommitOnClose -> false, automaticTestTable -> null, breakAfterAcquireFailure -> false, checkoutTimeout -> 0, connectionCustomizerClassName -> null, connectionTesterClassName -> com.mchange.v2.c3p0.impl.DefaultConnectionTester, contextClassLoaderSource -> caller, dataSourceName -> 1b60l63a61t50dkt1jzczv|1dfff9f6, debugUnreturnedConnectionStackTraces -> false, description -> null, driverClass -> com.mysql.jdbc.Driver, extensions -> {}, factoryClassLocation -> null, forceIgnoreUnresolvedTransactions -> false, forceSynchronousCheckins -> false, forceUseNamedDriverClass -> false, identityToken -> 1b60l63a61t50dkt1jzczv|1dfff9f6, idleConnectionTestPeriod -> 0, initialPoolSize -> 20, jdbcUrl -> jdbc:mysql://localhost:3306/myblog?useSSL=false&useUnicode=true&characterEncoding=utf-8, maxAdministrativeTaskTime -> 0, maxConnectionAge -> 0, maxIdleTime -> 0, maxIdleTimeExcessConnections -> 0, maxPoolSize -> 50, maxStatements -> 0, maxStatementsPerConnection -> 0, minPoolSize -> 20, numHelperThreads -> 3, preferredTestQuery -> null, privilegeSpawnedThreads -> false, properties -> {user=******, password=******}, propertyCycle -> 0, statementCacheNumDeferredCloseThreads -> 0, testConnectionOnCheckin -> false, testConnectionOnCheckout -> false, unreturnedConnectionTimeout -> 0, userOverrides -> {}, usesTraditionalReflectiveProxies -> false ]\r\n十二月 09, 2019 9:05:47 下午 com.mchange.v2.c3p0.impl.AbstractPoolBackedDataSource \r\n信息: Initializing c3p0 pool... com.mchange.v2.c3p0.ComboPooledDataSource [ acquireIncrement -> 5, acquireRetryAttempts -> 30, acquireRetryDelay -> 1000, autoCommitOnClose -> false, automaticTestTable -> null, breakAfterAcquireFailure -> false, checkoutTimeout -> 0, connectionCustomizerClassName -> null, connectionTesterClassName -> com.mchange.v2.c3p0.impl.DefaultConnectionTester, contextClassLoaderSource -> caller, dataSourceName -> 1b60l63a61t50dkt1jzczv|24852a06, debugUnreturnedConnectionStackTraces -> false, description -> null, driverClass -> com.mysql.jdbc.Driver, extensions -> {}, factoryClassLocation -> null, forceIgnoreUnresolvedTransactions -> false, forceSynchronousCheckins -> false, forceUseNamedDriverClass -> false, identityToken -> 1b60l63a61t50dkt1jzczv|24852a06, idleConnectionTestPeriod -> 0, initialPoolSize -> 20, jdbcUrl -> jdbc:mysql://localhost:3306/myblog?useSSL=false&useUnicode=true&characterEncoding=utf-8, maxAdministrativeTaskTime -> 0, maxConnectionAge -> 0, maxIdleTime -> 0, maxIdleTimeExcessConnections -> 0, maxPoolSize -> 50, maxStatements -> 0, maxStatementsPerConnection -> 0, minPoolSize -> 20, numHelperThreads -> 3, preferredTestQuery -> null, privilegeSpawnedThreads -> false, properties -> {user=******, password=******}, propertyCycle -> 0, statementCacheNumDeferredCloseThreads -> 0, testConnectionOnCheckin -> false, testConnectionOnCheckout -> false, unreturnedConnectionTimeout -> 0, userOverrides -> {}, usesTraditionalReflectiveProxies -> false ]\r\n十二月 09, 2019 9:07:04 下午 org.apache.catalina.core.StandardWrapperValve invoke\r\n严重: Servlet.service() for servlet [blog.servlet.NewCommentServlet] in context with path [/Blog] threw exception\r\njava.lang.IllegalArgumentException: An invalid character [32] was present in the Cookie value\r\n	at org.apache.tomcat.util.http.Rfc6265CookieProcessor.validateCookieValue(Rfc6265CookieProcessor.java:182)\r\n	at org.apache.tomcat.util.http.Rfc6265CookieProcessor.generateHeader(Rfc6265CookieProcessor.java:115)\r\n	at org.apache.catalina.connector.Response.generateCookieString(Response.java:976)\r\n	at org.apache.catalina.connector.Response.addCookie(Response.java:928)\r\n	at org.apache.catalina.connector.ResponseFacade.addCookie(ResponseFacade.java:385)\r\n	at blog.servlet.NewCommentServlet.doGet(NewCommentServlet.java:69)\r\n	at blog.servlet.NewCommentServlet.doPost(NewCommentServlet.java:79)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:660)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at blog.filter.CodeFilter.doFilter(CodeFilter.java:41)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:199)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:490)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:668)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:791)\r\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1417)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(Unknown Source)\r\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(Unknown Source)\r\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Unknown Source)\r\n\r\n');
INSERT INTO `t_article` VALUES ('19', 'Java：类与继承', '小杰12', '程序人生', '2019-12-12 08:24:27', '0', '0', '0', '\r\n 大家好，对于面向对象的程序设计语言来说，类毫无疑问是其最重要的基础。抽象、封装、继承、多态这四大特性都离不开类，只有存在类，才能体现面向对象编程的特点，今天我们就来了解一些类与继承的相关知识。首先，我们讲述一下与类的初始化相关的东西，然后再从几个方面阐述继承这一大特性。以下是本文的目录大纲：\r\n　　**一.你了解类吗？\r\n　　二.你了解继承吗？\r\n　　三.常见的面试笔试题\r\n　\r\n　若有不正之处，请多多谅解并欢迎批评指正。\r\n　　\r\n一.你了解类吗？**\r\n　　在Java中，类文件是以.java为后缀的代码文件，在每个类文件中最多只允许出现一个public类，当有public类的时候，类文件的名称必须和public类的名称相同，若不存在public，则类文件的名称可以为任意的名称（当然以数字开头的名称是不允许的）。\r\n　　在类内部，对于成员变量，如果在定义的时候没有进行显示的赋值初始化，则Java会保证类的每个成员变量都得到恰当的初始化：\r\n　　1）对于  char、short、byte、int、long、float、double等基本数据类型的变量来说会默认初始化为0（boolean变量默认会被初始化为false）；\r\n　　2）对于引用类型的变量，会默认初始化为null。\r\n　　如果没有显示地定义构造器，则编译器会自动创建一个无参构造器，但是要记住一点，如果显示地定义了构造器，编译器就不会自动添加构造器。注意，所有的构造器默认为static的。\r\n　　下面我们着重讲解一下 初始化 顺序：\r\n　　当程序执行时，需要生成某个类的对象，Java执行引擎会先检查是否加载了这个类，如果没有加载，则先执行类的加载再生成对象，如果已经加载，则直接生成对象。\r\n　　在类的加载过程中，类的static成员变量会被初始化，另外，如果类中有static语句块，则会执行static语句块。static成员变量和static语句块的执行顺序同代码中的顺序一致。记住，在Java中，类是按需加载，只有当需要用到这个类的时候，才会加载这个类，并且只会加载一次。看下面这个例子就明白了：\r\n　　\r\n\r\n```java\r\npublic class Test {\r\n    public static void main(String[] args) throws ClassNotFoundException {\r\n         \r\n        Bread bread1 = new Bread();\r\n        Bread bread2 = new Bread();\r\n    }\r\n}\r\n \r\nclass Bread {\r\n    static{\r\n        System.out.println(\"Bread is loaded\");\r\n    }\r\n    public Bread() {\r\n        System.out.println(\"bread\");\r\n    }\r\n}\r\n```\r\n　　运行这段代码就会发现\"Bread is loaded\"只会被打印一次。\r\n　　在生成对象的过程中，会先初始化对象的成员变量，然后再执行构造器。也就是说类中的变量会在任何方法（包括构造器）调用之前得到初始化，即使变量散步于方法定义之间。\r\n\r\n```java\r\npublic class Test {\r\n    public static void main(String[] args)  {\r\n        new Meal();\r\n    }\r\n}\r\n \r\n \r\nclass Meal {\r\n     \r\n    public Meal() {\r\n        System.out.println(\"meal\");\r\n    }\r\n     \r\n    Bread bread = new Bread();\r\n}\r\n \r\nclass Bread {\r\n     \r\n    public Bread() {\r\n        System.out.println(\"bread\");\r\n    }\r\n}\r\n```\r\n\r\n　　输出结果为：\r\n\r\n    bread\r\n    meal\r\n\r\n**二.你了解继承吗？**\r\n　　继承是所有OOP语言不可缺少的部分，在java中使用extends关键字来表示继承关系。当创建一个类时，总是在继承，如果没有明确指出要继承的类，就总是隐式地从根类Object进行继承。比如下面这段代码：\r\n\r\n```java\r\nclass Person {\r\n    public Person() {\r\n         \r\n    }\r\n}\r\n \r\nclass Man extends Person {\r\n    public Man() {\r\n         \r\n    }\r\n}\r\n```\r\n\r\n　　类Man继承于Person类，这样一来的话，Person类称为父类（基类），Man类称为子类（导出类）。如果两个类存在继承关系，则子类会自动继承父类的方法和变量，在子类中可以调用父类的方法和变量。在java中，只允许单继承，也就是说 一个类最多只能显示地继承于一个父类。但是一个类却可以被多个类继承，也就是说一个类可以拥有多个子类。\r\n　　**1.子类继承父类的成员变量**\r\n　　当子类继承了某个类之后，便可以使用父类中的成员变量，但是并不是完全继承父类的所有成员变量。具体的原则如下：\r\n　　   1）能够继承父类的public和protected成员变量；不能够继承父类的private成员变量；\r\n　 　2）对于父类的包访问权限成员变量，如果子类和父类在同一个包下，则子类能够继承；否则，子类不能够继承；\r\n　 　3）对于子类可以继承的父类成员变量，如果在子类中出现了同名称的成员变量，则会发生隐藏现象，即子类的成员变量会屏蔽掉父类的同名成员变量。如果要在子类中访问父类中同名成员变量，需要使用super关键字来进行引用。\r\n　　**2.子类继承父类的方法**\r\n　　同样地，子类也并不是完全继承父类的所有方法。\r\n　　 1）能够继承父类的public和protected成员方法；不能够继承父类的private成员方法；\r\n　 　2）对于父类的包访问权限成员方法，如果子类和父类在同一个包下，则子类能够继承；否则，子类不能够继承；\r\n　　 3）对于子类可以继承的父类成员方法，如果在子类中出现了同名称的成员方法，则称为覆盖，即子类的成员方法会覆盖掉父类的同名成员方法。如果要在子类中访问父类中同名成员方法，需要使用super关键字来进行引用。\r\n　　注意：隐藏和覆盖是不同的。隐藏是针对成员变量和静态方法的，而覆盖是针对普通方法的。（后面会讲到）\r\n　　**3.构造器**\r\n　　子类是不能够继承父类的构造器，但是要注意的是，如果父类的构造器都是带有参数的，则必须在子类的构造器中显示地通过super关键字调用父类的构造器并配以适当的参数列表。如果父类有无参构造器，则在子类的构造器中用super关键字调用父类构造器不是必须的，如果没有使用super关键字，系统会自动调用父类的无参构造器。看下面这个例子就清楚了：\r\n　　\r\n\r\n```java\r\nclass Shape {\r\n     \r\n    protected String name;\r\n     \r\n    public Shape(){\r\n        name = \"shape\";\r\n    }\r\n     \r\n    public Shape(String name) {\r\n        this.name = name;\r\n    }\r\n}\r\n \r\nclass Circle extends Shape {\r\n     \r\n    private double radius;\r\n     \r\n    public Circle() {\r\n        radius = 0;\r\n    }\r\n     \r\n    public Circle(double radius) {\r\n        this.radius = radius;\r\n    }\r\n     \r\n    public Circle(double radius,String name) {\r\n        this.radius = radius;\r\n        this.name = name;\r\n    }\r\n}\r\n```\r\n\r\n\r\n\r\n　　这样的代码是没有问题的，如果把父类的无参构造器去掉，则下面的代码必然会出错：\r\n\r\n　　改成下面这样就行了：\r\n\r\n　　**4.super**\r\n　　super主要有两种用法：\r\n　　1）super.成员变量/super.成员方法;\r\n　　2）super(parameter1,parameter2....)\r\n　　第一种用法主要用来在子类中调用父类的同名成员变量或者方法；第二种主要用在子类的构造器中显示地调用父类的构造器，要注意的是，如果是用在子类构造器中，则必须是子类构造器的第一个语句。\r\n三.常见的面试笔试题\r\n1.下面这段代码的输出结果是什么？\r\n\r\n```java\r\npublic class Test {\r\n    public static void main(String[] args)  {\r\n        new Circle();\r\n    }\r\n}\r\n \r\nclass Draw {\r\n     \r\n    public Draw(String type) {\r\n        System.out.println(type+\" draw constructor\");\r\n    }\r\n}\r\n \r\nclass Shape {\r\n    private Draw draw = new Draw(\"shape\");\r\n     \r\n    public Shape(){\r\n        System.out.println(\"shape constructor\");\r\n    }\r\n}\r\n \r\nclass Circle extends Shape {\r\n    private Draw draw = new Draw(\"circle\");\r\n    public Circle() {\r\n        System.out.println(\"circle constructor\");\r\n    }\r\n}\r\n```\r\n\r\n    shape draw constructor\r\n    shape constructor\r\n    circle draw constructor\r\n    circle constructor\r\n\r\n　　这道题目主要考察的是类继承时构造器的调用顺序和初始化顺序。要记住一点：父类的构造器调用以及初始化过程一定在子类的前面。由于Circle类的父类是Shape类，所以Shape类先进行初始化，然后再执行Shape类的构造器。接着才是对子类Circle进行初始化，最后执行Circle的构造器。\r\n2.下面这段代码的输出结果是什么？\r\n\r\n```java\r\npublic class Test {\r\n    public static void main(String[] args)  {\r\n        Shape shape = new Circle();\r\n        System.out.println(shape.name);\r\n        shape.printType();\r\n        shape.printName();\r\n    }\r\n}\r\n \r\nclass Shape {\r\n    public String name = \"shape\";\r\n     \r\n    public Shape(){\r\n        System.out.println(\"shape constructor\");\r\n    }\r\n     \r\n    public void printType() {\r\n        System.out.println(\"this is shape\");\r\n    }\r\n     \r\n    public static void printName() {\r\n        System.out.println(\"shape\");\r\n    }\r\n}\r\n \r\nclass Circle extends Shape {\r\n    public String name = \"circle\";\r\n     \r\n    public Circle() {\r\n        System.out.println(\"circle constructor\");\r\n    }\r\n     \r\n    public void printType() {\r\n        System.out.println(\"this is circle\");\r\n    }\r\n     \r\n    public static void printName() {\r\n        System.out.println(\"circle\");\r\n    }\r\n}\r\n```\r\n\r\n    shape constructor\r\n    circle constructor\r\n    shape\r\n    this is circle\r\n    shape\r\n\r\n　　这道题主要考察了隐藏和覆盖的区别（当然也和多态相关，在后续博文中会继续讲到）。\r\n　　覆盖只针对非静态方法（终态方法不能被继承，所以就存在覆盖一说了），而隐藏是针对成员变量和静态方法的。这2者之间的区别是：覆盖受RTTI（Runtime type  identification）约束的，而隐藏却不受该约束。也就是说只有覆盖方法才会进行动态绑定，而隐藏是不会发生动态绑定的。在Java中，除了static方法和final方法，其他所有的方法都是动态绑定。因此，就会出现上面的输出结果。');
INSERT INTO `t_article` VALUES ('21', 'Spring Data Redis入门小Demo', '笃行', 'Spring', '2019-12-18 10:42:54', '0', '2', '1', '##### 1.准备工作\r\n\r\n> （1）构建Maven工程  SpringDataRedisDemo \r\n> （2）引入Spring相关依赖、引入JUnit依赖  \r\n> （3）引入Jedis和SpringDataRedis依赖\r\n\r\n```java\r\n<!-- Spring -->\r\n	<dependency>\r\n		<groupId>org.springframework</groupId>\r\n		<artifactId>spring-context</artifactId>		\r\n	</dependency>\r\n	<dependency>\r\n		<groupId>org.springframework</groupId>\r\n		<artifactId>spring-beans</artifactId>		\r\n	</dependency>\r\n	<dependency>\r\n		<groupId>org.springframework</groupId>\r\n		<artifactId>spring-webmvc</artifactId>		\r\n	</dependency>\r\n	<dependency>\r\n		<groupId>org.springframework</groupId>\r\n		<artifactId>spring-jdbc</artifactId>		\r\n	</dependency>\r\n	<dependency>\r\n		<groupId>org.springframework</groupId>\r\n		<artifactId>spring-aspects</artifactId>		\r\n	</dependency>\r\n	<dependency>\r\n		<groupId>org.springframework</groupId>\r\n		<artifactId>spring-jms</artifactId>		\r\n	</dependency>\r\n	<dependency>\r\n		<groupId>org.springframework</groupId>\r\n		<artifactId>spring-context-support</artifactId>		\r\n	</dependency>\r\n	<dependency>\r\n		<groupId>org.springframework</groupId>\r\n		<artifactId>spring-test</artifactId>		\r\n	</dependency>\r\n<!-- junit -->\r\n	<dependency>\r\n		<groupId>junit</groupId>\r\n		<artifactId>junit</artifactId>		\r\n	</dependency>\r\n<!-- 缓存 -->\r\n	<dependency> \r\n		<groupId>redis.clients</groupId> \r\n		<artifactId>jedis</artifactId> \r\n		<version>2.8.1</version> \r\n	</dependency> \r\n	<dependency> \r\n		<groupId>org.springframework.data</groupId> \r\n		<artifactId>spring-data-redis</artifactId> \r\n		<version>1.7.2.RELEASE</version> \r\n	</dependency>	\r\n```\r\n\r\n> （4）在src/main/resources下创建properties文件夹，建立redis-config.properties\r\n\r\n```java\r\nredis.host=127.0.0.1 \r\nredis.port=6379 \r\nredis.pass= \r\nredis.database=0 \r\nredis.maxIdle=300 \r\nredis.maxWait=3000 \r\nredis.testOnBorrow=true \r\n```\r\n\r\n> （5）在src/main/resources下创建spring文件夹 ，创建applicationContext-redis.xml\r\n```java\r\n  <context:property-placeholder location=\"classpath*:properties/*.properties\" />   \r\n   <!-- redis 相关配置 --> \r\n   <bean id=\"poolConfig\" class=\"redis.clients.jedis.JedisPoolConfig\">  \r\n     <property name=\"maxIdle\" value=\"${redis.maxIdle}\" />   \r\n     <property name=\"maxWaitMillis\" value=\"${redis.maxWait}\" />  \r\n     <property name=\"testOnBorrow\" value=\"${redis.testOnBorrow}\" />  \r\n   </bean>  \r\n   <bean id=\"JedisConnectionFactory\" class=\"org.springframework.data.redis.connection.jedis.JedisConnectionFactory\" \r\n       p:host-name=\"${redis.host}\" p:port=\"${redis.port}\" p:password=\"${redis.pass}\" p:pool-config-ref=\"poolConfig\"/>  \r\n   \r\n   <bean id=\"redisTemplate\" class=\"org.springframework.data.redis.core.RedisTemplate\">  \r\n     <property name=\"connectionFactory\" ref=\"JedisConnectionFactory\" />  \r\n   </bean>  \r\n```\r\n\r\n    maxIdle ：最大空闲数\r\n    maxWaitMillis:连接时的最大等待毫秒数\r\n    testOnBorrow：在提取一个jedis实例时，是否提前进行验证操作；如果为true，则得到的jedis实例均是可用的；\r\n\r\n**2.值类型操作**\r\n\r\n```java\r\n@RunWith(SpringJUnit4ClassRunner.class)\r\n@ContextConfiguration(locations=\"classpath:spring/applicationContext-redis.xml\")\r\npublic class TestValue {\r\n	@Autowired\r\n	private RedisTemplate redisTemplate;	\r\n	@Test\r\n	public void setValue(){\r\n		redisTemplate.boundValueOps(\"name\").set(\"itcast\");		\r\n	}	\r\n	@Test\r\n	public void getValue(){\r\n		String str = (String) redisTemplate.boundValueOps(\"name\").get();\r\n		System.out.println(str);\r\n	}	\r\n	@Test\r\n	public void deleteValue(){\r\n		redisTemplate.delete(\"name\");;\r\n	}	\r\n}\r\n```\r\n\r\n**3 .Set类型操作**\r\n\r\n```java\r\n@RunWith(SpringJUnit4ClassRunner.class)\r\n@ContextConfiguration(locations=\"classpath:spring/applicationContext-redis.xml\")\r\npublic class TestSet {\r\n	\r\n	@Autowired\r\n	private RedisTemplate redisTemplate;\r\n	\r\n	/**\r\n	 * 存入值\r\n	 */\r\n	@Test\r\n	public void setValue(){\r\n		redisTemplate.boundSetOps(\"nameset\").add(\"曹操\");		\r\n		redisTemplate.boundSetOps(\"nameset\").add(\"刘备\");	\r\n		redisTemplate.boundSetOps(\"nameset\").add(\"孙权\");\r\n	}\r\n	\r\n	/**\r\n	 * 提取值\r\n	 */\r\n	@Test\r\n	public void getValue(){\r\n		Set members = redisTemplate.boundSetOps(\"nameset\").members();\r\n		System.out.println(members);\r\n	}\r\n	\r\n	/**\r\n	 * 删除集合中的某一个值\r\n	 */\r\n	@Test\r\n	public void deleteValue(){\r\n		redisTemplate.boundSetOps(\"nameset\").remove(\"孙权\");\r\n	}\r\n	\r\n	/**\r\n	 * 删除整个集合\r\n	 */\r\n	@Test\r\n	public void deleteAllValue(){\r\n		redisTemplate.delete(\"nameset\");\r\n	}\r\n}\r\n```\r\n#### 4. List类型操作\r\n**创建测试类TestList \r\n（1）右压栈**\r\n\r\n```java\r\n/**\r\n	 * 右压栈：后添加的对象排在后边\r\n	 */\r\n	@Test\r\n	public void testSetValue1(){		\r\n		redisTemplate.boundListOps(\"namelist1\").rightPush(\"刘备\");\r\n		redisTemplate.boundListOps(\"namelist1\").rightPush(\"关羽\");\r\n		redisTemplate.boundListOps(\"namelist1\").rightPush(\"张飞\");		\r\n	}\r\n	\r\n	/**\r\n	 * 显示右压栈集合\r\n	 */\r\n	@Test\r\n	public void testGetValue1(){\r\n		List list = redisTemplate.boundListOps(\"namelist1\").range(0, 10);\r\n		System.out.println(list);\r\n	}\r\n```\r\n	\r\n    运行结果：\r\n    [刘备, 关羽, 张飞]\r\n\r\n**（2）左压栈**\r\n\r\n```java\r\n/**\r\n	 * 左压栈：后添加的对象排在前边\r\n	 */\r\n	@Test\r\n	public void testSetValue2(){		\r\n		redisTemplate.boundListOps(\"namelist2\").leftPush(\"刘备\");\r\n		redisTemplate.boundListOps(\"namelist2\").leftPush(\"关羽\");\r\n		redisTemplate.boundListOps(\"namelist2\").leftPush(\"张飞\");		\r\n	}\r\n	\r\n	/**\r\n	 * 显示左压栈集合\r\n	 */\r\n	@Test\r\n	public void testGetValue2(){\r\n		List list = redisTemplate.boundListOps(\"namelist2\").range(0, 10);\r\n		System.out.println(list);\r\n	}\r\n```\r\n	\r\n    运行结果：\r\n    [张飞, 关羽, 刘备]\r\n\r\n**（3）根据索引查询元素**\r\n\r\n```java\r\n	/**\r\n	 * 查询集合某个元素\r\n	 */\r\n	@Test\r\n	public void testSearchByIndex(){\r\n		String s = (String) redisTemplate.boundListOps(\"namelist1\").index(1);\r\n		System.out.println(s);\r\n	}\r\n```\r\n	\r\n**（4）移除某个元素的值**\r\n\r\n```java\r\n/**\r\n	 * 移除集合某个元素\r\n	 */\r\n	@Test\r\n	public void testRemoveByIndex(){\r\n		redisTemplate.boundListOps(\"namelist1\").remove(1, \"关羽\");\r\n	}\r\n```\r\n	\r\n##### 5. Hash类型操作\r\n**创建测试类TestHash**\r\n\r\n```java\r\n（1）存入值\r\n	@Test\r\n	public void testSetValue(){\r\n		redisTemplate.boundHashOps(\"namehash\").put(\"a\", \"唐僧\");\r\n		redisTemplate.boundHashOps(\"namehash\").put(\"b\", \"悟空\");\r\n		redisTemplate.boundHashOps(\"namehash\").put(\"c\", \"八戒\");\r\n		redisTemplate.boundHashOps(\"namehash\").put(\"d\", \"沙僧\");\r\n	}\r\n\r\n（2）提取所有的KEY\r\n	@Test\r\n	public void testGetKeys(){\r\n		Set s = redisTemplate.boundHashOps(\"namehash\").keys();		\r\n		System.out.println(s);		\r\n	}\r\n\r\n```\r\n\r\n    运行结果：\r\n    [a, b, c, d]\r\n    \r\n```java\r\n（3）提取所有的值\r\n	@Test\r\n	public void testGetValues(){\r\n		List values = redisTemplate.boundHashOps(\"namehash\").values();\r\n		System.out.println(values);		\r\n	}\r\n运行结果：\r\n[唐僧, 悟空, 八戒, 沙僧]\r\n（4）根据KEY提取值\r\n	@Test\r\n	public void testGetValueByKey(){\r\n		Object object = redisTemplate.boundHashOps(\"namehash\").get(\"b\");\r\n		System.out.println(object);\r\n	}\r\n运行结果：\r\n悟空\r\n（5）根据KEY移除值\r\n	@Test\r\n	public void testRemoveValueByKey(){\r\n		redisTemplate.boundHashOps(\"namehash\").delete(\"c\");\r\n	}\r\n运行后再次查看集合内容：\r\n[唐僧, 悟空, 沙僧]\r\n```\r\n\r\n\r\n');
INSERT INTO `t_article` VALUES ('22', 'Centos6.8中安装Docker遇到No package docker-io available解决办法', '小杰', 'Linux', '2019-12-18 10:46:50', '0', '6', '9', '\r\n####   由于写完一个项目后，只能在自己的电脑上运行，换一台电脑的话就需要各种环境配置，如此麻烦，费力费时。项目小还好，一遇到那种大型的项目变束手无策了，因此想到了学习Docker来解决这个问题——以此达到应用程式跨平台间的无缝接轨运作\r\n\r\n#### 个人学习教程：[尚硅谷_Docker核心技术](https://www.bilibili.com/video/av27122140/?p=15&t=133)\r\nhttps://www.bilibili.com/video/av27122140/?p=15&t=133\r\n\r\n\r\n今天在学习Docker时，在centos6.8安装docker过程中\r\n\r\n    yum install epel-release\r\n    yum install docker-io\r\n\r\n##### 遇到：No package docker-io available 错误：无须任何处理\r\n于是各种百度寻找解决办法，找到解决办法，直接执行命令：\r\n    \r\n\r\n> yum install https://get.docker.com/rpm/1.7.1/centos-6/RPMS/x86_64/docker-engine-1.7.1-1.el6.x86_64.rpm\r\n\r\n\r\n问题解决\r\n\r\n其他内容：\r\n\r\nDocker简介：https://blog.csdn.net/qq_41216743/article/details/93615104');
INSERT INTO `t_article` VALUES ('23', 'Docker简介', '杰尼', 'Linux', '2019-12-18 11:08:42', '0', '1', '3', '### 一、是什么\r\n#### 1.问题：为什么会有docker出现\r\n 一款产品从开发到上线，从操作系统，到运行环境，再到应用配置。作为开发+运维之间的协作我们需要关心很多东西，这也是很多互联网公司都不得不面对的问题，特别是各种版本的迭代之后，不同版本环境的兼容，对运维人员都是考验。\r\n \r\nDocker之所以发展如此迅速，也是因为它对此给出了一个标准化的解决方案。\r\n环境配置如此麻烦，换一台机器，就要重来一次，费力费时。很多人想到，能不能从根本上解决问题，软件可以带环境安装？也就是说，安装的时候，把原始环境一模一样地复制过来。开发人员利用 Docker 可以消除协作编码时“在我的机器上可正常工作”的问题。\r\n \r\n之前在服务器配置一个应用的运行环境，要安装各种软件，就拿尚硅谷电商项目的环境来说吧，Java/Tomcat/MySQL/JDBC驱动包等。安装和配置这些东西有多麻烦就不说了，它还不能跨平台。假如我们是在 Windows 上安装的这些环境，到了 Linux 又得重新装。况且就算不跨操作系统，换另一台同样操作系统的服务器，要移植应用也是非常麻烦的。\r\n \r\n传统上认为，软件编码开发/测试结束后，所产出的成果即是程序或是能够编译执行的二进制字节码等(java为例)。而为了让这些程序可以顺利执行，开发团队也得准备完整的部署文件，让运维团队得以部署应用程式，开发需要清楚的告诉运维部署团队，用的全部配置文件+所有软件环境。不过，即便如此，仍然常常发生部署失败的状况。Docker镜像的设计，使得Docker得以打破过去「程序即应用」的观念。透过镜像(images)将作业系统核心除外，运作应用程式所需要的系统环境，由下而上打包，达到应用程式跨平台间的无缝接轨运作。\r\n\r\n#### 2.docker理念\r\nDocker是基于Go语言实现的云开源项目。\r\n\r\nDocker的主要目标是“Build，Ship and Run Any App,Anywhere”，也就是通过对应用组件的封装、分发、部署、运行等生命周期的管理，使用户的APP（可以是一个WEB应用或数据库应用等等）及其运行环境能够做到“一次封装，到处运行”。\r\n\r\nLinux 容器技术的出现就解决了这样一个问题，而 Docker 就是在它的基础上发展过来的。将应用运行在 Docker 容器上面，而 Docker 容器在任何操作系统上都是一致的，这就实现了跨平台、跨服务器。只需要一次配置好环境，换到别的机子上就可以一键部署好，大大简化了操作\r\n\r\n\r\n##### 一句话：\r\n###### 解决了运行环境和配置问题软件容器，方便做持续集成并有助于整体发布的容器虚拟化技术。\r\n\r\n\r\n\r\n### 二、能干嘛\r\n#### 1.之前的虚拟机技术\r\n虚拟机（virtual machine）就是带环境安装的一种解决方案。\r\n\r\n它可以在一种操作系统里面运行另一种操作系统，比如在Windows 系统里面运行Linux 系统。应用程序对此毫无感知，因为虚拟机看上去跟真实系统一模一样，而对于底层系统来说，虚拟机就是一个普通文件，不需要了就删掉，对其他部分毫无影响。这类虚拟机完美的运行了另一套系统，能够使应用程序，操作系统和硬件三者之间的逻辑不变。  \r\n\r\n虚拟机的缺点：\r\n\r\n - 资源占用多\r\n - 冗余步骤多\r\n -  启动慢\r\n\r\n\r\n#### 2.容器虚拟化技术\r\n由于前面虚拟机存在这些缺点，Linux 发展出了另一种虚拟化技术：Linux 容器（Linux Containers，缩写为 LXC）。\r\n\r\nLinux 容器不是模拟一个完整的操作系统，而是对进程进行隔离。有了容器，就可以将软件运行所需的所有资源打包到一个隔离的容器中。容器与虚拟机不同，不需要捆绑一整套操作系统，只需要软件工作所需的库资源和设置。系统因此而变得高效轻量并保证部署在任何环境中的软件都能始终如一地运行。\r\n\r\n**比较了 Docker 和传统虚拟化方式的不同之处：**\r\n  \r\n\r\n● 传统虚拟机技术是虚拟出一套硬件后，在其上运行一个完整操作系统，在该系统上再运行所需应用进程；   \r\n●    而容器内的应用进程直接运行于宿主的内核，容器内没有自己的内核，而且也没有进行硬件虚拟。因此容器要比传统虚拟机更为轻便。 \r\n  ●    每个容器之间互相隔离，每个容器有自己的文件系统 ，容器之间进程不会相互影响，能区分计算资源。\r\n  \r\n\r\n#### 3.开发/运维（DevOps）一次构建、随处运行\r\n  ● 更快速的应用交付和部署\r\n\r\n> 传统的应用开发完成后，需要提供一堆安装程序和配置说明文档，安装部署后需根据配置文档进行繁杂的配置才能正常运行。Docker化之后只需要交付少量容器镜像文件，在正式生产环境加载镜像并运行即可，应用安装配置在镜像里已经内置好，大大节省部署配置和测试验证时间。\r\n\r\n  ● 更便捷的升级和扩缩容\r\n\r\n> 随着微服务架构和Docker的发展，大量的应用会通过微服务方式架构，应用的开发构建将变成搭乐高积木一样，每个Docker容器将变成一块“积木”，应用的升级将变得非常容易。当现有的容器不足以支撑业务处理时，可通过镜像运行新的容器进行快速扩容，使应用系统的扩容从原先的天级变成分钟级甚至秒级。\r\n\r\n  ● 更简单的系统运维\r\n\r\n> 应用容器化运行后，生产环境运行的应用可与开发、测试环境的应用高度一致，容器会将应用程序相关的环境和状态完全封装起来，不会因为底层基础架构和操作系统的不一致性给应用带来影响，产生新的BUG。当出现程序异常时，也可以通过测试环境的相同容器进行快速定位和修复。\r\n\r\n  ● 更高效的计算资源利用\r\n	\r\n\r\n> Docker是内核级虚拟化，其不像传统的虚拟化技术一样需要额外的Hypervisor支持，所以在一台物理机上可以运行很多个容器实例，可大大提升物理服务器的CPU和内存的利用率。\r\n\r\n			\r\n### 三、去哪下\r\n**官网**\r\n	\r\n\r\n - docker官网：http://www.docker.com\r\n\r\n	\r\n\r\n - docker中文网站：https://www.docker-cn.com/\r\n\r\n**仓库**\r\n	\r\n\r\n - Docker Hub官网: https://hub.docker.com/\r\n');
INSERT INTO `t_article` VALUES ('24', '集群概述', '小杰', 'Linux', '2019-12-18 11:11:29', '0', '0', '2', '\r\n### 1.1什么是集群\r\n###### 1.1.1集群概念\r\n集群是一种计算机系统， 它通过一组松散集成的计算机软件和/或硬件连接起来高度紧密地协作完成计算工作。在某种意义上，他们可以被看作是一台计算机。集群系统中的单个计算机通常称为节点，通常通过局域网连接，但也有其它的可能连接方式。集群计算机通常用来改进单个计算机的计算速度和/或可靠性。一般情况下集群计算机比单个计算机，比如工作站或超级计算机性能价格比要高得多。\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/2019062522124911.jpeg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQxMjE2NzQz,size_16,color_FFFFFF,t_70)\r\n###### 1.1.2集群的特点\r\n**集群拥有以下两个特点：**\r\n1.   可扩展性：集群的性能不限制于单一的服务实体，新的服务实体可以动态的添加到集群，从而增强集群的性能。\r\n2.   高可用性：集群当其中一个节点发生故障时，这台节点上面所运行的应用程序将在另一台节点被自动接管，消除单点故障对于增强数据可用性、可达性和可靠性是非常重要的。\r\n###### 1.1.3集群的两大能力\r\n**集群必须拥有以下两大能力：**\r\n1.    负载均衡：负载均衡把任务比较均匀的分布到集群环境下的计算和网络资源，以提高数据吞吐量。\r\n2.    错误恢复：如果集群中的某一台服务器由于故障或者维护需要无法使用，资源和应用程序将转移到可用的集群节点上。这种由于某个节点的资源不能工作，另一个可用节点中的资源能够透明的接管并继续完成任务的过程，叫做错误恢复。\r\n负载均衡和错误恢复要求各服务实体中有执行同一任务的资源存在，而且对于同一任务的各个资源来说，执行任务所需的信息视图必须是相同的。\r\n### 1.2集群与分布式的区别\r\n说到集群，可能大家会立刻联想到另一个和它很相近的一个词----“分布式”。那么集群和分布式是一回事吗？有什么联系和区别呢?\r\n**相同点：**\r\n分布式和集群都是需要有很多节点服务器通过网络协同工作完成整体的任务目标。\r\n**不同点：**\r\n分布式是指将业务系统进行拆分，即分布式的每一个节点都是实现不同的功能。而集群每个节点做的是同一件事情。\r\n如下图，每个人都有不同的分工，一起协作干一件事，叫做“分布式”\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190625221525783.jpeg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQxMjE2NzQz,size_16,color_FFFFFF,t_70)\r\n\r\n再看下图：每个划桨人干的都是一样的活，叫做集群。\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190625221541591.jpeg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQxMjE2NzQz,size_16,color_FFFFFF,t_70)\r\n分布式的每一个节点也可以做成集群。其实这个赛龙舟的图，总整体来看属于分布式,包括打鼓和划桨两个分布式节点，而划桨的节点又是集群的形态。\r\n\r\n\r\n现实生活中例子还有很多，例如，这样古代乐队的图就属于集群\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190625221618923.jpeg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQxMjE2NzQz,size_16,color_FFFFFF,t_70)\r\n\r\n而现代乐队这样图就是分布式啦\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190625221647181.jpeg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQxMjE2NzQz,size_16,color_FFFFFF,t_70)\r\n\r\n好啦，集群概念就分享到这，如果喜欢给个赞喔喔！！！');
INSERT INTO `t_article` VALUES ('25', '开源数据库中间件-MyCat', '笃行', 'JavaEE学习', '2019-12-18 11:12:46', '0', '0', '1', '### 1.1 MyCat简介\r\nMycat 背后是阿里曾经开源的知名产品——Cobar。Cobar 的核心功能和优势是 MySQL 数据库分片，此产品曾经广为流传，据说最早的发起者对 Mysql 很精通，后来从阿里跳槽了，阿里随后开源的 Cobar，并维持到 2013 年年初，然后，就没有然后了。 \r\n\r\nCobar 的思路和实现路径的确不错。基于 Java 开发的，实现了 MySQL 公开的二进制传输协议，巧妙地将自己伪装成一个 MySQL Server，目前市面上绝大多数 MySQL 客户端工具和应用都能兼容。比自己实现一个新的数据库协议要明智的多，因为生态环境在哪里摆着。\r\n \r\nMycat 是基于 cobar 演变而来，对 cobar 的代码进行了彻底的重构，使用 NIO 重构了网络模块，并且优化了 Buffer 内核，增强了聚合，Join 等基本特性，同时兼容绝大多数数据库成为通用的数据库中间件。\r\n\r\n**简单的说，MyCAT就是：**\r\n		一个新颖的数据库中间件产品支持mysql集群，或者mariadb cluster，提供高可用性数据分片集群。你可以像使用mysql一样使用mycat。对于开发人员来说根本感觉不到mycat的存在。\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190626170611145.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQxMjE2NzQz,size_16,color_FFFFFF,t_70)\r\nMyCat支持的数据库：\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190626170655467.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQxMjE2NzQz,size_16,color_FFFFFF,t_70)\r\n\r\n\r\n### 1.2MyCat分片-海量数据存储解决方案\r\n##### 1.2.1 什么是分片\r\n简单来说，就是指通过某种特定的条件，将我们存放在同一个数据库中的数据分散存放到多个数据库（主机）上面，以达到分散单台设备负载的效果。 \r\n数据的切分（Sharding）根据其切分规则的类型，可以分为两种切分模式。\r\n  \r\n（1）一种是按照不同的表（或者Schema）来切分到不同的数据库（主机）之上，这种切分可以称之为数据的垂直（纵向）切分\r\n   ![在这里插入图片描述](https://img-blog.csdnimg.cn/20190626170847531.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQxMjE2NzQz,size_16,color_FFFFFF,t_70)\r\n\r\n（2）另外一种则是根据表中的数据的逻辑关系，将同一个表中的数据按照某种条件拆分到多台数据库（主机）上面，这种切分称之为数据的水平（横向）切分。\r\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190626170900810.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQxMjE2NzQz,size_16,color_FFFFFF,t_70)\r\n\r\n### 1.3 MyCat安装及启动\r\n**MyCat：\r\nMyCat的官方网站：**\r\nhttp://www.mycat.org.cn/\r\n**下载地址：**\r\nhttps://github.com/MyCATApache/Mycat-download\r\n');
INSERT INTO `t_article` VALUES ('26', 'JVM详解与类加载机制', '小杰', 'JavaEE学习', '2019-12-18 11:15:10', '0', '0', '1', '目录\r\n           一、JVM体系结构概述\r\n\r\n           二、堆体系结构概述\r\n\r\n           三、对参数调优入门\r\n\r\n           学习视频：https://www.bilibili.com/video/av64318688\r\n\r\n           学习资料：https://pan.baidu.com/s/1AoD3-np_im3r1CeA_YzZmQ          提取码：v0yc \r\n\r\n\r\n\r\n\r\n一、JVM体系结构概述\r\n1.1 JVM位置(JVM是运行在操作系统之上的，它与硬件没有直接的交互)\r\n\r\n\r\n\r\n\r\n\r\n1.2 JVM体系结构概述\r\n\r\n\r\n\r\n\r\n\r\n1.3 类装载器ClassLoader\r\n\r\n负责加载class文件，class文件在文件开头有特定的文件标示，并且ClassLoader只负责class文件的加载，至于它是否可以运行，则由Execution Engine决定\r\n\r\n\r\n\r\n1.4 类装载器种类（4种）\r\n\r\n•虚拟机自带的加载器\r\n\r\n       •启动类加载器（Bootstrap）C++\r\n\r\n       •扩展类加载器（Extension）Java\r\n\r\n       •应用程序类加载器（AppClassLoader）Java，也叫系统类加载器，加载当前应用的classpath的所有类\r\n\r\n•用户自定义加载器  Java.lang.ClassLoader的子类，用户可以定制类的加载方式\r\n\r\n\r\n\r\n\r\n\r\n1.5 Native Interface本地接口\r\n\r\n本地接口的作用是融合不同的编程语言为 Java 所用，它的初衷是融合 C/C++程序，Java 诞生的时候是 C/C++横行的时候，要想立足，必须有调用 C/C++程序，于是就在内存中专门开辟了一块区域处理标记为native的代码，它的具体做法是 Native Method Stack中登记 native方法，在Execution Engine 执行时加载native libraies。\r\n\r\n  目前该方法使用的越来越少了，除非是与硬件有关的应用，比如通过Java程序驱动打印机或者Java系统管理生产设备，在企业级应用中已经比较少见。因为现在的异构领域间的通信很发达，比如可以使用 Socket通信，也可以使用Web Service等等，不多做介绍。\r\n\r\n\r\n\r\n1.6 Native Method Stack\r\n\r\n它的具体做法是Native Method Stack中登记native方法，在Execution Engine 执行时加载本地方法库。\r\n\r\n\r\n1.7 PC寄存器\r\n        每个线程都有一个程序计数器，是线程私有的,就是一个指针，指向方法区中的方法字节码（用来存储指向下一条指令的地址,也即将要执行的指令代码），由执行引擎读取下一条指令，是一个非常小的内存空间，几乎可以忽略不记。\r\n\r\n\r\n\r\n1.9 Method Area 方法区\r\n\r\n方法区是被所有线程共享，所有字段和方法字节码，以及一些特殊方法如构造函数，接口代码也在此定义。简单说，所有定义的方法的信息都保存在该区域，此区属于共享区间。\r\n\r\n静态变量+常量+类信息(构造方法/接口定义)+运行时常量池存在方法区中，But实例变量存在堆内存中,和方法区无关\r\n\r\n\r\n\r\n\r\n1.10 java栈区（Stack 栈是什么）是什么？\r\n         栈也叫栈内存，主管Java程序的运行，是在线程创建时创建，它的生命期是跟随线程的生命期，线程结束栈内存也就释放，对于栈来说不存在垃圾回收问题，只要线程一结束该栈就Over，生命周期和线程一致，是线程私有的。8种基本类型的变量+对象的引用变量+实例方法都是在函数的栈内存中分配。\r\n\r\n\r\n\r\n\r\n\r\n二、堆体系结构描述\r\n2.1 Heap 堆\r\n\r\n  一个JVM实例只存在一个堆内存，堆内存的大小是可以调节的。类加载器读取了类文件后，需要把类、方法、常变量放到堆内存中，保存所有引用类型的真实信息，以方便执行器执行，堆内存分为三部分：\r\n\r\nYoung Generation Space      新生区                    Young/New\r\nTenure generation space      养老区                    Old/ Tenure\r\n Permanent Space                永久区                    Perm\r\nJava7之前：\r\n\r\n  一个JVM实例只存在一个堆内存，堆内存的大小是可以调节的。类加载器读取了类文件后，需要把类、方法、常变量放到堆内存中，保存所有引用类型的真实信息，以方便执行器执行。堆内存逻辑上分为三部分：新生+养老+永久\r\n\r\n新生区：\r\n\r\n新生区是类的诞生、成长、消亡的区域，一个类在这里产生，应用，最后被垃圾回收器收集，结束生命。新生区又分为两部分： 伊甸区（Eden space）和幸存者区（Survivor pace） ，所有的类都是在伊甸区被new出来的。幸存区有两个： 0区（Survivor 0 space）和1区（Survivor 1 space）。当伊甸园的空间用完时，程序又需要创建对象，JVM的垃圾回收器将对伊甸园区进行垃圾回收(Minor GC)，将伊甸园区中的不再被其他对象所引用的对象进行销毁。然后将伊甸园中的剩余对象移动到幸存 0区。若幸存 0区也满了，再对该区进行垃圾回收，然后移动到 1 区。那如果1 区也满了呢？再移动到养老区。若养老区也满了，那么这个时候将产生MajorGC（FullGC），进行养老区的内存清理。若养老区执行了Full GC之后发现依然无法进行对象的保存，就会产生OOM异常“OutOfMemoryError”。\r\n\r\n如果出现java.lang.OutOfMemoryError: Java heap space异常，说明Java虚拟机的堆内存不够。原因有二：\r\n\r\n（1）Java虚拟机的堆内存设置不够，可以通过参数-Xms、-Xmx来调整。\r\n\r\n（2）代码中创建了大量大对象，并且长时间不能被垃圾收集器收集（存在被引用）。\r\n\r\n\r\n\r\n永久区：\r\n\r\n  永久存储区是一个常驻内存区域，用于存放JDK自身所携带的 Class,Interface 的元数据，也就是说它存储的是运行环境必须的类信息，被装载进此区域的数据是不会被垃圾回收器回收掉的，关闭 JVM 才会释放此区域所占用的内存。\r\n\r\n  如果出现java.lang.OutOfMemoryError: PermGen space，说明是Java虚拟机对永久代Perm内存设置不够。一般出现这种情况，都是程序启动需要加载大量的第三方jar包。例如：在一个Tomcat下部署了太多的应用。或者大量动态反射生成的类不断被加载，最终导致Perm区被占满。\r\n\r\nJdk1.6及之前： 有永久代, 常量池1.6在方法区\r\nJdk1.7：       有永久代，但已经逐步“去永久代”，常量池1.7在堆\r\nJdk1.8及之后： 无永久代，常量池1.8在元空间\r\n\r\n\r\n三、对参数调优入门\r\n3.1 堆内存调优简介\r\n\r\n\r\n\r\n\r\n\r\n代码调试：\r\n\r\npackage com.jvm.test;\r\n\r\nimport java.util.Random;\r\n\r\npublic class JvmTest {\r\n    public static void main(String[] args){\r\n       long maxMemory = Runtime.getRuntime().maxMemory() ;//返回 Java 虚拟机试图使用的最大内存量。\r\n       long totalMemory = Runtime.getRuntime().totalMemory() ;//返回 Java 虚拟机中的内存总量。\r\n       System.out.println(\"MAX_MEMORY = \" + maxMemory + \"（字节）、\" + (maxMemory / (double)1024 / 1024) + \"MB\");\r\n       System.out.println(\"TOTAL_MEMORY = \" + totalMemory + \"（字节）、\" + (totalMemory / (double)1024 / 1024) + \"MB\");\r\n       \r\n    }\r\n\r\n}\r\n\r\n\r\n本人内存大小为8G，发现默认的情况下分配的内存(MAX)是总内存的“1 / 4”、而初始化（TOTAL_MEMORY）的内存为“1 / 64”\r\n\r\n\r\n\r\n手动调整：\r\n\r\n\r\n\r\n\r\n\r\n运行结果：\r\n\r\n\r\n\r\n\r\n\r\n最大内存调为20M，运行下列代码将会堆溢出：\r\n\r\n\r\n\r\npackage com.jvm.test;\r\n\r\nimport java.util.Random;\r\n\r\npublic class JvmTest {\r\n    public static void main(String[] args){\r\n        String str = \"你好！远方的朋友\" ;\r\n        while(true)\r\n        {\r\n            str += str + new Random().nextInt(88888888) + new Random().nextInt(999999999) ;\r\n        }\r\n\r\n    }\r\n\r\n}\r\n\r\n\r\n运行结果：\r\n\r\n\r\n\r\n通过上图我们可以发现，当新生区内存不够时便会执行GC进行垃圾回收，多次未被回收的将被存入养老区，当养老区内存也不够时执行fullGC回收，fullGC失败即会出现OutOfMemoryError。\r\n\r\n\r\n\r\n\r\n\r\n每日一言：\r\n\r\n做完高难度任务后，再去做低难度任务效率会很高！\r\n\r\n\r\n\r\n');
INSERT INTO `t_article` VALUES ('27', '使用Maven的好处', '小杰', 'JavaEE学习', '2019-12-18 11:18:05', '0', '0', '1', 'Maven提供了开发人员构建一个完整的生命周期框架。开发团队可以自动完成项目的基础工具建设，Maven使用标准的目录结构和默认构建生命周期。Maven让开发人员的工作更轻松，同时创建报表，检查，构建和测试自动化设置。Maven简化和标准化项目建设过程。处理编译，分配，文档，团队协作和其他任务的无缝连接。 Maven增加可重用性并负责建立相关的任务。\r\n\r\n每个Java项目的目录结构都没有一个统一的标准，配置文件到处都是，单元测试代码到底应该放在那里也没有一个权威的规范。\r\n\r\n因此，我们就要用到Maven（使用Ant也可以，不过编写Ant的xml脚本比较麻烦）----一个项目管理工具。\r\n\r\nMaven主要做了两件事：\r\n\r\n统一开发规范与工具\r\n统一管理jar包\r\n如果没有Maven,你可能不得不经历下面的过程：\r\n\r\n    1 如果使用了spring，去spring的官网下载jar包；如果使用hibernate，去hibernate的官网下载Jar包；如果使用Log4j，去log4j的官网  下载jar包.....\r\n    2 当某些jar包有依赖的时候，还要去下载对应的依赖jar包\r\n    3 当jar包依赖有冲突时，不得不一个一个的排查\r\n    4 执行构建时，需要使用ant写出很多重复的任务代码\r\n    5 当新人加入开发时，需要拷贝大量的jar包，然后重复进行构建\r\n    6 当进行测试时，需要一个一个的运行....检查\r\n\r\n\r\n有了Maven，它提供了三种功能：\r\n\r\n    1 依赖的管理：仅仅通过jar包的几个属性，就能确定唯一的jar包，在指定的文件pom.xml中，只要写入这些依赖属性，就会自动下载并管理jar包。\r\n    2 项目的构建：内置很多的插件与生命周期，支持多种任务，比如校验、编译、测试、打包、部署、发布...\r\n    3 项目的知识管理：管理项目相关的其他内容，比如开发者信息，版本等等 \r\n原文转自：https://www.cnblogs.com/best/p/9676515.html');
INSERT INTO `t_article` VALUES ('28', 'jvm面试题---请谈谈你对 OOM 的认识？', '笃行', 'JavaEE学习', '2019-12-18 11:39:59', '0', '0', '4', 'JVM面试题——谈谈你对OOM的理解？\r\njava中的常见OOM有：\r\n\r\n1、java.lang.StackOverflowError\r\n\r\n2、java.lang.OutOfMemoryError: Java heap space\r\n\r\n3、java.lang.OutOfMemoryError: GC overhead limit exceeded\r\n\r\n4、java.lang.OutOfMemoryError: Direct buffer memory\r\n\r\n5、java.lang.OutOfMemoryError : unable to create new native thread\r\n\r\n6、java.lang.OutOfMemoryError: Metaspace\r\n\r\n\r\n\r\n1、java.lang.StackOverflowError\r\n\r\n在一个函数中调用自己就会产生这样的错误（栈溢出）\r\n发生区域：java虚拟机栈或本地方法栈\r\n代码实现：\r\n\r\npublic class StackOverflowErrorDemo {\r\n    public static void main(String[] args) {\r\n        stackOverflowError();\r\n    }\r\n\r\n    private static void stackOverflowError() {\r\n        stackOverflowError();\r\n    }\r\n}\r\n\r\n\r\n2、java.lang.OutOfMemoryError: Java heap space\r\n\r\nnew 一个很大对象,jvm堆内存不足时 \r\n发生区域：java堆\r\n代码实现：\r\n\r\n/*\r\n*\r\n* -Xms20m -Xmx20m\r\n*/\r\npublic class JavaHeapSpaceDemo {\r\n    public static void main(String[] args) {\r\n        //方式一\r\n        /*String str = \"lijiegui\";\r\n        while (true) {\r\n            str += str + new Random().nextInt(1111);\r\n            str.intern();\r\n        }*/\r\n        \r\n        //方式二\r\n        byte[] bytes = new byte[80*1024*1024];\r\n    }\r\n}\r\n\r\n\r\n3、java.lang.OutOfMemoryError: GC overhead limit exceeded\r\n\r\n执行垃圾收集的时间比例太大， 有效的运算量太小，默认情况下,，如果GC花费的时间超过 98%， 并且GC回收的内存少于 2%， JVM就会抛出这个错误。\r\n代码实现：\r\n\r\n//-Xms10m -Xmx10m -XX:+PrintGCDetails -XX:MaxDirectMemorySize=5m\r\npublic class GcOverheadDemo {\r\n    public static void main(String[] args) {\r\n        int i = 0;\r\n        List<String> list = new ArrayList<>();\r\n\r\n        try {\r\n            while (true) {\r\n                list.add(String.valueOf(++i).intern());\r\n            }\r\n        } catch (Exception e) {\r\n            System.out.println(\"---i:\" + i);\r\n            e.printStackTrace();\r\n        }\r\n    }\r\n}\r\n\r\n\r\n4、java.lang.OutOfMemoryError: Direct buffer memory\r\n\r\n原因：直接内存不足\r\n\r\n写NIO程序经常使用ByteBuffer来读取或写入数据，这是一种基于通道与缓冲区的I/O方式\r\n\r\nByteBuffer.allocate() 分配JVM堆内存，属于GC管辖范围，需要拷贝所以速度相对较慢\r\n\r\nByteBuffer.allocateDirect() 分配操作系统本地内存，不属于GC管辖范围，不需要内存拷贝所以速度相对较快\r\n\r\n代码实现：\r\n\r\n//配置参数：-Xms10m -Xmx10m -XX:+PrintGCDetails -XX:MaxDirectMemorySize=5m\r\npublic class DirectBufferDemo {\r\n    public static void main(String[] args) {\r\n        System.out.println(\"maxDirectMemory : \" + sun.misc.VM.maxDirectMemory() / (1024 * 1024) + \"MB\");\r\n        ByteBuffer byteBuffer = ByteBuffer.allocateDirect(6 * 1024 * 1024);\r\n    }\r\n}\r\n\r\n\r\n5、java.lang.OutOfMemoryError : unable to create new native thread\r\n\r\n一个应用进程创建了多个线程，超过系统承载极限,Linux默认允许单个进程可以创建的线程数1024\r\n代码实现：\r\n\r\npublic class UnableCreateNewThreadDemo {\r\n    public static void main(String[] args) {\r\n        for (int i = 0; ; i++) {\r\n            new Thread(() -> {\r\n                try {\r\n                    Thread.sleep(Integer.MAX_VALUE);\r\n                } catch (InterruptedException e) {\r\n                    e.printStackTrace();\r\n                }\r\n            }, String.valueOf(i)).start();\r\n        }\r\n    }\r\n}　　\r\n\r\n\r\n6、java.lang.OutOfMemoryError: Metaspace\r\n\r\njava8使用Metaspace代替永久代，与永久代最大的区别是：元空间并不在虚拟机内存中，而是使用本地内存。　　\r\n\r\n永久代（java8使用Metaspace）存放的信息：\r\n\r\n虚拟机加载的类信息\r\n常量池\r\n静态变量\r\n即时编译后的代码\r\n\r\n\r\n\r\n\r\n每日一言：\r\n\r\n有目标不一定怎么样，没目标一定不能怎么样。\r\n\r\n\r\n\r\n');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `nickname` varchar(30) DEFAULT NULL,
  `content` text,
  `time` datetime DEFAULT '2017-09-18 00:00:00',
  `star` int(11) DEFAULT '0',
  `diss` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`),
  CONSTRAINT `article_id` FOREIGN KEY (`article_id`) REFERENCES `t_article` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('25', '17', '大美女', '还行', '2019-12-13 11:19:18', '0', '0');
INSERT INTO `t_comment` VALUES ('26', '17', '188', '124', '2019-12-15 09:02:40', '0', '0');
INSERT INTO `t_comment` VALUES ('27', '17', '188', '124', '2019-12-15 09:04:25', '0', '0');
INSERT INTO `t_comment` VALUES ('28', '13', '44', '444', '2017-09-18 00:00:00', '0', '0');
INSERT INTO `t_comment` VALUES ('29', '21', '匿名', '感谢博主，学到了', '2019-12-18 10:45:54', '0', '0');
INSERT INTO `t_comment` VALUES ('30', '21', '1952175699', '非常不错的文章', '2019-12-18 10:46:18', '0', '0');
INSERT INTO `t_comment` VALUES ('31', '22', '小美', 'very good……', '2019-12-18 10:50:09', '0', '0');
INSERT INTO `t_comment` VALUES ('32', '21', '小美', 'very good……', '2019-12-18 10:59:45', '0', '0');
INSERT INTO `t_comment` VALUES ('33', '22', '匿名', '向博主学习', '2019-12-18 11:00:39', '0', '0');
INSERT INTO `t_comment` VALUES ('34', '22', '刘海斌', '可以啊', '2019-12-18 11:01:43', '0', '0');
INSERT INTO `t_comment` VALUES ('35', '22', '杰尼', '加油', '2019-12-18 11:07:49', '0', '0');
INSERT INTO `t_comment` VALUES ('36', '22', '123', 'welcome to you ', '2019-12-18 11:08:21', '0', '0');
INSERT INTO `t_comment` VALUES ('37', '23', '嘚瑟', '哈哈，第一', '2019-12-18 11:10:18', '0', '0');

-- ----------------------------
-- Table structure for t_link
-- ----------------------------
DROP TABLE IF EXISTS `t_link`;
CREATE TABLE `t_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '友链名称',
  `url` varchar(255) DEFAULT NULL COMMENT '友链地址',
  `image` varchar(255) DEFAULT NULL COMMENT '友链图像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_link
-- ----------------------------
INSERT INTO `t_link` VALUES ('1', '笃行博客', 'https://blog.csdn.net/qq_41216743', 'user7-128x128.jpg');
INSERT INTO `t_link` VALUES ('2', '小杰日志', 'https://pure-xiaojie.github.io', 'user2-160x160.jpg');
INSERT INTO `t_link` VALUES ('6', '哈哈123', 'www.baidu.com', 'user8-128x128.jpg');

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag` (
  `id` int(11) DEFAULT NULL,
  `tag` varchar(30) DEFAULT NULL,
  KEY `id` (`id`),
  CONSTRAINT `t_tag_ibfk_1` FOREIGN KEY (`id`) REFERENCES `t_article` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tag
-- ----------------------------
INSERT INTO `t_tag` VALUES ('13', 'SpringBoot');
INSERT INTO `t_tag` VALUES ('13', 'java');
INSERT INTO `t_tag` VALUES ('14', 'java');
INSERT INTO `t_tag` VALUES ('14', '支付宝沙箱');
INSERT INTO `t_tag` VALUES ('17', 'c');
INSERT INTO `t_tag` VALUES ('17', 'c++');
INSERT INTO `t_tag` VALUES ('17', 'Vector');
INSERT INTO `t_tag` VALUES ('21', 'redis');
INSERT INTO `t_tag` VALUES ('21', 'spring');
INSERT INTO `t_tag` VALUES ('21', 'java');
INSERT INTO `t_tag` VALUES ('22', 'Centos');
INSERT INTO `t_tag` VALUES ('22', 'Docker');
INSERT INTO `t_tag` VALUES ('23', 'Docker');
INSERT INTO `t_tag` VALUES ('23', 'Centos');
INSERT INTO `t_tag` VALUES ('23', '容器');
INSERT INTO `t_tag` VALUES ('24', '集群');
INSERT INTO `t_tag` VALUES ('24', 'linux');
INSERT INTO `t_tag` VALUES ('25', '中间件');
INSERT INTO `t_tag` VALUES ('25', 'mycat');
INSERT INTO `t_tag` VALUES ('25', '分片');
INSERT INTO `t_tag` VALUES ('26', 'java');
INSERT INTO `t_tag` VALUES ('27', 'maven');
INSERT INTO `t_tag` VALUES ('27', 'java');
INSERT INTO `t_tag` VALUES ('28', 'jvm');
INSERT INTO `t_tag` VALUES ('28', 'OOM');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'primary_key',
  `user_name` varchar(20) NOT NULL COMMENT 'username',
  `user_password` varchar(20) NOT NULL COMMENT 'password',
  `user_work` varchar(255) DEFAULT NULL,
  `user_place` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '小杰', '123456', 'java开发，在学习中', '湖南省永州市蓝山县', '1952175699@qq.com', '15874423919');
INSERT INTO `t_user` VALUES ('2', '创新', '123', '还在学习', '湖南张家界', '1952175699@qq.com', '15897476136');
INSERT INTO `t_user` VALUES ('3', '哈哈', '0000', '无业游民', '吉首大学', '123456@qq.com', '10086');

-- ----------------------------
-- Table structure for t_visitor
-- ----------------------------
DROP TABLE IF EXISTS `t_visitor`;
CREATE TABLE `t_visitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `web_ip` varchar(50) DEFAULT NULL,
  `host` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_visitor
-- ----------------------------
INSERT INTO `t_visitor` VALUES ('52', '0:0:0:0:0:0:0:1', '2019-12-09-20:52:49', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('53', '0:0:0:0:0:0:0:1', '2019-12-09-20:53:18', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('54', '0:0:0:0:0:0:0:1', '2019-12-10 14:59:13', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('55', '0:0:0:0:0:0:0:1', '2019-12-10 14:59:48', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('56', '0:0:0:0:0:0:0:1', '2019-12-10 15:06:25', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('57', '0:0:0:0:0:0:0:1', '2019-12-10 15:22:21', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('58', '0:0:0:0:0:0:0:1', '2019-12-10 15:49:07', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('59', '0:0:0:0:0:0:0:1', '2019-12-12 08:37:47', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('60', '0:0:0:0:0:0:0:1', '2019-12-12 08:40:15', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('61', '0:0:0:0:0:0:0:1', '2019-12-12 08:40:44', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('62', '0:0:0:0:0:0:0:1', '2019-12-12 08:41:43', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('63', '0:0:0:0:0:0:0:1', '2019-12-12 08:47:59', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('64', '0:0:0:0:0:0:0:1', '2019-12-12 14:50:44', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('65', '0:0:0:0:0:0:0:1', '2019-12-12 16:32:46', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('66', '0:0:0:0:0:0:0:1', '2019-12-12 16:34:24', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('67', '0:0:0:0:0:0:0:1', '2019-12-12 16:35:47', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('68', '0:0:0:0:0:0:0:1', '2019-12-12 16:36:36', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('69', '0:0:0:0:0:0:0:1', '2019-12-13 10:07:47', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('70', '0:0:0:0:0:0:0:1', '2019-12-13 10:08:42', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('71', '0:0:0:0:0:0:0:1', '2019-12-13 10:09:02', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('72', '0:0:0:0:0:0:0:1', '2019-12-13 10:09:13', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('73', '0:0:0:0:0:0:0:1', '2019-12-13 10:09:15', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('74', '0:0:0:0:0:0:0:1', '2019-12-13 10:10:14', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('75', '0:0:0:0:0:0:0:1', '2019-12-13 10:12:23', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('76', '0:0:0:0:0:0:0:1', '2019-12-13 10:13:14', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('77', '0:0:0:0:0:0:0:1', '2019-12-13 10:14:18', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('78', '0:0:0:0:0:0:0:1', '2019-12-13 10:14:33', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('79', '0:0:0:0:0:0:0:1', '2019-12-13 10:25:20', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('80', '0:0:0:0:0:0:0:1', '2019-12-13 11:04:22', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('81', '0:0:0:0:0:0:0:1', '2019-12-13 11:18:52', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('82', '0:0:0:0:0:0:0:1', '2019-12-13 11:20:48', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('83', '0:0:0:0:0:0:0:1', '2019-12-13 11:26:59', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('84', '0:0:0:0:0:0:0:1', '2019-12-13 11:37:57', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('85', '0:0:0:0:0:0:0:1', '2019-12-13 11:39:12', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('86', '0:0:0:0:0:0:0:1', '2019-12-13 11:40:25', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('87', '0:0:0:0:0:0:0:1', '2019-12-13 12:00:06', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('88', '0:0:0:0:0:0:0:1', '2019-12-15 08:19:46', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('89', '0:0:0:0:0:0:0:1', '2019-12-15 08:20:12', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('90', '0:0:0:0:0:0:0:1', '2019-12-15 09:11:27', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('91', '0:0:0:0:0:0:0:1', '2019-12-15 09:16:00', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('92', '0:0:0:0:0:0:0:1', '2019-12-15 09:16:29', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('93', '0:0:0:0:0:0:0:1', '2019-12-15 09:19:30', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('94', '0:0:0:0:0:0:0:1', '2019-12-15 09:59:44', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('95', '0:0:0:0:0:0:0:1', '2019-12-15 09:59:52', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('96', '0:0:0:0:0:0:0:1', '2019-12-15 10:00:13', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('97', '0:0:0:0:0:0:0:1', '2019-12-15 10:06:19', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('98', '0:0:0:0:0:0:0:1', '2019-12-15 10:06:29', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('99', '0:0:0:0:0:0:0:1', '2019-12-15 10:06:47', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('100', '0:0:0:0:0:0:0:1', '2019-12-15 10:10:00', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('101', '0:0:0:0:0:0:0:1', '2019-12-15 10:11:24', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('102', '0:0:0:0:0:0:0:1', '2019-12-15 10:12:01', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('103', '0:0:0:0:0:0:0:1', '2019-12-15 10:14:05', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('104', '0:0:0:0:0:0:0:1', '2019-12-15 10:14:36', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('105', '0:0:0:0:0:0:0:1', '2019-12-15 10:14:40', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('106', '0:0:0:0:0:0:0:1', '2019-12-15 10:14:49', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('107', '0:0:0:0:0:0:0:1', '2019-12-15 10:16:01', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('108', '0:0:0:0:0:0:0:1', '2019-12-15 10:16:57', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('109', '0:0:0:0:0:0:0:1', '2019-12-15 10:17:15', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('110', '0:0:0:0:0:0:0:1', '2019-12-15 10:17:57', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('111', '0:0:0:0:0:0:0:1', '2019-12-15 10:17:59', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('112', '0:0:0:0:0:0:0:1', '2019-12-15 10:18:28', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('113', '0:0:0:0:0:0:0:1', '2019-12-15 10:18:47', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('114', '0:0:0:0:0:0:0:1', '2019-12-15 10:19:21', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('115', '0:0:0:0:0:0:0:1', '2019-12-15 10:19:25', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('116', '0:0:0:0:0:0:0:1', '2019-12-15 10:19:42', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('117', '0:0:0:0:0:0:0:1', '2019-12-15 10:19:50', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('118', '0:0:0:0:0:0:0:1', '2019-12-15 10:20:09', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('119', '0:0:0:0:0:0:0:1', '2019-12-15 10:20:28', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('120', '0:0:0:0:0:0:0:1', '2019-12-15 10:20:54', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('121', '0:0:0:0:0:0:0:1', '2019-12-15 10:20:58', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('122', '0:0:0:0:0:0:0:1', '2019-12-15 10:21:14', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('123', '0:0:0:0:0:0:0:1', '2019-12-15 10:21:15', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('124', '0:0:0:0:0:0:0:1', '2019-12-15 10:21:49', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('125', '0:0:0:0:0:0:0:1', '2019-12-15 10:23:45', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('126', '0:0:0:0:0:0:0:1', '2019-12-15 10:23:46', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('127', '0:0:0:0:0:0:0:1', '2019-12-15 10:23:47', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('128', '0:0:0:0:0:0:0:1', '2019-12-15 10:23:47', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('129', '127.0.0.1', '2019-12-15 10:24:25', '127.0.0.1', '127.0.0.1');
INSERT INTO `t_visitor` VALUES ('130', '0:0:0:0:0:0:0:1', '2019-12-15 10:24:36', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('131', '0:0:0:0:0:0:0:1', '2019-12-15 10:25:28', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('132', '0:0:0:0:0:0:0:1', '2019-12-15 10:25:43', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('133', '0:0:0:0:0:0:0:1', '2019-12-15 10:28:12', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('134', '0:0:0:0:0:0:0:1', '2019-12-15 10:36:30', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('135', '0:0:0:0:0:0:0:1', '2019-12-15 11:35:26', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('136', '0:0:0:0:0:0:0:1', '2019-12-15 11:40:46', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('137', '0:0:0:0:0:0:0:1', '2019-12-15 11:58:39', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('138', '0:0:0:0:0:0:0:1', '2019-12-15 12:03:23', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('139', '0:0:0:0:0:0:0:1', '2019-12-15 12:17:11', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('140', '0:0:0:0:0:0:0:1', '2019-12-16 21:43:33', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('141', '0:0:0:0:0:0:0:1', '2019-12-17 08:51:56', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('142', '0:0:0:0:0:0:0:1', '2019-12-17 08:56:01', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('143', '0:0:0:0:0:0:0:1', '2019-12-17 09:01:46', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('144', '0:0:0:0:0:0:0:1', '2019-12-17 09:02:44', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('145', '0:0:0:0:0:0:0:1', '2019-12-17 09:03:04', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('146', '0:0:0:0:0:0:0:1', '2019-12-17 09:03:51', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('147', '0:0:0:0:0:0:0:1', '2019-12-17 09:07:58', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('148', '0:0:0:0:0:0:0:1', '2019-12-17 09:09:28', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('149', '0:0:0:0:0:0:0:1', '2019-12-17 09:09:33', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('150', '0:0:0:0:0:0:0:1', '2019-12-17 09:10:08', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('151', '0:0:0:0:0:0:0:1', '2019-12-17 09:10:10', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('152', '0:0:0:0:0:0:0:1', '2019-12-17 09:10:24', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('153', '0:0:0:0:0:0:0:1', '2019-12-17 09:10:44', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('154', '0:0:0:0:0:0:0:1', '2019-12-17 09:10:46', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('155', '0:0:0:0:0:0:0:1', '2019-12-17 09:11:17', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('156', '0:0:0:0:0:0:0:1', '2019-12-17 09:12:12', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('157', '0:0:0:0:0:0:0:1', '2019-12-17 09:12:26', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('158', '0:0:0:0:0:0:0:1', '2019-12-17 09:12:38', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('159', '0:0:0:0:0:0:0:1', '2019-12-17 09:13:35', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('160', '0:0:0:0:0:0:0:1', '2019-12-17 09:13:38', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('161', '0:0:0:0:0:0:0:1', '2019-12-17 09:13:53', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('162', '0:0:0:0:0:0:0:1', '2019-12-17 09:22:14', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('163', '0:0:0:0:0:0:0:1', '2019-12-17 09:23:07', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('164', '0:0:0:0:0:0:0:1', '2019-12-17 09:23:23', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('165', '0:0:0:0:0:0:0:1', '2019-12-17 09:25:12', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('166', '0:0:0:0:0:0:0:1', '2019-12-17 09:25:17', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('167', '0:0:0:0:0:0:0:1', '2019-12-17 09:29:03', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('168', '0:0:0:0:0:0:0:1', '2019-12-17 09:29:58', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('169', '0:0:0:0:0:0:0:1', '2019-12-17 09:30:51', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('170', '0:0:0:0:0:0:0:1', '2019-12-17 09:52:12', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('171', '0:0:0:0:0:0:0:1', '2019-12-17 09:55:54', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('172', '0:0:0:0:0:0:0:1', '2019-12-17 09:58:20', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('173', '0:0:0:0:0:0:0:1', '2019-12-17 10:07:01', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('174', '0:0:0:0:0:0:0:1', '2019-12-17 10:37:24', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('175', '0:0:0:0:0:0:0:1', '2019-12-17 10:54:11', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('176', '0:0:0:0:0:0:0:1', '2019-12-17 10:56:22', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('177', '0:0:0:0:0:0:0:1', '2019-12-17 10:56:41', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('178', '0:0:0:0:0:0:0:1', '2019-12-17 10:56:52', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('179', null, '2019-12-17 11:01:06', null, null);
INSERT INTO `t_visitor` VALUES ('180', null, '2019-12-17 11:04:45', null, null);
INSERT INTO `t_visitor` VALUES ('181', '0:0:0:0:0:0:0:1', '2019-12-17 11:05:23', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('182', '0:0:0:0:0:0:0:1', '2019-12-17 11:05:26', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('183', '0:0:0:0:0:0:0:1', '2019-12-17 11:06:10', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('184', '0:0:0:0:0:0:0:1', '2019-12-17 11:07:23', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('185', '0:0:0:0:0:0:0:1', '2019-12-17 11:07:25', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('186', '0:0:0:0:0:0:0:1', '2019-12-17 11:14:42', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('187', '0:0:0:0:0:0:0:1', '2019-12-17 11:14:46', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('188', '0:0:0:0:0:0:0:1', '2019-12-17 11:14:47', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('189', '0:0:0:0:0:0:0:1', '2019-12-17 11:15:18', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('190', '0:0:0:0:0:0:0:1', '2019-12-17 11:17:27', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('191', '0:0:0:0:0:0:0:1', '2019-12-17 11:19:14', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('192', '0:0:0:0:0:0:0:1', '2019-12-17 11:19:40', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('193', '0:0:0:0:0:0:0:1', '2019-12-17 11:19:50', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('194', '0:0:0:0:0:0:0:1', '2019-12-17 11:25:54', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('195', '0:0:0:0:0:0:0:1', '2019-12-17 11:28:58', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('196', '0:0:0:0:0:0:0:1', '2019-12-17 11:29:38', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('197', '0:0:0:0:0:0:0:1', '2019-12-17 11:54:05', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('198', '0:0:0:0:0:0:0:1', '2019-12-17 14:03:47', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('199', '0:0:0:0:0:0:0:1', '2019-12-17 14:07:42', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('200', '0:0:0:0:0:0:0:1', '2019-12-17 14:09:23', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('201', '0:0:0:0:0:0:0:1', '2019-12-17 14:11:57', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('202', '0:0:0:0:0:0:0:1', '2019-12-17 14:12:00', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('203', '0:0:0:0:0:0:0:1', '2019-12-17 14:13:24', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('204', '0:0:0:0:0:0:0:1', '2019-12-17 14:15:43', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('205', '0:0:0:0:0:0:0:1', '2019-12-17 14:38:42', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('206', '0:0:0:0:0:0:0:1', '2019-12-17 14:39:13', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('207', '0:0:0:0:0:0:0:1', '2019-12-17 15:02:19', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('208', '0:0:0:0:0:0:0:1', '2019-12-17 15:25:12', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('209', '0:0:0:0:0:0:0:1', '2019-12-17 15:32:58', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('210', '0:0:0:0:0:0:0:1', '2019-12-17 15:53:58', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('211', '0:0:0:0:0:0:0:1', '2019-12-17 15:54:06', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('212', '0:0:0:0:0:0:0:1', '2019-12-17 15:55:33', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('213', '0:0:0:0:0:0:0:1', '2019-12-17 16:01:03', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('214', '0:0:0:0:0:0:0:1', '2019-12-17 16:08:54', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('215', '0:0:0:0:0:0:0:1', '2019-12-17 16:17:48', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('216', '0:0:0:0:0:0:0:1', '2019-12-17 16:37:09', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('217', '0:0:0:0:0:0:0:1', '2019-12-18 08:12:35', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('218', '0:0:0:0:0:0:0:1', '2019-12-18 08:13:04', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('219', '0:0:0:0:0:0:0:1', '2019-12-18 08:48:19', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('220', '0:0:0:0:0:0:0:1', '2019-12-18 08:50:34', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('221', '0:0:0:0:0:0:0:1', '2019-12-18 09:04:19', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('222', '0:0:0:0:0:0:0:1', '2019-12-18 09:08:04', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('223', '0:0:0:0:0:0:0:1', '2019-12-18 09:09:25', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('224', '0:0:0:0:0:0:0:1', '2019-12-18 09:10:07', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('225', '0:0:0:0:0:0:0:1', '2019-12-18 09:29:37', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('226', '0:0:0:0:0:0:0:1', '2019-12-18 09:37:50', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('227', '0:0:0:0:0:0:0:1', '2019-12-18 09:39:27', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('228', '0:0:0:0:0:0:0:1', '2019-12-18 10:26:11', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('229', '0:0:0:0:0:0:0:1', '2019-12-18 10:41:45', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('230', '0:0:0:0:0:0:0:1', '2019-12-18 11:10:44', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('231', '0:0:0:0:0:0:0:1', '2019-12-18 11:12:18', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('232', '0:0:0:0:0:0:0:1', '2019-12-18 11:13:57', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('233', '0:0:0:0:0:0:0:1', '2019-12-18 11:14:33', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('234', '0:0:0:0:0:0:0:1', '2019-12-18 11:16:38', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('235', '0:0:0:0:0:0:0:1', '2019-12-18 11:19:03', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('236', '0:0:0:0:0:0:0:1', '2019-12-18 11:19:20', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('237', '0:0:0:0:0:0:0:1', '2019-12-18 11:19:35', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('238', '0:0:0:0:0:0:0:1', '2019-12-18 11:20:54', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('239', '0:0:0:0:0:0:0:1', '2019-12-18 11:22:54', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('240', '0:0:0:0:0:0:0:1', '2019-12-18 11:23:20', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('241', '0:0:0:0:0:0:0:1', '2019-12-18 11:27:30', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('242', '0:0:0:0:0:0:0:1', '2019-12-18 11:29:36', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('243', '0:0:0:0:0:0:0:1', '2019-12-18 11:30:49', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('244', '0:0:0:0:0:0:0:1', '2019-12-18 11:34:26', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('245', '0:0:0:0:0:0:0:1', '2019-12-18 11:36:43', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('246', '0:0:0:0:0:0:0:1', '2019-12-18 11:37:02', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('247', '0:0:0:0:0:0:0:1', '2019-12-18 11:39:18', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('248', '0:0:0:0:0:0:0:1', '2019-12-18 11:39:41', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('249', '0:0:0:0:0:0:0:1', '2019-12-18 11:39:43', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('250', '0:0:0:0:0:0:0:1', '2019-12-18 11:41:47', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('251', '0:0:0:0:0:0:0:1', '2019-12-18 11:42:01', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('252', '0:0:0:0:0:0:0:1', '2019-12-18 11:43:36', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('253', '0:0:0:0:0:0:0:1', '2019-12-18 11:44:02', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('254', '0:0:0:0:0:0:0:1', '2019-12-18 11:47:51', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('255', '0:0:0:0:0:0:0:1', '2019-12-18 11:55:21', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('256', '0:0:0:0:0:0:0:1', '2019-12-18 12:05:04', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('257', '0:0:0:0:0:0:0:1', '2019-12-18 12:05:10', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('258', '0:0:0:0:0:0:0:1', '2019-12-18 13:37:38', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('259', '0:0:0:0:0:0:0:1', '2019-12-18 13:39:09', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('260', '0:0:0:0:0:0:0:1', '2019-12-18 13:42:11', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('261', '0:0:0:0:0:0:0:1', '2019-12-18 13:46:49', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('262', '0:0:0:0:0:0:0:1', '2019-12-18 13:47:37', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('263', '0:0:0:0:0:0:0:1', '2019-12-18 13:49:53', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('264', '0:0:0:0:0:0:0:1', '2019-12-18 14:03:06', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('265', '0:0:0:0:0:0:0:1', '2019-12-18 14:22:05', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('266', '0:0:0:0:0:0:0:1', '2019-12-18 14:27:05', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('267', '0:0:0:0:0:0:0:1', '2019-12-18 14:27:46', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('268', '0:0:0:0:0:0:0:1', '2019-12-18 14:30:47', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('269', '0:0:0:0:0:0:0:1', '2019-12-18 15:48:40', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('270', '0:0:0:0:0:0:0:1', '2019-12-18 15:51:05', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('271', '0:0:0:0:0:0:0:1', '2019-12-18 16:02:18', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('272', '0:0:0:0:0:0:0:1', '2019-12-18 16:04:11', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('273', '0:0:0:0:0:0:0:1', '2019-12-18 16:24:52', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('274', '0:0:0:0:0:0:0:1', '2019-12-18 18:48:08', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('275', '0:0:0:0:0:0:0:1', '2019-12-18 18:48:44', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('276', '0:0:0:0:0:0:0:1', '2019-12-18 18:52:43', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('277', '0:0:0:0:0:0:0:1', '2019-12-18 19:14:34', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('278', '0:0:0:0:0:0:0:1', '2019-12-18 19:15:08', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('279', '0:0:0:0:0:0:0:1', '2019-12-18 19:15:58', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('280', '0:0:0:0:0:0:0:1', '2019-12-18 19:16:20', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('281', '0:0:0:0:0:0:0:1', '2019-12-18 19:17:31', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('282', '0:0:0:0:0:0:0:1', '2019-12-18 19:17:41', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('283', '0:0:0:0:0:0:0:1', '2019-12-18 19:18:51', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('284', '0:0:0:0:0:0:0:1', '2019-12-18 19:20:14', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('285', '0:0:0:0:0:0:0:1', '2019-12-18 19:20:32', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('286', '0:0:0:0:0:0:0:1', '2019-12-18 19:59:15', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('287', '0:0:0:0:0:0:0:1', '2019-12-18 20:50:09', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('288', '0:0:0:0:0:0:0:1', '2019-12-18 20:52:25', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('289', '0:0:0:0:0:0:0:1', '2019-12-18 20:53:02', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('290', '0:0:0:0:0:0:0:1', '2019-12-18 20:53:47', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('291', '0:0:0:0:0:0:0:1', '2019-12-18 20:54:04', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('292', '0:0:0:0:0:0:0:1', '2019-12-18 20:54:20', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('293', '0:0:0:0:0:0:0:1', '2019-12-18 20:54:26', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('294', '0:0:0:0:0:0:0:1', '2019-12-18 20:54:26', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('295', '0:0:0:0:0:0:0:1', '2019-12-18 20:54:48', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('296', '0:0:0:0:0:0:0:1', '2019-12-18 20:56:46', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('297', '0:0:0:0:0:0:0:1', '2019-12-18 20:56:48', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('298', '0:0:0:0:0:0:0:1', '2019-12-18 20:58:15', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('299', '0:0:0:0:0:0:0:1', '2019-12-18 21:07:59', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('300', '0:0:0:0:0:0:0:1', '2019-12-18 21:08:27', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('301', '0:0:0:0:0:0:0:1', '2019-12-18 21:08:30', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('302', '0:0:0:0:0:0:0:1', '2019-12-18 21:08:33', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('303', '0:0:0:0:0:0:0:1', '2019-12-18 21:08:36', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('304', '0:0:0:0:0:0:0:1', '2019-12-18 21:08:42', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('305', '0:0:0:0:0:0:0:1', '2019-12-18 21:08:44', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('306', '0:0:0:0:0:0:0:1', '2019-12-18 21:12:59', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('307', '0:0:0:0:0:0:0:1', '2019-12-18 21:13:54', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('308', '0:0:0:0:0:0:0:1', '2019-12-18 21:13:57', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('309', '0:0:0:0:0:0:0:1', '2019-12-18 21:15:38', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('310', '0:0:0:0:0:0:0:1', '2019-12-18 21:15:53', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('311', '0:0:0:0:0:0:0:1', '2019-12-18 21:15:57', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('312', '0:0:0:0:0:0:0:1', '2019-12-18 21:16:05', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('313', '0:0:0:0:0:0:0:1', '2019-12-18 21:17:14', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('314', '0:0:0:0:0:0:0:1', '2019-12-18 21:30:42', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('315', '0:0:0:0:0:0:0:1', '2019-12-19 09:53:50', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('316', null, '2019-12-19 10:05:48', null, null);
INSERT INTO `t_visitor` VALUES ('317', '0:0:0:0:0:0:0:1', '2019-12-19 10:06:37', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('318', '0:0:0:0:0:0:0:1', '2019-12-19 10:08:45', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('319', '0:0:0:0:0:0:0:1', '2019-12-19 10:08:49', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('320', '0:0:0:0:0:0:0:1', '2019-12-19 10:19:36', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('321', '0:0:0:0:0:0:0:1', '2019-12-19 10:21:50', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('322', '0:0:0:0:0:0:0:1', '2019-12-19 10:28:33', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('323', '0:0:0:0:0:0:0:1', '2019-12-19 10:28:48', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('324', '0:0:0:0:0:0:0:1', '2019-12-19 10:29:39', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('325', '0:0:0:0:0:0:0:1', '2019-12-19 10:29:46', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('326', '0:0:0:0:0:0:0:1', '2019-12-19 10:34:02', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('327', '0:0:0:0:0:0:0:1', '2019-12-19 10:35:11', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('328', '0:0:0:0:0:0:0:1', '2019-12-19 10:35:29', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('329', '0:0:0:0:0:0:0:1', '2019-12-19 10:35:36', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('330', '0:0:0:0:0:0:0:1', '2019-12-19 10:41:06', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('331', '0:0:0:0:0:0:0:1', '2019-12-19 10:41:11', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('332', '0:0:0:0:0:0:0:1', '2019-12-19 10:51:31', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('333', '0:0:0:0:0:0:0:1', '2019-12-19 10:51:45', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('334', '0:0:0:0:0:0:0:1', '2019-12-19 10:51:50', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('335', '0:0:0:0:0:0:0:1', '2019-12-19 10:57:18', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('336', '0:0:0:0:0:0:0:1', '2019-12-19 10:57:23', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('337', '0:0:0:0:0:0:0:1', '2019-12-19 11:05:16', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('338', '0:0:0:0:0:0:0:1', '2019-12-19 11:05:36', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('339', '0:0:0:0:0:0:0:1', '2019-12-19 11:05:58', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('340', '0:0:0:0:0:0:0:1', '2019-12-19 11:06:15', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('341', '0:0:0:0:0:0:0:1', '2019-12-19 11:06:28', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('342', '0:0:0:0:0:0:0:1', '2019-12-19 11:06:57', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('343', '0:0:0:0:0:0:0:1', '2019-12-19 11:07:48', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('344', '0:0:0:0:0:0:0:1', '2019-12-19 11:08:08', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('345', '0:0:0:0:0:0:0:1', '2019-12-19 11:08:53', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('346', '0:0:0:0:0:0:0:1', '2019-12-19 11:11:21', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('347', '0:0:0:0:0:0:0:1', '2019-12-19 11:11:33', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('348', '0:0:0:0:0:0:0:1', '2019-12-19 11:11:57', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('349', '0:0:0:0:0:0:0:1', '2019-12-19 11:36:13', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('350', '0:0:0:0:0:0:0:1', '2019-12-19 11:37:57', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('351', '0:0:0:0:0:0:0:1', '2019-12-19 11:38:01', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('352', '0:0:0:0:0:0:0:1', '2019-12-19 11:38:44', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('353', '0:0:0:0:0:0:0:1', '2019-12-19 11:39:03', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('354', '0:0:0:0:0:0:0:1', '2019-12-19 15:56:02', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('355', '0:0:0:0:0:0:0:1', '2019-12-19 15:58:44', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('356', '0:0:0:0:0:0:0:1', '2019-12-19 16:00:46', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
INSERT INTO `t_visitor` VALUES ('357', '0:0:0:0:0:0:0:1', '2019-12-19 16:00:54', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');
