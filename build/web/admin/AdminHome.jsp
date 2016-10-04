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
    
    <body>
            
    <h1>Admin Home</h1>
    <a href="Profile.jsp">Profile</a>
    <p><a href="ShowStudent.jsp">Students</a></p>
    <p><a href="ShowAdmins.jsp">Admins</a></p>
    <p><a href="StudentReg.jsp">Add Student</a></p>
    <p><a href="AdminReg.jsp">Add Admin</a></p>
    <p><a href="ChangePassword.jsp">Change Password</a></p>
    <p><a href="../Logout.jsp">Logout</a></p>
    </body>
</html>
