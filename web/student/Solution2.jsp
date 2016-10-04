<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
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
        <h2>Solve Question</h2>
        <%
            String qsub;
            qsub=request.getParameter("subject");
            
            MyLib obj=new MyLib();
            Class.forName(obj.getDriver());
            Connection cn=DriverManager.getConnection(obj.getPath(),obj.getUser(),obj.getPassword());

            String sql="select * from qbank where qsub=? order by date desc";
            PreparedStatement p1=cn.prepareStatement(sql);
            p1.setString(1, qsub);
            ResultSet r1=p1.executeQuery();
            while(r1.next())
            {
                String question,qid,qdate,qby;
                qid=r1.getString("qid");
                question=r1.getString("question");
                qdate=r1.getString("date");
                qby=r1.getString("qby");
                
                java.util.Calendar cal=java.util.Calendar.getInstance();
                cal.setTimeInMillis(Long.parseLong(qdate));
                   
                DateFormat f1=new SimpleDateFormat("dd/MM/YYYY");
                DateFormat f2=new SimpleDateFormat("HH:mm:ss");
                String dt=f1.format(cal.getTime());
                String tm=f2.format(cal.getTime());
                
                %>
                <h3>Question ID <%= qid%> : <%= question %> </h3>
                <p>Upload By :<%= qby %>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                Date :<%= dt %> [<%= tm %>]
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="Solution3.jsp?qid=<%= qid %>">SOLVE</a>
                </p>
                <hr />
            <%
            }
        %>
    </body>
</html>
