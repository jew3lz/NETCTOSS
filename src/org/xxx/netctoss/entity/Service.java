package org.xxx.netctoss.entity;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

/**
 * Created by JEWELZ on 23/6/15.
 */
public class Service implements Serializable {
    private Integer id;
    private Integer account_id;
    private String unix_host;
    private String os_username;
    private String login_passwd;
    private String status;
    private Timestamp create_date;
    private Date pause_date;
    private Date close_date;
    private Integer cost_id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAccount_id() {
        return account_id;
    }

    public void setAccount_id(Integer account_id) {
        this.account_id = account_id;
    }

    public String getUnix_host() {
        return unix_host;
    }

    public void setUnix_host(String unix_host) {
        this.unix_host = unix_host;
    }

    public String getOs_username() {
        return os_username;
    }

    public void setOs_username(String os_username) {
        this.os_username = os_username;
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

    public Timestamp getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Timestamp create_date) {
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

    public Integer getCost_id() {
        return cost_id;
    }

    public void setCost_id(Integer cost_id) {
        this.cost_id = cost_id;
    }
}
