
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="UTF-8" />
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
        <title>Login and Registration Form with HTML5 and CSS3</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style3.css" />
		<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
    </head>
    <body>
        <div class="container">
            
            
            <header>
                <h1>ADMIN</h1>
				
            </header>
            <section>				
                <div id="container_demo" >
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    
                    <div id="wrapper">
                        
                        <div id="login" class="animate form">
                            <form autocomplete="on"> 
                                <h1> ADD / DELETE  STUDENT </h1>
                                <p> 
                                    <label for="sname" class="uname" data-icon="u">Student name</label>
                                    <input id="sname" name="sname" required="required" type="text" placeholder="mysuperusername690" />
                                </p>
                                <p> 
                                    <label for="rollno" data-icon="e" >Roll Number</label>
                                    <input id="rollno" name="rollno" required="required" type="text" placeholder="1604510001"/> 
                                </p>
                                <p >
                                    <label for="department" >Branch<br></label>
                                    
                                    <select name="department" style="font:1.25em blue" required="required">
                                             <option value="cse" >Computer Science</option>
                                             <option value="me">Mechanical</option>
                                             <option value="it">Information Technology</option>
                                             <option value="et">Electronics</option>
                            </select>
                                    
                                </p>
                                <p> 
                                    <label for="year" >Year </label>
                                    <input id="year" name="year" required="required" type="text" placeholder="eg. 4"/>
                                </p>
                                <p> 
									<input type="submit" id="adds" name="action" value="ADD"/> 
								</p>
                                                                
                                                                    <p> 
									<input type="submit" id="deletes" name="action" value="DELETE"/> 
								</p>                               
                                                              <p class="change_link">
									
									<a href="adminlist.html" class="to_register">Back</a>
								</p>


                            </form>
                            
                        </div>
		
                    </div>
                </div>  
            </section>
        </div>
         <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%! String userdbName;

String userdbPsw,cnf;



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
String name = request.getParameter("rollno");
String sname = request.getParameter("sname");
String year = request.getParameter("year");
String branch=request.getParameter("department");
String action=request.getParameter("action");
if("ADD".equals(action)){
try{
if(sname.length()!=0&&name.length()!=0&&year.length()!=0&&branch.length()!=0){
    name=name.toUpperCase();
    sname=sname.toUpperCase();
String sql = "select * from "+branch+" where sid='"+name+"';";

ps = con.prepareStatement(sql);
 rs = ps.executeQuery();
 if(!rs.next())

{ 
 sql="Insert into "+branch+" values('"+name+"','"+sname+"',"+year+",0,0,0,0,0);";
     Statement s = con.createStatement();
     s.executeUpdate(sql);
     %>
     <script>
    window.alert("Data inserted successfully.");
    
    </script>
     
     <%
}
else
 {
    
%>
<script>
    window.alert("Student already exists.");
    
    </script>
<%
    
}

rs.close();

ps.close(); 
}
else{
%>
<script>window.alert("please fill all the details properly...");</script>
<%
}
}

catch(Exception sqe)

{

System.out.println(sqe);

}
}
else if("DELETE".equals(action))
{
try{


if(sname.length()!=0&&name.length()!=0&& branch.length()!=0){
sname=sname.toUpperCase();
name=name.toUpperCase();
String sql = "select * from "+branch+" where sid='"+name+"' and sname='"+sname+"';";
ps = con.prepareStatement(sql);
 rs = ps.executeQuery();
 if(!rs.next())
{
%>
<script>
    window.alert("Record doesn't exist...!");
</script>

<%
}
else{

sql="Delete from "+branch+" where sname='"+sname+"' and sid='"+name+"';";
     Statement s = con.createStatement();
     s.executeUpdate(sql);
%>
<script>
    window.alert("Record deleted successfully...!");
</script>
<%
}
ps.close(); 
rs.close();
}

}
catch(Exception sqe)

{

System.out.println(sqe);

}
}



%>
        
        
        
        
    </body>
</html>