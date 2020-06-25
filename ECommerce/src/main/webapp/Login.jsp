<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User login - MyCart</title>
<%@include file="components/CommonCssJs.jsp"%>
</head>
<body style="background:;">
<%@include file="components/navbar.jsp"%>
    <div class="container-fluid login">
        <div class="row mt-4">
               <div class="col-md-4 offset-md-4 ">
               
               <div class="card text-white">
                 
                   <div class="container text-center mt-2">
                <img src="images/user.png" style="max-width:100px" class="img-fluid" alt="Login.png">
               </div>
                     <div class="container text-center">
                   <h2>Login here</h2>
                   </div>
                
                       
                        <div class="card-body">
                        
                       <%@include file="components/message.jsp"%>
                       
<form action="LoginServlet" method="post">
         <div class="form-group col-sm-12">
            <label for="exampleInputEmail1">Email address</label>
            <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
         </div>
            
        <div class="form-group col-sm-12">
        <label for="exampleInputPassword1">Password</label>
        <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
        </div>
   
       <a href="Register.jsp" class="text-center d-block mb-2"><p style="color:red;">if not resistered click here</p></a>
   
       <div class="container text-center">
       <button type="submit" class="btn btn-primary custom-bg">Submit</button>
       </div>
</form>
                        </div>
                  
                   
                 
                    <div class="social-media">
                     <link rel="stylesheet" href="components/socialMedia.css">
                                <ul>
                                    <li>
									<img src="images/facebook.png" alt="FacebookPNG"/></li>
                                    <li>
									<img src="images/twitter.png" alt="TwitterPNG"/></li>
                                    <li>
									<img src="images/instagram.png" alt="InstagramPNG"/></li>
									<li>
									<img src="images/linkedin.png" alt="LinkedInPNG"/></li>

                                </ul>
                                </div>
                 
                  
                        
               
                 </div>
               </div>
        
        </div>
    
    </div>

</body>
</html>