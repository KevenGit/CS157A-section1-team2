<%@ page import="org.apache.shiro.crypto.hash.Sha256Hash" %>
<%@ page import="org.apache.shiro.crypto.RandomNumberGenerator" %>
<%@ page import="org.apache.shiro.crypto.SecureRandomNumberGenerator" %>
<%@ page import="org.apache.shiro.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cs157a.evendor.model.*"%>
<%@ page import="com.cs157a.evendor.util.*"%>
<%!
    public boolean validate(String password) {
        // Temporary checking for now:
        if (password == null || password.length() < 6)
            return false;
        return true;
    }
%>

<%
//get info from register form 
    String password = request.getParameter("admin_regis_password");
    String username = request.getParameter("admin_regis_username");
    String first_name = request.getParameter("admin_regis_first_name");
    String last_name = request.getParameter("admin_regis_last_name");
    //String phone_number = request.getParameter("regis_phone_number");
    
    String msg = "";

    int numRowsUpdated;
    if (validate(password)) {
        RandomNumberGenerator rng = new SecureRandomNumberGenerator();
        //Object salt = rng.nextBytes();
        ByteSource salt = rng.nextBytes();
		
        String hashedPasswordBase64 = new Sha256Hash(password, salt, 1024).toBase64();
        String saltBase64 = salt.toBase64();
        // Add account:
        //Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DbUtils.getConnection();
        //Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_vendor_data_test?serverTimezone=EST5EDT","root", "root");
	
        String sqlInsert = "INSERT INTO admin(first_name, last_name, username, hash_pw, pw_salt) VALUES (?, ?, ?, ?, ?)";
        List parameters = Arrays.asList(first_name, last_name, username, hashedPasswordBase64, saltBase64);
        try {
            numRowsUpdated = DbUtils.update(conn, sqlInsert, parameters);
            msg = "Admin added successfully!";
        } catch (Exception e) {
            msg = e.getMessage();
        }
        DbUtils.close(conn);
        response.sendRedirect("adminLogin.jsp?status=" + msg);
    } else {
        msg = "Invalid input";
        response.sendRedirect("adminLogin.jsp?status=" + msg);
    }
%>
<!DOCTYPE html>
<html>
<body>
 <h3><%=msg%></h3>
</body>
</html>