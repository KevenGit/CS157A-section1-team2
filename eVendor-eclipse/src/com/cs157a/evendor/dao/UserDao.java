package com.cs157a.evendor.dao;

import java.sql.SQLException;
import java.util.*;

import com.cs157a.evendor.model.User;
import com.cs157a.evendor.util.DbUtils;

public class UserDao {
	
	private static final String GET_USER_SQL =
			"SELECT id, username, first_name, last_name, email, balance " + 
			"FROM user WHERE id = ?";
	
	public static User getUser(int id) {
		User user = null;
		
		try {
			List<Object> params = Arrays.asList(id);
			Map<String, Object> tuple = DbUtils.query(GET_USER_SQL, params).get(0);
			
			user = new User((Integer) tuple.get("id"),
							(String) tuple.get("username"),
							null, null,
							(String) tuple.get("first_name"),
							(String) tuple.get("last_name"),
							(String) tuple.get("email"),
							(Double) tuple.get("balance"));
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
}