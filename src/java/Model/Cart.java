package Model;

public class Cart {
    private int cart_id;
    private int product_id;
    private String email;
    private int quantity;
    private double tempTotal;

    // Constructor
    public Cart(int cart_id, int product_id, String email, int quantity, double tempTotal) {
        this.cart_id = cart_id;
        this.product_id = product_id;
        this.email = email;
        this.quantity = quantity;
        this.tempTotal = tempTotal;
    }

    // Getters and Setters
    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTempTotal() {
        return tempTotal;
    }

    public void setTempTotal(double tempTotal) {
        this.tempTotal = tempTotal;
    }
}
