/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p1;
import java.sql.*;
/**
 *
 * @author AKSHAY SRIVASTAVA
 */
public class insert {
    private String username;
    private String confirm_password;
    private String security_question;
    private String security_answer;
    private String gender;
    private String maritial;
    private String date_of_birth;
    private String occupation;
    private String email;
    private String mobile;
    private String nationality;
    private String address;
    private String state;
    private String city;
    private String zipcode;
    private String country;

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the confirm_confirm_password
     */
    public String getConfirm_password() {
        return confirm_password;
    }

    /**
     * @param confirm_password the confirm_password to set
     */
    public void setConfirm_Password(String confirm_password) {
        this.confirm_password = confirm_password;
    }

    /**
     * @return the security_question
     */
    public String getSecurity_question() {
        return security_question;
    }

    /**
     * @param security_question the security_question to set
     */
    public void setSecurity_question(String security_question) {
        this.security_question = security_question;
    }

    /**
     * @return the security_answer
     */
    public String getSecurity_answer() {
        return security_answer;
    }

    /**
     * @param security_answer the security_answer to set
     */
    public void setSecurity_answer(String security_answer) {
        this.security_answer = security_answer;
    }

    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * @return the maritial
     */
    public String getmaritial() {
        return maritial;
    }

    /**
     * @param maritial the maritial to set
     */
    public void setmaritial(String maritial) {
        this.maritial = maritial;
    }

    /**
     * @return the date_of_birth
     */
    public String getDate_of_birth() {
        return date_of_birth;
    }

    /**
     * @param date_of_birth the date_of_birth to set
     */
    public void setDate_of_birth(String date_of_birth) {
        this.date_of_birth = date_of_birth;
    }

    /**
     * @return the occupation
     */
    public String getOccupation() {
        return occupation;
    }

    /**
     * @param occupation the occupation to set
     */
    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the mobile
     */
    public String getMobile() {
        return mobile;
    }

    /**
     * @param mobile the mobile to set
     */
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    /**
     * @return the nationality
     */
    public String getNationality() {
        return nationality;
    }

    /**
     * @param nationality the nationality to set
     */
    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the state
     */
    public String getState() {
        return state;
    }

    /**
     * @param state the state to set
     */
    public void setState(String state) {
        this.state = state;
    }

    /**
     * @return the city
     */
    public String getCity() {
        return city;
    }

    /**
     * @param city the city to set
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * @return the zipcode
     */
    public String getZipcode() {
        return zipcode;
    }

    /**
     * @param zipcode the zipcode to set
     */
    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }
    
    public Boolean Insert()
    {
        Boolean b=false;
        try
        {
            
        int i=0;
        Connection con=ConnectionClass.getConnection();
        PreparedStatement pst=con.prepareStatement("insert into login values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        pst.setString(1,getUsername());
        pst.setString(2,getConfirm_password());
        pst.setString(3,getSecurity_question());
        pst.setString(4,getSecurity_answer());
        pst.setString(5,getGender());
        pst.setString(6,getmaritial());
        pst.setString(7,getDate_of_birth());
        pst.setString(8,getOccupation());
        pst.setString(9,getEmail());
        pst.setString(10,getMobile());
        pst.setString(11,getNationality());
        pst.setString(12,getAddress());
        pst.setString(13,getCountry());
        pst.setString(14,getState());
        pst.setString(15,getCity());
        pst.setString(16,getZipcode());
        i+=pst.executeUpdate();
        
        if(i>0)
        {
            b=true;
        }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return b;
        }

    /**
     * @return the country
     */
    public String getCountry() {
        return country;
    }

    /**
     * @param country the country to set
     */
    public void setCountry(String country) {
        this.country = country;
    }
        
    }
 
