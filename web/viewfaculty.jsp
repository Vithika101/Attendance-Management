<!DOCTYPE html>
<html lang="en">
<head>
  <title>FACULTY</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
</head>
<body>
<center>
    <h2><B><I><font color="#800000">&nbsp;&nbsp;<U>TEACHERS LIST</U></font></I></B></h2>
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

try{

%>

<br><br>
  <div class="container">         
  <table class="table table-striped">
    <thead>
      <tr>
          <th>Teacher ID</th>
        <th>Teacher Name</th>
        <th>Password</th>
      </tr>
    </thead>
  
    <tbody>
 <%
    String sql="select * from teacher;";
    ps=con.prepareStatement(sql);
     rs=ps.executeQuery();
    while(rs.next()){
     %>
      <tr>
        <td><%=rs.getString("tid")%></td>
        <td><%=rs.getString("tname").toUpperCase()%></td>
        <td><%=rs.getString("password")%></td>
      </tr>
     <%
         }
rs.close();

ps.close(); 
}

catch(Exception sqe)

{

System.out.println(sqe);

}


%>

    </tbody>
  </table>
</div>

</center>
</body>
</html>
