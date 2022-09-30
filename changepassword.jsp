<%-- 
    Document   : changepassword
    Created on : 15 Jun, 2018, 6:23:25 PM
    Author     : Abhishek Rai
--%>

<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HashMap ud=(HashMap)session.getAttribute("userdata");
    if(ud!=null){
%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>PeopleTalk</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="bootstrap/css/forgetpassword.css" rel="stylesheet">
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
	</nav><!-- end of navbar-->
		
        <div class="container">
            <section>
                <div class="panel panel-warning">
                    <div class="panel-heading text-center">
                        <h3>CHANGE PASSWORD</h3>
                    </div>
                    <div class="panel-body"></br></br>
                        <form action="ChngPwd" method="post" class="form-horizontal">
                            <div class="form-group">
                                <label for="oldpwd" class="col-lg-2 control-label">Current Password:</label>
                                <div class="col-lg-9">
                                    <input type="password" class="form-control" name="oldpwd" id="oldpwd"/>
                                </div>
                            </div><!--end form group-->
                            <div class="form-group">
                                <label for="newpwd" class="col-lg-2 control-label">New Password:</label>
                                <div class="col-lg-9">
                                    <input type="password" class="form-control" name="newpwd1" id="newpwd"/>
                                </div>
                            </div><!--end form group-->
                            <div class="form-group">
                                <label for="confirmpwd" class="col-lg-2 control-label">Confirm Password:</label>
                                <div class="col-lg-9">
                                    <input type="password" class="form-control" name="newpwd2" id="confirmpwd"/>
                                </div>
                            </div><!--end form group-->
                            <div class="form-group">
                                <div class="col-lg-10 col-lg-offset-5">
                                    <button type="submit" class="btn btn-warning">Submit</button>
                                    <button onclick="history.back()" class="btn btn-info" name='view' value="" >Back</button>
                                </div>
                            </div><!--end form group-->
                        </form>
                    </div>
                </div>
            </section>
	</div>
	<!--footer-->
	
	<div class="navbar navbar-inverse navbar-fixed-bottom">
            <div class="container">
                <div class="navbar-text pull-left">
                    <p>Design and Develop by INCAPP</p>
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