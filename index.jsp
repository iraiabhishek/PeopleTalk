<%-- 
    Document   : index
    Created on : 14 Jun, 2018, 12:23:56 AM
    Author     : Abhishek Rai
--%>

<%@page import="java.util.HashMap"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>PeopleTalk</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="bootstrap/css/custom.css" rel="stylesheet">
        <script src="bootstrap/countries.js"></script>
        <style>
            body {
              background-image: url('bootstrap/img/bg.jpg');
            }
        </style>
    </head>
    
    <body data-spy="scroll" data-target="#my-navbar">
        <!--navigation bar-->
        <nav class="navbar navbar-inverse navbar-fixed-top" id="my-navbar">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp">PeopleTalk</a>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                    <%
                        HashMap ud=(HashMap)session.getAttribute("userdata");
                        if(ud!=null){
                    %>
                            <li><a href="Profile.jsp"><%=ud.get("name")%></a></li>
                            <li><a href="Logout">Logout</a><li>
                    <%
                        }
                    %>
                        </ul>			
                    </div>
                </div><!--end of header inside navigation bar-->
            </div><!--end container-->
        </nav><!--end navigation bar-->	
	
        <!--Gallery-->
	<div class="container">
            <section>
                <div class="carousel slide" id="screenshot-carousel" data-ride="carousel">
                     <!--Indicators--> 
                    <ol class="carousel-indicators">
                        <li data-target="#screenshot-carousel" data-slide-to="0" class="active"></li>
                        <li data-target="#screenshot-carousel" data-slide-to="1" ></li>
                        <li data-target="#screenshot-carousel" data-slide-to="2" ></li>
                    </ol>
                    
                     <!--Wrapper for slides--> 
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="bootstrap/img/image1.png" alt="Text of the image" height="10" width="1200">
                            <div class="carousel-caption">
                                <h4>CONNECTING PEOPLE</h4>
                            </div>
                        </div>
                        <div class="item">
                            <img src="bootstrap/img/image2.jpg" alt="Text of the image" height="10" width="1200">
                            <div class="carousel-caption">
                                <h4>SHARE INFORMATION</h4>
                            </div>
                        </div>
                        <div class="item">
                            <img src="bootstrap/img/image3.jpg" alt="Text of the image" height="10" width="1200">
                            <div class="carousel-caption">
                                <h4>MAKING WORLD CLOSER</h4>
                            </div>
                        </div>
                    </div><!--end carousel-inner-->
    
                     <!--Left and right controls--> 
                    <a href="#screenshot-carousel" class="left carousel-control" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a href="#screenshot-carousel" class="right carousel-control" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div><!--end of carousel-->
            </section>
        </div><!--end of container-->
        <!--end of Gallery-->
        
        <!--Features-->
        <br/>
        <div class="container">
            <section>
                <div class="row">
                <!--Left Side-->
                    <div class="col-lg-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading text-center">
                                <h3>REGISTRATION</h3>
                            </div>
                            <div class="panel-body">
                                <form action="Register" method='post' enctype="multipart/form-data" class="form-horizontal">
                                    <div class="form-group">
                                        <label for="name" class="col-lg-3 control-label">Name:</label>
                                        <div class="col-lg-9">
                                            <input type="text" class="form-control" name="name" id="name" placeholder="Enter your name"/>
                                        </div>
                                    </div><!--end form group-->
                                    <div class="form-group">
                                        <label for="email" class="col-lg-3 control-label">Email:</label>
                                        <div class="col-lg-9">
                                            <input type="email" class="form-control" name="email" id="email" placeholder="Enter your email"/>
                                        </div>
                                    </div><!--end form group-->
                                    <div class="form-group">
                                        <label for="password" class="col-lg-3 control-label">Password:</label>
                                        <div class="col-lg-9">
                                            <input type="password" class="form-control" name="pass" id="password" placeholder="Enter your password"/>
                                        </div>
                                    </div><!--end form group-->
                                    <div class="form-group">
                                        <label for="password" class="col-lg-3 control-label">Confirm:</label>
                                        <div class="col-lg-9">
                                            <input type="password" class="form-control" name="pass2" id="password2" placeholder="Re-enter your password"/>
                                        </div>
                                    </div><!--end form group-->
                                    <div class="form-group">
                                        <label for="gender" class="col-lg-3 control-label">Gender:</label>
                                        <div class="col-lg-9">
                                            <label class="radio-inline"><input type="radio" name="gen" value="Male" id="gender"/>Male</label>
                                            <label class="radio-inline"><input type="radio" name="gen" value="Female" id="gender"/>Female</label>
                                            <label class="radio-inline"><input type="radio" name="gen" value="Other" id="gender"/>Other</label>
                                        </div>
                                    </div><!--end form group-->
                                    <div class="form-group">
                                        <label for="dob" class="col-lg-3 control-label">Date of Birth:</label>
                                        <div class="col-lg-9">
                                            <input type="date" class="form-control" name="dob" id="dob"/>
                                        </div>
                                    </div><!--end form group-->
                                    <div class="form-group">
                                        <label for="country" class="col-lg-3 control-label">Country:</label>
                                        <div class="col-lg-9">
                                            <select class="form-control" id="country" name="country"></select>
                                        </div>
                                    </div><!--end form group-->
                                    <div class="form-group">
                                        <label for="state" class="col-lg-3 control-label">State:</label>
                                        <div class="col-lg-9">
                                            <select class="form-control" name="state" id="state"></select>
                                        </div>
                                    </div><!--end form group-->
                                    <script language="javascript">
                                        populateCountries("country", "state");
                                        populateCountries("country");
                                    </script>
                                    <div class="form-group">
                                        <label for="photo" class="col-lg-3 control-label">Photo:</label>
                                        <div class="col-lg-9">
                                            <input class="form-control" type="file" name="photo" size="4096" required/>
                                        </div>
                                    </div><!--end form group-->
                                    <div class="form-group">
                                        <div class="col-lg-10 col-lg-offset-3">
                                            <button type="submit" class="btn btn-primary">Register</button>
                                            <button type="reset" class="btn btn-primary">Reset</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                <!--Right Side-->
                    <div class="col-lg-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading text-center">
                                <h3>LOGIN</h3>
                            </div>
                            <div class="panel-body">
                                <form action="LoginProcess" class="form-horizontal">
                                    <div class="form-group">
                                        <label for="email" class="col-lg-3 control-label">Email:</label>
                                        <div class="col-lg-9">
                                            <input type="email" class="form-control" name="email" id="email" placeholder="Enter your email"/>
                                        </div>
                                    </div><!--end form group-->
                                    <div class="form-group">
                                        <label for="password" class="col-lg-3 control-label">Password:</label>
                                        <div class="col-lg-9">
                                            <input type="password" class="form-control" name="pass" id="password" placeholder="Enter your name"/>
                                        </div>
                                    </div><!--end form group-->
                                    <div class="form-group">
                                        <div class="col-lg-10 col-lg-offset-3">
                                            <button type="submit" class="btn btn-primary">Login</button>
                                            <button type="reset" class="btn btn-primary">Reset</button>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-10 col-lg-offset-3">
                                            <a href="forgetpassword.jsp">Forget Password ?</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <!--end of Features-->
	
        <hr>
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