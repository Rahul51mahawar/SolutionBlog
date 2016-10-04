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
        <%
        String qsub,question;
        qsub=request.getParameter("T1");
        qsub=qsub.toUpperCase();
        
        question=request.getParameter("T2");
        
        MyLib obj=new MyLib();
        int qid=obj.generateId(1,"qbank");
        
        long dt=System.currentTimeMillis();
        
        String qby=e1;//get email from session
        
        //save data in table
        
        Class.forName(obj.getDriver());
        Connection cn=DriverManager.getConnection(obj.getPath(),obj.getUser(),obj.getPassword());

        String sql="insert into qbank values(?,?,?,?,?)";
        PreparedStatement p1=cn.prepareStatement(sql);
        
        p1.setInt(1, qid);
        p1.setString(2, qsub);
        p1.setString(3, question);
        p1.setLong(4, dt);
        p1.setString(5, qby);
        
        int a=p1.executeUpdate();
        
        if(a==1)
        {
            %>
            <h2>Question is successfully submitted</h2>
            <h2>Question is saved and the Question Id is <%= qid %></h2>
            <%
        }
        else
        {
            %>
            <h2>Cannot Save The Question</h2>
            <%
        }
    %>
    <p><a href="Ask.jsp">Ask More</a></p>
    <p><a href="StudentHome.jsp">Home</a></p>
    </body>
</html>
