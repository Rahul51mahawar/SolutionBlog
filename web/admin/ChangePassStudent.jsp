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
         <h2>Change Password</h2>
        <form name="form1" method="post" action="ChangePassStudent1.jsp">
          <p>New Password 
            <label for="T1"></label>
            <input type="text" name="T1" id="T1">
          </p>
          <p>Confirm Password 
            <label for="T3"></label>
            <input type="text" name="T2" id="T2">
          </p>
          <p>
            <input type="submit" name="B1" id="B1" value="Save Change
            ">
          </p>
        </form>
        <p>&nbsp;</p>
    </body>
</html>
