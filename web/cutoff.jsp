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
      <label for="year" id="1"><font size="4em" color="white"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Year:</b></font></label>&nbsp;&nbsp;
      <input type="text" name="year" text-align="center" size="23" value='<%=(request.getParameter("year")!=null)?request.getParameter("year"):""%>'>
  </div>
  <div class="div1">
        <label for="department" id="1" ><font size="4em" color="white"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Branch:&nbsp;<br></b></font></label>
                                    
        <input name="department" value='<%=session.getAttribute("branch").toString().toUpperCase()%>' size="23" readonly>
            
        <br>
  </div>
        <div class="div1">
            <label for="p" id="1"><font size="4em" color="white"><b>Minimum %:</b></font></label>&nbsp;&nbsp;
      <input type="text" name="p" text-align="center" size="23" value='<%=(request.getParameter("p")!=null)?request.getParameter("p"):"0.00"%>'>
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
String branch=session.getAttribute("branch").toString();

%>

<br><br>
  <div class="container">         
  <table class="table table-striped">
    <thead>
      <tr>
          <th>Roll No.</th>
        <th>Student Name</th>
        <th>Year</th>
        <th>Attendance%</th>
      </tr>
    </thead>
  
    <tbody>
 <%
      
      if(year==null)
{
String sql="select * from "+ branch+";";
    ps=con.prepareStatement(sql);
     rs=ps.executeQuery();
    // System.out.println(sql+"year="+year+" branch="+branch);
    while(rs.next()){
        int t=Integer.parseInt(rs.getString("sub1"))+Integer.parseInt(rs.getString("sub2"))+Integer.parseInt(rs.getString("sub3"))+Integer.parseInt(rs.getString("sub4"))+Integer.parseInt(rs.getString("sub5"));
     float a=0;
    year=(rs.getString("year"));
    int l=0;
    String sq="select SUM(lectures) from subject where dname='"+ branch+"' and year="+year+";";
     System.out.println(sq+"year="+year+" branch="+branch);
    ps=con.prepareStatement(sq);
     ResultSet rs1=ps.executeQuery();
     while(rs1.next())
         l+=Integer.parseInt(rs1.getString("SUM(lectures)"));
    if(t!=0&&l!=0)
    a=(float)(t*100)/(float)l;
    String p=request.getParameter("p");
    double cutoff=0.0;
    if(p!=null)
        cutoff=Float.parseFloat(p);
    if(cutoff<=a){
%>
      <tr>
        <td><%=rs.getString("sid")%></td>
        <td><%=rs.getString("sname").toUpperCase()%></td>
        <td><%=rs.getString("year")%></td>
        <td><%=a+"%"%></td>
      </tr>
     <%
         }
         }
}
else{
String sql="select * from "+ branch+" where year="+year+";";
    ps=con.prepareStatement(sql);
     rs=ps.executeQuery();
     System.out.println(sql+"year="+year+" branch="+branch);
    while(rs.next()){
        int t=Integer.parseInt(rs.getString("sub1"))+Integer.parseInt(rs.getString("sub2"))+Integer.parseInt(rs.getString("sub3"))+Integer.parseInt(rs.getString("sub4"))+Integer.parseInt(rs.getString("sub5"));
    float a=0;
    int l=0;
    String sq="select SUM(lectures) from subject where dname='"+ branch+"' and year="+year+";";
    ps=con.prepareStatement(sq);
     ResultSet rs1=ps.executeQuery();
     if(rs1.next())
         l=Integer.parseInt(rs1.getString("SUM(lectures)"));
    if(t!=0&&l!=0)
    a=(float)(t*100)/(float)l;
    String p=request.getParameter("p");
    float cutoff=0;
    if(p!=null)
        cutoff=Float.parseFloat(p);
    if(cutoff<=a){
%>
      <tr>
        <td><%=rs.getString("sid")%></td>
        <td><%=rs.getString("sname").toUpperCase()%></td>
        <td><%=rs.getString("year")%></td>
        <td><%=a+"%"%></td>
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
