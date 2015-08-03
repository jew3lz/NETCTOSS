package org.xxx.netctoss.controller;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.xxx.netctoss.dao.AdminMapper;
import org.xxx.netctoss.dao.RoleMapper;
import org.xxx.netctoss.entity.Admin;
import org.xxx.netctoss.entity.Privilege;
import org.xxx.netctoss.entity.PrivilegeReader;
import org.xxx.netctoss.entity.Role;
import org.xxx.netctoss.vo.AdminInfoPage;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by JEWELZ on 24/6/15.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Resource
    private AdminMapper adminDao;

    @Resource
    private RoleMapper roleDao;

    @Transactional(readOnly = true)
    @RequestMapping(value = "/list/{priId}/{roleName}/{page}", method = RequestMethod.GET)
    public String adminList(@PathVariable("priId") Integer priId, @PathVariable("roleName") String roleName,
                            @PathVariable("page") Integer p, Model model) {
        System.out.println("priId=" + priId);
        System.out.println("roleName=" + roleName);
        System.out.println("page=" + p);
        AdminInfoPage page = new AdminInfoPage();
        page.setPriId(priId);
        page.setRoleName(roleName);
        page.setPage(p);
        List<Privilege> modules = PrivilegeReader.getModules();
        List<Admin> list = adminDao.findByPage(page);
        model.addAttribute("admins", list);
        model.addAttribute("modules", modules);
        model.addAttribute("page", page);
        return "admin/admin_list";
    }

    @Transactional(readOnly = true)
    @RequestMapping(value = "/toAdd", method = RequestMethod.GET)
    public String toAdd(Model model) {
        List<Role> roles = roleDao.findAll();
        model.addAttribute("roles", roles);
        return "admin/admin_add";
    }

    @Transactional
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(Admin admin) {
        admin.setEnrolldate(new Timestamp(System.currentTimeMillis()));
        System.out.println(admin);
        adminDao.save(admin);

        List<Integer> roleIds = admin.getRoleIds();
        for (Integer roleId : roleIds) {
            Map<String, Object> admin_roles = new HashMap<>();
            admin_roles.put("admin_id", admin.getAdmin_id());
            admin_roles.put("role_id", roleId);
            adminDao.saveAdminRoles(admin_roles);
        }
        return "redirect:/admin/list/-1/*/1";
    }

    @Transactional(readOnly = true)
    @RequestMapping(value = "/{id}/toUpdateAdmin", method = RequestMethod.GET)
    public String toUpdate(@PathVariable("id") int id, Model model) {
        List<Role> roles = roleDao.findAll();
        model.addAttribute("roles", roles);

        Admin admin = adminDao.findById(id);
        model.addAttribute("admin", admin);
        return "admin/admin_modi";
    }

    @Transactional
    @RequestMapping("/{id}/update")
    public String update(@PathVariable int id, Admin admin) {
        System.out.println(admin);
        admin.setAdmin_id(id);
        adminDao.updateAdmin(admin);
        adminDao.deleteAdminRoles(id);

        List<Integer> roleIds = admin.getRoleIds();
        for (Integer roleId : roleIds) {
            Map<String, Object> admin_roles = new HashMap<>();
            admin_roles.put("admin_id", admin.getAdmin_id());
            admin_roles.put("role_id", roleId);
            adminDao.saveAdminRoles(admin_roles);
        }
        return "redirect:/admin/list/-1/*/1";
    }


}
