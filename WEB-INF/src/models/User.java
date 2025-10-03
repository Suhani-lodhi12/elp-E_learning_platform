package models;

import java.util.*;
import java.sql.*;
import java.sql.Date;

import org.jasypt.util.password.StrongPasswordEncryptor;

import utils.DBConnect;

public class User {

    private Integer userId;
    private String name;
    private String email;
    private String aboutMe;
    private String password;
    private String profilePic;
    private String phone;
    private Date dob;
    private String gender;
    private Status status;
    private Timestamp createdOn;
    private Country country;
    private UserType userType;

    static StrongPasswordEncryptor spe = new StrongPasswordEncryptor();

    

    public User(Integer userId) {
        this.userId = userId;
    }

    public User(String name, String email, String password, Country country, String phone, UserType userType) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.country = country;
        this.phone = phone;
        this.userType = userType;
    }

    public User(String name, String email, String password, Country country, String phone, Timestamp createdOn,
            UserType userType) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.country = country;
        this.phone = phone;
        this.createdOn = createdOn;
        this.userType = userType;
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }


    //-----------
    public static User getUserById(int userId) {
        User user = null;
        try {
            Connection con = DBConnect.getConnection();
            String query = "SELECT email, password FROM users WHERE user_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
    
            if (rs.next()) {
                user = new User(rs.getString("email"), rs.getString("password")); 
                user.setUserId(userId); // Assuming there's a setter method in User class
            }
    
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
    
    //-----------

    public boolean updateUserTypeId(){
         boolean flag = false;
        try{
            Connection con = DBConnect.getConnection();

            String query = "update users set user_type_id=1 where user_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,userId);

            int res = ps.executeUpdate();

            if (res == 1)
                flag = true;
            
        } catch(SQLException e){
            e.printStackTrace();
        }
        return flag;
    }

    public void signinUser() {
        status = new Status(-1);  // -1 = no account with the given email...
        try {
            Connection con = DBConnect.getConnection();

            String query = "select * from users where email=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            System.out.println(ps);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                if(spe.checkPassword(password, rs.getString("password"))); {

                    userId = rs.getInt("user_id");
                    name = rs.getString("name");
                    aboutMe = rs.getString("about_me");
                    profilePic = rs.getString("profile_pic");
                    phone = rs.getString("phone");
                    dob = rs.getDate("dob");
                    gender = rs.getString("gender");
                    status = new Status(rs.getInt("status_id"));
                    createdOn = rs.getTimestamp("created_on");                 
                    country = new Country(rs.getInt("country_id"));
                    userType = new UserType(rs.getInt("user_type_id"));

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean saveUser() {
        boolean flag = false;

        try {
            Connection con = DBConnect.getConnection();
            if (con != null) {
                String query = "insert into users (name,email,password,phone,country_id,user_type_id,created_on) value (?,?,?,?,?,?,?)";

                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, spe.encryptPassword(password));
                ps.setString(4, phone);
                ps.setInt(5, country.getCountryId());
                ps.setInt(6, userType.getUserTypeId());
                ps.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
                int res = ps.executeUpdate();

                if (res == 1)
                    flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flag;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setAboutMe(String aboutMe) {
        this.aboutMe = aboutMe;
    }

    public String getAboutMe() {
        return aboutMe;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public void setProfilePic(String profilePic) {
        this.profilePic = profilePic;
    }

    public String getProfilePic() {
        return profilePic;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPhone() {
        return phone;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public Date getDob() {
        return dob;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getGender() {
        return gender;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Status getStatus() {
        return status;
    }

    public void setCreatedOn(Timestamp createdOn) {
        this.createdOn = createdOn;
    }

    public Timestamp getCreatedOn() {
        return createdOn;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    public Country getCountry() {
        return country;
    }

    public void setUserType(UserType userType) {
        this.userType = userType;
    }

    public UserType getUserType() {
        return userType;
    }

}
