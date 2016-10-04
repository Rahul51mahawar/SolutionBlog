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
            String qid,solution,qby;
            qid=request.getParameter("qid");
            
            MyLib obj=new MyLib();
            int sid=obj.generateId(1,"solution");
            
            solution=request.getParameter("T1");
            
            long date=System.currentTimeMillis();
            
            qby=e1;
            
           
            Class.forName(obj.getDriver());
            Connection cn=DriverManager.getConnection(obj.getPath(),obj.getUser(),obj.getPassword());

            String sql="insert into solution value(?,?,?,?,?)";

            PreparedStatement p1=cn.prepareStatement(sql);
            p1.setInt(1,sid );
            p1.setInt(2,Integer.parseInt(qid));
            p1.setString(3,solution);
            p1.setLong(4,date );
            p1.setString(5,qby );

            int a=p1.executeUpdate(); 
            if(a==1)
            {
                %>
                <h2>saved</h2>
                <%
            }
             else
            {
                %>
                <h2>CANNOT SAVE</h2>
                <%
            }
        %>
    </body>
</html>
