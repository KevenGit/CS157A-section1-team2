package com.cs157a.evendor.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cs157a.evendor.dao.*;
import com.cs157a.evendor.model.*;

@WebServlet("/page")
public class SuiteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SuiteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("submit");
		if (action == null) action = "";
		
		switch (action) {
		case "create":
			this.createSuite(request, response);
			break;
		case "delete":
			this.deleteSuite(request, response);
			break;
		default:
			display(request, response);
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void display(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postingId = Integer.parseInt(request.getParameter("post-id").trim().toLowerCase());
		List<Suite> suites = SuiteDao.selectPostingsSuites(postingId);
		Posting posting = PostingDao.selectById(postingId);
		Seller seller = SellerDao.getSellerByPosting(postingId);
		
		request.setAttribute("suites", suites);
		request.setAttribute("posting", posting);
		request.setAttribute("seller", seller);
		
		RequestDispatcher dispatch = request.getRequestDispatcher("viewPosting.jsp");
		dispatch.forward(request, response);
	}
	
	private void createSuite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String h = request.getParameter("heading");
		String p = request.getParameter("paragraph");
		String i = request.getParameter("imgPath");
		int postId = Integer.parseInt(request.getParameter("post-id"));
		int index = Integer.parseInt(request.getParameter("index"));
		
		SuiteDao.createSuite(h, p, i, postId, index);
		
		RequestDispatcher dispatch = request.getRequestDispatcher("viewPosting.jsp");
		dispatch.forward(request, response);
	}
	
	private void deleteSuite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int suiteId = Integer.parseInt(request.getParameter("post-id"));
		
		SuiteDao.deleteSuite(suiteId);
		
		RequestDispatcher dispatch = request.getRequestDispatcher("viewPosting.jsp");
		dispatch.forward(request, response);
	}
}