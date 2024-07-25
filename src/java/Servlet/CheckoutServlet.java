package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CheckoutServlet", urlPatterns = {"/CheckoutServlet"})
public class CheckoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String[] cartIds = request.getParameterValues("cart_id");
        String subtotal = request.getParameter("subtotal");

        if (cartIds != null && cartIds.length > 0 && subtotal != null) {
            session.setAttribute("cartIds", cartIds);
            session.setAttribute("subtotal", subtotal);
            response.sendRedirect("checkout.jsp");
        } else {
            response.sendRedirect("cart.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
