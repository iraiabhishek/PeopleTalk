<%-- 
    Document   : changepassword
    Created on : 15 Jun, 2018, 6:11:48 PM
    Author     : Abhishek Rai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <nav class="navbar navbar-inverse navbar-fixed-top" id="my-navbar">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="index.jsp" class="navbar-brand">PeopleTalk</a>
                </div><!--end header-->
            </div><!--end container-->
        </nav><!--end navbar-->
        
        <div class="container">
            <section>
                <div class="panel panel-warning">
                    <div class="panel-heading text-center">
                        <h3>FORGET PASSWORD ?</h3>
                    </div>
                    <div class="panel-body"></br></br>
                        <form action="ResetPass" method="post" class="form-horizontal">
                            <div class="form-group">
                                <label for="email" class="col-lg-2 control-label">Email: </label>
                                <div class="col-lg-9">
                                    <input type="email" class="form-control" name="email" placeholder="Enter your email id"/>
                                </div>
                            </div><!--end form group-->
                            <div class="form-group">
                                <div class="col-lg-2 col-lg-offset-5">
                                    <button type="submit" class="btn btn-success">Submit</button>
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
                <p>Developed by Abhishek Rai</p>
            </div>
        </div>
    </div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>