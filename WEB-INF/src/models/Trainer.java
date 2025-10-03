package models;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import utils.DBConnect;

public class Trainer {

    private Integer trainerId;
    private User user;
    private String experience;
    private String skills;
    private Integer launchedCourse;
    private String profession;
    private String education;

    public Trainer(){
        
    }

    public Trainer(Integer trainerId) {
        this.trainerId = trainerId;
    }

    public Trainer(String experience, String skills, Integer launchedCourse, String profession, String education, User user){
        this.experience = experience;
        this.skills = skills;
        this.launchedCourse = launchedCourse;
        this.profession = profession;
        this.education = education;
        this.user = user;
    }


    public static Trainer getTrainerByUserId(int userId) {
        Trainer trainer = null;
        try {
            Connection con = DBConnect.getConnection();
            String query = "SELECT trainer_id, experience, skills, launched_courses, profession, education FROM trainers WHERE user_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
    
            if (rs.next()) {
                trainer = new Trainer();
                trainer.setTrainerId(rs.getInt("trainer_id"));
    
                // Fetch the User object properly
                User user = User.getUserById(userId); // Assuming you create this method in User.java
                trainer.setUser(user);
    
                trainer.setExperience(rs.getString("experience"));
                trainer.setSkills(rs.getString("skills"));
                trainer.setLaunchedCourse(rs.getInt("launched_courses"));
                trainer.setProfession(rs.getString("profession"));
                trainer.setEducation(rs.getString("education"));
            }
    
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return trainer;
    }
    
    

    public boolean saveDetail(){
        boolean flag = false;

        try{
            Connection con = DBConnect.getConnection();
            String query = "insert into trainers (user_id,experience,skills,launched_courses,profession,education) value (?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, user.getUserId());
            ps.setString(2,experience);
            ps.setString(3,skills);
            ps.setInt(4,launchedCourse);
            ps.setString(5, profession);
            ps.setString(6, education);

            int res = ps.executeUpdate();

            if(res == 1)
                flag = true;
            
            con.close();

        } catch(SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    
    public void setTrainerId(Integer trainerId) {
        this.trainerId = trainerId;
    }

    public Integer getTrainerId() {
        return trainerId;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
    public User getUser() {
        return user;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getExperience() {
        return experience;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }
    
    public String getSkills() {
        return skills;
    }

    public void setLaunchedCourse(Integer launchedCourse) {
        this.launchedCourse = launchedCourse;
    }
    
    public Integer getLaunchedCourse() {
        return launchedCourse;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getProfession() {
        return profession;
    }

    public void setEducation(String education) {
        this.education = education;
    }
    
    public String getEducation() {
        return education;
    }

    
}