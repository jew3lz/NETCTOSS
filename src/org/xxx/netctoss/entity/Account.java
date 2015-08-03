package org.xxx.netctoss.entity;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

/**
 * Created by JEWELZ on 19/6/15.
 */
public class Account implements Serializable {
    private Integer id;
    private Integer recommender_id;
    private String login_name;
    private String login_passwd;
    private String status;
    private Date create_date;
    private Date pause_date;
    private Date close_date;
    private String real_name;
    private String idcard_no;
    private Date birthdate;
    private String gender;
    private String occupation;
    private String telephone;
    private String email;
    private String mailaddress;
    private String zipcode;
    private String qq;
    //需要用到秒
    private Timestamp last_login_time;
    private String last_login_ip;

    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", recommender_id=" + recommender_id +
                ", login_name='" + login_name + '\'' +
                ", login_passwd='" + login_passwd + '\'' +
                ", status='" + status + '\'' +
                ", create_date=" + create_date +
                ", pause_date=" + pause_date +
                ", close_date=" + close_date +
                ", real_name='" + real_name + '\'' +
                ", idcard_no='" + idcard_no + '\'' +
                ", birthdate=" + birthdate +
                ", gender='" + gender + '\'' +
                ", occupation='" + occupation + '\'' +
                ", telephone='" + telephone + '\'' +
                ", email='" + email + '\'' +
                ", mailaddress='" + mailaddress + '\'' +
                ", zipcode='" + zipcode + '\'' +
                ", qq='" + qq + '\'' +
                ", last_login_time=" + last_login_time +
                ", last_login_ip='" + last_login_ip + '\'' +
                '}';
    }

    public Account() {
    }

    public Account(Integer id, Integer recommender_id, String login_name, String login_passwd, String status, Date create_date, Date pause_date, Date close_date, String real_name, String idcard_no, Date birthdate, String gender, String occupation, String telephone, String email, String mailaddress, String zipcode, String qq, Timestamp last_login_time, String last_login_ip) {
        this.id = id;
        this.recommender_id = recommender_id;
        this.login_name = login_name;
        this.login_passwd = login_passwd;
        this.status = status;
        this.create_date = create_date;
        this.pause_date = pause_date;
        this.close_date = close_date;
        this.real_name = real_name;
        this.idcard_no = idcard_no;
        this.birthdate = birthdate;
        this.gender = gender;
        this.occupation = occupation;
        this.telephone = telephone;
        this.email = email;
        this.mailaddress = mailaddress;
        this.zipcode = zipcode;
        this.qq = qq;
        this.last_login_time = last_login_time;
        this.last_login_ip = last_login_ip;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRecommender_id() {
        return recommender_id;
    }

    public void setRecommender_id(Integer recommender_id) {
        this.recommender_id = recommender_id;
    }

    public String getLogin_name() {
        return login_name;
    }

    public void setLogin_name(String login_name) {
        this.login_name = login_name;
    }

    public String getLogin_passwd() {
        return login_passwd;
    }

    public void setLogin_passwd(String login_passwd) {
        this.login_passwd = login_passwd;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public Date getPause_date() {
        return pause_date;
    }

    public void setPause_date(Date pause_date) {
        this.pause_date = pause_date;
    }

    public Date getClose_date() {
        return close_date;
    }

    public void setClose_date(Date close_date) {
        this.close_date = close_date;
    }

    public String getReal_name() {
        return real_name;
    }

    public void setReal_name(String real_name) {
        this.real_name = real_name;
    }

    public String getIdcard_no() {
        return idcard_no;
    }

    public void setIdcard_no(String idcard_no) {
        this.idcard_no = idcard_no;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMailaddress() {
        return mailaddress;
    }

    public void setMailaddress(String mailaddress) {
        this.mailaddress = mailaddress;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public Timestamp getLast_login_time() {
        return last_login_time;
    }

    public void setLast_login_time(Timestamp last_login_time) {
        this.last_login_time = last_login_time;
    }

    public String getLast_login_ip() {
        return last_login_ip;
    }

    public void setLast_login_ip(String last_login_ip) {
        this.last_login_ip = last_login_ip;
    }
}
