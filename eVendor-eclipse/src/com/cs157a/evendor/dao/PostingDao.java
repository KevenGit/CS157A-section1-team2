package com.cs157a.evendor.dao;

import java.util.*;

import com.cs157a.evendor.model.*;
import com.cs157a.evendor.util.DbUtils;

public class PostingDao {
	
	private static final String SELECT_CATEGORY_SQL = "SELECT * FROM postings WHERE category = ?";
	
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
}
