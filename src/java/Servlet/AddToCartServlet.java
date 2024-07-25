package Servlet;

import Database.DBConnection;
import Database.CartDAOImpl;
import Model.Cart;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AddToCartServlet", urlPatterns = {"/AddToCartServlet"})
public class AddToCartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String productId = request.getParameter("product_id");
        String quantityStr = request.getParameter("quantity");

        int quantity = Integer.parseInt(quantityStr);

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        DBConnection db = new DBConnection();
        Connection con = db.setConnection();

        String selectQuery = "SELECT price FROM tblproduct WHERE product_id = ?";
        String insertQuery = "INSERT INTO tblcart (product_id, email, quantity, tempTotal) VALUES (?, ?, ?, ?)";

        try {
            PreparedStatement selectPst = con.prepareStatement(selectQuery);
            selectPst.setInt(1, Integer.parseInt(productId));
            ResultSet rs = selectPst.executeQuery();

            if (rs.next()) {
                double price = rs.getDouble("price");
                double tempTotal = quantity * price;

                Cart cart = new Cart(0, Integer.parseInt(productId), email, quantity, tempTotal);

                CartDAOImpl cartDAO = new CartDAOImpl(con);
                boolean success = cartDAO.addToCart(cart);

                if (success) {
                    response.getWriter().write("success");
                } else {
                    response.getWriter().write("fail");
                }
            } else {
                response.getWriter().write("fail");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("fail");
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}