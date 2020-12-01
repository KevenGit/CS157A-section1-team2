package com.cs157a.evendor.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import com.cs157a.evendor.dao.SuiteDao;
import com.cs157a.evendor.util.Utils;

@WebServlet("/upload")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UploadServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String h = "";
		String p = "";
		String i = "";
		int postId = 0;
		int index = 0;
		
		if (ServletFileUpload.isMultipartContent(request)) {
			
		}
		
	    try {
	        List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
	        for (FileItem item : items) {
	            if (item.isFormField()) {
	                
	                if (item.getFieldName().equals("heading")) {
	                	h = item.getString();
	                }
	                else if (item.getFieldName().equals("desc")) {
	                	p = item.getString();
	                }
	                else if (item.getFieldName().equals("post-id")) {
	                	postId = Integer.parseInt(item.getString());
	                }
	                else if (item.getFieldName().equals("index")) {
	                	index = Integer.parseInt(item.getString());
	                }
	                
	            } else {
	                
	                if (item.getFieldName().equals("file"))
	                	i = FilenameUtils.getName(item.getName());
	               
	                item.write(new File(Utils.getUploadDir() + File.separator + i));
	            }
	        }
	        
	        SuiteDao.createSuite(h, p, i, postId, index);
	        	
			response.sendRedirect("page?action=edit-suite&post-id=" + postId);
	        
	    } catch (Exception e) {
	        throw new ServletException("File Upload Failed", e);
	    }
	}
}
