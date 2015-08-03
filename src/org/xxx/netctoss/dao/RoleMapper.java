package org.xxx.netctoss.dao;

import org.xxx.netctoss.annotation.MyBatisRepository;
import org.xxx.netctoss.entity.Role;
import org.xxx.netctoss.entity.RolePrivilege;
import org.xxx.netctoss.vo.Page;

import java.util.List;

/**
 * Created by JEWELZ on 17/6/15.
 */
@MyBatisRepository
public interface RoleMapper {
    List<Role> findAll();

    List<Role> findPage(Page page);

    void addRole(Role role);

    void addRolePrivilege(RolePrivilege rolePrivilege);

    Role findById(int id);

    List<Integer> findPrivilegeIdByRoleId(int id);

    void updateRole(Role role);

    void deletePrivilegeByRoleId(int id);

    int findRows();
}
