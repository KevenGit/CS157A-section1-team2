package com.cs157a.evendor.dao;

import java.sql.SQLException;
import java.util.*;

import com.cs157a.evendor.model.*;
import com.cs157a.evendor.util.DbUtils;


public class SuiteDao {
	
	private static final String SELECT_SUITES_SQL =
			"SELECT id, heading, paragraph, img_path, index_position " +
			"FROM contain JOIN suite ON contain.suite_id = suite.id " +
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
									(String) t.get("img_path"),
									(Integer) t.get("index_position"));
				results.add(s);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return results;
	}
	
	public static void createSuite(String heading, String paragraph, String imgPath, int postId, int index) {
		String sql1 = "INSERT INTO suite (heading, paragraph, img_path) VALUES (?, ?, ?)";
		String sql2 = "INSERT INTO contain (post_id, suite_id, index_position) VALUES (?, ?, ?)";
		String sql3 = "SELECT id FROM suite WHERE heading = ? AND paragraph = ? AND img_path = ?";
		
		List<Object> params1 = Arrays.asList(heading, paragraph, imgPath);
		List<Object> params2;
		
		try {
			DbUtils.update(sql1, params1);
			int suiteId = (Integer) DbUtils.query(sql3, params1).get(0).get("id");
			
			params2 = Arrays.asList(postId, suiteId, index);
			DbUtils.update(sql2, params2);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void deleteSuite(int id) {
		String sql1 = "DELETE FROM suite WHERE id = ?";
		String sql2 = "DELETE FROM contain WHERE suite_id = ?";
		
		List<Object> params = Arrays.asList(id);
		
		try {
			DbUtils.update(sql1, params);
			DbUtils.update(sql2, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
