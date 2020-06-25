<%@page import="com.factoryProvider.Helper"%>
<%@page import="com.bean.entities.Category"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.bean.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.factoryProvider.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>MyCart_HomePage</title>
    <%@include file="components/CommonCssJs.jsp"%>
</head>
<body style="background:#ff0066;">

<%@include file="components/navbar.jsp"%>

<div class="container-fluid">
    
       <div class="row mt-3 mx-2">
       
       <%
       
       String cat = request.getParameter("category");
       
       ProductDao pd = new ProductDao(FactoryProvider.getFactory());
       List<Product> list = null;
       
       if(cat==null||cat.trim().equals("all"))
       {
          list = pd.getAllProducts();
       }
       else
       {
    	   int cid = Integer.parseInt(cat.trim());
    	   list = pd.getAllProductsById(cid);
       }
       
       CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
       List<Category> clist = cdao.getCategories();
       %>
       
       <!--show categories  -->
          <div class="col-md-2">
          
          
          <div class="list-group mt-4">
          
           <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
             All Products
           </a>
          
          
            
          <%
          for(Category c : clist)
          {
          %>
          
          <a href="index.jsp?category=<%=c.getCategoryId() %>" class="list-group-item list-group-item-action "><%=c.getCategoryTitle() %></a>
        
          <% 
          }
          
          %>
          
          </div>
          </div>
          
          <!--show products  -->
          
          <div class="col-md-10 ">
            
            <div class="row mt-4">
            
              <div class="col-md-12">
                
                 <div class="card-columns">
                 
                 <!-- traversing product -->
                
                   <%
                   
                   for(Product p : list)
                   {
                   
                   %>
                  
                  <!-- product card -->
                
                   <div class="card product-card">
                     
                     <div class="container text-center mt-2">
                     <img class="card-img-top" src="images/product/<%=p.getpPhoto() %>" style="max-height: 150px; max-width: 100%; width: auto;" alt="Card image cap">
                     </div>
                     
                     <div class="card-body ">
                       <h5 class="card-title"><%=p.getpName() %></h5>
                         <p class="card-text"><%=Helper.get10Words(p.getpDesc())%></p>
                       
                     </div>
                     
                     <div class="card-footer text-center">
                     
                      <button style="background-color:#00b8e6" class="btn text-white" onclick="add_to_cart(<%= p.getpId()%>,'<%= p.getpName()%>',<%= p.getPriceAfterDisc()%>)">Add to cart</button>
                      <button class="btn btn-success ">&#8377; <%=p.getPriceAfterDisc() %>/-<span class="discount-label"> &#8377;<%=p.getpPrice()%>% off</span></button>
                     
                     
                     </div>
                     
                   </div>
                       
                  
                  <%
                  
                   }
                   if(list.size()==0)
                   {
                	   out.println("<h3>No items in this category</h3>");
                   }
                  
                  %>
                 </div>
              
              </div>
            
            
            </div>
          
          
          </div>
       
       </div>
       </div>
       
       <%@ include file="components/common_modal.jsp" %>
</body>
</html>
