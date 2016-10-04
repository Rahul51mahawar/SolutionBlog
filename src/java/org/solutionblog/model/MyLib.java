
package org.solutionblog.model;

import java.sql.*;
/**
 *
 * @author Rahul Mahawar
 */
public class MyLib{
    public String getDriver()
    {
        return "com.mysql.jdbc.Driver";
    }
    public String getPath()
    {
        return "jdbc:mysql://localhost/answerblog";
    }
    public String getUser()
    {
        return "root";
    }
    public String getPassword()
    {
        return "root";
    }
    public int generateId(int start, String tablename)
        {
            int id=start;
            
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/answerblog","root","root");
                String sql="select * from"+tablename;
                PreparedStatement p1=cn.prepareStatement(sql);
                ResultSet r1=p1.executeQuery();
                while(r1.next())
                {
                    id++;
                }                
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
            return id;
        }
     public String getPhoto(String email)
        {
            String photo="no";
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/answerblog","root","root");
                String sql="select * from photos where email=? " ;
                PreparedStatement p1=cn.prepareStatement(sql);
                p1.setString(1, email);
                ResultSet r1=p1.executeQuery();
                if(r1.next())
                {
                    photo=r1.getString("photo");
                }
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
            return photo;
        }
}

