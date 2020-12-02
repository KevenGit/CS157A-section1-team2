package com.cs157a.evendor.dao;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import com.cs157a.evendor.model.*;
import com.cs157a.evendor.util.DbUtils;

public class OrderDao {
	
	public static boolean insertOrder(String addr, int quantity, double price, int postId, int sellerId, int userId) {
		User user = UserDao.getUser(userId);
		double leftover = user.getBalance() - (quantity * price);
		if (leftover < 0) return false;
		
		String sql1 = "INSERT INTO orders " + 
					"(delivery_address, date, quantity) VALUES (?, current_timestamp(), ?)";
		String sql2 = "INSERT INTO buys (user_id, order_id) VALUES (?, ?)";
		String sql3 = "INSERT INTO fulfills (seller_id, order_id) VALUES (?, ?)";
		String sql4 = "INSERT INTO isFrom (post_id, order_id) VALUES (?, ?)";
		String sql5 = "SELECT MAX(id) FROM" + 
					"(SELECT id FROM orders " +
					"WHERE delivery_address = ? AND quantity = ?)R";
		String sql6 = "UPDATE user SET balance = ? WHERE id = ?";
		
		List<Object> params = Arrays.asList(addr, quantity);
		
		try {
			DbUtils.update(sql1, params);
			
			int orderId = (Integer) DbUtils.query(sql5, params).get(0).get("id");
			
			params = Arrays.asList(userId, orderId);
			DbUtils.update(sql2, params);
			
			params = Arrays.asList(sellerId, orderId);
			DbUtils.update(sql3, params);
			
			params = Arrays.asList(postId, orderId);
			DbUtils.update(sql4, params);
			
			params = Arrays.asList(leftover, userId);
			DbUtils.update(sql6, params);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
}
