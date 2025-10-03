package models;

import java.util.*;

import utils.DBConnect;

import java.sql.*;
// import java.time.LocalDateTime;

public class Cart {

    private Integer cartId;
    private User user;
    private Timestamp cartDate;
    private Integer cartTotal;
    private Integer courseAdded;
    private String transactionPic;
    private Status status;

    private Course course;
    private CartItem cartItem;

    // Constructor
    public Cart(int cartId, Course course, CartItem cartItem) {
        this.cartId = cartId;
        this.course = course;
        this.cartItem = cartItem;
    }

    public Cart() {

    }


    public static boolean updateCartTotal(int cartId, double coursePrice) {
        boolean updated = false;
    
        try {
            Connection con = DBConnect.getConnection();
            String query = "UPDATE carts SET cart_total = cart_total - ?, courses_added = courses_added - 1 WHERE cart_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            
            // Set the parameters correctly
            ps.setDouble(1, coursePrice);  // subtract the course price from cart total
            ps.setInt(2, cartId);          // provide the cart ID for the cart to be updated
            
            int rowsAffected = ps.executeUpdate();
            updated = rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
    
        return updated;
    }
    
    

    public static List<Cart> getCartItemsByUserId(int userId) {
        List<Cart> cartItems = new ArrayList<>();
        Connection con = DBConnect.getConnection();

        try {
            // String query = "select * from courses where trainer_id=?";
            String query = "SELECT ct.cart_id, c.course_id, c.course_name, c.thumbnail, ci.cart_items_id, ci.price, ci.discount " +
                       "FROM carts ct " +
                       "JOIN cart_items ci ON ct.cart_id = ci.cart_id " +
                       "JOIN courses c ON ci.course_id = c.course_id " +
                       "WHERE ct.user_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                 // Get data from ResultSet
                 int cartId = rs.getInt("cart_id");
                 int courseId = rs.getInt("course_id");
                 String courseName = rs.getString("course_name");
                 String thumbnail = rs.getString("thumbnail");
                 int cartItemId = rs.getInt("cart_items_id");
                 int price = rs.getInt("price");
                 int discount = rs.getInt("discount");
 
                 // Create Course and CartItem objects
                 Course course = new Course(courseId, courseName, thumbnail);
                 CartItem cartItem = new CartItem(cartItemId, price, discount);
 
                 // Create Cart object
                 Cart cart = new Cart(cartId, course, cartItem);
 
                 // Add Cart to the list
                 cartItems.add(cart);
                        
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cartItems;

    }

    public static int getCartId(int userId){
        int cartId = -1;
        try{
            Connection con = DBConnect.getConnection();
            String checkSql = "SELECT cart_id FROM carts WHERE user_id = ?";
            PreparedStatement ps = con.prepareStatement(checkSql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("cart_id");
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return cartId;
    }

    public int getOrCreateCartId(int userId) {
        int cartId = -1;

        String checkSql = "SELECT cart_id FROM carts WHERE user_id = ?";
        Connection con = DBConnect.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement(checkSql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                cartId = rs.getInt("cart_id");
            } else {
                String insertSql = "INSERT INTO carts (user_id, cart_date, cart_total, courses_added, status_id) VALUES (?, NOW(), 0, 0, 8)";

                try (PreparedStatement insertStmt = con.prepareStatement(insertSql, PreparedStatement.RETURN_GENERATED_KEYS)) {
                    insertStmt.setInt(1, userId);

                    int rows = insertStmt.executeUpdate();
                    if (rows == 1) {
                        ResultSet generatedKeys = insertStmt.getGeneratedKeys();
                        if (generatedKeys.next()) {
                            cartId = generatedKeys.getInt(1);
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cartId;
    }

    public boolean updateCartTotal(int userId, int price) {
        boolean flag = false;
    
        try {
            Connection con = DBConnect.getConnection();
            String sql = "UPDATE carts SET cart_total = cart_total + ? WHERE user_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, price);
            ps.setInt(2, userId);
    
            if (ps.executeUpdate() == 1) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    
        return flag;
    }

    public boolean incrementCourses(int userId) {
    boolean flag = false;

    try {
        Connection con = DBConnect.getConnection();
        String sql = "UPDATE carts SET courses_added = courses_added + 1 WHERE user_id = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, userId);
        // ps.setObject(2, LocalDateTime.now());
        
        if (ps.executeUpdate() == 1) {
            flag = true;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return flag;
}


    

    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }

    public Integer getCartId() {
        return cartId;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public User getUser() {
        return user;
    }

    public void setCartDate(Timestamp cartDate) {
        this.cartDate = cartDate;
    }

    public Timestamp getCartDate() {
        return cartDate;
    }

    public void setCartTotal(Integer cartTotal) {
        this.cartTotal = cartTotal;
    }

    public Integer getCartTotal() {
        return cartTotal;
    }

    public void setCourseAdded(Integer courseAdded) {
        this.courseAdded = courseAdded;
    }

    public Integer getCourseAdded() {
        return courseAdded;
    }

    public void setTransactionPic(String transactionPic) {
        this.transactionPic = transactionPic;
    }

    public String getTransactionPic() {
        return transactionPic;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Status getStatus() {
        return status;
    }

}