package models;

import java.util.*;

import utils.DBConnect;

import java.sql.*;

public class Subscription {

    private Integer subscriptionId;
    private User user;
    private Course course;
    private Timestamp purchaseDate;
    private Integer price;
    private Integer validityTill;
    private Status status;

    

    public Subscription(User user, Course course, Timestamp purchaseDate, Integer price, Integer validityTill,
            Status status) {
        this.user = user;
        this.course = course;
        this.purchaseDate = purchaseDate;
        this.price = price;
        this.validityTill = validityTill;
        this.status = status;
    }

    public static boolean save(int userId, int courseId, Timestamp purchaseDate, int price, int validityTill, int statusId) throws Exception {
        boolean flag = false;

        try{
            Connection con = DBConnect.getConnection();

            String sql = "INSERT INTO subscriptions (user_id, course_id, purchase_date, price, validity_till, status_id) "
                    + "VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, courseId);
            ps.setTimestamp(3, purchaseDate);
            ps.setInt(4, price);
            ps.setInt(5, validityTill);
            ps.setInt(6, statusId);
            int res = ps.executeUpdate();
            if (res == 1)
                    flag = true;
        } catch(SQLException e){
            e.printStackTrace();
        }

        return flag;
    }

    public static List<Subscription> getEnrolledCoursesByUserId(int userId){
        List<Subscription> subscribeCourses = new ArrayList<>();
        Connection con = DBConnect.getConnection();

        try{
            String query = "SELECT s.subscription_id, s.user_id, s.course_id, s.purchase_date, s.price, s.validity_till, " +
               "c.course_name, c.thumbnail, st.status_id, st.status " +
               "FROM subscriptions s " +
               "JOIN courses c ON s.course_id = c.course_id " +
               "JOIN status st ON s.status_id = st.status_id " +
               "WHERE s.user_id = ?";


         PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                subscribeCourses.add(new Subscription(rs.getInt("subscription_id"),
                new User(rs.getInt("user_id")),
                new Course(rs.getInt("course_id"),rs.getString("course_name"),rs.getString("thumbnail")),
                rs.getTimestamp("purchase_date"),
                rs.getInt("price"),
                rs.getInt("validity_till"),
                new Status(rs.getInt("status_id"), rs.getString("status"))));
            }
        } catch(SQLException e){
            e.printStackTrace();
        }
        return subscribeCourses;
    }

    public Subscription(Integer subscriptionId, User user, Course course, Timestamp purchaseDate, Integer price,
            Integer validityTill, Status status) {
        this.subscriptionId = subscriptionId;
        this.user = user;
        this.course = course;
        this.purchaseDate = purchaseDate;
        this.price = price;
        this.validityTill = validityTill;
        this.status = status;
    }

    public void setSubscriptionId(Integer subscriptionId) {
        this.subscriptionId = subscriptionId;
    }

    public Integer getSubscriptionId() {
        return subscriptionId;
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

    public void setPurchaseDate(Timestamp purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public Timestamp getPurchaseDate() {
        return purchaseDate;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getPrice() {
        return price;
    }

    public void setValidityTill(Integer validityTill) {
        this.validityTill = validityTill;
    }

    public Integer getValidityTill() {
        return validityTill;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Status getStatus() {
        return status;
    }

}