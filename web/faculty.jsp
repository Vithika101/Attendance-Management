<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%! String userdbName;

String userdbPsw;



%>

<%

Connection con= null;

PreparedStatement ps = null;

ResultSet rs = null;


String url = "jdbc:mysql://localhost:3306/attendance";

String user = "root";

String dbpsw = "0000";
%>
 <%
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(
          "jdbc:mysql://localhost:3306/attendance", "root", "0000"); 
String name = request.getParameter("fid");

String password = request.getParameter("fpass");
name="1001";
password="hello1001";
System.out.println(name+" "+password);
try{
String sql = "select from teacher where tid="+name+" and password='"+password+"';";

ps = con.prepareStatement(sql);
 rs = ps.executeQuery();
 if(rs.next())

{ 

userdbName = rs.getString("tid");

userdbPsw = rs.getString("password");
System.out.println(userdbName+" "+userdbPsw);


if(name.equals(userdbName) && password.equals(userdbPsw))

{

response.sendRedirect("view.jsp"); 

} 

}


rs.close();

ps.close(); 
}

catch(Exception sqe)

{

System.out.println("hello");

}


%>
