<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Product - Diana’s Jewelry</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .header {
            background-color: #343a40;
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .logout-btn {
            color: white;
            text-decoration: none;
        }
        .logout-btn:hover {
            text-decoration: underline;
        }
        .form-container {
            margin-top: 50px;
        }
        .form-group .form-text {
            font-size: 0.875em;
            color: #6c757d;
        }
        .input-group-prepend span {
            background-color: #e9ecef;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
            padding: 0.375rem 0.75rem;
        }
        .input-group-append span {
            display: none;
        }
    </style>
</head>
<body>
    <header class="header bg-dark text-white p-3">
        <div class="container d-flex justify-content-between">
            <h2>Add Product</h2>
            <a href="logoutServlet" class="btn btn-danger">Logout</a>
        </div>
    </header>

    <div class="container form-container">
        <h3>Add New Product</h3>
        <form action="addProductServlet" method="post" onsubmit="combineImageUrl()">
            <div class="form-group">
                <label for="name">Product Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
                <small class="form-text">Enter the product name, e.g., "Gold Ring".</small>
            </div>
            <div class="form-group">
                <label for="price">Price</label>
                <input type="number" step="0.01" class="form-control" id="price" name="price" required>
                <small class="form-text">Enter the price in IDR, e.g., "5000000".</small>
            </div>
            <div class="form-group">
                <label for="category_id">Category</label>
                <select class="form-control" id="category_id" name="category_id" required>
                    <option value="1">Necklaces</option>
                    <option value="2">Earrings</option>
                    <option value="3">Ring</option>
                    <option value="4">Bracelets</option>
                </select>
                <small class="form-text">Select the category for the product.</small>
            </div>
            <div class="form-group">
                <label for="stock">Stock</label>
                <input type="number" class="form-control" id="stock" name="stock" required>
                <small class="form-text">Enter the available stock quantity, e.g., "50".</small>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea class="form-control" id="description" name="description" required></textarea>
                <small class="form-text">Provide a detailed description of the product.</small>
            </div>
            <div class="form-group">
                <label for="short_description">Short Description</label>
                <textarea class="form-control" id="short_description" name="short_description" required></textarea>
                <small class="form-text">Provide a short description of the product.</small>
            </div>
            <div class="form-group">
                <label for="spec">Specification</label>
                <textarea class="form-control" id="spec" name="spec" required></textarea>
                <small class="form-text">Enter the product specifications, e.g., "18K gold, weight: 10 grams".</small>
            </div>
            <div class="form-group">
                <label for="image_url">Image URL</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">images/</span>
                    </div>
                    <input type="text" class="form-control" id="image_url_input" name="image_url_input" required>
                    <input type="hidden" id="image_url" name="image_url">
                </div>
                <small class="form-text">Enter the image URL, e.g., "ring.jpg".</small>
            </div>
            <button type="submit" class="btn btn-primary">Add Product</button>
            <button type="reset" class="btn btn-secondary">Reset</button>
            <a href="productAdmin.jsp" class="btn btn-secondary">Back</a>
        </form>
        <% if (request.getSession().getAttribute("addSuccess") != null) { %>
            <div class="alert alert-success mt-3">Product added successfully!</div>
            <%
                request.getSession().removeAttribute("addSuccess");
            %>
        <% } %>
        <% if (request.getSession().getAttribute("addError") != null) { %>
            <div class="alert alert-danger mt-3">Error adding product!</div>
            <%
                request.getSession().removeAttribute("addError");
            %>
        <% } %>
    </div>

    <script>
        function combineImageUrl() {
            var fixedPart = 'images/';
            var userInput = document.getElementById('image_url_input').value;
            document.getElementById('image_url').value = fixedPart + userInput;
        }
    </script>

    <!-- Bootstrap core JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
