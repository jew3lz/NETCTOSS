package org.xxx.netctoss.controller;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.xxx.netctoss.dao.RoleMapper;
import org.xxx.netctoss.entity.Privilege;
import org.xxx.netctoss.entity.PrivilegeReader;
import org.xxx.netctoss.entity.Role;
import org.xxx.netctoss.entity.RolePrivilege;
import org.xxx.netctoss.vo.Page;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by JEWELZ on 17/6/15.
 */
@Controller
@RequestMapping("/role")
public class RoleController {
    @Resource
    private RoleMapper roleDao;

    @RequestMapping(value = "/list/{pageNum}", method = RequestMethod.GET)
    @Transactional(readOnly = true)
    public String listRole(@PathVariable("pageNum") int pageNum, Model model) {
        Page page = new Page();
        System.out.println("into role");
        page.setPage(pageNum);
        int totalPage;
        int totalRows = roleDao.findRows();
        if (totalRows % page.getPageSize() == 0)
            totalPage = totalRows / page.getPageSize();
        else
            totalPage = totalRows / page.getPageSize() + 1;
        page.setTotalPage(totalPage);
        List<Role> list = roleDao.findPage(page);
        model.addAttribute("roles", list);
        model.addAttribute("page", page);
        return "role/role_list";
    }

    @RequestMapping(value = "/toAdd", method = RequestMethod.GET)
    @Transactional(readOnly = true)
    public String toAdd(Model model) {
        //获取privileges.xml中的权限信息
        List<Privilege> list = PrivilegeReader.getModules();
        model.addAttribute("pris", list);
        return "role/role_add";
    }
    @Transactional
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(@RequestParam("name") String name, @RequestParam("pri") Integer[] priIds) {
        //插入Role表
        Role role = new Role();
        role.setName(name);
        roleDao.addRole(role);
        //插入ROLE_PRIVILEGES表
        for (Integer priId : priIds) {
            RolePrivilege rolePrivilege = new RolePrivilege();
            //RoleMap.xml中定义自动主键会自动返回主键,这里直接调用
            rolePrivilege.setRole_id(role.getRole_id());
            rolePrivilege.setPrivilege_id(priId);
            roleDao.addRolePrivilege(rolePrivilege);
        }
        return "redirect:/role/list/1";
    }
    @Transactional(readOnly = true)
    @RequestMapping(value = "/{id}/toUpdate", method = RequestMethod.GET)
    public String toUpdate(@PathVariable("id") Integer id, Model model) {
        //加载Role信息
        Role role = roleDao.findById(id);
        List<Integer> pri_list = roleDao.findPrivilegeIdByRoleId(id);
        role.setPriIds(pri_list);
        model.addAttribute("role", role);
        return "role/role_modi";
    }

    @ModelAttribute("pris")
    @Transactional
    //该标记方法在toUpdate操作前执行,相当于model.addAttribute("pris",list)
    public List<Privilege> loadPrivileges() {
        //提取权限信息,用于生成checkBoxes
        return PrivilegeReader.getModules();
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    @Transactional
    public String update(@PathVariable("id") Integer id, @RequestParam("name") String name,
                         @RequestParam("priIds") Integer[] priIds) {
        //更新ROLE_INFO的NAME字段
        Role role = new Role();
        role.setRole_id(id);
        role.setName(name);
        roleDao.updateRole(role);
        //更新role_id对应的privilege_id,在ROLE_PRIVILEGE表中,首先删除对应关系
        roleDao.deletePrivilegeByRoleId(id);
        //然后再添加对应关系
        for (Integer priId : priIds) {
            RolePrivilege rolePrivilege = new RolePrivilege();
            rolePrivilege.setRole_id(id);
            rolePrivilege.setPrivilege_id(priId);
            roleDao.addRolePrivilege(rolePrivilege);
        }
        return "redirect:/role/list/1";
    }
}