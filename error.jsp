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
        
        <div class="container text-center" >
            <section>
                <div class="panel panel-danger">
                    <div class="panel-heading text-center">
                        <h1><b>ERROR</b></h1>
                    </div>
                    <div class="panel-body"></br></br>
                        <form action="" class="form-horizontal">
                            <div class="form-group">
                                <h3>Something went wrong !</h3>
                                <h3><%=session.getAttribute("msg")%></h3>
                            </div><!--end form group-->
                            <div class="form-group">
                                <div class="col-lg-2 col-lg-offset-5">
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