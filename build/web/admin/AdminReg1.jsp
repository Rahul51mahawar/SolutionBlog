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
    MyLib obj=new MyLib();
    Class.forName(obj.getDriver());
    Connection cn=DriverManager.getConnection(obj.getPath(),obj.getUser(),obj.getPassword());
    String s1="insert into admindata values(?,?,?,?,?)";
    String s2="insert into logindata values(?,?,?)";
    PreparedStatement p1=cn.prepareStatement(s1);
    PreparedStatement p2=cn.prepareStatement(s2);
    
    String name,address,city,contact,email,password;
    name=request.getParameter("T1");
    address=request.getParameter("T2");
    city=request.getParameter("T3");
    contact=request.getParameter("T4");
    email=request.getParameter("T5");
    password=request.getParameter("T6");
    
    p1.setString(1, name);
    p1.setString(2, address);
    p1.setString(3, city);
    p1.setString(4, contact);
    p1.setString(5, email);
    
    p2.setString(1, email);
    p2.setString(2,password);
    p2.setString(3, "admin");
    
    int a=p1.executeUpdate();
    int b=p2.executeUpdate();
    
    if(a==1) 
    {
        %>
        <h2>Data Saved</h2>
        <%
    }
    else
    {
        %>
        <h2>Error : Cannot save data</h2>
        <%
    }
    if(b==1)
    {
        %>
        <h2>Login created</h2>
        <%
    }
    else
    {
        %>
        <h2>Error: cannot create login</h2>
        <%
    }
    %>
    </body>
</html>
