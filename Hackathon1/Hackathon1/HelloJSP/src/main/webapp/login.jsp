<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username == null || password == null) {
        response.sendRedirect("login.html");
        return;
    }

    String passwordPattern = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$";
    if (!password.matches(passwordPattern)) {
        out.println("<div style='color:red;'>Password must be at least 8 characters long and include at least one number, one lowercase letter, and one uppercase letter.</div>");
        out.println("<a href='login.html'>Go back to login page</a>");
        return;
    }

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    HttpSession ses = request.getSession();

    try {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Connect to the MySQL database
        conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/Books", "root", "");

        // Prepare SQL statement for checking credentials
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            // Credentials are correct
            ses.setAttribute("username", username);
            response.sendRedirect("index.jsp");
        } else {
            // Invalid credentials
            out.println("Invalid username or password. Please try again.");
        }
    } catch (ClassNotFoundException e) {
        out.println("Error: MySQL JDBC driver not found. Please make sure the MySQL Connector/J JAR file is correctly added to your project's classpath.");
    } catch (SQLException e) {
        out.println("Error: " + e.getMessage());
    } finally {
        // Close resources
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            out.println("Error while closing resources: " + ex.getMessage());
        }
    }
%>
