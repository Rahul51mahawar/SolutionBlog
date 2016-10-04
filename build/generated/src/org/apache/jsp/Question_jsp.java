package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.solutionblog.model.MyLib;
import java.sql.*;

public final class Question_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h2>Solve Question</h2>\n");
      out.write("        ");

            String qsub;
            qsub=request.getParameter("subject");
            
            MyLib obj=new MyLib();
            Class.forName(obj.getDriver());
            Connection cn1=DriverManager.getConnection(obj.getPath(),obj.getUser(),obj.getPassword());

            String sql1="select * from qbank where qsub=? order by qdate desc";
            PreparedStatement p2=cn1.prepareStatement(sql1);
            p2.setString(1, qsub);
            ResultSet r2=p2.executeQuery();
            while(r2.next())
            {
                String question,qid,qdate,qby;
                qid=r2.getString("qid");
                question=r2.getString("question");
                qdate=r2.getString("qdate");
                qby=r2.getString("qby");
                
                
      out.write("\n");
      out.write("                <h3>Question ID ");
      out.print( qid);
      out.write(" : ");
      out.print( question );
      out.write(" </h3>\n");
      out.write("                <p>Upload By :");
      out.print( qby );
      out.write("\n");
      out.write("                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                Date :");
      out.print( qdate );
      out.write("\n");
      out.write("                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                <a href=\"student/Solution3.jsp?qid=");
      out.print( qid );
      out.write("\">SOLVE</a>\n");
      out.write("                </p>\n");
      out.write("                <hr />\n");
      out.write("            ");

            }
        
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
