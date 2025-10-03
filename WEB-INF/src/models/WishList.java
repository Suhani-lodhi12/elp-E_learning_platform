package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utils.DBConnect;

public class WishList {

    private Integer wishListId;
    private User user;
    private Course course;

    public WishList() {
    }

    // Add method to check if the course is already in the wishlist
    public boolean isCourseInWishlist(int userId, int courseId) {
        boolean flag = false;
        try {
            Connection con = DBConnect.getConnection();
            String query = "SELECT COUNT(*) FROM wishlist WHERE user_id = ? AND course_id = ?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setInt(2, courseId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                if(rs.getInt(1) > 0){
                    flag = true;
                } // If count > 0, course is in the wishlist
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    // Method to add the course to the wishlist
    public void addToWishlist(int userId, int courseId) {
        if (!isCourseInWishlist(userId, courseId)) {
            try{
                Connection con = DBConnect.getConnection();
                String query = "INSERT INTO wishlist (user_id, course_id) VALUES (?, ?)";

                PreparedStatement ps = con.prepareStatement(query);
                ps.setInt(1, userId);
                ps.setInt(2, courseId);
                ps.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Method to remove the course from the wishlist
    public void removeFromWishlist(int userId, int courseId) {
        if (isCourseInWishlist(userId, courseId)) {
            try{
                Connection con = DBConnect.getConnection();
                String query = "DELETE FROM wishlist WHERE user_id = ? AND course_id = ?";
                
                PreparedStatement ps = con.prepareStatement(query);
                ps.setInt(1, userId);
                ps.setInt(2, courseId);
                ps.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void setWishListId(Integer wishListId) {
        this.wishListId = wishListId;
    }

    public Integer getWishListId() {
        return wishListId;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public User getUser() {
        return user;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Course getCourse() {
        return course;
    }

}