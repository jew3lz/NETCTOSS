package org.xxx.netctoss.dao;

import org.xxx.netctoss.annotation.MyBatisRepository;
import org.xxx.netctoss.entity.Admin;
import org.xxx.netctoss.entity.Privilege;
import org.xxx.netctoss.vo.AdminInfoPage;

import java.util.List;
import java.util.Map;

/**
 * Created by JEWELZ on 16/6/15.
 */
@MyBatisRepository
public interface AdminMapper {
    Admin findByCode(String admin_code);

    List<Admin> findByCondition(AdminInfoPage adminInfoPage);

    List<Admin> findByPage(AdminInfoPage adminInfoPage);

    void save(Admin admin);

    void saveAdminRoles(Map<String, Object> map);

    Admin findById(int id);

    void deleteAdminRoles(int id);

    void updateAdmin(Admin admin);

    void deleteAdmin(int id);

    List<Privilege> findPrivilegesByAdmin(int id);
}
