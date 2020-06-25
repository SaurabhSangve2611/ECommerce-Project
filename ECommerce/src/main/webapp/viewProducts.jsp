<%@page import="com.bean.entities.User"%>
<% 
   User user = (User)session.getAttribute("current-user");
   
   if(user==null)
   {
	   session.setAttribute("message", "You are not logged in..! Login First");
	   response.sendRedirect("Login.jsp");
	   return;
   }
   else
   {
	   if(user.getUserType().equals("normal"))
	   {
		   session.setAttribute("message","You are not Admin..! Do not Access this page..!");
		   response.sendRedirect("Login.jsp");
		   return;

	   }
   }

%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="components/CommonCssJs.jsp"%>
<title>Admin Panel-Products Page</title>
</head>
<body style="background:#e6005c;">
     <%@include file="components/navbar.jsp"%>
     
     
     
     
     
     
     
     
      <%@include file="components/common_modal.jsp" %>
</body>
</html>