package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import utils.DBConnect;

public class SubTopic {

    private Integer subTopicId;
    private CourseTopic courseTopic;
    private String title;
    private Boolean preview;
    private String video;
    private Integer duration;

    private String thumbnail;

    public SubTopic() {
    }

    
    public SubTopic(Integer subTopicId, String title, String video, Integer duration) {
        this.subTopicId = subTopicId;
        this.title = title;
        this.video = video;
        this.duration = duration;
    }


    public SubTopic(Integer subTopicId, String title, Boolean preview, String video) {
        this.subTopicId = subTopicId;
        this.title = title;
        this.preview = preview;
        this.video = video;
    }

    

    public static boolean deleteSubTopicById(int subTopicId) {
        boolean deleted = false;

        try {
            Connection con = DBConnect.getConnection();
            String sql = "DELETE FROM sub_topics WHERE sub_topic_id = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, subTopicId);

            int row = stmt.executeUpdate();
            deleted = row > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return deleted;
    }

    public static SubTopic getById(int subTopicId) {
        SubTopic subtopic = null;
        try {
            Connection conn = DBConnect.getConnection();
            String sql = "SELECT * FROM sub_topics WHERE sub_topic_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, subTopicId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                subtopic = new SubTopic();
                subtopic.setSubTopicId(rs.getInt("sub_topic_id"));
                subtopic.setTitle(rs.getString("title"));
                subtopic.setVideo(rs.getString("videos")); // full path relative to /WEB-INF/uploads
                subtopic.setDuration(rs.getInt("duration"));
                // Set other fields if needed
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return subtopic;
    }


    public static SubTopic getPreviewById(int subTopicId) {
        SubTopic subTopic = null;

        try {
            Connection con = DBConnect.getConnection();
            String query = "SELECT preview FROM sub_topics WHERE sub_topic_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, subTopicId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                subTopic = new SubTopic();
                subTopic.setSubTopicId(subTopicId); // ID hum already jaante hai
                subTopic.setPreview(rs.getBoolean("preview")); // Bas preview set kar rahe hai
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return subTopic;
    }

    public void updatePreview() {
        try {
            Connection con = DBConnect.getConnection();
            String query = "UPDATE sub_topics SET preview=? WHERE sub_topic_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, this.preview ? 1 : 0);
            ps.setInt(2, this.subTopicId);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Preview updated successfully.");
            } else {
                System.out.println("No sub_topic found with the provided sub_topic_id.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Boolean collectAllSubTopics(List<CourseTopic> topicList) {
        Boolean flag = false;

        for (CourseTopic coursetopic : topicList) {
            try {
                Connection con = DBConnect.getConnection();
                String query = "select st.sub_topic_id, st.title, st.preview, st.videos from sub_topics st where st.course_topic_id=?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setInt(1, coursetopic.getCourseTopicId());

                ResultSet rs = ps.executeQuery();
                ArrayList<SubTopic> subTopics = new ArrayList<>();
                while (rs.next()) {
                    subTopics.add(new SubTopic(rs.getInt("sub_topic_id"), rs.getString("title"),rs.getBoolean("preview"),rs.getString("videos")));
                    flag = true;
                }
                coursetopic.setSubTopics(subTopics);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return flag;
    }

    public boolean saveSubTopic() {
        boolean flag = false;

        try {
            Connection con = DBConnect.getConnection();

            String query = "insert into sub_topics (course_topic_id,title,videos,duration) value (?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, courseTopic.getCourseTopicId());
            ps.setString(2, title);
            // ps.setBoolean(3, preview);
            ps.setString(3, video);
            ps.setInt(4, duration);

            if (ps.executeUpdate() == 1)
                flag = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public static List<SubTopic> getByCourseTopicId(int courseTopicId) {
        List<SubTopic> list = new ArrayList<>();

        try {
            Connection con = DBConnect.getConnection();
            String query = "SELECT st.sub_topic_id, st.title, st.preview, st.videos, st.duration, c.thumbnail " +
                    "FROM sub_topics st " +
                    "JOIN course_topics ct ON st.course_topic_id = ct.course_topic_id " +
                    "JOIN courses c ON ct.course_id = c.course_id " +
                    "WHERE st.course_topic_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, courseTopicId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SubTopic sub = new SubTopic();
                sub.setSubTopicId(rs.getInt("sub_topic_id"));
                sub.setTitle(rs.getString("title"));
                sub.setVideo(rs.getString("videos"));
                sub.setDuration(rs.getInt("duration"));
                sub.setPreview(rs.getBoolean("preview"));
                sub.setThumbnail(rs.getString("thumbnail"));
                list.add(sub);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public static double getTotalDurationInHours(int courseId) {
        double totalHours = 0;
        String query = "SELECT SUM(st.duration) FROM sub_topics st " +
                       "INNER JOIN course_topics ct ON st.course_topic_id = ct.course_topic_id " +
                       "WHERE ct.course_id = ?";
    
        try (Connection con = DBConnect.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
    
            ps.setInt(1, courseId);
            ResultSet rs = ps.executeQuery();
    
            if (rs.next()) {
                int totalMinutes = rs.getInt(1);
                totalHours = totalMinutes / 60.0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    
        return totalHours;
    }
    

    public static int getSubTopicCount(int courseId) {
        int count = 0;
        Connection con = DBConnect.getConnection();
        String query = "SELECT COUNT(*) AS subtopic_count FROM sub_topics AS st JOIN course_topics AS ct ON st.course_topic_id = ct.course_topic_id WHERE ct.course_id = ?";

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, courseId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt("subtopic_count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }

    public void setSubTopicId(Integer subTopicId) {
        this.subTopicId = subTopicId;
    }

    public Integer getSubTopicId() {
        return subTopicId;
    }

    public void setCourseTopic(CourseTopic courseTopic) {
        this.courseTopic = courseTopic;
    }

    public CourseTopic getCourseTopic() {
        return courseTopic;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

    public void setPreview(Boolean preview) {
        this.preview = preview;
    }

    public Boolean getPreview() {
        return preview;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public String getVideo() {
        return video;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public Integer getDuration() {
        return duration;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

}