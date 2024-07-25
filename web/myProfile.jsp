<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Database.DBConnection, java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Profile - Diana’s Jewelry</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <%@ include file="headerProfile.jsp" %>
    <div class="container mt-5">
        <h3>My Profile</h3>
        <%
            String userEmail = (String) session.getAttribute("email");
            if (userEmail == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            DBConnection db = new DBConnection();
            Connection con = db.setConnection();
            String query = "SELECT * FROM tblUser WHERE email = ?";
            String name = "", phone = "", password = "";
            try {
                PreparedStatement pst = con.prepareStatement(query);
                pst.setString(1, userEmail);
                ResultSet rs = pst.executeQuery();
                
                if (rs.next()) {
                    name = rs.getString("name");
                    
                    phone = rs.getString("phone");
                    password = rs.getString("password");
                } else {
                    out.println("<div class='alert alert-danger'>User not found.</div>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<div class='alert alert-danger'>Database error: " + e.getMessage() + "</div>");
            } finally {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
        <form action="viewProfileServlet" method="post">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" value="<%= name %>" readonly>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" value="<%= userEmail %>" readonly>
            </div>
            <div class="form-group">
                <label for="phone">Phone</label>
                <input type="text" class="form-control" id="phone" value="<%= phone %>" readonly>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" value="<%= password %>" readonly>
            </div>
            <a href="indexSuccess.jsp" class="btn btn-success mb-3">Back</a>
           
        </form>
    </div>

    <!-- Bootstrap core JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
