package org.xxx.netctoss.controller;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xxx.netctoss.dao.UserMapper;
import org.xxx.netctoss.entity.Admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by JEWELZ on 2/8/15.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    UserMapper userDao;

    @Transactional(readOnly = true)
    @RequestMapping(value = "/info", method = RequestMethod.GET)
    public String userInfo(HttpSession session, Model model) {
        String name = (String) session.getAttribute("user");
        Admin admin = userDao.findByName(name);
        model.addAttribute("admin", admin);
        return "/user/user_info";
    }


    @Transactional
    @RequestMapping("/{id}/update")
    public String update(@PathVariable int id, Admin admin) {
        System.out.println(admin);
        admin.setAdmin_id(id);
        userDao.update(admin);

        return "redirect:/login/toIndex";
    }

    @Transactional(readOnly = true)
    @RequestMapping("/checkPwd/{pwd}")
    @ResponseBody
    public boolean checkPwd(@PathVariable("pwd") String pwd, HttpSession session) {
        Admin admin = userDao.findByName((String) session.getAttribute("user"));
        if (pwd.equals(admin.getPassword()))
            return true;
        else
            return false;
    }

    @RequestMapping("/toChangePwd")
    public String toChangePwd() {
        return "user/user_modi_pwd";
    }

    @Transactional
    @RequestMapping("/changePwd/{pwd}")
    public String changePwd(@PathVariable("pwd") String pwd, HttpSession session) {
        Admin admin = userDao.findByName((String) session.getAttribute("user"));
        admin.setPassword(pwd);
        userDao.changePwd(admin);
        return "redirect:/login/toIndex";
    }
}
