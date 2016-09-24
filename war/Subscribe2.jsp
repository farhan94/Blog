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
	<link type="text/css" rel="stylesheet" href="/stylesheets/style1.css" />	

</head>
<header>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/Blog.jsp">The Blog</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
    <ul class="nav navbar-nav navbar-right">
        <li><a  href="/PostHistory.jsp"><span class="glyphicon glyphicon-list"></span> All Posts</a></li>

		<%
	    	UserService userService = UserServiceFactory.getUserService();
	    	User user = userService.getCurrentUser();
	    	if (user != null) {
	      		pageContext.setAttribute("user", user);
		%>
		<li><a href="/CreateBlog.jsp"><span class="glyphicon glyphicon-pencil"></span> New Blog</a></li>
      <li><a href="<%= userService.createLogoutURL(request.getRequestURI()) %>"><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
    </ul>
    </div>
  </div>
</nav>
</header>
<body>
<div class="container">
<br>
 <h2>Subscribe or Unsubscribe</h2>
 <br>
 <form action="/subscribe" method="post">
 	<div class="form-group">
    <label class="control-label col-sm-4" for="Email Address">Subscribe Email Address:</label>
    <textarea name="Email Address" rows="1" cols="120"  required></textarea>
</div>
   <button type="submit" name="Subscribe" class="btn btn-default"> Subscribe</button>
 </form>
   </form>
   <br>
   <br>
 <form action="/unsubscribe" method="post">
 	<div class="form-group">
    <label class="control-label col-sm-4" for="Email Address">Unsubscribe Email Address:</label>
    <textarea name="Email Address" rows="1" cols="120"  required></textarea>
</div>
   <button type="submit" name="Subscribe" class="btn btn-default"> Unsubscribe</button>
   </form>
   </div>
</body>
 <%
    		} else {
		%>
		<li><a href="<%= userService.createLoginURL(request.getRequestURI()) %>"><span class="glyphicon glyphicon-log-in"></span> Log In</a></li>
		</ul>
    </div>
  </div>
</nav>
</header>
<body>
<div class="container">
<br>
 <h2>Subscribe or Unsubscribe</h2>
 <br>
 <form action="/subscribe" method="post">
 	<div class="form-group">
    <label class="control-label col-sm-4" for="Email Address">Subscribe Email Address:</label>
    <textarea name="Email Address" rows="1" cols="120"  required></textarea>
</div>
   <button type="submit" name="Subscribe" class="btn btn-default"> Subscribe</button>
   </form>
   <br>
   <br>
 <form action="/unsubscribe" method="post">
 	<div class="form-group">
    <label class="control-label col-sm-4" for="Email Address">Unsubscribe Email Address:</label>
    <textarea name="Email Address" rows="1" cols="120"  required></textarea>
</div>
   <button type="submit" name="Subscribe" class="btn btn-default"> Unsubscribe</button>
   </form>
</div>
</body>
 
      <%
    		}
		%>

</html>