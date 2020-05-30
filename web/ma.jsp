
<%@page import="java.awt.Window"%>
<html><body>
<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*"%>
<%@ page import="javax.swing.JOptionPane" %>

<%	
                        Connection con= null;

PreparedStatement ps = null;

ResultSet rs = null;

try{
String url = "jdbc:mysql://localhost:3306/attendance";

String user = "root";

String dbpsw = "0000";
			Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(
          "jdbc:mysql://localhost:3306/attendance", "root", "0000"); 
                
                String y=request.getParameter("y");
                String b=request.getParameter("b");
                String s=request.getParameter("s");
                String si=request.getParameter("si");
                String sn=request.getParameter("sn");
                
                    
                int c=Integer.parseInt(request.getParameter("c"));
                if(c>0)
                {
     int t=0;
     
     if(t==0)
         {
          String sql = "update subject set lectures=lectures+1 where subid='"+si+"' and year="+y+" and dname='"+b+"';";
                   Statement pss =  con.createStatement();
 pss.executeUpdate(sql);
 sql = "update subject set lastdate=curdate() where subid='"+si+"' and year="+y+" and dname='"+b+"';";
                   pss =  con.createStatement();
 pss.executeUpdate(sql);
                
               sql = "select sid from "+b+" where year="+y+";";
                    ps =  con.prepareStatement(sql);
 rs = ps.executeQuery();
 while(rs.next())
 {
     String sql1="";
     if(request.getParameter(rs.getString("sid")).equals("Present")){
     sql1 = "update "+b+" set "+sn+"="+sn+"+1 where sid='"+rs.getString("sid")+"';";
               Statement stmt =  con.createStatement();
 stmt.executeUpdate(sql1);
     %>
  <script>
    window.alert("Attendance marked successfully.Have a good day:)");
    
    </script>
  <%}
 }
 
  
         response.sendRedirect("facultylogin.jsp"); 

         }
 
                }
                }
    catch (Exception e) { 
                    System.out.println(e);
			//e.printStackTrace(); 
		}
                 %>
</body></html> 