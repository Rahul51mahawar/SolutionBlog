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
        <%
            String name,address,city,contact,email;
            
            MyLib obj=new MyLib();
            Class.forName(obj.getDriver());
            Connection cn=DriverManager.getConnection(obj.getPath(),obj.getUser(),obj.getPassword());

            String sql="SELECT * FROM ADMINDATA WHERE EMAIL=?";
            PreparedStatement p1=cn.prepareStatement(sql);
            p1.setString(1,e1);
            ResultSet r1=p1.executeQuery();
            if(r1.next())
            {
                name=r1.getString("name");
                address=r1.getString("address");
                city=r1.getString("city");
                contact=r1.getString("contact");

        %>
        <h2><u><%= name%></u></h2>
        <p>
            Address = <%= address %> <br/>
            City = <%= city %> <br/>
            Contact = <%= contact %> <br/>
            Email = <%= e1 %> 

        </p> 

        <hr/>
        <%
            }
        %>
        <a href="Profile1.jsp">Edit Profile</a>
    </body>
</html>
