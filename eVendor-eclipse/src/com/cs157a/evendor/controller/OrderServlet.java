package com.cs157a.evendor.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cs157a.evendor.dao.*;
import com.cs157a.evendor.model.*;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public OrderServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = (String) request.getParameter("action");
		if (action == null) action = "";
		
		switch (action) {
		case "order":
			displayOrder(request, response);
			break;
		case "purchase":
			purchase(request, response);
			break;
		default:
			response.getWriter().append("Error");
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void displayOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postId = Integer.parseInt(request.getParameter("post-id"));
		
		Posting posting = PostingDao.selectById(postId);
		Seller seller = SellerDao.getSellerByPosting(postId);
		
		request.setAttribute("posting", posting);
		request.setAttribute("seller", seller);
		
		RequestDispatcher dispatch = request.getRequestDispatcher("purchase.jsp");
		dispatch.forward(request, response);
	}
	
	private void purchase(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String addr = request.getParameter("addr");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int postId = Integer.parseInt(request.getParameter("post-id"));
		int userId = Integer.parseInt(request.getParameter("user-id"));
		int sellerId = Integer.parseInt(request.getParameter("seller-id"));
		double price = Double.parseDouble(request.getParameter("price"));
		
		OrderDao.insertOrder(addr, quantity, price, postId, sellerId, userId);
		
		RequestDispatcher dispatch = request.getRequestDispatcher("purchase.jsp");
		dispatch.forward(request, response);
	}
}
