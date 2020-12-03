package com.cs157a.evendor.dao;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.cs157a.evendor.model.User;
import com.cs157a.evendor.util.DbUtils;
import com.cs157a.evendor.model.Favorite;

public class FavDao {
	
	private static final String GET_FAV_SQL =
			"SELECT user_id, post_id " + 
			"FROM user WHERE user_id = ?";
	
	public static Favorite getFav(int user_id) {
		
		Favorite fav = null;
		
		try {
			List<Object> params = Arrays.asList(user_id);
			Map<String, Object> tuple = DbUtils.query(GET_FAV_SQL, params).get(0);
			
			fav = new Favorite((Integer) tuple.get("user_id"),
								(Integer) tuple.get("post_id"));
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return fav;
	}
}