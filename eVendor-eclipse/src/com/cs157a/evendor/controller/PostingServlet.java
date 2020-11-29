package com.cs157a.evendor.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cs157a.evendor.dao.PostingDao;
import com.cs157a.evendor.model.Posting;

@WebServlet("/postings")
public class PostingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PostingServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getContextPath();
		
		switch (action) {
		case "/postings/categories":
			displayCategoryList(request, response);
			break;
		case "/postings/search":
			displaySearchResults(request, response);
			break;
		default:
			response.getWriter().append("Error");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void displayCategoryList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("name").toLowerCase();
		List<Posting> result = PostingDao.selectByCategory(category);
		request.setAttribute("result", result);
		request.setAttribute("category", category);
		
		RequestDispatcher dispatch = request.getRequestDispatcher("category-list.jsp");
		dispatch.forward(request, response);
	}
	
	private void displaySearchResults(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");
		String category = request.getParameter("category");
		String region = request.getParameter("region");
		String price = request.getParameter("price");
		
		if (search == null) search = "";
		if (category.equals("None")) category = "%";
		if (region.equals("None")) region = "%";
		if (price.equals("Any")) price = "0.00-10000.00";
		
		String keywords[] = search.split("\\s+");
		String range[] = price.split("-");
		
		List<Posting> result = PostingDao.searchPostings(keywords, category, region, range);
		request.setAttribute("result", result);
		
		RequestDispatcher dispatch = request.getRequestDispatcher("search-form.jsp");
		dispatch.forward(request, response);
	}
}
