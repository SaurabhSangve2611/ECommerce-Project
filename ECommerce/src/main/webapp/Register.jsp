<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User</title>
 <%@include file="components/CommonCssJs.jsp"%>
</head>
<body style="background:;">
<%@include file="components/navbar.jsp"%>
  
  
  <div class="container-fluid register">
  
  <div class="row mt-3">
      
       <div class="col-md-6 offset-md-3">
            
            <div class="card text-white">
            
            <%@include file="components/message.jsp"%>
            
               <div class="card-body px-10">
                <div class="container text-center">
                <img src="images/Register.png" style="max-width:100px" class="img-fluid" alt="Register.png">
             
                </div>
               
               <h3 class="text-center my-3">Sign up here</h3>
          
           <form action="RegisterServlet" method="post">
           
           
           <div class="form-group row">
             <label for="name" class="col-sm-3 col-form-label col-form-label-sm">User Name</label>
               <div class="col-sm-8">
                  <input name="user_name" type="text" class="form-control form-control-sm" id="name" placeholder="Enter Name">
               </div>
           </div>
           
            
            <div class="form-group row">
             <label for="email" class="col-sm-3 col-form-label col-form-label-sm">User Email</label>
               <div class="col-sm-8">
                  <input name="user_email" type="email" class="form-control form-control-sm" id="email" placeholder="Enter Email">
               </div>
           </div>
            
            <div class="form-group row">
                <label for="password" class="col-sm-3 col-form-label col-form-label-sm">User Password</label>
                 <div class="col-sm-8">
                   <input name="user_password" type="password" class="form-control form-control-sm" id="password"  placeholder="Enter Password">
                 </div>
            </div>
            
            
            <div class="form-group row">
                <label for="phone" class="col-sm-3 col-form-label col-form-label-sm">User PhoneNo</label>
                 <div class="col-sm-8">
                   <input name="user_phone" type="number" class="form-control form-control-sm" id="phone"  placeholder="Enter Phone">
                 </div>
            </div>
            
            
            <div class="form-group row">
                <label for="phone" class="col-sm-3 col-form-label col-form-label-sm">User Address</label>
                 <div class="col-sm-8">
                   <textarea name="user_address" type="number" class="form-control form-control-sm" id="phone"  placeholder="Enter Your Address"></textarea>
                 </div>
            </div>
             
              <div="container text-center">
              <button class="btn btn-outline-success">Register</button>
              <button class="btn btn-outline-warning">Reset</button>
              </div>
              
              
      
            </form>
               
               </div>
            
            </div>
       </div>
  </div>
  
  </div>
  
  

</body>
</html>