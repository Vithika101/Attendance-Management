<!DOCTYPE html>
<html lang="en">
<head>
  <title>VIEW ATTENDANCE</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <style>
      .div1{
          background-color: seagreen
      }
      input{
          text-align: center;
          text-color: violet;
      }
      #1{
          text-color: white;
      }
      #2{
          text-color: #8B0000;
      }
  </style>
</head>
<body>
<center>
<center>
<form action="#" method="post">
<div class="div1">
    <br>
    <br>
      <label for="id" id="1"><font size="4em" color="white"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Student ID:</b></font></label>&nbsp;&nbsp;
      <input type="text" id="id" name="fid" text-align="center" size="30" value='<%=(session.getAttribute("sroll")!=null)?session.getAttribute("sroll").toString():""%>' readonly>
  </div>
  <div class="div1">
      <label for="tname" id="1"><font size="4em" color="white"><b>Student Name:</b></font></label>&nbsp;&nbsp;
      <input type="text" name="tname" size="30" text-align="center" value='<%=(session.getAttribute("stuname")!=null)?session.getAttribute("stuname").toString():""%>' readonly>
  </div>
</center>
    

  <div class="div1">
      <label for="year" id="1"><font size="4em" color="white"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Year:</b></font></label>&nbsp;&nbsp;
      <input type="text" name="year" text-align="center" size="30" value='<%=(session.getAttribute("year")!=null)?session.getAttribute("year"):"1"%>' required>
  </div>
  <div class="div1">
        <label for="department" id="1" ><font size="4em" color="white"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Branch:&nbsp;&nbsp;<br></b></font></label>
        <input type="text" name="department" size="30" text-align="center" value='<%=(session.getAttribute("dept")!=null)?session.getAttribute("dept").toString().toUpperCase():"CSE"%>' readonly>                            
        <br>
  </div>
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
    String name = session.getAttribute("sroll").toString();
String year=session.getAttribute("year").toString();
String sname=session.getAttribute("stuname").toString();
String branch=session.getAttribute("dept").toString();
if(name.length()!=0){
    System.out.println("name="+name);
    %>
    
    
    <%
 String sql = "select * from subject where dname='"+branch+"' and year="+year+" order by sno;";
String sql1="select sub1,sub2,sub3,sub4,sub5 from "+branch+" where sid='"+name+"';";
ps =  con.prepareStatement(sql1);

 rs = ps.executeQuery();
 System.out.println(sql1);
 int[] b=new int[5];
 int l=0;
 while(rs.next())
 {
     b[l++]=Integer.parseInt(rs.getString("sub"+l));
 }
ps =  con.prepareStatement(sql);

 rs = ps.executeQuery();
 System.out.println(sql);
 int[] a=new int[5];
 String[][] n=new String[5][2];
 l=0;
 int sum=0;
 while(rs.next())
 {
     if(rs.getString("subid")!=null){
         n[l][0]=rs.getString("subid");
         n[l][1]=rs.getString("subname");}
     else
     {
         n[l][0]="";
         n[l][1]="";
     }
         
     a[l]=Integer.parseInt(rs.getString("lectures"));
     sum+=a[l++];
 }
 if(sum==0)
 sum=1;
   %>
  <br><br>
  <div class="container">         
  <table class="table table-striped">
    <thead>
      <tr>
          <th>Subject ID.</th>
        <th>Subject Name</th>
        <th>Present</th>
        <th>Total working days</th>
        <th>Subject Attendance%</th>
      </tr>
    </thead>
    <tbody>
 <%
     l=0;
     while(l<5){
     if(n[l][0]!=""){
     %>
      <tr>
        <td><%=n[l][0]%></td>
        <td><%=n[l][1]%></td>
        <td><%=b[l]%></td>
        <td><%=a[l]%></td>
        <%
            if(a[l]!=0)
            {
          %>  
            <td><%=(float)(b[l]*100)/(float)a[l]%>%</td>
            <%}
else{
                %>
                <td>0.00%</td>
                <%
                    }
%>
      </tr>
      <%
          }
l++;
}
rs.close();

ps.close(); 

%>
    <center><b><h3>Total Attendance% : <%=((float)(b[0]+b[1]+b[2]+b[3]+b[4])*100.0)/(float)sum%> %</h3></b></center>
      
      <%}
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
