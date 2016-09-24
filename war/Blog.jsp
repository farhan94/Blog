<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.googlecode.objectify.*" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="blog.Blog" %>
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
        <li><a  href="/PostHistory.jsp"><span class="glyphicon glyphicon-list"></span> All Posts</a>
    <li><a  href="/Subscribe2.jsp"><span class="glyphicon glyphicon-envelope"></span> Subscribe</a>
		<%
	    	UserService userService = UserServiceFactory.getUserService();
	    	User user = userService.getCurrentUser();
	    	if (user != null) {
	      		pageContext.setAttribute("user", user);
		%>
		  <li><a href="/CreateBlog.jsp"><span class="glyphicon glyphicon-pencil"></span> New Blog</a>
      <li><a href="<%= userService.createLogoutURL(request.getRequestURI()) %>"><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
      <%
    		} else {
		%>
      <li><a href="<%= userService.createLoginURL(request.getRequestURI()) %>"><span class="glyphicon glyphicon-log-in"></span> Log In</a></li>
      <%
    		}
		%>
    </ul>
    </div>
  </div>
</nav>


	<div class="container-fluid bg-1a text-center">
 		 <div class="row">
    <div class="col-sm-4">
      <img src="Images/pen-blog.jpg" class="img-circle" height="200" width= "200" alt="Image1">
    </div>
    <div class="col-sm-4 centerBlock" >
			<h1><strong>The Blog</strong></h1>
			<h4 class="text-center" style="color:#d9d9d9">A blogging website by Farhan Ali and Karim Sayani</h4>
    </div>
    <div class="col-sm-4"> 
      <img src="Images/letter-blog.jpg" class="img-circle" height="200" width="200" alt="Image3">
    </div>
  </div>
  </div> 
</header>
  <body>
  <br>
  <div class="col-sm-2">
   </div>
   <div class="container-fluid col-sm-8 bg-3">
	<%
	ObjectifyService.register(Blog.class);
	List<Blog> blogs = ObjectifyService.ofy().load().type(Blog.class).list();
	Collections.sort(blogs); 
    if (blogs.isEmpty()) {
        %>
        <br>
        <p class="text-center">No blogs to display! :(</p>
        <%
    } else{
    	for(int i = 0; i<4 && i < blogs.size(); i++){
    		 pageContext.setAttribute("blog_content", blogs.get(i).getContent());
    		 pageContext.setAttribute("blog_title", blogs.get(i).getTitle());
    		 pageContext.setAttribute("blog_user", blogs.get(i).getUser().getNickname());
    		 pageContext.setAttribute("blog_date", blogs.get(i).getDateAsString());
    		%>
    		<p class="text-center">
    		<h2>${fn:escapeXml(blog_title)}</h2>
    		<h4><span class="glyphicon glyphicon-time"></span> Submitted by ${fn:escapeXml(blog_user)}  <small> on ${fn:escapeXml(blog_date)}</small></h4>
    		 <hr>
    		 <blockquote>${fn:escapeXml(blog_content)}</blockquote></p>
    		 <hr>
    		
<%    	}
    	}
        %>
        </div>
        <div class="col-sm-2"> </div>
  </body>
</html>