<%-- 
    Document   : Login
    Created on : Oct 1, 2016, 11:31:09 PM
    Author     : Rahul Mahawar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <script type="text/javascript">
        function check(str)
        {
                var xmlhttp;
                if (str.length==0)
                { 
                        document.getElementById("s1").innerHTML="";
                        return;
                }
                if (window.XMLHttpRequest)
                {// code for IE7+, Firefox, Chrome, Opera, Safari
                        xmlhttp=new XMLHttpRequest();
                }
                else
                {// code for IE6, IE5
                        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                }

                xmlhttp.onreadystatechange=function()
                {
                        if (xmlhttp.readyState==4 && xmlhttp.status==200)
                        {
                                        document.getElementById("s1").innerHTML=xmlhttp.responseText;
                        }
                }
                xmlhttp.open("GET","checkemail.jsp?q="+str,true);
                xmlhttp.send();
        }
        </script>

    </head>
    <body>
        <h1>Login Here !!</h1>
        <form id="form1" name="form1" method="post" action="CheckLogin.jsp">
          <p>Email 
            <input type="text" name="T1" id="T1" onkeyup="check(this.value)"/>
            <span id="s1"></span>
          </p>
          <p>Password 
            <input type="text" name="T2" id="T2" />
          </p>
          <p>
            <input type="submit" name="B1" id="B1" value="LOGIN" />
          </p>
        </form>
        <p>&nbsp;</p>
    </body>
</html>
