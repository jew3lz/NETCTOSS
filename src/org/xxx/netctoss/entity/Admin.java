package org.xxx.netctoss.entity;

import java.sql.Timestamp;
import java.util.List;

/**
 * Created by JEWELZ on 16/6/15.
 */
public class Admin {
    private Integer admin_id;
    private String admin_code;
    private String password;
    private String name;
    private String telephone;
    private String email;
    private Timestamp enrolldate;
    //追加属性,用于存储角色,需要采用集合映射加载Role数据
    private List<Role> roles;
    //追加属性,用于存储角色ID集合
    private List<Integer> roleIds;

    public List<Integer> getRoleIds() {
        return roleIds;
    }

    public void setRoleIds(List<Integer> roleIds) {
        this.roleIds = roleIds;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    //扩展属性,用于接收请求提交验证码信息.
    private String code;

    //追加方法,JSP可以用过roleNames访问属性
    public String getRoleNames() {
        String name = "";
        for (Role role : roles) {
            name += role.getName() + ",";
        }
        name = name.substring(0, name.length() - 1);
        return name;
    }

    public Integer getAdmin_id() {
        return admin_id;
    }

    public String getName() {
        return name;
    }

    public String getTelephone() {
        return telephone;
    }

    public String getEmail() {
        return email;
    }

    public Timestamp getEnrolldate() {
        return enrolldate;
    }

    public String getCode() {
        return code;
    }

    public void setAdmin_id(Integer admin_id) {
        this.admin_id = admin_id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setEnrolldate(Timestamp enrolldate) {
        this.enrolldate = enrolldate;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "admin_id=" + admin_id +
                ", admin_code='" + admin_code + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", telephone='" + telephone + '\'' +
                ", email='" + email + '\'' +
                ", enrolldate=" + enrolldate +
                ", roles=" + roles +
                ", code='" + code + '\'' +
                '}';
    }

    public Admin() {
    }

    public Admin(Integer admin_id, String admin_code, String password, String name, String telephone, String email, Timestamp enrolldate) {
        this.admin_id = admin_id;
        this.admin_code = admin_code;
        this.password = password;
        this.name = name;
        this.telephone = telephone;
        this.email = email;
        this.enrolldate = enrolldate;
    }

    public String getAdmin_code() {
        return admin_code;
    }

    public void setAdmin_code(String admin_code) {
        this.admin_code = admin_code;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
