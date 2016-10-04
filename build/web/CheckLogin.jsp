<%@ page import="org.solutionblog.model.MyLib"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
    String email,password;
    email=request.getParameter("T1");
    password=request.getParameter("T2");
    
    MyLib obj=new MyLib();
    Class.forName(obj.getDriver());
    Connection cn=DriverManager.getConnection(obj.getPath(),obj.getUser(),obj.getPassword());
    
    String sql="Select * from logindata where email=? and password=? ";
    PreparedStatement p1=cn.prepareStatement(sql);
    p1.setString(1, email);
    p1.setString(2, password);
    ResultSet r1=p1.executeQuery();
    if(r1.next())
    {
        String utype=r1.getString("usertype");
        
        //create session
        session=request.getSession(true);//creating session
        session.setAttribute("email",email);
        session.setAttribute("usertype", utype);
        //send to correct page
        
        if(utype.equalsIgnoreCase("admin"))
        {
            response.sendRedirect("admin/AdminHome.jsp");
        }
        else if(utype.equalsIgnoreCase("student"))
        {
            response.sendRedirect("student/StudentHome.jsp");
        }
    }
    else
    {
        response.sendRedirect("LoginError.jsp");
    }
%>