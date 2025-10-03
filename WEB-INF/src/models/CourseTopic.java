package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeSet;

import utils.DBConnect;

public class CourseTopic {
    
    private Integer courseTopicId;
    private String topicName;
    private Course course;
    private Boolean preview;
    private Integer video;
    private Integer totalHour;

    private ArrayList<SubTopic> subTopics;

    


    public CourseTopic(Integer courseTopicId, String topicName) {
        this.courseTopicId = courseTopicId;
        this.topicName = topicName;
    }


    public CourseTopic(String topicName, Course course) {
        this.topicName = topicName;
        this.course = course;
    }

    


    public CourseTopic(Integer courseTopicId) {
        this.courseTopicId = courseTopicId;
    }


    public boolean saveCourseTopic() {
        boolean flag = false;

        try {
            Connection con = DBConnect.getConnection();
            if (con != null) {
                String query = "insert into course_topics (topic_name,course_id) value (?,?)";

                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, topicName);
                ps.setInt(2, course.getCourseId());
    
                int res = ps.executeUpdate();

                if (res == 1)
                    flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flag;
    }

     // Static method to fetch topics for a course
    public static List<CourseTopic> getTopicsByCourseId(int courseId) {
        List<CourseTopic> topics = new ArrayList<>();

        String query = "SELECT course_topic_id, topic_name FROM course_topics WHERE course_id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, courseId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int topicId = rs.getInt("course_topic_id");
                String topicName = rs.getString("topic_name");

                Course course = new Course(courseId); // assuming simple Course constructor
                CourseTopic topic = new CourseTopic(topicName, course);
                topic.courseTopicId = topicId;

                topics.add(topic);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return topics;
    }

    public static CourseTopic getById(int courseTopicId) {
        CourseTopic topic = null;
    
        String query = "SELECT course_topic_id, topic_name, course_id FROM course_topics WHERE course_topic_id = ?";
    
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
    
            stmt.setInt(1, courseTopicId);
            ResultSet rs = stmt.executeQuery();
    
            if (rs.next()) {
                String topicName = rs.getString("topic_name");
                int courseId = rs.getInt("course_id");
    
                Course course = new Course(courseId); // or load full course if needed
                topic = new CourseTopic(topicName, course);
                topic.setCourseTopicId(courseTopicId);
            }
    
        } catch (SQLException e) {
            e.printStackTrace();
        }
    
        return topic;
    }
    

    

    public void setCourseTopicId(Integer courseTopicId) {
        this.courseTopicId = courseTopicId;
    }
    
    public Integer getCourseTopicId() {
        return courseTopicId;
    }

    public void setTopicName(String topicName) {
        this.topicName = topicName;
    }
    
    public String getTopicName() {
        return topicName;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
    
    public Course getCourse() {
        return course;
    }

    public void setPreview(Boolean preview) {
        this.preview = preview;
    }
    
    public Boolean getPreview() {
        return preview;
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

    
    public ArrayList<SubTopic> getSubTopics() {
        return subTopics;
    }


    public void setSubTopics(ArrayList<SubTopic> subTopics) {
        this.subTopics = subTopics;
    }


}