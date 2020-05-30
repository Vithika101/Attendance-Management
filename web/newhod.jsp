
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
                                <h1> CHANGE HOD </h1>
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
                                    <label for="hname" class="uname" data-icon="u">New HOD name</label>
                                    <input id="hname" name="hname" required="required" type="text" placeholder="mysuperusername690" />
                                </p>
                                <p> 
                                    <label for="tid" data-icon="e" >Teacher ID</label>
                                    <input id="tid" name="tid" required="required" type="text" placeholder="CS10012"/> 
                                </p>
                                 <p> 
                                    <label for="passh" class="youpasswd" data-icon="p">New password </label>
                                    <input id="passh" name="passh" type="password" placeholder="eg. X8df!90EO" contenteditable="true"/>
                                </p>
                                <p> 
                                    <label for="confpassh" class="youpasswd" data-icon="p">Confirm your password </label>
                                    <input id="confpassh" name="confpassh" type="password" placeholder="eg. X8df!90EO" contenteditable="true"/>
                                </p>

                               
                                <p> 
									<input type="submit" id="action" name="action" value="CHANGE"/> 
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
String name = request.getParameter("tid");
String fname = request.getParameter("hname");
String password = request.getParameter("passh");
String cnfpass=request.getParameter("confpassh");
String action=request.getParameter("action");
String branch=request.getParameter("department");
if("CHANGE".equals(action)){
System.out.println(name+" "+password+" "+cnfpass);
try{
if(fname.length()!=0&&name.length()!=0&&password.length()!=0&&cnfpass.length()!=0 && branch.length()!=0){
    fname=fname.toUpperCase();
    name=name.toUpperCase();
String sql = "select * from teacher where tid="+name+";";

ps = con.prepareStatement(sql);
 rs = ps.executeQuery();
 if(!rs.next())

{ 
%>
<script>
    window.alert("No such teacher ID exists...!");
    
    </script>

<%

}
else
 {
    if(!password.equals(cnfpass))
{
%>
<script>
    window.alert("Passwords don't match...");
    
    </script>
<%
    
}
else{
sql="update department set hid="+name+" where dname='"+branch+"';";
Statement s = con.createStatement();
     s.executeUpdate(sql);
    sql="update department set hname='"+fname+"' where dname='"+branch+"';";
s.executeUpdate(sql);
sql="update department set password='"+password+"' where dname='"+branch+"';";
s.executeUpdate(sql);

 %>
 <script>
    window.alert("Changed HOD successfully...");
    
    </script>
 
 <%
}
 }

rs.close();

ps.close(); 
}
else{
%>
<script> window.alert("please fill all the details properly...");</script>
<%
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