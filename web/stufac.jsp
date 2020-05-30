<!DOCTYPE html>
<html lang="en">
<head>
  <title>SUBJECTS</title>
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
      <h2><B><I><font color="#D0A000">&nbsp;&nbsp;<U>SUBJECTS LIST</U></font></I></B></h2>
      <br>
      <label for="year" id="1"><font size="4em" color="white"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Year:</b></font></label>&nbsp;&nbsp;
      <input type="text" name="year" text-align="center" size="23" value='<%=(request.getParameter("year")!=null)?request.getParameter("year"):""%>'>
  </div>
  <div class="div1">
        <label for="branch" id="1" ><font size="4em" color="white"><b>&nbsp;&nbsp;Branch:&nbsp;&nbsp;<br></b></font></label>
                                    
        <select name="branch" style="font:1.25em blue" required="required">
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
      <input type="submit" value="VIEW SUBJECTS">
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
String branch=request.getParameter("branch");
if(year==null)
    year="";
if(branch==null)
    branch="ALL";
 System.out.println(year+" "+branch);
%>

<br><br>
  <div class="container">         
  <table class="table table-striped">
    <thead>
      <tr>
          <th>Subject ID</th>
        <th>Subject Name</th>
        <th>Department</th>
        <th>Year</th>
        <th>Teacher</th>
        <th>Teacher ID</th>
      </tr>
    </thead>
  
    <tbody>
 <%
     
      if(year.equals("") && branch.equals("ALL")){
    String sql="select * from subject,teacher where (teacher.tid=subject.tid);";
    ps=con.prepareStatement(sql);
     rs=ps.executeQuery();
    while(rs.next()){
     %>
      <tr>
        <td><%=rs.getString("subid")%></td>
        <td><%=rs.getString("subname").toUpperCase()%></td>
        <td><%=rs.getString("dname").toUpperCase()%></td>
        <td><%=rs.getString("year")%></td>
        <td><%=rs.getString("tname")%></td>
        <td><%=rs.getString("tid")%></td>
      </tr>
     <%
         }
}
 else if(year.equals(""))
{
String sql="select * from subject,teacher where (teacher.tid=subject.tid) && dname='"+branch+"';";
    ps=con.prepareStatement(sql);
     rs=ps.executeQuery();
    while(rs.next()){
     %>
      <tr>
        <td><%=rs.getString("subid")%></td>
        <td><%=rs.getString("subname").toUpperCase()%></td>
        <td><%=rs.getString("dname").toUpperCase()%></td>
        <td><%=rs.getString("year")%></td>
        <td><%=rs.getString("tname")%></td>
        <td><%=rs.getString("tid")%></td>
      </tr>
     <%
         }
}
 else if(branch.equals("ALL"))
{
String sql="select * from subject,teacher where (teacher.tid=subject.tid) && year="+year+";";
    ps=con.prepareStatement(sql);
     rs=ps.executeQuery();
    while(rs.next()){
     %>
      <tr>
        <td><%=rs.getString("subid")%></td>
        <td><%=rs.getString("subname").toUpperCase()%></td>
        <td><%=rs.getString("dname").toUpperCase()%></td>
        <td><%=rs.getString("year")%></td>
        <td><%=rs.getString("tname")%></td>
        <td><%=rs.getString("tid")%></td>
      </tr>
     <%
         }
}
else
{
String sql="select * from subject,teacher where (teacher.tid=subject.tid) && dname='"+branch+"' && year="+year+";";
    ps=con.prepareStatement(sql);
     rs=ps.executeQuery();
    while(rs.next()){
     %>
      <tr>
        <td><%=rs.getString("subid")%></td>
        <td><%=rs.getString("subname").toUpperCase()%></td>
        <td><%=rs.getString("dname").toUpperCase()%></td>
        <td><%=rs.getString("year")%></td>
        <td><%=rs.getString("tname")%></td>
        <td><%=rs.getString("tid")%></td>
      </tr>
     <%
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
