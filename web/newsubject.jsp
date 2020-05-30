
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
                                <h1> ADD / DELETE  SUBJECT </h1>
                                <p> 
                                    <label for="subname" class="uname" data-icon="u">Subject name</label>
                                    <input id="subname" name="subname" required="required" type="text" placeholder="eg. Operating System" />
                                </p>
                                <p> 
                                    <label for="code" data-icon="e" >Subject ID</label>
                                    <input id="code" name="code" required="required" type="text" placeholder="eg. ICS101"/> 
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
                                    <label for="tname" class="uname" data-icon="u">Teacher id</label>
                                    <input id="tname" name="tname" required="required" type="text" placeholder="eg. 1001" />
                                </p>
                                <p> 
									<input type="submit" name="action" value="ADD"/> 
								</p>
                                                                
                                                                    <p> 
									<input type="submit" name="action" value="DELETE"/> 
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
String name = request.getParameter("code");
String subname = request.getParameter("subname");
String branch = request.getParameter("department");
String year=request.getParameter("year");
String tname=request.getParameter("tname");
String action=request.getParameter("action");
if("ADD".equals(action)){
System.out.println(name+" "+branch+" "+year);
try{
if(subname.length()!=0&&name.length()!=0&& branch.length()!=0&&year.length()!=0 && tname.length()!=0){
    name=name.toUpperCase();
    subname=subname.toUpperCase();
String sql="select * from subject where dname='"+branch+"' and year="+year+" and (subname='"+subname+"' or subid='"+name+"');";
System.out.println(sql);
ps = con.prepareStatement(sql);
 rs = ps.executeQuery();
 if(!rs.next())
 {
     sql="select * from teacher where tid="+tname+";";
     ps = con.prepareStatement(sql);
 rs = ps.executeQuery();
 if(!rs.next())
 {
     %>
     <script>
         window.alert("No such Teacher ID exists...!");
     </script>
     <%
 }
     else{
        sql = "select sno,count(subid) from subject where dname='"+ branch+"' and year="+year+" and subid is not null;";
        System.out.println(sql);
ps = con.prepareStatement(sql);
 rs = ps.executeQuery();
 if(rs.next())
{ 
int x[]=new int[6];
userdbPsw = rs.getString("count(subid)");
while(rs.next())
    x[Integer.parseInt(rs.getString("sno"))]=1;
System.out.println("1 "+userdbName+" "+userdbPsw);
 int count=6;
for(int i=1;i<6;i++)
    if(x[i]==0)
    {
        count=i;
         break;
    }

if(count<=5)
{
     sql="delete from subject where dname='"+branch+"' and year="+year+" and sno="+count+";";
     Statement s = con.createStatement();
     s.executeUpdate(sql);
     System.out.println(sql);
     sql="Insert into subject values('"+branch+"',"+year+","+count+",'"+name+"','"+subname+"',"+tname+",0,'0000-00-00');";
      s.executeUpdate(sql);
      System.out.println(sql);
 %>
 <script>
    window.alert("Inserted data successfully...");
    
    </script>
 
 <%
}
else{
%>
<script>
    window.alert("5 subjects already registered for "+branch.toUpperCase()+" "+year+" year...");
    
    </script>


<%
}
 }
}
rs.close();

ps.close(); 

}
else
{
%>
<script>
    window.alert("Subject already exists...")
    </script>
<%
}
}
else{
%>
<h5> please fill all the details properly...</h5>
<%
}
}

catch(Exception sqe)

{

System.out.println(2+" "+sqe);

}
}
else if("DELETE".equals(action))
{
try{


if(subname.length()!=0&&name.length()!=0&&year.length()!=0&&branch.length()!=0){
name=name.toUpperCase();
String sql = "select sno from subject where dname='"+ branch+"' and year="+year+" and subid='"+name+"';";
System.out.println(sql);
 ps = con.prepareStatement(sql);
 rs = ps.executeQuery();
if(rs.next())
{
String sno=rs.getString("sno").toUpperCase();
sql="update "+branch+" set sub"+sno+"=0 where year="+year+";";
System.out.println(sql);
     Statement s = con.createStatement();
     s.executeUpdate(sql);
  
sql="update subject set subname=NULL where dname='"+branch+"' and year="+year+" and sno="+sno+";";
System.out.println(sql);    
s.executeUpdate(sql);
sql="update subject set subid=NULL where dname='"+branch+"' and year="+year+" and sno="+sno+";";
System.out.println(sql);    
s.executeUpdate(sql);
sql="update subject set tid=NULL where dname='"+branch+"' and year="+year+" and sno="+sno+";";
System.out.println(sql);    
s.executeUpdate(sql);
sql="update subject set lectures=0 where dname='"+branch+"' and year="+year+" and sno="+sno+";";
System.out.println(sql);    
s.executeUpdate(sql);
sql="update subject set lastdate=NULL where dname='"+branch+"' and year="+year+" and sno="+sno+";";
System.out.println(sql);    
s.executeUpdate(sql);

%>
<script>
    window.alert("Record deleted successfully...!");
</script>
<%
}
else{
%>
<script>
    window.alert("No such record to delete...!");
</script>
<%
}
ps.close(); 
rs.close();
}

}
catch(Exception sqe)

{

System.out.println("3 "+sqe);

}
}



%>   
    
    
</html>