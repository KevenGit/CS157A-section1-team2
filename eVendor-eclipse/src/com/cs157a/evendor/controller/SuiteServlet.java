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
		
		int postingId = Integer.parseInt(request.getParameter("id").trim().toLowerCase());
		List<Suite> suites = SuiteDao.selectPostingsSuites(postingId);
		Posting posting = PostingDao.selectById(postingId);
		Seller seller = SellerDao.getSellerByPosting(postingId);
		
		request.setAttribute("suites", suites);
		request.setAttribute("posting", posting);
		request.setAttribute("seller", seller);
		
		RequestDispatcher dispatch = request.getRequestDispatcher("posting-page.jsp");
		dispatch.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
