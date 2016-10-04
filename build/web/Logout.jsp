<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
        session=request.getSession(false);
        if(session==null)
        {
            response.sendRedirect("Login.jsp");
        }
        else
        {
            try
            {
                session.removeAttribute("email");
                session.removeAttribute("usertype");
                session.invalidate();//removing of session
                response.sendRedirect("Login.jsp");
            }
            catch(NullPointerException e)
            {
                response.sendRedirect("Login.jsp");
            }
        }
%>