
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
    <font size="4em" face="comic sans" color="red"><a href="studentlogin.html"><B>ADMIN</B></a></font>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font size="4em" face="comic sans" color="red"><a href="hodlogin.jsp"><B>DEPARTMENT</B></a></font>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font size="4em" face="comic sans" color="red"><a href="facultylogin.jsp"><B>FACULTY</B></a></font>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font size="4em" face="comic sans" color="red"><a href="studentlogin.jsp"><B>STUDENT</B></a></font>
<br><br>
<br><br>
<h2> <font color="blue"><b><u>STUDENT LOGIN</u>&nbsp;&nbsp;&nbsp;</b> </font></h2>
<br>
<h3><b><u><font size="4em"> Login Details</font></u></b></h3>
<form action="studentlogin.jsp" method="post">
  <div>
      <label for="id"><font size="4em" color="#8B0000"><b>Student ID:</b></font></label>&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="text" id="id" name="sid" size="30">
  </div>
    <br>
  <div>
        <label for="department"><font size="4em" color="#8B0000"><b>Department:</b></font></label>&nbsp;&nbsp;&nbsp;&nbsp;
        <select name="department">
            <option value="CSE">Computer Science</option>
            <option value="ME">Mechanical</option>
            <option value="IT">Information Technology</option>
            <option value="ET">Electronics</option>
        </select>
    </div>
    <br>
    <input type="submit" value="LOGIN">
</form>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%! String userdbName;


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
String name = request.getParameter("sid");
String dname = request.getParameter("department");
System.out.println(dname+" "+name);
try{
if(name.length()!=0){
String sql = "select * from "+dname.toLowerCase()+" where sid='"+name+"';";
//System.out.println("hello0");
ps = con.prepareStatement(sql);
//System.out.println("hello1");
 rs = ps.executeQuery();
 //System.out.println("hello2");
 if(rs.next())

{ 
//System.out.println("hello3");
userdbName = rs.getString("sid");
String usern=rs.getString("sname");
String year=rs.getString("year");
System.out.println(userdbName);


if(name.equals(userdbName))

{
session.setAttribute("sroll",name);
session.setAttribute("stuname",usern);
session.setAttribute("dept",dname);
session.setAttribute("year",year);
response.sendRedirect("student.jsp"); 

} 

}

rs.close();

ps.close(); 
}
else{
  %>
  Incomplete details.Please fill all the details correctly.
<%    

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