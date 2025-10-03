package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.TreeSet;



import utils.DBConnect;

public class Country implements Comparable<Country> {

    private Integer countryId;
    private String country;
    private String flag;
    private Integer countryCode;

    public Country() {

    }

    public Country(Integer countryId, String country, String flag, Integer countryCode) {
        this.countryId = countryId;
        this.country = country;
        this.flag = flag;
        this.countryCode = countryCode;
    }

    public Country(Integer countryId) {
        this.countryId = countryId;
    }

    public int compareTo(Country ct) {
        return this.country.compareTo(ct.country);
    }

    public static TreeSet<Country> collectCountries() {
        TreeSet<Country> countries = new TreeSet<>();
        System.out.println(countries);

        try {
            Connection con = DBConnect.getConnection();
            String query = "select * from countries";

            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                countries.add(new Country(rs.getInt("country_id"),rs.getString("country"),rs.getString("flag"),rs.getInt("country_code")));
            } 

            con.close();
        } catch(SQLException e) {
            e.printStackTrace();
        } 

        return countries;
    }

    public void setCountryId(Integer countryId) {
        this.countryId = countryId;
    }
    
    public Integer getCountryId() {
        return countryId;
    }

    public void setName(String country) {
        this.country = country;
    }
    
    public String getCountry() {
        return country;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }
    
    public String getFlag() {
        return flag;
    }

    public void setCountryCode(Integer countryCode) {
        this.countryCode = countryCode;
    }
    
    public Integer getCountryCode() {
        return countryCode;
    }
}