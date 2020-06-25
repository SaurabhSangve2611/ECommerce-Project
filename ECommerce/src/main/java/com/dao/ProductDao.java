package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.bean.entities.Product;

public class ProductDao 
{
  private SessionFactory factory;
	
	public ProductDao(SessionFactory factory)
	{
		this.factory = factory;
	}
	
	
	public boolean saveProduct(Product product)
	{
		boolean f = false;
		try
		{
			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();
			
			session.save(product);
			
			tx.commit();
			session.close();
			f = true;
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			f = false;
		}
		
		
		return f;
	}

	
	public List<Product> getAllProducts()
	{
		Session session = this.factory.openSession();
		Query q = session.createQuery("from Product");  // Product is class name not a database table name
		List<Product> list = q.list();
		
		return list;
	}
	
	//get all products of given category
		public List<Product> getAllProductsById(int cid)
		{
			Session session = this.factory.openSession();
			Query q = session.createQuery("from Product as p where p.category.categoryId =:id");  // Product is class name not a database table name
			q.setParameter("id", cid);
			List<Product> list = q.list();
			
			return list;
		}
}
