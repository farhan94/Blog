<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
		.bg-1 { 
		    background-color: #1abc9c; /* Green */
		    color: #ffffff;
		}
		.bg-2 { 
    		background-color: #474e5d; /* Dark Blue */
    		color: #ffffff;
		}
		.btn-space {
   			 margin-left: 5px;
		}

	</style>
	<style type="text/css">
		<!--
		.side { vertical-align:absbottom; display:inline }
		-->
	</style>
</head>
 <header>
 	<div class="container-fluid bg-2 text-right" style="padding-top:10px; padding-bottom:10px;">
 		<button type="button" class="btn btn-default btn-sm btn-space">About</button> 		
 		<%
	    	UserService userService = UserServiceFactory.getUserService();
	    	User user = userService.getCurrentUser();
	    	if (user != null) {
	      		pageContext.setAttribute("user", user);
		%>
			<!-- <h5 class="side" style="padding-left:10px;">Hello, ${fn:escapeXml(user.nickname)}! (You can -->
			<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>" class="btn btn-default btn-sm btn-space">Sign out</a>
			<!--  </h5> -->
		<%
    		} else {
		%>
			<a href="<%= userService.createLoginURL(request.getRequestURI()) %>" class="btn btn-default btn-sm btn-space">Sign in</a>
		<%
    		}
		%>
	</div>
   	<div class="container-fluid bg-1 text-center">
		<h1>Blog</h1>
 		<img src="/Images/IMG_0586.JPG" height="200" alt="Texas">
 		<h2 class="text-center"><small>A blogging website by Farhan Ali and Karim Sayani</small></h2>
  </div>
 </header>
  <body>



  </body>
</html>