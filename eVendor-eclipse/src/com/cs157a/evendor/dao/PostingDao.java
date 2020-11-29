package com.cs157a.evendor.dao;

import java.util.*;

import com.cs157a.evendor.model.*;
import com.cs157a.evendor.util.DbUtils;

public class PostingDao {
	
	private static final String SELECT_ID_SQL = "SELECT * FROM postings WHERE id = ?";
	private static final String SELECT_CATEGORY_SQL = "SELECT * FROM postings WHERE category = ?";
	private static final String SEARCH_SQL = "SELECT * FROM " +
											"(SELECT * FROM postings " + 
											"WHERE category LIKE ? AND region LIKE ? AND price >= ? AND price <= ?)";
	
	public static Posting selectById(int id) {
		Posting result = null;
		
		try {
			
			List<Object> params = Arrays.asList(id);
			Map<String, Object> tuple = DbUtils.query(SELECT_ID_SQL, params).get(0);
			
			result = new Posting((Integer) tuple.get("id"),
								(String) tuple.get("title"),
								(String) tuple.get("category"),
								(Double) tuple.get("price"),
								(String) tuple.get("region"));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static List<Posting> selectByCategory(String category) {
		List<Posting> result = new ArrayList<>();
		
		try {
			
			List<Object> params = Arrays.asList(category);
			List<Map<String, Object>> rs = DbUtils.query(SELECT_CATEGORY_SQL, params);
			
			for (Map<String, Object> t : rs) {
				Posting p = new Posting((Integer) t.get("id"),
										(String) t.get("title"),
										(String) t.get("category"),
										(Double) t.get("price"),
										(String) t.get("region"));
				result.add(p);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static List<Posting> searchPostings(String[] search, String category, String region, String[] price) {
		List<Posting> result = new ArrayList<>();
		
		String sql = SEARCH_SQL;
		Double lowerRange = Double.parseDouble(price[0]);
		Double upperRange = Double.parseDouble(price[1]);
		
		for (int i = 0; i < search.length; i++) {
			if (i == 0)
				sql += " WHERE title LIKE" + search[i];
			else
				sql += " AND title LIKE" + search[i];
		}
		
		try {
			
			List<Object> params = Arrays.asList(category, region, lowerRange, upperRange);
			List<Map<String, Object>> rs = DbUtils.query(sql, params);
			
			for (Map<String, Object> t : rs) {
				Posting p = new Posting((Integer) t.get("id"),
										(String) t.get("title"),
										(String) t.get("category"),
										(Double) t.get("price"),
										(String) t.get("region"));
				result.add(p);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
