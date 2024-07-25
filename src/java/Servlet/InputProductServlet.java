package Servlet;

import Database.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AddProductServlet", urlPatterns = {"/addProductServlet"})
public class InputProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int category_id = Integer.parseInt(request.getParameter("category_id"));
        int stock = Integer.parseInt(request.getParameter("stock"));

        DBConnection db = new DBConnection();
        Connection con = db.setConnection();
        String query = "INSERT INTO tblProduct (name, price, category_id, stock) VALUES (?, ?, ?, ?)";

        try {
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, name);
            pst.setDouble(2, price);
            pst.setInt(3, category_id);
            pst.setInt(4, stock);
            int rowCount = pst.executeUpdate();

            if (rowCount > 0) {
                request.getSession().setAttribute("addSuccess", true);
            } else {
                request.getSession().setAttribute("addError", true);
            }

            response.sendRedirect("productAdmin.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("productAdmin.jsp?error=Database error: " + e.getMessage());
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
