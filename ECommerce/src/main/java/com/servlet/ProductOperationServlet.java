package com.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.bean.entities.Category;
import com.bean.entities.Product;
import com.dao.CategoryDao;
import com.dao.ProductDao;
import com.factoryProvider.FactoryProvider;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	
    public ProductOperationServlet() 
    {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out =response.getWriter();
		
		
		String op = request.getParameter("operation"); 
		
		if(op.trim().equals("addcategory"))
		{
			// add category
			
			  String title = request.getParameter("catTitle"); 
			  String desc = request.getParameter("catDesc");
			 
			  Category category= new Category();
			  category.setCategoryTitle(title);
			  category.setCategoryDescription(desc);
			  
			  //save category to database
			  
			  CategoryDao catDao = new CategoryDao(FactoryProvider.getFactory());
					  
			  int catId =  catDao.saveCategory(category);
			  
			//  out.println("Category saved..");
			  
			  HttpSession httpSession = request.getSession();
			  httpSession.setAttribute("message", "Category added Successfully..! Category id is :"+catId);
			  response.sendRedirect("admin.jsp");
			  return;
		}
		else if(op.trim().equals("addproduct"))
		{
			//add product
			String pName = request.getParameter("productName");
			String pDesc = request.getParameter("productDesc");
			int pPrice = Integer.parseInt (request.getParameter("productPrice"));
	        int pDisc = Integer.parseInt(request.getParameter("productDiscount"));
			int pQuant = Integer.parseInt(request.getParameter("productQuantity"));
			int catId = Integer.parseInt(request.getParameter("catID"));
			Part part= request.getPart("productPic");
			
	
			Product p = new Product();
			p.setpName(pName);
			p.setpDesc(pDesc);
			p.setpPrice(pPrice);
			p.setpDiscount(pDisc);
			p.setpQuantity(pQuant);
			p.setpPhoto(part.getSubmittedFileName());
			
			//get category by id;
			CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
			Category category =  cdao.getcategoryById(catId);
			
			p.setCategory(category);
			
			//save product
			
			ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
			pdao.saveProduct(p);
			
			//pic upload
			// fing out the path to uplaoad photo
			
			try
			{
			
	        String path = request.getRealPath("images")+File.separator+"product"+File.separator+part.getSubmittedFileName();
	        System.out.println(path);
			
	        // uploading code..
	        
	        FileOutputStream fos = new FileOutputStream(path);
	        
	        InputStream is = part.getInputStream();
	        
	        //reading data
	        
	        byte [] data = new byte[is.available()];
	        
			is.read(data);
			
			// writting data
			
			fos.write(data);
			fos.close();
			
			}
			catch (Exception e) 
			{
			e.printStackTrace();
			}
			
			HttpSession httpSession = request.getSession();
			  httpSession.setAttribute("message", "Product is added Successfully..! Category id is :"+catId);
			  response.sendRedirect("admin.jsp");
			  return;
		}
	}

}
