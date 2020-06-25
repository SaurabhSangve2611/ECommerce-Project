<%@page import="com.factoryProvider.Helper"%>
<%@page import="java.util.Map"%>
<%@page import="com.bean.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.factoryProvider.FactoryProvider"%>
<%@page import="com.dao.CategoryDao"%>
<%@ page import="com.bean.entities.User" %>
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

              <%
              
              CategoryDao dao = new CategoryDao(FactoryProvider.getFactory());
              List<Category> list =dao.getCategories();
              
              //gettig count
              
              Map<String,Long> m = Helper.getCounts(FactoryProvider.getFactory());
              %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="components/CommonCssJs.jsp"%>
<title>Admin Panel</title>
</head>
<body>
     <%@include file="components/navbar.jsp"%>
     <div class="container admin">
     
     <!-- msg -->
     
     <div class="container-fluid mt-3">
       <%@ include file="components/message.jsp"%>
     </div>
     
     
     
     
     
     
     
         <div class="row mt-3">
         
             <div class="col-md-4">
                <div class="card  text-white bg-success mb-3" data-toggle="tooltip" data-placement="left" title="No of Users" style="max-width: 19rem;">
                    <div class="card-body text-center">
                        
                       <div class="container">
                          <img style="max-width:100px;" class="img-fluid" src="images/seo-and-web.png" alt="Users.png">
                       </div>
                         <h1 class="mt-2"><%=m.get("userCount") %></h1>
                         <h1  style="color:orange;"class="text-uppercase">Users</h1>
                    
                    </div>
                </div>
             </div>
             
             
             <div class="col-md-4">
                 <div class="card text-white bg-warning mb-3 "data-toggle="tooltip" data-placement="bottom" title="No of Categories" style="max-width: 19rem;">
                    <div class="card-body text-center">
                        <div class="container">
                          <img style="max-width:100px;" class="img-fluid" src="images/list.png" alt="Users.png">
                       </div>
                         <h1 class="mt-2"><%= list.size() %></h1>
                         <h1 style="color:black;"class="text-uppercase">Categories</h1>
                    
                    </div>
                </div>
             
             </div>
             
             <div class="col-md-4">
                 <div class="card text-white bg-info mb-3" data-toggle="tooltip" data-placement="right" title="No of Products" style="max-width: 19rem;">
                    <div class="card-body text-center">
                        <div class="container">
                          <img style="max-width:100px;" class="img-fluid" src="images/hands-and-gestures.png" alt="Users.png">
                       </div>
                         <h1 class="mt-2"><%=m.get("productCount") %></h1>
                         <h1 style="color:yellow;"class="text-uppercase">Products</h1>
                    </div>
                </div>
             </div>
         </div>
         
         
         
         
                <div class="row mt-2">
                      
                     <div class="col-md-4">
                          <div class="card  text-white bg-primary mb-3" style="max-width: 19rem;" data-toggle="modal" data-target="#add-category-modal">
                              <div class="card-body text-center">
                                  <div class="container">
                                      <img style="max-width:100px;" class="img-fluid" src="images/delivery.png" alt="Users.png">
                                  </div>
                                  <p class="mt-2">Click Here to Add new Category</p>
                                  <h1 style="color:black;"class="text-uppercase">Add Category</h1>
                               </div>
                            </div>
                      </div>
                     
         
         
                     <div class="col-md-4">
                          <div class="card bg-danger mb-3" style="max-width: 19rem;">
                              <div class="card-body text-center ">
                                  
                                  <div class="container">
                                         <img style="max-width:100px;" class="img-fluid" src="images/social.png" alt="Users.png">
                                    </div>
                                    <p>Current User</p>
                                    <h4 style="color:yellow">Welcome</h4>
                                 <h3 style="color:black;" class="text-uppercase"><%= user.getUserName() %></h3>
                                 
                               </div>
                            </div>
                      </div>
         
         
         
                
                     <div class="col-md-4">
                           <div class="card  text-white bg-dark mb-3 " style="max-width: 19rem;" data-toggle="modal" data-target="#add-product-modal">
                               <div class="card-body text-center ">
                                    <div class="container">
                                         <img style="max-width:100px;" class="img-fluid" src="images/product.png" alt="Users.png">
                                    </div>
                                   <p class="mt-2">Click Here to Add new Product</p>
                                   <h1 style="color:orange;"class="text-uppercase">Add Product</h1>
                                </div>
                            </div>
                        </div>
                    
                </div>
                
                <!-- view products row -->
                
                <div class="row mt-2">
                
                <div class="col-md-6">
                          <div onclick="window.location='viewProducts.jsp'" class="card  text-white bg-warning mb-3" data-toggle="tooltip" data-placement="top" title="Click here to view products"  data-toggle="modal" data-target="#add-category-modal">
                              <div class="card-body text-center">
                                  <div class="container">
                                      <img style="max-width:100px;" class="img-fluid" src="images/vision.png" alt="Users.png">
                                  </div>
                                  <p class="mt-2"style="color:blue;">Click Here to view products</p>
                                  <h1 style="color:black;"class="text-uppercase">View products</h1>
                               </div>
                            </div>
                      </div>
                      
                      <div class="col-md-6">
                          <div onclick="window.location='deleteProducts.jsp'" class="card  text-white bg-warning mb-3" data-toggle="tooltip" data-placement="top" title="Click here to delete products"  data-toggle="modal" data-target="#add-category-modal">
                              <div class="card-body text-center ">
                                  <div class="container ">
                                      <img style="max-width:100px;" class="img-fluid" src="images/trash.png" alt="Users.png">
                                  </div>
                                  <p class="mt-2"style="color:blue;">Click Here to delete products</p>
                                  <h1 style="color:black;"class="text-uppercase">Delete products</h1>
                               </div>
                            </div>
                      </div>
                </div>
                
                
                </div>
                
                
     
     
     <!-- model -->
     
    

<!-- Modal -->
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text white">
        <h5 class="modal-title" id="exampleModalLabel">Fill product details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
          
          <input type="hidden" name="operation" value="addproduct">
          
               <div class="form-group">
                  <input class="form-control" type="text" name="productName" placeholder="Enter tilte of product" required/>
              </div>
              
               <div class="form-group">
                  <textarea  style="height:100px" class="form-control" name="productDesc" placeholder="Enter product description" required></textarea>
              </div>
              
              <div class="form-group">
                  <input type="number" class="form-control" name="productPrice" placeholder="Enter product price" required/>
              </div>
             
              <div class="form-group">
                  <input type="number" class="form-control" name="productDiscount" placeholder="Enter product discount" required/>
              </div>
              
              <div class="form-group">
                  <input type="number" class="form-control" name="productQuantity" placeholder="Enter product quantity" required/>
              </div>
              
             
              <!-- product category -->
              <div class="form-group">
                  <select  name="catID" class="form-contorl" id="">
                   
                   <%
                   for(Category c :list)
                   {
                   %>
                  
                  <option value="<%= c.getCategoryId() %>"> <%=c.getCategoryTitle() %></option>
                  
                  <%} %>
                  
                  </select>
              
              
              </div>
              
              
              
              <div class="form-group">
              <label for="pPic">Select picture of product</label>
                  <input type="file" id="pPic" name="productPic" required/>
              
              
              </div>
                 <div class="container">
               
                <button class="btn btn-outline-success">Add product</button>
              </div>
              
              
          </form>
      </div>
      <div class="modal-footer">
   
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>



<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text white">
        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="ProductOperationServlet" method="post">
          
          <input type="hidden" name="operation" value="addcategory">
          
               <div class="form-group">
                  <input class="form-control" type="text" name="catTitle" placeholder="Enter category title" required/>
              </div>
              
               <div class="form-group">
                  <textarea style="height:200px" class="form-control" name="catDesc" placeholder="Enter category description" required></textarea>
              </div>
              
              <div class="container">
               
                <button class="btn btn-outline-success">Add category</button>
              </div>
              
          </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>

  <%@include file="components/common_modal.jsp" %>
  
  <script>
  $(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	})
  </script>
  
</body>
</html>