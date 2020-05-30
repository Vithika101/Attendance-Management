
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
                <script>
                    func del()
                    {
                        var ans=confirm("Do you really want to delete?");
                        if(!ans)
                            return true;
                        else
                            return false;
                       
                    }
                    </script>
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
                            
                            <form autocomplete="on" action="newfaculty.jsp" method="post"> 
                                <h1> ADD / DELETE  FACULTY </h1>
                               
                                <p> 
                                    <label for="fname" class="uname" data-icon="u">Teacher name</label>
                                    <input id="fname" name="fname" required type="text" placeholder="myusername690" />
                                </p>
                                <p> 
                                    <label for="fid" data-icon="e" >Teacher ID</label>
                                    <input id="fid" name="fid" required type="text" placeholder="1001" maxlength="4"/> 
                                </p>
                                 <p> 
                                    <label for="passf" class="youpasswd" data-icon="p">Your password </label>
                                    <input id="passf" name="passf" type="password" placeholder="eg. X8df!90EO" contenteditable="true"/>
                                </p>
                                <p> 
                                    <label for="confpassf" class="youpasswd" data-icon="p">Please confirm your password </label>
                                    <input id="confpassf" name="confpassf" type="password" placeholder="eg. X8df!90EO" contenteditable="true"/>
                                </p>

                               
                                <p> 
									<input type="submit" name="action" id="addf" value="ADD FACULTY"/> 
								</p>
                                                                <p> 
                                                                    <input type="submit" name="action" id="deletef" value="DELETE FACULTY" onclick="return del()"/> 
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
String name = request.getParameter("fid");
String fname = request.getParameter("fname");
String password = request.getParameter("passf");
String cnfpass=request.getParameter("confpassf");
String action=request.getParameter("action");
if("ADD FACULTY".equals(action)){
System.out.println(name+" "+password+" "+cnfpass);
try{
if(fname.length()!=0&&name.length()!=0&&password.length()!=0&&cnfpass.length()!=0){
String sql = "select * from teacher where tid="+name+";";
 fname=fname.toUpperCase();
ps = con.prepareStatement(sql);
 rs = ps.executeQuery();
 if(rs.next())

{ 

    
userdbName = rs.getString("tid");

userdbPsw = rs.getString("password");

System.out.println(userdbName+" "+userdbPsw);


if(name.equals(userdbName))

{

%>
<script>
    window.alert("This teacher has already been registered");
    
    </script>
<%

} 

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
     sql="Insert into teacher values('"+fname+"',"+name+",'"+password+"');";
     Statement s = con.createStatement();
     s.executeUpdate(sql);
 %>
 <script>
    window.alert("Inserted data successfully...");
    
    </script>
 
 <%
}
 }

rs.close();

ps.close(); 
}
else{
%>
<h5> please fill all the details properly...</h5>
<%
}
}

catch(Exception sqe)

{

System.out.println(sqe);

}
}
else if("DELETE FACULTY".equals(action))
{
try{


if(fname.length()!=0&&name.length()!=0){
String sql = "select * from teacher where tid="+name+";";
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

sql="Delete from teacher where tname='"+fname+"' and tid="+name+";";
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