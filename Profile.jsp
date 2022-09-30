<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DbConnect"%>
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
      <!-- Bootstrap -->
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
	</br></br>
        <div class="container">
            <section>
                <div class="row">
                        
                    <div class="col-lg-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading text-center">
                                <h3>PROFILE</h3>
                            </div>
                            <div class="panel-body">
                                <div class="col-lg-4">
                                    <img src="GetPhoto?email=<%=ud.get("email")%>"
                                         border="0px" align="" width="120px" height="120px" alt="Profile Photo">
                                </div>
                                <div class="col-lg-8">				
                                    <form action="" class="form-horizontal">
                                        <div class="form-group">
                                            <label for="email" class="control-label">Name: <font color="grey"><%=ud.get("name")%></font></label>						
                                        </div><!--end form group-->
                                        <div class="form-group">
                                            <label for="name" class="control-label">Email: <font color="grey"><%=ud.get("email")%></font></label>						
                                        </div><!--end form group-->
                                        <div class="form-group">
                                            <label for="gender" class="control-label">Gender: <font color="grey"><%=ud.get("gen")%></font></label>
                                        </div><!--end form group-->
                                        <div class="form-group">
                                            <label for="dob" class="control-label">Date of Birth: <font color="grey"><%=ud.get("dob")%></font></label>
                                        </div>
                                        <div class="form-group">
                                            <label for="state" class="control-label">Address: <font color="grey"><%=ud.get("state")%>, <%=ud.get("country")%></font></label>						
                                        </div><!--end form group-->
                                        <div class="form-group">
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-warning" formaction="EditProfile.jsp">Edit Profile</button>
                                                <button onclick="history.back()" class="btn btn-info" name='view' value="" >Back</button>
                                                <button type="submit" class="btn btn-warning" formaction="changepassword.jsp">Change Password</button>
                                            </div>						
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div><!--end form group-->
                    
                    <div class="col-lg-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading text-center">
                                <h3>SEARCH PEOPLE</h3>
                            </div>
                            <div class="panel-body">
                                <form action="searchpeople" method="post" class="form-horizontal">
                                    <div class="form-group">
                                        <label for="country" class="col-lg-3 control-label">Country:</label>
                                        <div class="col-lg-9">
                                            <select class="form-control" id="country" name ="country"></select>
                                        </div>
                                    </div><!--end form group-->
                                    <div class="form-group">
                                        <label for="state" class="col-lg-3 control-label">State:</label>
                                        <div class="col-lg-9">
                                            <select class="form-control" name ="state" id ="state"></select>
                                        </div>
                                    </div><!--end form group-->
                                    <script language="javascript">
                                        populateCountries("country", "state");
                                        populateCountries("country");
                                    </script>
                                    <div class="form-group">
                                        <div class="col-lg-10 col-lg-offset-3">
                                            <button type="search" class="btn btn-info">Search</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading text-center">
                                <h3>RECENT TALKS</h3>
                            </div>
                            <div class="panel-body">
                                <section>
                    <%
                                    DbConnect db=(DbConnect)application.getAttribute("db");
                                    if(db==null){
                                        db=new DbConnect();
                                        application.setAttribute("db",db);
                                    }
                                    PreparedStatement getMsgs=db.getMsgs();
                                    getMsgs.setString(1, String.valueOf(ud.get("email")));
                                    getMsgs.setString(2, String.valueOf(ud.get("email")));
                                    ResultSet rs=getMsgs.executeQuery();
                                    
                                    PreparedStatement userdetails=db.getUserDetails();
                                    ResultSet rs1;
                                    String sp[][]=new String[100][4];
                                    
                                    int i=0,j=0;
                                    try{
                                        while(rs.next())
                                        {
                                            userdetails.setString(1, rs.getString(1));
                                            rs1=userdetails.executeQuery();
                                            if(rs1.next()){
                                                sp[i][j]=rs1.getString(1);
                                                sp[i][j+1]=rs1.getString(2);
                                                sp[i][j+2]=rs1.getString(4);
                                                sp[i][j+3]=rs1.getString(5);
                        %>
                                                <div class="row">
                                                    <form action="talkprocess" method="post" class="form-horizontal">
                                                        <div class="col-lg-2">
                                                            <img src="GetPhoto?email=<%=sp[i][j+1] %>"
                                                             border="0px" align="" width="50px" height="50px" alt="Profile Photo">
                                                        </div>
                                                        <div class="col-lg-7">
                                                            <label for="name" name="name" class="control-label"><font color="grey"> <%=sp[i][j]%></font></label><br>
                                                            <!--<div class="form-group">
                                                                <label for="name" name="name" class="control-label">Name: <font color="grey"> <%=sp[i][j]%></font></label><br>
                                                                <label for="email" name="email" class="control-label">Email:<font color="grey"> <%=sp[i][j+1]%></font></label><br>
                                                                <label for="gender" name="gen" class="control-label">Gender: <font color="grey"> <%=sp[i][j+2]%></font></label><br>
                                                                <label for="dob" name="dob" class="control-label">Date of Birth: <font color="grey"> <%=sp[i][j+3]%></font></label><br>
                                                            </div>-->
                                                        </div>
                                                        <div class="col-lg-3">
                                                                <button type="search" name="talk" value='<%=sp[i][j+1]%>' class='btn btn-success' >Talk</button>
                                                        </div>
                                                    </form>
                                                </div><br>
                        <%                      
                                                i++;
                                            }
                                        }
                                    }catch(Exception ex){
                                        session.setAttribute("msg",ex);
                                        response.sendRedirect("error.jsp");
                                    }
                    %>
                                </section>
                            </div>
                        </div><br>
                                
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
<%
    }else{
        session.setAttribute("msg","Plz Login First!");
            response.sendRedirect("index.jsp");
    }
%>