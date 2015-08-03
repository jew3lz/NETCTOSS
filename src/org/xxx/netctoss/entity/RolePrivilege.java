package org.xxx.netctoss.entity;

import java.io.Serializable;

/**
 * Created by JEWELZ on 17/6/15.
 */
public class RolePrivilege implements Serializable {
    private Integer role_id;
    private Integer privilege_id;

    @Override
    public String toString() {
        return "RolePrivilege{" +
                "role_id=" + role_id +
                ", privilege_id=" + privilege_id +
                '}';
    }

    public Integer getRole_id() {
        return role_id;
    }

    public void setRole_id(Integer role_id) {
        this.role_id = role_id;
    }

    public Integer getPrivilege_id() {
        return privilege_id;
    }

    public void setPrivilege_id(Integer privilege_id) {
        this.privilege_id = privilege_id;
    }
}
