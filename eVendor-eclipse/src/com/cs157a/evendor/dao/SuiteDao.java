package com.cs157a.evendor.dao;

import java.sql.SQLException;
import java.util.*;

import com.cs157a.evendor.model.*;
import com.cs157a.evendor.util.DbUtils;


public class SuiteDao {
	
	private static final String SELECT_SUITES_SQL =
			"SELECT id, heading, paragraph, img_path, index_position " +
			"FROM contains JOIN suite ON contains.suite_id = suite.id " +
			"WHERE post_id = ? " +
			"ORDER BY index_position";
	
	public static List<Suite> selectPostingsSuites(int postingId) {
		List<Suite> results = new ArrayList<>();
		
		try {
			List<Object> params = Arrays.asList(postingId);
			
			for (Map<String, Object> t : DbUtils.query(SELECT_SUITES_SQL, params)) {
				Suite s = new Suite((Integer) t.get("id"),
									(String) t.get("heading"),
									(String) t.get("paragraph"),
									(String) t.get("img_path"));
				results.add(s);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return results;
	}
	
}
