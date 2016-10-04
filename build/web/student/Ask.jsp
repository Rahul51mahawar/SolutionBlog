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
                    if(usertype==null || usertype.equalsIgnoreCase("student")==false)
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
        <h2>Ask Question</h2>
        <form id="form1" name="form1" method="post" action="Ask1.jsp">
          <p>Subject 
            <label for="T1"></label>
            <input type="text" name="T1" id="T1" />
          </p>
          <p>Question 
            <label for="T2"></label>
            <label for="T3"></label>
            <textarea name="T2" id="T3" cols="45" rows="5"></textarea>
          </p>
          <p>
            <input type="submit" name="B1" id="B1" value="Send" />
          </p>
        </form>
        <p>&nbsp;</p>
    </body>
</html>
