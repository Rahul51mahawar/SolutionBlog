<%@page import="org.solutionblog.model.MyLib"%> 
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Subscribe Here !!</h1>
        <form id="form1" name="form1" method="post" action="Subscribe.jsp">
            <input type="text" placeholder="Enter emial to subscribe" name="T1" id="T1"/>
            <input type="submit" name="B1" id="B1" value="Submit" />
        </form>
        <%
            String email;
            email=request.getParameter("T1");
            
            MyLib obj=new MyLib();
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/answerblog" , "root", "root");
            String sql="insert into subscribe values(?,?)";
            PreparedStatement p=cn.prepareStatement(sql);
            int Eid=obj.generateId(1,"Subscribe");
            p.setInt(1, Eid);
            p.setString(2, email);
            int a=0;
            a=p.executeUpdate();
            if(a==1)
            {
                %>
                <p>Thanks to Subscribe</p>
                <%
            }
        %>
    </body>
</html>
