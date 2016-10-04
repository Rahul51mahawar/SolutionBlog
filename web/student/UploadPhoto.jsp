<%@page import="org.solutionblog.model.MyLib"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
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

//Code for file upload
String saveFile="";
String contentType = request.getContentType();
if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
	DataInputStream in = new DataInputStream(request.getInputStream());
	int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while (totalBytesRead < formDataLength) {
byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
totalBytesRead += byteRead;
}
String file = new String(dataBytes);
saveFile = file.substring(file.indexOf("filename=\"") + 10);
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1,contentType.length());
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
//saveFile="C:/Tomcat 7.0/webapps/jsp_img_upload/photos/"+saveFile;
File f = new File("F:/Code-Ground/netProject/Solution_blog/web/student/Photos/"+saveFile);
FileOutputStream fileOut = new FileOutputStream(f);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();


//Save filename and email in photos table
MyLib obj=new MyLib();
    Class.forName(obj.getDriver());
    Connection cn=DriverManager.getConnection(obj.getPath(),obj.getUser(),obj.getPassword());
    
    String sql="insert into photos values(?,?)";
PreparedStatement p1=cn.prepareStatement(sql);
p1.setString(1,saveFile);
p1.setString(2,e1);
p1.executeUpdate();


}
%>
<h2>Photo Uploaded</h2>
<p>
    <a href="StudentHome.jsp">Continue</a>
</p>