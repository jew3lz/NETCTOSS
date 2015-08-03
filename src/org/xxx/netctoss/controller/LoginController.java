package org.xxx.netctoss.controller;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.xxx.netctoss.dao.AdminMapper;
import org.xxx.netctoss.entity.Admin;
import org.xxx.netctoss.entity.Privilege;
import org.xxx.netctoss.entity.PrivilegeReader;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 * Created by JEWELZ on 16/6/15.
 */
@Controller
@RequestMapping("/login")

public class LoginController {
    @Resource
    private AdminMapper adminDao;

    public void setAdminDao(AdminMapper adminDao) {
        this.adminDao = adminDao;
    }

    @Transactional(readOnly = true)
    @RequestMapping(value = "/toLogin", method = RequestMethod.GET)
    public String toLogin() {
        return "login";
    }

    @RequestMapping("/logOut")
    public String logOut(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/login/toLogin";
    }

    @Transactional(readOnly = true)
    @RequestMapping(value = "/login/{code}", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> login(@PathVariable("code") String code, @RequestHeader("name") String name,
                                     @RequestHeader("passwd") String passwd, Model model, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        map.put("login", false);//标示登陆失败
        //检查验证码
        String scode = (String) session.getAttribute("scode");
        if (!code.toUpperCase().equals(scode)) {
            map.put("code_error", "验证码错误");
            System.out.println(map);
            return map;
        }
        //检查账号密码
        Admin admin = adminDao.findByCode(name);
        List<Privilege> privileges = adminDao.findPrivilegesByAdmin(admin.getAdmin_id());
        for (Privilege privilege : privileges) {
            privilege.setUrls(PrivilegeReader.getUrlsById(privilege.getId()));
        }
        if (admin != null && passwd.equals(admin.getPassword())) {
            //放入当前操作者
            System.out.println("login success");
            session.setAttribute("user", name);
            session.setAttribute("privileges", privileges);
            map.put("login", true);
            return map;
        } else {
            map.put("error", "用户名或密码不正确");
            return map;
        }
    }

    @RequestMapping(value = "/nopower")
    public String noPower() {
        return "nopower";
    }

    @RequestMapping(value = "/toIndex")
    public String toIndex() {
        return "index";
    }

    @RequestMapping(value = "/getCode", method = RequestMethod.GET)
    public void getCode(HttpServletResponse response, HttpSession session) throws IOException {
        //0.创建空白图片
        BufferedImage image = new BufferedImage(100, 30, BufferedImage.TYPE_INT_RGB);
        //1.获取图片画笔
        Graphics g = image.getGraphics();
        Random r = new Random();
        //2.设置画笔颜色
        g.setColor(new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255)));
        //3.绘制矩形的背景
        g.fillRect(0, 0, 100, 30);
        //4.调用自定义的方法,获取长度为5的字母组合的字符串
        String number = getNumber(5);
        session.setAttribute("scode", number);
        g.setColor(new Color(0, 0, 0));
        g.setFont(new Font(null, Font.BOLD, 24));
        //5.设置画笔颜色后,绘制字符表
        g.drawString(number, 5, 25);
        //6.绘制8条干扰线
        for (int i = 0; i < 8; i++) {
            g.setColor(new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255), r.nextInt(255)));
            g.drawLine(r.nextInt(100), r.nextInt(30), r.nextInt(100), r.nextInt(30));
        }
        response.setContentType("image/jpeg");
        OutputStream os = response.getOutputStream();
        ImageIO.write(image, "jpeg", os);
        os.close();
    }

    private String getNumber(int size) {
        String str = "ABCDEFGHIJKLMNOPQRSTUVWXZY0123456789";
        String number = "";
        Random r = new Random();
        for (int i = 0; i < size; i++) {
            number += str.charAt(r.nextInt(str.length()));
        }
        return number;
    }
}
