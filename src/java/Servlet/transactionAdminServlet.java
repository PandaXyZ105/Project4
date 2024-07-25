package Servlet;

import Database.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "TransactionAdminServlet", urlPatterns = {"/transactionAdminServlet"})
public class transactionAdminServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            DBConnection db = new DBConnection();
            Connection con = db.setConnection();

            String query = "SELECT transaction_id, cart_id, email, full_name, address, province, city, district, postal_code, phone_number, payment_method, notes, order_date, total_payment FROM tbltransaction";

            try {
                PreparedStatement pst = con.prepareStatement(query);
                ResultSet rs = pst.executeQuery();

                out.println("<!DOCTYPE html>");
                out.println("<html lang='en'>");
                out.println("<head>");
                out.println("<meta charset='UTF-8'>");
                out.println("<title>Transaction Management - Gentle Sparkle</title>");
                out.println("<meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'>");
                out.println("<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'>");
                out.println("<link rel='stylesheet' href='Css/admin.css'>");
                out.println("</head>");
                out.println("<body>");
                out.println("<div class='container-fluid mt-4'>");

                // Back to Admin Dashboard button
                out.println("<div class='mb-3'>");
                out.println("<a href='admin.jsp' class='btn btn-secondary'>Back to Admin Dashboard</a>");
                out.println("</div>");

                out.println("<h3 class='mb-4'>Manage Transactions</h3>");
                
                // Display transaction table
                out.println("<div id='transactionTable'>");
                out.println("<table class='table table-bordered'>");
                out.println("<thead><tr><th>ID</th><th>Cart ID</th><th>Email</th><th>Full Name</th><th>Address</th><th>Province</th><th>City</th><th>District</th><th>Postal Code</th><th>Phone Number</th><th>Payment Method</th><th>Notes</th><th>Order Date</th><th>Total Payment</th></tr></thead>");
                out.println("<tbody>");
                
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                
                while (rs.next()) {
                    int transactionId = rs.getInt("transaction_id");
                    int cartId = rs.getInt("cart_id");
                    String email = rs.getString("email");
                    String fullName = rs.getString("full_name");
                    String address = rs.getString("address");
                    String province = rs.getString("province");
                    String city = rs.getString("city");
                    String district = rs.getString("district");
                    String postalCode = rs.getString("postal_code");
                    String phoneNumber = rs.getString("phone_number");
                    String paymentMethod = rs.getString("payment_method");
                    String notes = rs.getString("notes");
                    String orderDate = sdf.format(rs.getDate("order_date"));
                    double totalPayment = rs.getDouble("total_payment");
                    
                    // Format total payment to Indonesian Rupiah
                    NumberFormat format = NumberFormat.getCurrencyInstance();
                    String formattedTotalPayment = format.format(totalPayment);

                    out.println("<tr>");
                    out.println("<td>" + transactionId + "</td>");
                    out.println("<td>" + cartId + "</td>");
                    out.println("<td>" + email + "</td>");
                    out.println("<td>" + fullName + "</td>");
                    out.println("<td>" + address + "</td>");
                    out.println("<td>" + province + "</td>");
                    out.println("<td>" + city + "</td>");
                    out.println("<td>" + district + "</td>");
                    out.println("<td>" + postalCode + "</td>");
                    out.println("<td>" + phoneNumber + "</td>");
                    out.println("<td>" + paymentMethod + "</td>");
                    out.println("<td>" + notes + "</td>");
                    out.println("<td>" + orderDate + "</td>");
                    out.println("<td>" + formattedTotalPayment + "</td>");
                    out.println("</tr>");
                }
                out.println("</tbody>");
                out.println("</table>");
                out.println("</div>");

                out.println("</div>"); // Close container-fluid
                out.println("</body>");
                out.println("</html>");

            } catch (SQLException e) {
                e.printStackTrace();
                out.println("Database error: " + e.getMessage());
            } finally {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Transaction Admin Servlet";
    }
}
