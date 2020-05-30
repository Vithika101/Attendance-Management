<!DOCTYPE html>
<html lang="en">
<head>
    <title>MARK ATTENDANCE</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <style>
      .div1{
          background-color: seagreen
      }
      input,select{
          text-align: center;
          
      }
      #1{
          text-color: white;
      }
      .div2{
          font-color: #8B0000;
         
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
      <label for="id" id="1"><font size="4em" color="white"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Faculty ID:</b></font></label>&nbsp;&nbsp;
      <input type="text" id="id" name="fid" text-align="center" size="30" value='<%=(session.getAttribute("tid")!=null)?session.getAttribute("tid").toString():"1001"%>' readonly>
  </div>
  <div class="div1">
      <label for="tname" id="1"><font size="4em" color="white"><b>Faculty Name:</b></font></label>&nbsp;&nbsp;
      <input type="text" name="tname" size="30" text-align="center" value='<%=(session.getAttribute("tname")!=null)?session.getAttribute("tname").toString():"ANITA"%>' readonly>
  </div>
</center>
    

  <div class="div1">
      <label for="year" id="1"><font size="4em" color="white"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Year:</b></font></label>&nbsp;&nbsp;
      <input type="text" name="year" text-align="center" size="30" value='<%=(request.getParameter("year")!=null)?request.getParameter("year"):""%>' required>
  </div>
  <div class="div1">
        <label for="department" id="1" ><font size="4em" color="white"><b>&nbsp;&nbsp;Branch:&nbsp;&nbsp;<br></b></font></label>
                                    
        <select name="department" style="font:1.25em blue" required="required" %>'>
                                             <option value="cse" >Computer Science</option>
                                             <option value="me">Mechanical</option>
                                             <option value="it">Information Technology</option>
                                             <option value="et">Electronics</option>
                            </select>
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
    String name = (session.getAttribute("tid")!=null)?session.getAttribute("tid").toString():"1001";
String year=request.getParameter("year");
String branch=request.getParameter("department");

if(name.length()!=0){
    System.out.println("name="+name);
    %>
    
    
    <%
 String sql = "select * from subject where tid="+name+";";

%>
<div class="div1">
<label for="subject" id="1"><font size="4em" color="white"><b>Choose the subject: </b></font><br></label>                                
                                    <select name="subject" style="font:1.25em blue" required="required" >

<%
ps =  con.prepareStatement(sql);

 rs = ps.executeQuery();
 System.out.println(sql);
 while(rs.next())
{ 
String s=rs.getString("subid");
String sub=rs.getString("subname");

%>
<option value='<%=s%>'><%=sub%> (<%=s%>)</option>
<%
}
%>
                                    </select>
<br>
                                    <input type="submit" name="submit" value="VIEW">

<hr size='1' width='100%'>
</div>
                                    </form>

<%
    if(request.getParameter("submit")==null)
        System.out.println("helloooooooooooooooooooooooooooooo");
    else if(request.getParameter("submit").equals("VIEW")){
       
    String s=request.getParameter("subject");
if(s.length()!=0&&year.length()!=0)
{
   sql = "select * from subject where subid='"+s+"' and tid="+ name+" and year="+year+" and dname='"+branch+"';";
   
   ps =  con.prepareStatement(sql);
 rs = ps.executeQuery();
 System.out.println(sql);
 if(rs.next()){
 int total=Integer.parseInt(rs.getString("lectures"));
 //System.out.println("222222222222222222");
 String sno="sub"+rs.getString("sno");
 //System.out.println("111111111111111111");
 %>
 <form action="ma.jsp" method="post">
 <div class="div2">
  
     <b> Year: </b><input id="2" type="text" name="y" value='<%=year%>' readonly>&nbsp;<b>Branch:</b> <input id="2" type="text" name="b" value='<%=branch%>' readonly>&nbsp;<b>Subject ID:</b> <input id="2" type="text" name="si" value='<%=rs.getString("subid")%>' readonly>&nbsp;<b>Subject:</b> <input id="2" type="text" name="s" value='<%=rs.getString("subname")%>' readonly>&nbsp;
  <br>
  </div>
  <br>
  <div class="container">         
  <table class="table table-striped">
    <thead>
      <tr>
          <th>Roll No.</th>
        <th>Student Name</th>
        <th>Mark Attendance</th>
        <th>Subject Attendance%</th>
      </tr>
    </thead>
    <tbody>
 <%
     sql = "select * from "+branch+" where year="+year+";";
   ps =  con.prepareStatement(sql);
 rs = ps.executeQuery();
 System.out.println(sql);
  int c=0;
 while(rs.next())
 {
     c++;
     int b=0;
     b=Integer.parseInt(rs.getString(sno));
     
     %>
      <tr>
        <td><%=rs.getString("sid")%></td>
        <td><%=rs.getString("sname").toUpperCase()%></td>
        <td><input type="radio" name='<%=rs.getString("sid")%>' value="Present" required> Present &nbsp;&nbsp;<input type="radio" name='<%=rs.getString("sid")%>' value="Absent"> Absent</td>
     <%
         if(total==0){  
      %>
        <td>0.00%</td>
        <%}
            else{
            %>
            <td><%=(float)(b*100)/(float)total%>%</td>
            <%}
         
%>
      </tr>
     <%
 }
%>
<input  type="hidden" name="c" value='<%=c%>' readonly>
<input  type="hidden" name="sn" value='<%=sno%>' readonly>
 </tbody>
  </table>
    <input type="submit" name="mark" value="MARK" formaction="ma.jsp">
    
<%
}
}
rs.close();

ps.close(); 
}
}
}

catch(Exception sqe)

{

System.out.println(sqe);

}


%>

   
</div>
  </form>
</center>


<%
 
%>
</body>
</html>