<%
  User user = (User)session.getAttribute("current-user");

if(user==null)
{
	   session.setAttribute("message", "You are not logged in..! Login First to access checkout page");
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
<title>Checkout</title>
 <%@include file="components/CommonCssJs.jsp"%>
</head>
<body style="background:;">
<%@include file="components/navbar.jsp"%>

<div class="container">
  <div class="row mt-5">
  
               <div class="col-md-6">
               <!-- Card  -->
                 
                 <div class="card">
                   <div class="card-body bg-warning">
                   <h3 class="text-center ">Your selected items</h3>
                     <div class="cart-body">
                  
                     </div>
                   </div>
                 </div>
                
               </div>
            
            
               <div class="col-md-6">
               <!-- Form Details -->
  
                  <div class="card ">
                   <div class="card-body bg-info">
                   <h3 class="text-center text-light ">Your details for order</h3>
                     
                     <form action="index.jsp">
                       <div class="form-group text-light">
   						    <label for="email">Email address</label>
 						    <input value="<%= user.getUserEmail()%>" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
    						<small id="emailHelp" class="form-text text-dark">We'll never share your email with anyone else.</small>
  					   </div>
  					   
  					   <div class="form-group text-light">
   						    <label for="name">Your name</label>
 						    <input value="<%= user.getUserName()%>" type="text" class="form-control" id="name" aria-describedby="namelHelp" placeholder="Enter name">
  					   </div>
  					   
  					   <div class="form-group text-light">
   						    <label for="mobileNo">Your Mobile No</label>
 						    <input value="<%= user.getUserPhone()%>" type="text" class="form-control" id="mobileNo" aria-describedby="namelHelp" placeholder="Enter Mobile No">
  					   </div>
  					   
  					   <div class="form-group text-light">
    						<label for="exampleFormControlTextarea1">Your shipping address</label>
  							<textarea value="<%= user.getUserAddress()%>" class="form-control" placeholder="Enter your address" id="exampleFormControlTextarea1" rows="3"></textarea>
 					   </div>
 					   
 					   <div class="modal-footer">
 					   
 					   <button class="btn bg-warning ">Continue Shopping</button>
 					   <a href="transaction.jsp" class="btn btn-danger text-warning" role="button" aria-pressed="true">Order Now</a>
                       
 					   </div>
 					   
                     </form>
                   </div>
                 </div>
               </div>
  
  </div>

</div>


 <%@ include file="components/common_modal.jsp" %>
</body>
</html>