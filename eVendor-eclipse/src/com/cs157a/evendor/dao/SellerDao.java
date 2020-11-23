package com.cs157a.evendor.dao;

import java.sql.SQLException;
import java.util.*;

import com.cs157a.evendor.model.*;
import com.cs157a.evendor.util.DbUtils;

public class SellerDao {
	
	private static final String GET_SELLER_BY_POSTING_SQL =
			"SELECT id, phone " +
			"FROM post JOIN seller ON post.seller_id = seller.id " +
			"WHERE post_id = ?";
	
	public static Seller getSellerByPosting(int postingId) {
		Seller seller = null;
		
		try {
			List<Object> params = Arrays.asList(postingId);
			Map<String, Object> tuple = DbUtils.query(GET_SELLER_BY_POSTING_SQL, params).get(0);
			
			seller = new Seller(UserDao.getUser((Integer) tuple.get("id")), (String) tuple.get("phone"));
			
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return seller;
	}

}
