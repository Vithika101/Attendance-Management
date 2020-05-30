
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body  {
  background-image: url("classroom.jpg");
  background-size: 100% 191%;
  background-repeat: no-repeat;
  
}
a{
    background-color: #DCDCDC;
     padding: 10px 20px;
  text-align: center;
    text-decoration: none;
}
h1{
    background-color: #A0522D;
}

</style>
</head>
<body>
<center> <h1> <font color="white"> ONLINE ATTENDANCE SYSTEM</font></h1>
    <br><br>
    <font size="4em" face="comic sans" color="red"><a href="index.html"><B>HOME</B></a></font>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font size="4em" face="comic sans" color="red"><a href="adminlogin.html"><B>ADMIN</B></a></font>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font size="4em" face="comic sans" color="red"><a href="hodlogin.jsp"><B>DEPARTMENT</B></a></font>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font size="4em" face="comic sans" color="red"><a href="facultylogin.jsp"><B>FACULTY</B></a></font>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font size="4em" face="comic sans" color="red"><a href="studentlogin.jsp"><B>STUDENT</B></a></font>
<br><br>
<br><br>
<h2> <font color="blue"><b><u>FACULTY LOGIN</u>&nbsp;&nbsp;&nbsp;</b> </font></h2>
<br>
<h3><b><u><font size="4em"> Login Details</font></u></b></h3>
<form action="facultylogin.jsp" method="get">
  <div>
      <label for="id"><font size="4em" color="#8B0000"><b>Faculty ID:</b></font></label>&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="text" id="id" name="fid" size="30" value='<%=(request.getParameter("fid")!=null)?request.getParameter("fid").toString():""%>'%>'>
  </div>
    <br>
  <div>
      <label for="facultypass"><font size="4em" color="#8B0000"><b>Password:</b></font></label>&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="password" id="fpass" name="fpass" size="30">
  </div>
    <br>
    <input type="submit" value="LOGIN" onclick="facultylogin.jsp">
    
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
String name = request.getParameter("fid");

String password = request.getParameter("fpass");
System.out.println(name+" "+password);
try{
if(name.length()!=0&&password.length()!=0){
    name=name.toUpperCase();
String sql = "select * from teacher where tid="+name+" and password='"+password+"';";

ps = con.prepareStatement(sql);
 rs = ps.executeQuery();
 if(rs.next())

{ 

userdbName = rs.getString("tid");

userdbPsw = rs.getString("password");
System.out.println(userdbName+" "+userdbPsw);


if(name.equals(userdbName) && password.equals(userdbPsw))

{
session.setAttribute("tid", name);
session.setAttribute("tname",rs.getString("tname"));
%>
<br>
<form method="post">
    <input type="submit" name="mark" value=" MARK ATTENDANCE " formaction="mark.jsp">
    <input type="submit" name="view" value=" VIEW ATTENDANCE " formaction="view.jsp">
</form>

<%
} 

}


rs.close();

ps.close(); 
}
}

catch(Exception sqe)

{

System.out.println(sqe);

}


%>

</center>
</body>
</html>