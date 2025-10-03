package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utils.DBConnect;

public class CartItem {

    private Integer cartItemId;
    private Cart cart;
    private Course course;
    private Integer price;
    private Integer discount;

    public CartItem(){

    }

    public CartItem(int cartItemId, int price, int discount) {
        this.cartItemId = cartItemId;
        this.price = price;
        this.discount = discount;
    }

        public static double getItemPrice(int courseId) {
        double price = 0;
        
        
        try{
            Connection con = DBConnect.getConnection();
            String query = "SELECT price FROM cart_items WHERE course_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, courseId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                price = rs.getDouble("price");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return price;
    }


    public static Boolean deleteCartItemById(int cartId, int courseId) {
        Boolean deleted = false;

        try {
            Connection con = DBConnect.getConnection();
            String sql = "DELETE FROM cart_items WHERE cart_id = ? AND course_id = ?";
             
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, cartId);
            stmt.setInt(2, courseId);

            int row = stmt.executeUpdate();
            deleted = row > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return deleted;
    }

    public Boolean addCartItem(int cartId, int courseId, int price, int discount) {
        Boolean flag = false;
        Connection con = DBConnect.getConnection();

        String query = "INSERT into cart_items(cart_id,course_id,price,discount) values (?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, cartId);
            ps.setInt(2, courseId);
            ps.setInt(3, price);
            ps.setInt(4, discount);

            int res = ps.executeUpdate();

            if(res>0) {
                flag = true;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }

        return flag;
    }

    public void setCartItemId(Integer cartItemId) {
        this.cartItemId = cartItemId;
    }
    
    public Integer getCartItemId() {
        return cartItemId;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }
    
    public Cart getCart() {
        return cart;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
    
    public Course getCourse() {
        return course;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }
    
    public Integer getPrice() {
        return price;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
    }
    
    public Integer getDiscount() {
        return discount;
    }
    
}