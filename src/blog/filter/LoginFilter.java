package blog.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter(filterName = "loginFilter", urlPatterns = { "*.jsp" })
public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest httpRequest = (HttpServletRequest)request;
        HttpServletResponse httpServletResponse= (HttpServletResponse)response;
        HttpSession session = httpRequest.getSession();
        Object state = session.getAttribute("userName");

        String url = httpRequest.getServletPath();

        boolean flag=false;
      
        if(url.indexOf("index.jsp") != -1) {
        	flag=true;
        }
        if(url.indexOf("admin") != -1) {
        	flag=false;
        }
        if(url.indexOf("main.jsp") != -1) {
        	flag=true;
        }
        if(url.indexOf("about.jsp") != -1) {
        	flag=true;
        }
        if(url.indexOf("info.jsp") != -1) {
        	flag=true;
        }
        if(flag == true || state!=null){
            chain.doFilter(request, response);
            return;
        }
        //若该if放在上一if语句之前，仍然会出现无限循环重定向的问题
        else {
        	 httpServletResponse.setContentType("text/html;charset=utf-8");
             PrintWriter out = response.getWriter();
        	 if(url.indexOf("admin") != -1) {
        		out.println("<script language=javascript>alert('请登录后再操作!');window.location='../login.html'</script>");
        	 } else {
        		 out.println("<script language=javascript>alert('访问出错!');window.location='index.jsp'</script>"); 
        	 }
        }


    }

    public void init(FilterConfig config) throws ServletException {

    }

}
