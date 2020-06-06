<%@page language="java" import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>

<%
  String reg_no,fname,lname,year,branch,semester;
  //String ans1,ans2,ans3,ans4,ans5;
  int a1,a2,a3,a4,a5;
  a1=a2=a3=a4=a5=0;
  Connection conn=null;
  Statement stmt=null;
  ResultSet rs=null;
  Class.forName("com.mysql.jdbc.Driver");
  conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql","root","goldenangel");
  if(request.getParameter("action")!=null) {
   reg_no=request.getParameter("reg_no");
   fname=request.getParameter("name");
   if(request.getParameter("lname")!=null)
   {
	   lname=request.getParameter("lname");
	   a1=1;
   }
   else 
	   lname="";
   if(request.getParameter("year")!=null)
   year=request.getParameter("year");
   else
	   year="";
   if(request.getParameter("semester")!=null)
   semester=request.getParameter("semester");
   else
	   semester="";
   if(request.getParameter("br")!=null)
	branch=request.getParameter("br");
   else
	   branch="";
   //if(ans1.equals("true"))
     //a1=2;
    //else
     //a1=0;
   
   //ans2=request.getParameter("q2");
   //if(ans2.equals("true"))
     //a2=2;
    //else
     //a2=0;

   //ans3=request.getParameter("q3");
   //if(ans3.equals("false"))
     //a3=2;
    //else
   //  a3=0;

   //ans4=request.getParameter("q4");
   //if(ans4.equals("false"))
     //a4=2;
    //else
     //a4=0;

   //ans5=request.getParameter("q5");
   //if(ans5.equals("false"))
     //a5=2;
    //else
     //a5=0;

   //int score=a1+a2+a3+a4+a5;
   String query;
   if(a1==1)
   {
	   stmt=conn.createStatement();
	  query="INSERT INTO examreg(reg_no,fname,lname,year,sem,br)VALUES('"+reg_no+"','"+fname+"','"+lname+"','"+year+"','"+semester+"','"+branch+"')";
      int result=stmt.executeUpdate(query);
   		stmt.close();
   }
   stmt=conn.createStatement();
   query="SELECT * FROM examreg WHERE fname='"+fname+"' AND reg_no='"+reg_no+"'";
   rs=stmt.executeQuery(query);
%>
 <html><head><title>Scrore</title></head>
 <body bgcolor="orange">
 <center>
   <h2>Anna university,Chennai.</h2>
   <h3>Student details.</h3>
   <h4>Welcome Guest,</h4>
   <hr />
   <br /><br />
   <table border="1">
     <tr>
        <td><b>Registration Number</b></td>
        <td><b>FirstName</b></td>
        <td><b>LastName</b></td>
        <td><b>Year</b></td>
        <td><b>Semester</b></td>
        <td><b>Branch</b></td>
        <td>
     </tr>
     <br/>
        <%
        while(rs.next()) {
      %>
       <tr>
        <td id="int"><%=rs.getString(1)%></td>
        <td><%=rs.getString(2)%></td>
        <td><%=rs.getString(3)%></td>
        <td><%=rs.getInt(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=rs.getString(6) %></td>
     </tr>
     <%
       }
       rs.close();
       stmt.close();
       conn.close();
      %>
    </table>
    </center><br /><br />
    <p>
      <center><i>Date: <%=new java.util.Date().toString()%> &nbsp; <b>&copy;ssn</b> </i></center>
    </p>
    <div>
      <a href="login.html">Logout.</a>
    </div>
    <script>
    var i=rs.getString(1);
      if(i=="")
    	 alert("NOT REGISTERED.PLEASE REGISTER FIRST USING THE REGISTER LINK.");
      else
    	  alert("REGISTERED SUCCESSFULLY.");
      
      </script>
   </body>
   </html>
  <%} else {%>
  <%}%>