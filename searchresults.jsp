<%-- 
    Document   : searchpeople
    Created on : 15 Jun, 2018, 7:11:16 PM
    Author     : Abhishek Rai
--%>
<%@page import="db.DbConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.HashMap"%>
<%
    HashMap ud=(HashMap)session.getAttribute("userdata");
    if(ud!=null){
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>PeopleTalk</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="bootstrap/css/talk.css" rel="stylesheet">
        <style>
            body {
              background-image: url('bootstrap/img/bg.jpg');
            }
        </style>
    </head>
    <body data-spy="scroll" data-target="#my-navbar">
    	<nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">PeopleTalk</a>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="Profile.jsp"><%=ud.get("name")%></a></li>
                        <li><a href="Logout">Logout</a><li>
                    </ul>			
                </div>
            </div>
	</nav>
	<div class="container">
            <div class="panel panel-warning text center">
                <div class="panel-heading text-center">
                    <h3>SEARCH RESULTS</h3>
                </div>
            </div>
	    <section>
<%
                try{
                    String sp[][]=(String[][])session.getAttribute("spl");
                    int i=0,j=0;
                    String email=String.valueOf(ud.get("email"));
                    while(sp[i][j]!=null)
                    {
                        if(!sp[i][j+1].equals(email)){
                            
%>
                        <div class="row">
                            <form action="talkprocess" method="post" class="form-horizontal">
                                <div class="col-lg-3">
                                    <img src="GetPhoto?email=<%=sp[i][j+1] %>"
                                     border="0px" align="" width="120px" height="120px" alt="Profile Photo">
                                </div>
                                <div class="col-lg-8">
                                    <div class="form-group">
                                        <label for="name" name="name" class="control-label">Name: <font color="white"> <%=sp[i][j]%></font></label><br>
                                        <label for="email" name="email" class="control-label">Email:<font color="white"> <%=sp[i][j+1]%></font></label><br>
                                        <label for="gender" name="gen" class="control-label">Gender: <font color="white"> <%=sp[i][j+2]%></font></label><br>
                                        <label for="dob" name="dob" class="control-label">Date of Birth: <font color="white"> <%=sp[i][j+3]%></font></label><br>
                                    </div>
                                </div>
                                <div class="col-lg-1">
                                    <div class="form-group"></br></br>
                                        <button type="search" name="talk" value='<%=sp[i][j+1]%>' class='btn btn-success'>Talk</button>
                                    </div>
                                </div>
                            </form>
                        </div><br/><br/>
<%                      
                        }
                        i++;
                    }
                }catch(Exception ex){
                    session.setAttribute("msg",ex);
                    response.sendRedirect("error.jsp");
                }
%>
            </section><hr/>
            <button onclick="history.back()" class="btn btn-info col-lg-offset-5" name='view' value="" >Back</button>
	</div></br>
        
	<!--footer-->
	<div class="navbar navbar-inverse navbar-fixed-bottom">
            <div class="container">
                <div class="navbar-text pull-left">
                        <p>Developed by Abhishek Rai</p>
                </div>
            </div>
	</div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>

<%
    }else{
        session.setAttribute("msg","Plz Login First!");
            response.sendRedirect("index.jsp");
    }
%>