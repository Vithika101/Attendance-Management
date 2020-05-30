<!DOCTYPE html>
<html lang="en">
<head>
  <title>STUDENTS LIST</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <style>
      .div1{
          background-color: seagreen
      }
      #1{
          text-color: white;
      }
     
  </style>
</head>
<body>
<center>

<form action="#" method="post">
  <div class="div1">
      <BR>
      <h2><B><I><font color="#D0A000">&nbsp;&nbsp;<U>STUDENTS LIST</U></font></I></B></h2>
      <br>
      <label for="year" id="1"><font size="4em" color="white"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Year:</b></font></label>&nbsp;&nbsp;
      <input type="text" name="year" text-align="center" size="23" value='<%=(request.getParameter("year")!=null)?request.getParameter("year"):""%>'>
  </div>
  <div class="div1">
        <label for="department" id="1" ><font size="4em" color="white"><b>&nbsp;&nbsp;Branch:&nbsp;&nbsp;<br></b></font></label>
                                    
        <select name="department" style="font:1.25em blue" required="required" %>'>
            <option value="ALL" selected>ALL</option>
                                             <option value="cse" >Computer Science</option>
                                             <option value="me">Mechanical</option>
                                             <option value="it">Information Technology</option>
                                             <option value="et">Electronics</option>
                            </select>
        <br>
  </div>
  <div class="div1">
      <br>
      <input type="submit" value="VIEW STUDENTS">
      <br>
  </div>
 
</form>
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
String year=request.getParameter("year");
String branch=request.getParameter("department");

%>

<br><br>
  <div class="container">         
  <table class="table table-striped">
    <thead>
      <tr>
          <th>Roll No.</th>
        <th>Student Name</th>
        <th>Year</th>
        <th>Branch</th>
      </tr>
    </thead>
  
    <tbody>
 <%
     if(year.equals(""))
{
    if(branch.equals("ALL")){
    String sql="select sid,sname,year from cse;";
    ps=con.prepareStatement(sql);
     rs=ps.executeQuery();
    while(rs.next()){
     %>
      <tr>
        <td><%=rs.getString("sid")%></td>
        <td><%=rs.getString("sname").toUpperCase()%></td>
        <td><%=rs.getString("year")%></td>
        <td>COMPUTER SCIENCE</td>
      </tr>
     <%
         }
sql="select sid,sname,year from et;";
    ps=con.prepareStatement(sql);
     rs=ps.executeQuery();
    while(rs.next()){
     %>
      <tr>
        <td><%=rs.getString("sid")%></td>
        <td><%=rs.getString("sname").toUpperCase()%></td>
        <td><%=rs.getString("year")%></td>
        <td>ELECTRONICS</td>
      </tr>
     <%
         }
sql="select sid,sname,year from it;";
    ps=con.prepareStatement(sql);
     rs=ps.executeQuery();
    while(rs.next()){
     %>
      <tr>
        <td><%=rs.getString("sid")%></td>
        <td><%=rs.getString("sname").toUpperCase()%></td>
        <td><%=rs.getString("year")%></td>
        <td>INFORMATION TECHNOLOGY</td>
      </tr>
     <%
         }
sql="select sid,sname,year from me;";
    ps=con.prepareStatement(sql);
     rs=ps.executeQuery();
    while(rs.next()){
     %>
      <tr>
        <td><%=rs.getString("sid")%></td>
        <td><%=rs.getString("sname").toUpperCase()%></td>
        <td><%=rs.getString("year")%></td>
        <td>MECHANICAL</td>
      </tr>
     <%
         }
         }
     else
{
String sql="select sid,sname,year from "+ branch+";";
    ps=con.prepareStatement(sql);
     rs=ps.executeQuery();
    while(rs.next()){
     %>
      <tr>
        <td><%=rs.getString("sid")%></td>
        <td><%=rs.getString("sname").toUpperCase()%></td>
        <td><%=rs.getString("year")%></td>
        <td><%=branch.toUpperCase()%></td>
      </tr>
     <%
         }
}
}
else{
if(!branch.equals("ALL"))
{
String sql="select sid,sname,year from "+ branch+" where year="+year+";";
    ps=con.prepareStatement(sql);
     rs=ps.executeQuery();
    while(rs.next()){
     %>
      <tr>
        <td><%=rs.getString("sid")%></td>
        <td><%=rs.getString("sname").toUpperCase()%></td>
        <td><%=rs.getString("year")%></td>
        <td><%=branch.toUpperCase()%></td>
      </tr>
     <%
         }
}
else
{
String sql="select sid,sname,year from cse where year="+year+";";
    ps=con.prepareStatement(sql);
     rs=ps.executeQuery();
    while(rs.next()){
     %>
      <tr>
        <td><%=rs.getString("sid")%></td>
        <td><%=rs.getString("sname").toUpperCase()%></td>
        <td><%=rs.getString("year")%></td>
        <td>COMPUTER SCIENCE</td>
      </tr>
     <%
         }
sql="select sid,sname,year from et where year="+year+";";
    ps=con.prepareStatement(sql);
     rs=ps.executeQuery();
    while(rs.next()){
     %>
      <tr>
        <td><%=rs.getString("sid")%></td>
        <td><%=rs.getString("sname").toUpperCase()%></td>
        <td><%=rs.getString("year")%></td>
        <td>ELECTRONICS</td>
      </tr>
     <%
         }
sql="select sid,sname,year from it where year="+year+";";
    ps=con.prepareStatement(sql);
     rs=ps.executeQuery();
    while(rs.next()){
     %>
      <tr>
        <td><%=rs.getString("sid")%></td>
        <td><%=rs.getString("sname").toUpperCase()%></td>
        <td><%=rs.getString("year")%></td>
        <td>INFORMATION TECHNOLOGY</td>
      </tr>
     <%
         }
sql="select sid,sname,year from me where year="+year+";";
    ps=con.prepareStatement(sql);
     rs=ps.executeQuery();
    while(rs.next()){
     %>
      <tr>
        <td><%=rs.getString("sid")%></td>
        <td><%=rs.getString("sname").toUpperCase()%></td>
        <td><%=rs.getString("year")%></td>
        <td>MECHANICAL</td>
      </tr>
     <%
         }
}
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
