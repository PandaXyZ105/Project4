package Database;

import Model.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDAOImpl {

    private Connection connection;

    public CartDAOImpl(Connection connection) {
        this.connection = connection;
    }

    public boolean addToCart(Cart cart) {
        String query = "INSERT INTO tblcart (product_id, email, quantity, tempTotal) VALUES (?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, cart.getProduct_id());
            statement.setString(2, cart.getEmail());
            statement.setInt(3, cart.getQuantity());
            statement.setDouble(4, cart.getTempTotal());
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Cart> getAllCarts() {
        List<Cart> carts = new ArrayList<>();
        String query = "SELECT * FROM tblcart";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int cart_id = rs.getInt("cart_id");
                int product_id = rs.getInt("product_id");
                String email = rs.getString("email");
                int quantity = rs.getInt("quantity");
                double tempTotal = rs.getDouble("tempTotal");
                Cart cart = new Cart(cart_id, product_id, email, quantity, tempTotal);
                carts.add(cart);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return carts;
    }

    public List<Cart> getAllCartsByEmail(String email) {
        List<Cart> carts = new ArrayList<>();
        String query = "SELECT * FROM tblcart WHERE email = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int cart_id = rs.getInt("cart_id");
                int product_id = rs.getInt("product_id");
                int quantity = rs.getInt("quantity");
                double tempTotal = rs.getDouble("tempTotal");
                Cart cart = new Cart(cart_id, product_id, email, quantity, tempTotal);
                carts.add(cart);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return carts;
    }

    public boolean updateCart(Cart cart) {
        String query = "UPDATE tblcart SET quantity = ?, tempTotal = ? WHERE cart_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, cart.getQuantity());
            statement.setDouble(2, cart.getTempTotal());
            statement.setInt(3, cart.getCart_id());
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteCart(int cart_id) {
        String query = "DELETE FROM tblcart WHERE cart_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, cart_id);
            int rowsDeleted = statement.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
