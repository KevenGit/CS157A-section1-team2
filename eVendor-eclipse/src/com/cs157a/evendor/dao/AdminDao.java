package com.cs157a.evendor.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.cs157a.evendor.util.DbUtils;

public class AdminDao {

	public static void deletePosting(int postId) {
		String sqls[] = new String[10];
		sqls[0] = "DELETE FROM postings WHERE id = ?";
		sqls[1] = "DELETE FROM post WHERE post_id = ?";
		sqls[2] = "DELETE FROM favorites WHERE post_id = ?";
		sqls[3] = "DELETE FROM flag WHERE post_id = ?";
		sqls[4] = "DELETE FROM suite WHERE id IN (SELECT suite_id FROM contain WHERE post_id = ?)";
		sqls[5] = "DELETE FROM contain WHERE post_id = ?";
		
		sqls[6] = "DELETE FROM orders WHERE id IN (SELECT order_id FROM isfrom WHERE post_id = ?)";
		sqls[7] = "DELETE FROM buys WHERE order_id IN (SELECT order_id FROM isfrom WHERE post_id = ?)";
		sqls[8] = "DELETE FROM fulfills WHERE order_id IN (SELECT order_id FROM isfrom WHERE post_id = ?)";
		sqls[9] = "DELETE FROM isfrom WHERE post_id = ?";
		
		
		List<Object> params = Arrays.asList(postId);
		
		try {
			for (String s : sqls) {
				DbUtils.update(s, params);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void deleteUser(int userId) {
		String sqls[] = new String[6];
		sqls[0] = "DELETE FROM user WHERE id = ?";
		sqls[1] = "DELETE FROM favorites WHERE user_id = ?";
		
		sqls[2] = "DELETE FROM orders WHERE id IN (SELECT order_id FROM buys WHERE user_id = ?)";
		sqls[3] = "DELETE FROM isfrom WHERE order_id IN (SELECT order_id FROM buys WHERE user_id = ?)";
		sqls[4] = "DELETE FROM fulfills WHERE order_id IN (SELECT order_id FROM buys WHERE user_id = ?)";
		sqls[5] = "DELETE FROM buys WHERE user_id = ?";
		
		
		List<Object> params = Arrays.asList(userId);
		
		try {
			for (String s : sqls) {
				DbUtils.update(s, params);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void deleteSeller(int sellerId) {
		String sql1 = "DELETE FROM seller WHERE id = ?";
		String sql2 = "SELECT post_id FROM post WHERE seller_id = ?";
		
		
		List<Object> params = Arrays.asList(sellerId);
		
		try {
			DbUtils.update(sql1, params);
			deleteUser(sellerId);
			
			List<Map<String, Object>> rs = DbUtils.query(sql2, params);
			ArrayList<Integer> postIds = new ArrayList<>();
			for (Map<String, Object> t : rs) {
				postIds.add((Integer) t.get("post_id"));
			}
			
			for (int i : postIds) {
				deletePosting(i);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
