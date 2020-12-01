package com.cs157a.evendor.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

public class Utils {
	
	public static String getUploadDir() throws IOException {
		String upload_dir = "";
		
		try(InputStream is = DbUtils.class.getClassLoader().getResourceAsStream("/e_vendor_data_test.properties")) {
			Properties prop = new Properties();
			prop.load(is);
			upload_dir = prop.getProperty("upload_dir");
		}
		return upload_dir;
	}
	
	public static String getImageDir() throws IOException {
		String image_dir = "";
		
		try(InputStream is = DbUtils.class.getClassLoader().getResourceAsStream("/e_vendor_data_test.properties")) {
			Properties prop = new Properties();
			prop.load(is);
			image_dir = prop.getProperty("image_dir");
		}
		return image_dir + "/";
	}
	
	public static StringBuffer printHtmlTable(Connection conn, String table) {
		StringBuffer result = new StringBuffer();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM " + table;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();
            result.append("<h3>Table: " + table + "</h3>");
            result.append("<table border=1><tr>");
            // Print the column header: column count starts from 1
            for (int j = 1; j <= columnCount; j++ ) {
              String colName = rsmd.getColumnName(j);
              result.append("<td><b>" + colName + "</b></td>");
            }
            // Print row content:
            while (rs.next()) {
            	result.append("</tr><tr>");
                for (int j = 1; j <= columnCount; j++ ) {
                	result.append("<td>" + rs.getString(j) + "</td>");
                }
            }
            result.append("</tr></table><br>");
            DbUtils.close(rs);
            DbUtils.close(stmt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
