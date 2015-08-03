package org.xxx.netctoss.entity;

import java.io.Serializable;
import java.util.List;

/**
 * Created by JEWELZ on 17/6/15.
 */
public class Role implements Serializable {
    private Integer role_id;
    private String name;
    //追加关联属性.用于存储相关联的Role_Privilege表记录
    private List<RolePrivilege> pris;

    //追加一个属性,用于存贮Role的priIds
    private List<Integer> priIds;

    public List<Integer> getPriIds() {
        return priIds;
    }

    public void setPriIds(List<Integer> priIds) {
        this.priIds = priIds;
    }

    //追加根据pris权限ID信息返回权限名,可以${role.prisName}
    public String getPrisName() {
        String name = "";
        for (RolePrivilege rp : pris) {
            Integer pid = rp.getPrivilege_id();
            name += PrivilegeReader.getModuleNameById(pid + "");
            name += ",";
        }
        name = name.substring(0, name.length() - 1);
        return name;
    }

    @Override
    public String toString() {
        return "Role{" +
                "role_id=" + role_id +
                ", name='" + name + '\'' +
                ", pris=" + pris +
                '}';
    }

    public List<RolePrivilege> getPris() {
        return pris;
    }

    public void setPris(List<RolePrivilege> pris) {
        this.pris = pris;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getRole_id() {

        return role_id;
    }

    public void setRole_id(Integer role_id) {
        this.role_id = role_id;
    }
}
