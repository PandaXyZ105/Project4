<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Admin - Gentle Sparkle</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <header class="header bg-dark text-white p-3">
        <div class="container d-flex justify-content-between">
            <h2>Product Admin</h2>
            <a href="logoutServlet" class="btn btn-danger btn-sm">Logout</a>
        </div>
    </header>
    
    
    <div class="container mt-5">
        
        <div id="productTable">
            <jsp:include page="productAdminServlet"></jsp:include>
        </div>
    </div>
        <a href="admin.jsp" class="btn btn-success mb-3">Back</a>

    <!-- Bootstrap core JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
