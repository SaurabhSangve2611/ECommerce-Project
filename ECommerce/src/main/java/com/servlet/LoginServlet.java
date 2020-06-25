package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.entities.User;
import com.dao.UserDao;
import com.factoryProvider.FactoryProvider;

public class LoginServlet extends HttpServlet {

    public LoginServlet() 
    {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    
	    //validation
	    HttpSession httpSession= request.getSession();
	    
	    if(email.isEmpty())
		{
			
			httpSession.setAttribute("message", " Please insert Email Id..!");
		    
		    response.sendRedirect("Login.jsp");
		    return;
		}
		if(password.isEmpty())
		{
			
			httpSession.setAttribute("message", " Please insert Password..!");
		    
		    response.sendRedirect("Login.jsp");
		    return;
		}
	    
	    //authentication
	     
	    UserDao userDao = new UserDao(FactoryProvider.getFactory());
	    User user = userDao.getUserByEmailAndPassword(email, password);
	    
	    
	    
	    if(user==null)
	    {
	    	out.println("<h1>Invalid Details..!</h1>");
	    	httpSession.setAttribute("message", "Invalid Details..! try with another one..!");
	    	
	    	response.sendRedirect("Login.jsp");
	    	return;
	    }
	    else
	    {
	    	out.println("<h1>Welcome "+user.getUserName()+"</h1>");
	    }
	    
	    //login
	    httpSession.setAttribute("current-user", user);
	    
	    if(user.getUserType().equals("admin"))
	    {
	    	response.sendRedirect("admin.jsp");
	    }
	    else if(user.getUserType().equals("normal"))
	    {
	    	response.sendRedirect("normal.jsp");
	    }
	    else
	    {
	    	out.println("We have not identified user type..!");
	    }
	    
	    //if admin: redirect to admin.jsp
	    
	    
	    //if normal : normal.jsp
	}

}
