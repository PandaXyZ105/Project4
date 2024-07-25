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
public class addProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int category_id = Integer.parseInt(request.getParameter("category_id"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        String description = request.getParameter("description");
        String short_description = request.getParameter("short_description");
        String spec = request.getParameter("spec");
        String image_url = request.getParameter("image_url");

        DBConnection db = new DBConnection();
        Connection con = db.setConnection();
        String query = "INSERT INTO tblProduct (name, price, category_id, stock, description, short_description, spec, image_url) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, name);
            pst.setDouble(2, price);
            pst.setInt(3, category_id);
            pst.setInt(4, stock);
            pst.setString(5, description);
            pst.setString(6, short_description);
            pst.setString(7, spec);
            pst.setString(8, image_url);
            int rowCount = pst.executeUpdate();

            if (rowCount > 0) {
                request.getSession().setAttribute("addSuccess", true);
            } else {
                request.getSession().setAttribute("addError", true);
            }

            response.sendRedirect("productAdmin.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            request.getSession().setAttribute("addError", true);
            response.sendRedirect("productAdmin.jsp");
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
