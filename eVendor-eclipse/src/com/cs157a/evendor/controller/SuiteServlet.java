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
	
	private static final String viewURI = "viewPosting.jsp";
	private static final String editURI = "editPosting.jsp";
       
    public SuiteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null) action = "";
		
		switch (action) {
		case "create-suite":
			createSuite(request, response);
			break;
		case "delete-suite":
			deleteSuite(request, response);
			break;
		case "edit-suite":
			display(request, response, editURI);
			break;
		default:
			display(request, response, viewURI);
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void display(HttpServletRequest request, HttpServletResponse response, String URI) throws ServletException, IOException {
		int postingId = Integer.parseInt(request.getParameter("post-id").trim().toLowerCase());
		List<Suite> suites = SuiteDao.selectPostingsSuites(postingId);
		Posting posting = PostingDao.selectById(postingId);
		Seller seller = SellerDao.getSellerByPosting(postingId);
		
		request.setAttribute("suites", suites);
		request.setAttribute("posting", posting);
		request.setAttribute("seller", seller);
		
		RequestDispatcher dispatch = request.getRequestDispatcher(URI);
		dispatch.forward(request, response);
	}
	
	private void createSuite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String h = request.getParameter("heading");
		String p = request.getParameter("paragraph");
		String i = request.getParameter("imgPath");
		int postId = Integer.parseInt(request.getParameter("post-id"));
		int index = Integer.parseInt(request.getParameter("index"));
		
		SuiteDao.createSuite(h, p, i, postId, index);
		
		RequestDispatcher dispatch = request.getRequestDispatcher("/page?submit=edit&post-id=" + postId);
		dispatch.forward(request, response);
	}
	
	private void deleteSuite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int suiteId = Integer.parseInt(request.getParameter("suite-id"));
		SuiteDao.deleteSuite(suiteId);
		
		int postId = Integer.parseInt(request.getParameter("post-id"));
		RequestDispatcher dispatch = request.getRequestDispatcher("/page?submit=edit&post-id=" + postId);
		dispatch.forward(request, response);
	}
}