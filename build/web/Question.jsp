<%-- 
    Document   : Question
    Created on : Oct 2, 2016, 2:17:35 AM
    Author     : Rahul Mahawar
--%>
<%@page import="org.solutionblog.model.MyLib"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Solve Question</h2>
        <%
            String qsub;
            qsub=request.getParameter("subject");
            
            MyLib obj=new MyLib();
            Class.forName(obj.getDriver());
            Connection cn1=DriverManager.getConnection(obj.getPath(),obj.getUser(),obj.getPassword());

            String sql1="select * from qbank where qsub=? order by date desc";
            PreparedStatement p2=cn1.prepareStatement(sql1);
            p2.setString(1, qsub);
            ResultSet r2=p2.executeQuery();
            while(r2.next())
            {
                String question,qid,qdate,qby;
                qid=r2.getString("qid");
                question=r2.getString("question");
                qdate=r2.getString("date");
                qby=r2.getString("qby");
                
                %>
                <h3>Question ID <%= qid%> : <%= question %> </h3>
                <p>Upload By :<%= qby %>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                Date :<%= qdate %>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="student/Solution3.jsp?qid=<%= qid %>">SOLVE</a>
                </p>
                <hr />
            <%
            }
        %>
    </body>
</html>
