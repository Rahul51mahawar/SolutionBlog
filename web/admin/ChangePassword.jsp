<%@page import="java.sql.*"%>
<%@page import="org.solutionblog.model.MyLib"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Change Password</h2>
    <form name="form1" method="post" action="ChangePassword1.jsp">
      <p>Old Password 
        <label for="T1"></label>
        <input type="text" name="T1" id="T1">
      </p>
      <p>New Password 
        <label for="T2"></label>
        <input type="text" name="T2" id="T2">
      </p>
      <p>Confirm Password 
        <label for="T3"></label>
        <input type="text" name="T3" id="T3">
      </p>
      <p>
        <input type="submit" name="B1" id="B1" value="Save Change
        ">
      </p>
    </form>
    <p>&nbsp;</p>
    </body>
</html>
