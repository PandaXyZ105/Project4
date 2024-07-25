package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Database.DBConnection;

@WebServlet("/ProcessOrderServlet")
public class ProcessOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String[] cartIds = request.getParameterValues("cart_id");
        String fullName = request.getParameter("name");
        String address = request.getParameter("address");
        String province = request.getParameter("province");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String postalCode = request.getParameter("postcode");
        String phoneNumber = request.getParameter("phone");
        String paymentMethod = request.getParameter("paymentMethod");
        String notes = request.getParameter("notes");
        String subtotalStr = (String) session.getAttribute("subtotal");
        double totalPayment = subtotalStr != null ? Double.parseDouble(subtotalStr) : 0.0;

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = new DBConnection().setConnection();
            String sql = "INSERT INTO tbltransaction (cart_id, email, full_name, address, province, city, district, postal_code, phone_number, payment_method, notes, order_date, total_payment) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);

            for (String cartId : cartIds) {
                ps.setInt(1, Integer.parseInt(cartId));
                ps.setString(2, email);
                ps.setString(3, fullName);
                ps.setString(4, address);
                ps.setString(5, province);
                ps.setString(6, city);
                ps.setString(7, district);
                ps.setString(8, postalCode);
                ps.setString(9, phoneNumber);
                ps.setString(10, paymentMethod);
                ps.setString(11, notes);
                ps.setString(12, new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                ps.setDouble(13, totalPayment);

                ps.addBatch();
            }

            ps.executeBatch();
            response.sendRedirect("indexSuccess.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("indexSuccess.jsp");
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}