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
           
            MyLib obj=new MyLib();
            Class.forName(obj.getDriver());
            Connection cn=DriverManager.getConnection(obj.getPath(),obj.getUser(),obj.getPassword());

            String sql="SELECT * FROM STUDENTDATA";
            PreparedStatement p1=cn.prepareStatement(sql);
            
            ResultSet r1=p1.executeQuery();
            while(r1.next())
            {
                name=r1.getString("name");
                branch=r1.getString("branch");
                collegeroll=r1.getString("collegeroll");
                contact=r1.getString("contact");
                email=r1.getString("email");
                
                %>
                <h2><u><%= name%></u></h2>
                <p>
                    Address = <%= branch %>;<br/>
                    City = <%= collegeroll %>;<br/>
                    Contact = <%= contact %>;<br/>
                    Email = <%= email %>;<br/>
                
                    <a href="EditStudent.jsp?email=<%= email%>">Edit</a>
                    <a href="DeleteStudent.jsp?email=<%= email%>">Delete</a>
                    <a href="ChangePassStudent.jsp?email=<%= email%>">Change Password</a>
                </p> 
                
                <hr/>
                <%
            }
        %>
    </body>
</html>
