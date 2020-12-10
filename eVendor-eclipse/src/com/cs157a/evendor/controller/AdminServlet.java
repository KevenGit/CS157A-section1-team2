package com.cs157a.evendor.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cs157a.evendor.dao.AdminDao;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

		switch (action) {
		case "admin-delete-posting":
			this.deletePosting(request, response);
			break;
		case "admin-delete-user":
			this.deleteUser(request, response);
			break;
		case "admin-delete-seller":
			this.deleteSeller(request, response);
			break;
		default:
			response.getWriter().append("Error");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	private void deletePosting(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postId = Integer.parseInt(request.getParameter("post-id"));
		AdminDao.deletePosting(postId);
		
		response.sendRedirect("adminIndex.jsp");
	}

	private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("user-id"));
		AdminDao.deleteUser(userId);
		
		response.sendRedirect("adminIndex.jsp");
	}

	private void deleteSeller(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sellerId = Integer.parseInt(request.getParameter("seller-id"));
		AdminDao.deleteSeller(sellerId);
		
		response.sendRedirect("adminIndex.jsp");
	}
}
