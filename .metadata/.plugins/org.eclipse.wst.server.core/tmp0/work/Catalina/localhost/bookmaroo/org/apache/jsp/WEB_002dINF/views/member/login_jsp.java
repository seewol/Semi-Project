/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.73
 * Generated at: 2023-06-28 01:20:13 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(4);
    _jspx_dependants.put("/WEB-INF/views/member/../common/bottom.jsp", Long.valueOf(1683960232000L));
    _jspx_dependants.put("/WEB-INF/lib/taglibs-standard-impl-1.2.5.jar", Long.valueOf(1683963886000L));
    _jspx_dependants.put("/WEB-INF/views/member/../common/top3.jsp", Long.valueOf(1687915179051L));
    _jspx_dependants.put("jar:file:/C:/Project/Bookmaroo/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Bookmaroo/WEB-INF/lib/taglibs-standard-impl-1.2.5.jar!/META-INF/c.tld", Long.valueOf(1425946270000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fscope_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fscope_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fscope_005fnobody.release();
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>로그인</title>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\r\n");
      out.write("<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\r\n");
      out.write("<link href=\"https://fonts.googleapis.com/css2?family=Inter:wght@300&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("<style>\r\n");
      out.write("	#main{\r\n");
      out.write("/* 		position: absolute; */\r\n");
      out.write("/* 		top: 50%; */\r\n");
      out.write("/*      left: 50%; */\r\n");
      out.write("/*      transform: translate(-50%, -50%); */\r\n");
      out.write("        font-family: 'Inter', sans-serif;\r\n");
      out.write("        margin-top: 120px;\r\n");
      out.write("        margin-bottom: 95px;\r\n");
      out.write("        width:100%;\r\n");
      out.write("        height: auto;\r\n");
      out.write("        min-height: 414px;\r\n");
      out.write("    }\r\n");
      out.write("    hr{width: 500px;}\r\n");
      out.write("    td{padding: 5px; width: 260px;}\r\n");
      out.write("   	\r\n");
      out.write("   	::placeholder {\r\n");
      out.write("  		color: black;\r\n");
      out.write(" 		font-size: .8em;\r\n");
      out.write(" 		font-weight: 400;\r\n");
      out.write("	}\r\n");
      out.write("	a>span{text-decoration-line: none;}\r\n");
      out.write("	a:link{color: black;}\r\n");
      out.write("	a:visited{color: black;}\r\n");
      out.write("	a:hover{color: #4373E6;}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ\" crossorigin=\"anonymous\">\r\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css?family=Inter\">\r\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.6.1.min.js\"></script>\r\n");
      out.write("<style>\r\n");
      out.write("	html, body{width: 100%; height: 100%; margin: 0; padding: 0;}\r\n");
      out.write("	body {font-family: 'Inter', sans-serif; min-width: 1920px;}\r\n");
      out.write("	header{margin: 0; padding: 0;}\r\n");
      out.write("	#login{display: flex; position: relative; align-items: center; justify-content: space-between; vertical-align: middle; text-align: center;}\r\n");
      out.write("	#login>ul{margin-right: 100px;}\r\n");
      out.write("	#login>ul>li{\r\n");
      out.write("		display: inline-block; \r\n");
      out.write("		font-size: 13px; font-weight: bold; \r\n");
      out.write("		margin-right: 5%; margin-left: 5%; \r\n");
      out.write("		width: 75px;\r\n");
      out.write("	}\r\n");
      out.write("	#login>ul>li>a{text-decoration: none; color: black;}\r\n");
      out.write("	#logo{height: 50px; width: 140px; margin-left: 100px;}\r\n");
      out.write("	#mainCategory a{\r\n");
      out.write("		margin-bottom: 10px; margin-top: 10px; margin-right: 25px; margin-left: 25px;\r\n");
      out.write("		font-size: 17px; font-weight: bold;\r\n");
      out.write("	}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("		");
      if (_jspx_meth_c_005fset_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("		\r\n");
      out.write("<!-- 			<div id=\"login\" style=\"height: 80px;\"> -->\r\n");
      out.write("\r\n");
      out.write("<!-- 				<ul id=\"login\"> -->\r\n");
      out.write("<!-- 					<li><a href=\"#\">로그인</a></li> -->\r\n");
      out.write("<!-- 					<li style=\"font-size: 15px; color: gray;\">|</li> -->\r\n");
      out.write("<!-- 					<li><a href=\"#\">회원가입</a></li> -->\r\n");
      out.write("<!-- 				</ul> -->\r\n");
      out.write("<!-- 			</div> -->\r\n");
      out.write("\r\n");
      out.write("	\r\n");
      out.write("	<div id=\"login\" style=\"height: 80px;\">\r\n");
      out.write("		<a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\"><img id=\"logo\" src=\"resources/image/logo.png\"/></a>\r\n");
      out.write("		<ul id=\"login\">\r\n");
      out.write("			");
      if (_jspx_meth_c_005fif_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("			");
      if (_jspx_meth_c_005fif_005f1(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("		</ul>\r\n");
      out.write("	</div>\r\n");
      out.write("	\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("			\r\n");
      out.write("	<nav class=\"navbar navbar-expand-sm navbar-light bg-white border-bottom border-top\">\r\n");
      out.write("   <div class=\"collapse navbar-collapse justify-content-center\" id=\"mainCategory\">\r\n");
      out.write("     	<ul class=\"navbar-nav\">\r\n");
      out.write("       	<li class=\"nav-item active\">\r\n");
      out.write("           <a class=\"nav-link\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/searchBook.lib\">도서실</a>\r\n");
      out.write("	      </li>\r\n");
      out.write("	      <li class=\"nav-item\">\r\n");
      out.write("	         <a class=\"nav-link\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/Announcement.bo\">게시판</a>\r\n");
      out.write("	      </li>\r\n");
      out.write("	      <li class=\"nav-item\">\r\n");
      out.write("	         <a class=\"nav-link\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/Review.bo\">리뷰</a>\r\n");
      out.write("	      </li>\r\n");
      out.write("	      <li class=\"nav-item\">\r\n");
      out.write("	         <a class=\"nav-link\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/information.gui\">이용안내</a>\r\n");
      out.write("	      </li>\r\n");
      out.write("	      <li class=\"nav-item\">\r\n");
      out.write("	      		");
      if (_jspx_meth_c_005fif_005f4(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("	      		");
      if (_jspx_meth_c_005fif_005f5(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("		    </li>\r\n");
      out.write("     	</ul>\r\n");
      out.write("   	</div>\r\n");
      out.write("	</nav>\r\n");
      out.write("	\r\n");
      out.write("	\r\n");
      out.write("	<div class=\"modal fade\" tabindex=\"-1\" role=\"dialog\" id=\"warning\">\r\n");
      out.write("	<div class=\"modal-dialog\" role=\"document\">\r\n");
      out.write("   		<div class=\"modal-content rounded-3 shadow\">\r\n");
      out.write("     			<div class=\"modal-body p-4 text-center\">\r\n");
      out.write("					<h1><i class=\"bi bi-exclamation-triangle-fill\" style=\"color: red;\"></i></h1>\r\n");
      out.write("		       		<h3 class=\"mb-0\">로그인이 필요한 서비스입니다</h3>\r\n");
      out.write("     			</div>\r\n");
      out.write("     			<div class=\"modal-footer flex-nowrap p-0\">\r\n");
      out.write("       			<button type=\"button\" class=\"btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end\" onclick=\"goforLogin()\">\r\n");
      out.write("       				로그인\r\n");
      out.write("       			</button>\r\n");
      out.write("       			<button type=\"button\" class=\"btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0\" data-bs-dismiss=\"modal\">취소</button>\r\n");
      out.write("     			</div>\r\n");
      out.write("   		</div>\r\n");
      out.write(" 	</div>\r\n");
      out.write("	</div>	\r\n");
      out.write("	\r\n");
      out.write("	<script>\r\n");
      out.write("	\r\n");
      out.write("	function needLogin(){\r\n");
      out.write("		$('#warning').modal('show');\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	function goforLogin(){\r\n");
      out.write("		location.href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/loginView.me\";\r\n");
      out.write("	}\r\n");
      out.write("	</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("	<section>\r\n");
      out.write("		<div align=\"center\" id=\"main\">\r\n");
      out.write("			<h4><b>로그인</b></h4><br>\r\n");
      out.write("			<form action=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/login.me\" method=\"post\">\r\n");
      out.write("				<table>\r\n");
      out.write("					<tr>\r\n");
      out.write("						<td>\r\n");
      out.write("							<input class=\"form-control\" type=\"text\" name=\"memId\" placeholder=\"아이디\" aria-label=\"default input example\" required/>\r\n");
      out.write("						</td>\r\n");
      out.write("					</tr>\r\n");
      out.write("					<tr>\r\n");
      out.write("						<td>\r\n");
      out.write("							<input class=\"form-control\" type=\"password\" name=\"password\" placeholder=\"비밀번호\" aria-label=\"default input example\" required/>\r\n");
      out.write("						</td>\r\n");
      out.write("					</tr>\r\n");
      out.write("				</table>\r\n");
      out.write("				<br/>\r\n");
      out.write("				<button class=\"btn btn-primary\" style=\"--bs-btn-padding-y: .55rem; --bs-btn-padding-x: 6.3rem; --bs-btn-font-size: 1.0rem; background-color: #4373E6;\">로그인</button>\r\n");
      out.write("			</form>\r\n");
      out.write("			<br>\r\n");
      out.write("			<a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/findIdForm.me\"><span style=\"font-size: 13px\"><b>아이디 찾기&nbsp;</b></span></a> |\r\n");
      out.write("			<a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/findPwdForm.me\"><span style=\"font-size: 13px\"><b>&nbsp;비밀번호 찾기&nbsp;</b></span></a> |\r\n");
      out.write("			<a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/signUp.me\"><span style=\"font-size: 13px\"><b>&nbsp;회원가입</b></span></a>\r\n");
      out.write("			<hr/>\r\n");
      out.write("			<div><span style=\"font-size: 11px; color: gray;\">카카오톡 계정으로 로그인 할 수 있어요</span></div> <!-- =http://localhost:8080/bookmaroo -->\r\n");
      out.write("			<a href=\"https://kauth.kakao.com/oauth/authorize?client_id=3820ee86989bf11805e157a18f4e15b1&redirect_uri=http://localhost:8099");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/kakao&response_type=code\">\r\n");
      out.write("			<img src=\"resources/image/kakao_login_medium_wide.png\" width=\"250px\" style=\"margin-top: 10px\"/>\r\n");
      out.write("			</a>\r\n");
      out.write("		</div>\r\n");
      out.write("	</section>\r\n");
      out.write("	");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<style>\r\n");
      out.write("	#ftnav{text-align: left; margin-left: 30px; font-size: 13px; }\r\n");
      out.write("	#ftnav a{text-decoration: none; color: white;}\r\n");
      out.write("	#ftp{text-align: left; margin-left: 10px; font-size: 13px; line-height:170%;}\r\n");
      out.write("	#anker{margin-left: 50px; vertical-align: middle; text-align: right; margin-right: 30px; position: fixed; right:15px;  bottom: 35px; }\r\n");
      out.write("	.bi-arrow-up-circle-fill{color:black; font-size: 40px;}\r\n");
      out.write("	footer {\r\n");
      out.write("		display:flex;  \r\n");
      out.write("		align-items:center; \r\n");
      out.write("		position: relative;\r\n");
      out.write("		bottom: 0;\r\n");
      out.write("		height: 180px; width: 100%;\r\n");
      out.write("		min-width: 1000px;\r\n");
      out.write("		background: rgb(67, 115, 230); \r\n");
      out.write("		color: white; \r\n");
      out.write("		align-items: center; justify-content: space-between; \r\n");
      out.write("		vertical-align: middle; text-align: center;\r\n");
      out.write("	}\r\n");
      out.write("</style>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	<footer>\r\n");
      out.write("		<div id=\"a1\">\r\n");
      out.write("			<nav id=\"ftnav\">\r\n");
      out.write("		   		<b>\r\n");
      out.write("		   			<a target='_blank'>&nbsp;&nbsp;이용약관&nbsp;&nbsp;&nbsp;&nbsp;</a> |&nbsp;&nbsp;&nbsp;\r\n");
      out.write("		    		<a target='_blank'>&nbsp;개인정보취급방침&nbsp;&nbsp;&nbsp;&nbsp;</a> |&nbsp;&nbsp;&nbsp;\r\n");
      out.write("		    		<a target='_blank'>&nbsp;문의</a>\r\n");
      out.write("		    	</b>\r\n");
      out.write("		    	<br/>\r\n");
      out.write("		    	<br/>\r\n");
      out.write("			    <p id=\"ftp\">\r\n");
      out.write("			    	<span id=\"sp2\">책마루도서관 ｜ 사업자등록번호 : 123-45-67890 ｜ 서울 종로 제2023-01호 ｜ 대표자 : 박지은 ｜ 책임자 : 우진기</span><br/>\r\n");
      out.write("			    	<span>서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) 2F, 3F</span><br/>\r\n");
      out.write("			    	<span id=\"sp1\">Copyright © 2023 Book Maru Library All Right Reserved</span>\r\n");
      out.write("			    </p>\r\n");
      out.write("		    </nav>\r\n");
      out.write("		</div>\r\n");
      out.write("		<div id=\"anker\"><a href=\"#\" onclick=\"scrollToElement('anchorPoint')\" ><i class=\"bi bi-arrow-up-circle-fill\"></a></i></div>\r\n");
      out.write("	</footer>\r\n");
      out.write("	<script>\r\n");
      out.write("	function scrollToElement(id) {\r\n");
      out.write("		  const element = document.getElementById(id);\r\n");
      out.write("		  element.scrollIntoView({ behavior: 'auto' });\r\n");
      out.write("		}\r\n");
      out.write("	</script>		\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fset_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f0 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fscope_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    boolean _jspx_th_c_005fset_005f0_reused = false;
    try {
      _jspx_th_c_005fset_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fset_005f0.setParent(null);
      // /WEB-INF/views/member/../common/top3.jsp(35,2) name = value type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f0.setValue(new org.apache.jasper.el.JspValueExpression("/WEB-INF/views/member/../common/top3.jsp(35,2) '${ pageContext.servletContext.contextPath }'",_jsp_getExpressionFactory().createValueExpression(_jspx_page_context.getELContext(),"${ pageContext.servletContext.contextPath }",java.lang.Object.class)).getValue(_jspx_page_context.getELContext()));
      // /WEB-INF/views/member/../common/top3.jsp(35,2) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f0.setVar("contextPath");
      // /WEB-INF/views/member/../common/top3.jsp(35,2) name = scope type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f0.setScope("application");
      int _jspx_eval_c_005fset_005f0 = _jspx_th_c_005fset_005f0.doStartTag();
      if (_jspx_th_c_005fset_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fscope_005fnobody.reuse(_jspx_th_c_005fset_005f0);
      _jspx_th_c_005fset_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fset_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fset_005f0_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f0_reused = false;
    try {
      _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f0.setParent(null);
      // /WEB-INF/views/member/../common/top3.jsp(52,3) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ empty loginUser }", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
      if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("				<li><a href=\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
          out.write("/loginView.me\">로그인</a></li>\r\n");
          out.write("				<li style=\"font-size: 15px; color: gray;\">|</li>\r\n");
          out.write("				<li><a href=\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
          out.write("/signUp.me\">회원가입</a></li>\r\n");
          out.write("			");
          int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
      _jspx_th_c_005fif_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f0_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f1(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f1 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f1_reused = false;
    try {
      _jspx_th_c_005fif_005f1.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f1.setParent(null);
      // /WEB-INF/views/member/../common/top3.jsp(57,3) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ !empty loginUser }", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f1 = _jspx_th_c_005fif_005f1.doStartTag();
      if (_jspx_eval_c_005fif_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("				");
          if (_jspx_meth_c_005fif_005f2(_jspx_th_c_005fif_005f1, _jspx_page_context))
            return true;
          out.write("\r\n");
          out.write("				");
          if (_jspx_meth_c_005fif_005f3(_jspx_th_c_005fif_005f1, _jspx_page_context))
            return true;
          out.write("\r\n");
          out.write("			");
          int evalDoAfterBody = _jspx_th_c_005fif_005f1.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f1);
      _jspx_th_c_005fif_005f1_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f1, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f1_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f2(javax.servlet.jsp.tagext.JspTag _jspx_th_c_005fif_005f1, javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f2 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f2_reused = false;
    try {
      _jspx_th_c_005fif_005f2.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f2.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fif_005f1);
      // /WEB-INF/views/member/../common/top3.jsp(58,4) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f2.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ empty loginUser.kakaoId }", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f2 = _jspx_th_c_005fif_005f2.doStartTag();
      if (_jspx_eval_c_005fif_005f2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("					<a href=\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
          out.write("/logout.me\" style=\"text-decoration: none; color:black; font-size: 13px; font-weight: bold;\">로그아웃</a>\r\n");
          out.write("				");
          int evalDoAfterBody = _jspx_th_c_005fif_005f2.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f2);
      _jspx_th_c_005fif_005f2_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f2, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f2_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f3(javax.servlet.jsp.tagext.JspTag _jspx_th_c_005fif_005f1, javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f3 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f3_reused = false;
    try {
      _jspx_th_c_005fif_005f3.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f3.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fif_005f1);
      // /WEB-INF/views/member/../common/top3.jsp(61,4) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f3.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ !empty loginUser.kakaoId }", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f3 = _jspx_th_c_005fif_005f3.doStartTag();
      if (_jspx_eval_c_005fif_005f3 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("					<a href=\"https://kauth.kakao.com/oauth/logout?client_id=3820ee86989bf11805e157a18f4e15b1&logout_redirect_uri=http://localhost:8099/bookmaroo/logout.me\" style=\"text-decoration: none; color:black; font-size: 13px; font-weight: bold;\">로그아웃</a>\r\n");
          out.write("				");
          int evalDoAfterBody = _jspx_th_c_005fif_005f3.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f3.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f3);
      _jspx_th_c_005fif_005f3_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f3, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f3_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f4(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f4 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f4_reused = false;
    try {
      _jspx_th_c_005fif_005f4.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f4.setParent(null);
      // /WEB-INF/views/member/../common/top3.jsp(87,9) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f4.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ !empty loginUser }", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f4 = _jspx_th_c_005fif_005f4.doStartTag();
      if (_jspx_eval_c_005fif_005f4 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("		         	<a class=\"nav-link\" href=\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
          out.write("/myInfoForm.me\">마이페이지</a>\r\n");
          out.write("	      		");
          int evalDoAfterBody = _jspx_th_c_005fif_005f4.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f4.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f4);
      _jspx_th_c_005fif_005f4_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f4, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f4_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f5(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f5 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f5_reused = false;
    try {
      _jspx_th_c_005fif_005f5.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f5.setParent(null);
      // /WEB-INF/views/member/../common/top3.jsp(90,9) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f5.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ empty loginUser }", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f5 = _jspx_th_c_005fif_005f5.doStartTag();
      if (_jspx_eval_c_005fif_005f5 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("		         	<a class=\"nav-link\" onclick=\"needLogin()\" style=\"cursor: pointer;\">마이페이지</a>\r\n");
          out.write("	      		");
          int evalDoAfterBody = _jspx_th_c_005fif_005f5.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f5.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f5);
      _jspx_th_c_005fif_005f5_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f5, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f5_reused);
    }
    return false;
  }
}
