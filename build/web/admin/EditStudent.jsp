<%-- 
    Document   : Profile1
    Created on : Oct 2, 2016, 12:14:41 AM
    Author     : Rahul Mahawar
--%>
<%@page import="org.solutionblog.model.MyLib" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            session=request.getSession(false);
            String usertype="",e1="";
            if(session==null)
            {
                response.sendRedirect("../AuthError.jsp");

            }
            else
            {
                try
                {
                    usertype=session.getAttribute("usertype").toString();
                    e1=session.getAttribute("email").toString();
                    if(usertype==null || usertype.equalsIgnoreCase("admin")==false)
                    {
                        response.sendRedirect("../AuthError.jsp");
                    }
                }
                catch(NullPointerException e)
                {
                    response.sendRedirect("../AuthError.jsp");
                }
            }
        %>

    </head>
    <body>
         <%
        String name,branch,collegeroll,contact,email;
        email=request.getParameter("email");
        
        MyLib obj=new MyLib();
        Class.forName(obj.getDriver());
        Connection cn=DriverManager.getConnection(obj.getPath(),obj.getUser(),obj.getPassword());

        String sql="SELECT * FROM STUDENTDATA WHERE EMAIL=?";
        PreparedStatement p1=cn.prepareStatement(sql);
        p1.setString(1, email);
        
        ResultSet r1=p1.executeQuery();
        if(r1.next())
        {
        name=r1.getString("name");
        branch=r1.getString("branch");
        collegeroll=r1.getString("collegeroll");
        contact=r1.getString("contact");
        
        %>
    <p>EDIT STUDENT</p>
    <form id="form1" name="form1" method="post" action="EditStudent1.jsp">
      <p>Name 
        <input type="text" name="T1" id="T1" value="<%= name %>"/>
      </p>
      <p>Branch 
        <input type="text" name="T2" id="T2" value="<%= branch %>"/>
      </p>
      <p>College Roll 
        <input type="text" name="T3" id="T3" value="<%= collegeroll %>"/>
      </p>
      <p>Contact 
        <input type="text" name="T4" id="T4" value="<%= contact %>"/>
      </p>
      <p>Email 
        <input readonly="readonly" type="text" name="T5" id="T5" value="<%= email %>"/>
      </p>
      <p>
        <input type="submit" name="B1" id="B1" value="Save Changes" />
      </p>
    </form>
    <p>&nbsp;</p>
    <%
            }
    %>
    </body>
</html>
