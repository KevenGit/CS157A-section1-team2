package com.cs157a.evendor.util;

import java.io.FileInputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.cs157a.evendor.model.User;

public class DbUtils {

	public static Connection getConnection(String fileName) {
		FileInputStream fis = null;
		Properties prop = null;		
		Connection conn = null;
		try {
			fis = new FileInputStream(fileName);
			prop = new Properties();
			prop.load(fis);
			Class.forName(prop.getProperty("jdbc_driver"));
			conn = DriverManager.getConnection(
					prop.getProperty("url"),
					prop.getProperty("db_user"),
					prop.getProperty("db_password"));
		} catch (Exception e) {
			e.printStackTrace();
			conn = null;
		}
		return conn;
	}

	public static Connection createConnection(String driver, String url, String username, String password)
			throws ClassNotFoundException, SQLException {
		Class.forName(driver);
		if ((username == null) || (password == null) || (username.trim().length() == 0)
				|| (password.trim().length() == 0)) {
			return DriverManager.getConnection(url);
		} else {
			return DriverManager.getConnection(url, username, password);
		}
	}

	public static void close(Connection connection) {
		try {
			if (connection != null) {
				connection.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close(Statement st) {
		try {
			if (st != null) {
				st.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close(ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void rollback(Connection connection) {
		try {
			if (connection != null) {
				connection.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static List<Map<String, Object>> map(ResultSet rs) throws SQLException {
		List<Map<String, Object>> results = new ArrayList<Map<String, Object>>();
		try {
			if (rs != null) {
				ResultSetMetaData meta = rs.getMetaData();
				int numColumns = meta.getColumnCount();
				while (rs.next()) {
					Map<String, Object> row = new HashMap<String, Object>();
					for (int i = 1; i <= numColumns; ++i) {
						String name = meta.getColumnName(i);
						Object value = rs.getObject(i);
						row.put(name, value);
					}
					results.add(row);
				}
			}
		} finally {
			close(rs);
		}
		return results;
	}

	public static List<Map<String, Object>> query(Connection connection, String sql, List<Object> parameters)
			throws SQLException {
		List<Map<String, Object>> results = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = connection.prepareStatement(sql);

			int i = 0;
			for (Object parameter : parameters) {
				ps.setObject(++i, parameter);
			}
			rs = ps.executeQuery();
			results = map(rs);
		} finally {
			close(rs);
			close(ps);
		}
		return results;
	}

	public static int update(Connection connection, String sql, List<Object> parameters) throws SQLException {
		int numRowsUpdated = 0;
		PreparedStatement ps = null;
		try {
			ps = connection.prepareStatement(sql);

			int i = 0;
			for (Object parameter : parameters) {
				ps.setObject(++i, parameter);
			}
			numRowsUpdated = ps.executeUpdate();
		} finally {
			close(ps);
		}
		return numRowsUpdated;
	}

	public static User getUser(Connection conn, String username) {
		User result = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT id, username, hash_pw, pw_salt, first_name, last_name, email, balance FROM user WHERE username = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
            if (rs.next()) {
            	long id = rs.getLong(1);
            	//String username = rs.getString(2);
            	String hash_pw = rs.getString(3);
            	String pw_salt = rs.getString(4);
            	String first_name = rs.getString(5);
            	String last_name = rs.getString(6);
            	String email = rs.getString(7);
            	long balance = rs.getLong(8);
            	result = new User(id, username, hash_pw, pw_salt, first_name, 
            			 last_name, email, balance);
            }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
            close(rs);
            close(ps);
            close(conn);
		}
		return result;
	}
}
