package Database;

import Model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductDAO {
    public Product getProductById(int product_id) {
        Product product = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = new DBConnection().setConnection();
            String sql = "SELECT * FROM tblproduct WHERE product_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, product_id);
            rs = ps.executeQuery();

            if (rs.next()) {
                product = new Product();
                product.setProduct_id(rs.getInt("product_id"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getDouble("price"));
                product.setImage_url(rs.getString("image_url"));
                product.setShort_description(rs.getString("short_description"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
        return product;
    }
}
