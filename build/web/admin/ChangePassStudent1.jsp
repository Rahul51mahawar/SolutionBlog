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
        String email,password;
        email=request.getParameter("email");
        password=request.getParameter("T1");
        MyLib obj=new MyLib();
        Class.forName(obj.getDriver());
        Connection cn=DriverManager.getConnection(obj.getPath(),obj.getUser(),obj.getPassword());

        String sql="UPDATE LOGINDATA SET PASSWORD=? WHERE EMAIL=? ";
        PreparedStatement p1=cn.prepareStatement(sql);
        p1.setString(1, password);
        p1.setString(2, email);
        p1.executeUpdate();
        %>
    <h2>Password Changed</h2>
    </body>
</html>
