package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import utils.DBConnect;

public class Course {

    private Integer courseId;
    private Trainer trainer;
    private String courseName;
    private String thumbnail;
    private String learningOutcome;
    private String description;
    private String courseTopic;
    private String keyFeature;
    private String pdf;
    private String certification;
    private String prerequisite;
    private Integer validityTill;
    private String refundPolicy;
    private Integer price;
    private Integer discount;
    private Integer subscriber;
    private Integer totalClick;
    private Integer starRank;
    private Status status;
    private Integer video;
    private Integer totalHour;
    private Integer discountedPrice; // new field

    public Course() {

    }
    
    

    public Course(Integer courseId, String courseName, String thumbnail) {
        this.courseId = courseId;
        this.courseName = courseName;
        this.thumbnail = thumbnail;
    }


    public Course(Integer courseId) {
        this.courseId = courseId;
    }

    public Course(Integer courseId, Trainer trainer, String courseName, String thumbnail, String learningOutcome,
            String description, String courseTopic, String keyFeature, String pdf, String certification,
            String prerequisite, Integer validityTill, String refundPolicy, Integer price, Integer discount,
            Integer subscriber, Integer totalClick, Integer starRank, Status status, Integer video, Integer totalHour) {
        this.courseId = courseId;
        this.trainer = trainer;
        this.courseName = courseName;
        this.thumbnail = thumbnail;
        this.learningOutcome = learningOutcome;
        this.description = description;
        this.courseTopic = courseTopic;
        this.keyFeature = keyFeature;
        this.pdf = pdf;
        this.certification = certification;
        this.prerequisite = prerequisite;
        this.validityTill = validityTill;
        this.refundPolicy = refundPolicy;
        this.price = price;
        this.discount = discount;
        this.subscriber = subscriber;
        this.totalClick = totalClick;
        this.starRank = starRank;
        this.status = status;
        this.video = video;
        this.totalHour = totalHour;
    }

    public Course(Integer courseId, Trainer trainer, String courseName, String thumbnail, String learningOutcome,
            String description, String courseTopic, String keyFeature, String pdf, String certification,
            String prerequisite, String refundPolicy, Integer price) {
        this.courseId = courseId;
        this.trainer = trainer;
        this.courseName = courseName;
        this.thumbnail = thumbnail;
        this.learningOutcome = learningOutcome;
        this.description = description;
        this.courseTopic = courseTopic;
        this.keyFeature = keyFeature;
        this.pdf = pdf;
        this.certification = certification;
        this.prerequisite = prerequisite;
        this.refundPolicy = refundPolicy;
        this.price = price;
    }

    public static ArrayList<Course> collectAllCourses() {
        ArrayList<Course> courseList = new ArrayList<>();

        try {
            Connection con = DBConnect.getConnection();
            String query = "SELECT c.course_id, c.course_name, c.thumbnail, c.price, c.discount, " +
                    "(c.price - (c.price * c.discount / 100)) AS discounted_price, " +
                    "c.description, c.key_features, c.star_rank, c.total_clicks, s.status, s.status_id " +
                    "FROM courses c " +
                    "JOIN status s ON c.status_id = s.status_id";

            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                courseList.add(new Course(rs.getInt("course_id"),
                        rs.getString("course_name"), rs.getString("thumbnail"),
                        rs.getString("description"), rs.getString("key_features"), rs.getInt("price"), rs.getInt("discount"),
                        rs.getInt("total_clicks"), rs.getInt("star_rank"),
                        new Status(rs.getInt("status_id"), rs.getString("status")), rs.getInt("discounted_price")));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return courseList;
    }

    public Course(Integer courseId, String courseName, String thumbnail, String description, String keyFeature, Integer price,
            Integer discount, Integer totalClick, Integer starRank, Status status, Integer discountedPrice) {
        this.courseId = courseId;
        this.courseName = courseName;
        this.thumbnail = thumbnail;
        this.description = description;
        this.keyFeature = keyFeature;
        this.price = price;
        this.discount = discount;
        this.totalClick = totalClick;
        this.starRank = starRank;
        this.status = status;
        this.discountedPrice = discountedPrice;
    }

    public static ArrayList<Course> collectAllCourses(Trainer trainer) {
        ArrayList<Course> courses = new ArrayList<>();

        Connection con = DBConnect.getConnection();

        try {
            // String query = "select * from courses where trainer_id=?";
            // String query = "select * from courses as c inner join status as s where c.status_id = s.status_id and trainer_id = ?";
        

            //    String query = "SELECT c.*, s.status, (SELECT COUNT(*) FROM sub_topics st INNER JOIN course_topics ct ON st.course_topic_id = ct.course_topic_id WHERE ct.course_id = c.course_id) AS videos FROM courses AS c INNER JOIN status AS s ON c.status_id = s.status_id WHERE c.trainer_id = ?;";
            // String query = "SELECT c.*, s.status, " +
            //    "(SELECT COUNT(*) FROM sub_topics st INNER JOIN course_topics ct ON st.course_topic_id = ct.course_topic_id " +
            //    " WHERE ct.course_id = c.course_id) AS videos_count " +
            //    "FROM courses AS c INNER JOIN status AS s ON c.status_id = s.status_id WHERE c.trainer_id = ?";
            String query = "SELECT c.*, s.status, " +
               "(SELECT COUNT(*) FROM sub_topics st INNER JOIN course_topics ct ON st.course_topic_id = ct.course_topic_id WHERE ct.course_id = c.course_id) AS videos_count, " +
               "(SELECT IFNULL(SUM(st.duration), 0)/60 FROM sub_topics st INNER JOIN course_topics ct ON st.course_topic_id = ct.course_topic_id WHERE ct.course_id = c.course_id) AS total_hours_sum, " +
               "(SELECT COUNT(*) FROM subscriptions WHERE course_id = c.course_id) AS subscribers_count " +
               "FROM courses AS c " +
               "INNER JOIN status AS s ON c.status_id = s.status_id " +
               "WHERE c.trainer_id = ?";


            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, trainer.getTrainerId());
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int videos = rs.getInt("videos_count");
                int totalHours = rs.getInt("total_hours_sum");
                
                int subscribersCount = rs.getInt("subscribers_count");

                courses.add(new Course(
                        rs.getInt("course_id"),
                        trainer,
                        rs.getString("course_name"),
                        rs.getString("thumbnail"),
                        rs.getString("learning_outcomes"),
                        rs.getString("description"),
                        rs.getString("course_topics"),
                        rs.getString("key_features"),
                        rs.getString("pdf"),
                        rs.getString("certification"),
                        rs.getString("prerequisites"),
                        rs.getInt("validity_till"),
                        rs.getString("refund_policy"),
                        rs.getInt("price"),
                        rs.getInt("discount"),
                        // rs.getInt("subscribers")
                        subscribersCount,
                        rs.getInt("total_clicks"),
                        rs.getInt("star_rank"),
                        new Status(rs.getInt("status_id"), rs.getString("status")),
                        videos,
                        totalHours));
                        // rs.getInt("videos"),
                        
                        // rs.getInt("total_hours")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }

    public boolean saveCourse() {
        boolean flag = false;
        System.out.println("saveCourser models pdf " + pdf);
        System.out.println("saveCourser models thumbnail " + thumbnail);

        try {
            Connection con = DBConnect.getConnection();

            String query = "insert into courses (trainer_id,course_name,thumbnail,learning_outcomes,description,course_topics,key_features,pdf,certification,prerequisites,refund_policy,price) value (?,?,?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, trainer.getTrainerId());
            ps.setString(2, courseName);
            System.out.println(courseName + " from modal course name");
            System.out.println(courseTopic + " from modal topci");
            ps.setString(3, thumbnail);
            ps.setString(4, learningOutcome);
            ps.setString(5, description);
            ps.setString(6, courseTopic);

            ps.setString(7, keyFeature);
            ps.setString(8, pdf);
            ps.setString(9, certification);
            ps.setString(10, prerequisite);
            ps.setString(11, refundPolicy);
            ps.setInt(12, price);

            if (ps.executeUpdate() == 1) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setTrainer(Trainer trainer) {
        this.trainer = trainer;
    }

    public Trainer getTrainer() {
        return trainer;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setLearningOutcome(String learningOutcome) {
        this.learningOutcome = learningOutcome;
    }

    public String getLearningOutcome() {
        return learningOutcome;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setCourseTopic(String courseTopic) {
        this.courseTopic = courseTopic;
    }

    public String getCourseTopic() {
        return courseTopic;
    }

    public void setKeyFeature(String keyFeature) {
        this.keyFeature = keyFeature;
    }

    public String getKeyFeature() {
        return keyFeature;
    }

    public void setPdf(String pdf) {
        this.pdf = pdf;
    }

    public String getPdf() {
        return pdf;
    }

    public void setCertification(String certification) {
        this.certification = certification;
    }

    public String getCertification() {
        return certification;
    }

    public void setPrerequisite(String prerequisite) {
        this.prerequisite = prerequisite;
    }

    public String getPrerequisite() {
        return prerequisite;
    }

    public void setValidityTill(Integer validityTill) {
        this.validityTill = validityTill;
    }

    public Integer getValidityTill() {
        return validityTill;
    }

    public void setRefundPolicy(String refundPolicy) {
        this.refundPolicy = refundPolicy;
    }

    public String getRefundPolicy() {
        return refundPolicy;
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

    public void setSubscriber(Integer subscriber) {
        this.subscriber = subscriber;
    }

    public Integer getSubscriber() {
        return subscriber;
    }

    public void setTotalClick(Integer totalClick) {
        this.totalClick = totalClick;
    }

    public Integer getTotalClick() {
        return totalClick;
    }

    public void setStarRank(Integer starRank) {
        this.starRank = starRank;
    }

    public Integer getStarRank() {
        return starRank;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Status getStatus() {
        return status;
    }

    public void setVideo(Integer video) {
        this.video = video;
    }

    public Integer getVideo() {
        return video;
    }

    public void setTotalHour(Integer totalHour) {
        this.totalHour = totalHour;
    }

    public Integer getTotalHour() {
        return totalHour;
    }

    public Integer getDiscountedPrice() {
        return discountedPrice;
    }

    public void setDiscountedPrice(Integer discountedPrice) {
        this.discountedPrice = discountedPrice;
    }

}