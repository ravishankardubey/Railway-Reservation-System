/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p1;


import java.sql.*;



public class Login_Create_Logic {

    private String userid;
    private String pass;

    private String username;
    private String f_name;
    private String l_name;
    private String gender;
    private String email;
    private String mob;
    private String dob;
    private String marital;
    private String security_que;
    private String security_ans;
    private String address;
    private String city;
    private String state;
    private String zipcode;
    private String password;

    
    public boolean login() {
        boolean rtn = false;
        try {

            Connection con = ConnectionPool.getConnect();
            Statement stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select password from login where user_name='" + userid + "'");
            rs.next();
            if (rs.getString(1).equals(pass)) {
                rtn = true;
            }

            /*
             while (rs.next()) {

             if (rs.getString(1).equals(request.getParameter("username"))) {
             flag = 1;
             }
             }

             if (flag == 1) {
             ResultSet rs1 = stmt.executeQuery("select password from login where user_name='" + request.getParameter("username") + "'");
             rs1.next();

             if (rs1.getString("password").equals(request.getParameter("password"))) {
             flag = 0;
             }
             if (flag == 0) {
             RequestDispatcher rd1 = request.getRequestDispatcher("Fetch");
             rd1.forward(request, response);
             }
             if (flag == 1) {
             request.setAttribute("msg_login", "password didn't match");
             RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
             rd1.forward(request, response);
             }
             } else {
             request.setAttribute("msg_login", "Invalid Username");
             RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
             rd1.forward(request, response);

             }
             */
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return rtn;
        }
    }

    public boolean create_account() {
        boolean rtn = false;
        try {
            int flag = 0;
            int i=0,j=0;
            Connection con = ConnectionPool.getConnect();
            Statement stmt = con.createStatement();

            ResultSet rs = stmt.executeQuery("select user_name from login");
            while (rs.next()) {
                if (username.equals(rs.getString(1))) {
                    flag = 1;
                }
            }
            if (flag == 1) {
                rtn = false;
            }
            if (flag == 0) {
                
                //logic to create acc here
                i = stmt.executeUpdate("insert into login values('" + username + "','" +getPassword()+ "')");
                    if (i > 0) {
                        j = stmt.executeUpdate("insert into userdetails values('"+username+"','"+f_name+"','"+l_name+"','"+gender+"','"+email+"',"+mob+",'"+marital+"','"+security_que+"','"+security_ans+"','"+address+"','"+city+"','"+state+"',"+zipcode+")");
                        if (j > 0) {
                            rtn=true;
                        }
                    }
                    else{
                    rtn=false;
                    }
                

            }

        } catch (Exception e) {

            e.printStackTrace();
        } finally {
            return rtn;
        }

    }

    /**
     * @return the userid
     */
    public String getUserid() {
        return userid;
    }

    /**
     * @param userid the userid to set
     */
    public void setUserid(String userid) {
        this.userid = userid;
    }

    /**
     * @return the pass
     */
    public String getPass() {
        return pass;
    }

    /**
     * @param pass the pass to set
     */
    public void setPass(String pass) {
        this.pass = pass;
    }

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
     * @return the f_name
     */
    public String getF_name() {
        return f_name;
    }

    /**
     * @param f_name the f_name to set
     */
    public void setF_name(String f_name) {
        this.f_name = f_name;
    }

    /**
     * @return the l_name
     */
    public String getL_name() {
        return l_name;
    }

    /**
     * @param l_name the l_name to set
     */
    public void setL_name(String l_name) {
        this.l_name = l_name;
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
     * @return the mob
     */
    public String getMob() {
        return mob;
    }

    /**
     * @param mob the mob to set
     */
    public void setMob(String mob) {
        this.mob = mob;
    }

    /**
     * @return the dob
     */
    public String getDob() {
        return dob;
    }

    /**
     * @param dob the dob to set
     */
    public void setDob(String dob) {
        this.dob = dob;
    }

    /**
     * @return the marital
     */
    public String getMarital() {
        return marital;
    }

    /**
     * @param marital the marital to set
     */
    public void setMarital(String marital) {
        this.marital = marital;
    }

    /**
     * @return the security_que
     */
    public String getSecurity_que() {
        return security_que;
    }

    /**
     * @param security_que the security_que to set
     */
    public void setSecurity_que(String security_que) {
        this.security_que = security_que;
    }

    /**
     * @return the security_ans
     */
    public String getSecurity_ans() {
        return security_ans;
    }

    /**
     * @param security_ans the security_ans to set
     */
    public void setSecurity_ans(String security_ans) {
        this.security_ans = security_ans;
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

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

}
