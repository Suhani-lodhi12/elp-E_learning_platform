package models;

public class UserType {

    private Integer userTypeId;
    private String name; 

    public UserType() {
        super();
    }

    public UserType(Integer userTypeId, String name) {
        super();

        this.userTypeId = userTypeId;
        this.name = name;
    }
    
    public UserType(Integer userTypeId) {
        super();

        this.userTypeId = userTypeId;
    }

    public void setUserTypeId(Integer userTypeId) {
        this.userTypeId = userTypeId;
    }
    
    public Integer getUserTypeId() {
        return userTypeId;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public String getName() {
        return name;
    }
}