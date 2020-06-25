package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.entities.User;
import com.factoryProvider.FactoryProvider;


public class RegisterServlet extends HttpServlet {
   
    public RegisterServlet() 
    {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out= response.getWriter();
		try
		{
			String userName= request.getParameter("user_name");
			String userEmail= request.getParameter("user_email");
			String userPassword= request.getParameter("user_password");
			String userPhone= request.getParameter("user_phone");
			String userAddress= request.getParameter("user_address");
			
			
			HttpSession httpSession = request.getSession();
			
			//validation
			
			if(userName.isEmpty())
			{
				
				httpSession.setAttribute("message", " Please insert User Name..!");
			    
			    response.sendRedirect("Register.jsp");
			    return;
			}
			
			if(userEmail.isEmpty())
			{
				
				httpSession.setAttribute("message", " Please insert Email Id..!");
			    
			    response.sendRedirect("Register.jsp");
			    return;
			}
			if(userPassword.isEmpty())
			{
				
				httpSession.setAttribute("message", " Please insert Password..!");
			    
			    response.sendRedirect("Register.jsp");
			    return;
			}
			if(userPhone.isEmpty())
			{
				
				httpSession.setAttribute("message", " Please insert User Phone..!");
			    
			    response.sendRedirect("Register.jsp");
			    return;
			}
			if(userAddress.isEmpty())
			{
				
				httpSession.setAttribute("message", " Please insert User Address..!");
			    
			    response.sendRedirect("Register.jsp");
			    return;
			}
			
			//creating user object to store data
			
			User user=new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress, "normal");
		
		    Session hibernateSession = FactoryProvider.getFactory().openSession();
		    
		    Transaction tx = hibernateSession.beginTransaction();
		    
		    int userId = (int) hibernateSession.save(user);
		    tx.commit();
		    hibernateSession.close();
		    
		    
		    httpSession.setAttribute("message", "Registration Successful..! User Id is :" + userId);
		    
		    response.sendRedirect("Register.jsp");
		    return;
		    
		}catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

}
