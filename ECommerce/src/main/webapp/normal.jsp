<%@ page import="com.bean.entities.User" %>
<%
    User user = (User)session.getAttribute("current-user");

    if(user==null)
    {
	   session.setAttribute("message", "You are not logged in..! Login First");
	   response.sendRedirect("Login.jsp");
	   return;
    }
   

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User</title>
 <%@include file="components/CommonCssJs.jsp"%>
</head>
<body>
<%@include file="components/navbar.jsp"%>
   
   <div class="col-md-12">
                          <div class="card mb-10">
                              <div class="card-body text-center ">
                                  
                                  <div class="container">
                                         <img style="max-width:100px;" class="img-fluid" src="images/social.png" alt="Users.png">
                                    </div>
                                    <p>Current User</p>
                                    <h4 style="color:blue">Welcome</h4>
                                 <h3 style="color:black;" class="text-uppercase"><%= user.getUserName() %></h3>
                                 
                               </div>
                            </div>
                      </div>
   
   
   
   
    <%@ include file="components/common_modal.jsp" %>
</body>
</html>