<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    HttpSession ses = request.getSession(false);
    if (ses == null || ses.getAttribute("username") == null) {
        response.sendRedirect("login.html");
        return;
    }
%>
<html>
<head>
    <title>Insert Data into MySQL</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
        }
        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            color: #333;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Book Entry Form</h2>
        <form action="index.jsp" method="post">
            <label for="book_id">Book ID:</label>
            <input type="text" id="book_id" name="book_id"><br><br>
            
            <label for="title">Title:</label>
            <input type="text" id="title" name="title"><br><br>
            
            <label for="author">Author:</label>
            <input type="text" id="author" name="author"><br><br>
            
            <label for="price">Price:</label>
            <input type="text" id="price" name="price"><br><br>
            
            <input type="submit" value="Submit">
        </form>
    </div>
    <h2>Book Database</h2>
    <table>
        <tr>
            <th>Book ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Price</th>
        </tr>
        <% 
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                // Connect to the MySQL database
                conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/Books", "root", "");

                // Retrieve data from the books table
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT * FROM books");

                // Iterate through the result set and display data in the table
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("book_id") + "</td>");
                    out.println("<td>" + rs.getString("title") + "</td>");
                    out.println("<td>" + rs.getString("author") + "</td>");
                    out.println("<td>" + rs.getInt("price") + "</td>");
                    out.println("</tr>");
                }
            } catch (SQLException ex) {
                out.println("Error: " + ex.getMessage());
            } finally {
                // Close resources
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException ex) {
                    out.println("Error while closing resources: " + ex.getMessage());
                }
            }
        %>
    </table>
</body>
</html>
