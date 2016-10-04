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
    <body>
            
<h1>Student Home
</h1>
    <%
    MyLib obj=new MyLib();
    String photo=obj.getPhoto(e1);
    if(photo.equalsIgnoreCase("no"))
    {
        %>
        <form action="UploadPhoto.jsp" method="post" enctype="multipart/form-data" name="form1" id="form1" >
            <p>photo</p>
            <input type="file" name="F1" id="F1"/>
        <p>
            <input type="submit" name="B1" value="Upload Photo"/>
        </p>
        </form>
    <%
    }
    else
    {
        %>
        <img src="Photos/<%= photo%>" width="100px" height="125px"/>
        <%
    }
    %>
<p>Profile</p>
<p><a href="Ask.jsp">Ask</a></p>
<p>Solve</p>
<p><a href="Solution1.jsp">Questions</a></p>
<p><a href="../Login.jsp">Logout</a></p>
    </body>
</html>
