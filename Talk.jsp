<%-- 
    Document   : Talk.jsp
    Created on : 15 Jun, 2018, 7:28:26 PM
    Author     : Abhishek Rai
--%>
<%@page import="db.DbConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.HashMap"%>
<%
    try{
        HashMap ud=(HashMap)session.getAttribute("userdata");
        HashMap rd=(HashMap)session.getAttribute("rcvdata");
        if(ud!=null){
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
	</nav><!-- end of navbar-->
        
        <div class="container">
            <div class="row">
                <!--Left -->
                <div class="col-lg-5">
                    <div class="panel panel-primary">
                        <div class="panel-heading text-center">
                            <h3><b>Profile</b></h3>
                        </div>
                    <div class="row">
                        <div class="panel-body text-center">
                            <div class="col-lg-5">
                                <img src="GetPhoto?email=<%=rd.get("email")%>"
                                     border="0px" align="" width="120px" height="120px" alt="Profile Photo">
                            </div>
                            <div class="col-lg-7 text-justify">
                                <div class="form-group"></br>
                                    <label for="email" class="control-label">Name: <font color="grey"><%=rd.get("name") %></font></label><br>
                                    <label for="gender" class="control-label">Gender: <font color="grey"><%=rd.get("gen") %></font></label><br>
                                    <label for="name" class="control-label">Email: <font color="grey"><%=rd.get("email")%></font></label><br>
                                    <label for="dob" class="control-label">Date of Birth: <font color="grey"><%=rd.get("dob") %></font></label><br>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-group">
                                    <button onclick="history.back()" class="btn btn-info" name='view' value="" >Back</button>
                                </div>						
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                <!--Right -->
                <div class="col-lg-6 col-lg-offset-1">
                    <div class="panel panel-primary">
                        <div class="panel panel-primary">
                            <div class="panel-heading text-center">
                                    <h3><b>Conversation</b></h3>
                            </div>
                            <div class="panel-body" name="tarea" rows="6" cols="40" class="form-control">
                                <font size="2">
                                <style>
                                    h1{
                                        color:greenyellow;
                                    }
                                    div.scroll{
                                        margin: 4px;
                                        padding: 4px;
                                        background-color: #ffffff;
                                        width: 100%;
                                        height: 205px;
                                        overflow-x: hidden;
                                        overflow-y: scroll;
                                            /*-visible-auto-initial-inherit;*/
                                        text-align: justify;
                                    }
                                </style>
                                <div class="scroll">
                                    <%
                                        DbConnect db=(DbConnect)application.getAttribute("db");
                                        if(db==null){
                                            db=new DbConnect();
                                            application.setAttribute("db",db);
                                        }
                                        PreparedStatement rMsg=db.getrMsg();
                                        rMsg.setString(1, (String)rd.get("email"));
                                        rMsg.setString(2, (String)ud.get("email"));
                                        rMsg.setString(3, (String)ud.get("email"));
                                        rMsg.setString(4, (String)rd.get("email"));
                                        ResultSet SR=rMsg.executeQuery();
                                        while(SR.next()){
                                            if(SR.getString(2).equals(String.valueOf(rd.get("email")))){
                                    %>
                                            <div class="row">    
                                                <p class="text-left bg-success col-lg-6 col-lg-offset-6">
                                                    <b>Me</b><br>
                                                    <%=SR.getString(4)%>
                                                </p><br>
                                            </div>
                                    <%
                                            }
                                            //if(SR.getString(2).equals(String.valueOf(ud.get("email"))))
                                            else{
                                    %>
                                            <div class="row">    
                                                <p class="text-left bg-info col-lg-6">
                                                    <b><%=rd.get("name")%></b><br>
                                                    <%=SR.getString(4)%>
                                                </p><br>
                                            </div>
                                    <%
                                            }
                                        }
                                    %>
                                </div>
                                </font>
                            </div>
                        </div>
                        <div class="panel-body text-center">
                            <form action="SendMessageAttachments" method="post" enctype="multipart/form-data" class="form-horizontal">
                                <div class="form-group">
                                    <div class="col-lg-12">
                                        <textarea id="message" name="tarea" placeholder="type your message..." class="form-control" rows="2" cols="50"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-lg-6">
                                        <input type="file" class="form-control" name="attachment" size="4096"/>
                                    </div>
                                    <div class="col-lg-1">
                                        <button type="submit" name="email" value=rd.get("email") class="btn btn-primary">Send</button>
                                    </div>
                                </div><!--end form group-->
                            </form>
                        </div>
                    </div>
                </div>
            </div>
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
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>

<%
        }else{
            session.setAttribute("msg","Plz Login First!");
                response.sendRedirect("index.jsp");
        }
    }catch(Exception e){
        session.setAttribute("msg",e);
        response.sendRedirect("error.jsp");
    }
%>