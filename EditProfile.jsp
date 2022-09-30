<%-- 
    Document   : EditProfile
    Created on : 15 Jun, 2018, 12:10:56 PM
    Author     : Abhishek Rai
--%>

<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="bootstrap/css/forgetpassword.css" rel="stylesheet">
        <script src="bootstrap/countries.js"></script>
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
		
        <div class="container col-lg-8 col-lg-offset-2">
            <section>
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <h3>EDIT PROFILE</h3>
                    </div>
                    <div class="panel-body">
                        <div class="container">
                            <div class="row">
                                <form action="UpdatePhoto" method="post" enctype="multipart/form-data" class="form-horizontal">
                                    <div class="col-lg-3" align="center">
                                        <img src="GetPhoto?email=<%=ud.get("email")%>"
                                     border="0px" align="" width="120px" height="120px" alt="Profile Photo">
                                    </div>
                                        <label for="changephoto" class="col-lg-3 control-label">Change Photo</label><br><br>
                                    <div class="form-group">
                                        <div class="col-lg-3">
                                            <input class="form-control" type="file" accept="image/*" name="photo" size="4096" required/>
                                        </div>
                                        <div class="col-lg-3">
                                            <button type="submit" class="btn btn-warning">Update Photo</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div><hr>
                        <div class="container">
                            <form action="UpdateProfile" method="post" class="form-horizontal">
                                <div class="form-group">
                                    <label for="name" class="col-lg-2 control-label">Name:</label>
                                    <div class="col-lg-5">
                                        <input type="text" class="form-control" name="name" id="name" placeholder="Enter your name" required/>
                                    </div>
                                </div><!--end form group-->
                                <div class="form-group">
                                    <label for="email" class="col-lg-2 control-label">Email:</label>
                                    <div class="col-lg-5">
                                        <!--
                                        <input type="email" class="form-control" disabled name="email"  id="email" placeholder="<%=ud.get("email")%>"/>
                                        -->
                                        <input type="email" class="form-control" readonly name="email"  id="email" placeholder="<%=ud.get("email")%>"/>
                                    </div>
                                </div><!--end form group-->
                                <div class="form-group">
                                    <label for="gender" class="col-lg-2 control-label">Gender:</label>
                                    <div class="col-lg-5">
                                        <label class="radio-inline"><input type="radio" name="gen" value="Male" id="gender" required/>Male</label>
                                        <label class="radio-inline"><input type="radio" name="gen" value="Female" id="gender" required/>Female</label>
                                        <label class="radio-inline"><input type="radio" name="gen" value="Other" id="gender" required/>Other</label>
                                    </div>
                                </div><!--end form group-->
                                <div class="form-group">
                                    <label for="dob" class="col-lg-2 control-label">Date of Birth:</label>
                                    <div class="col-lg-5">
                                        <input type="date" class="form-control" name="dob" id="dob" required/>
                                    </div>
                                </div><!--end form group-->
                                <div class="form-group">
                                    <label for="country" class="col-lg-2 control-label">Country:</label>
                                    <div class="col-lg-5">
                                        <select class="form-control" id="country" name="country" required></select>
                                    </div>
                                </div><!--end form group-->
                                <div class="form-group">
                                    <label for="state" class="col-lg-2 control-label">State:</label>
                                    <div class="col-lg-5">
                                        <select class="form-control" name="state" id="state" required></select>
                                    </div>
                                </div><!--end form group-->
                                <script language="javascript">
                                    populateCountries("country", "state");
                                    populateCountries("country");
                                </script>
                                <div class="form-group">
                                    <div class="col-lg-10 col-lg-offset-2">
                                        <button type="submit" class="btn btn-warning">Update Profile</button>
                                    </div>
                                </div>
                            </form>
                            <div class="form-group">
                                <div class="col-lg-3 col-lg-offset-4">
                                    <button onclick="history.back()" class="btn btn-info" name='view' value="" >Back</button>
                                    <button type="submit" onclick="return window.location.href='DeleteAccount' " class="btn btn-danger">Delete Account</button>
                                </div>
                            </div>
                        </div>
                    </div>							
                </div>
            </section><br/><br/><br/><br/>
        </div>
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