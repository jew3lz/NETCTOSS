package org.xxx.netctoss.controller;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.xxx.netctoss.dao.AccountMapper;
import org.xxx.netctoss.entity.Account;
import org.xxx.netctoss.vo.AccountPage;
import org.xxx.netctoss.vo.Page;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by JEWELZ on 19/6/15.
 */
@Controller
@RequestMapping("/account")
@SessionAttributes("page")
public class AccountController {
    @Resource
    private AccountMapper accountDao;

    @Transactional(readOnly = true)
    @RequestMapping(value = "/account_list/{idcard_no}/{real_name}/{login_name}/{status}/{page}", method = RequestMethod.GET)
    public String account_list(@PathVariable("idcard_no") String idcard_no, @PathVariable("real_name") String real_name,
                               @PathVariable("login_name") String login_name, @PathVariable("status") String status,
                               @PathVariable("page") Integer p, Model model) {
        System.out.println("idcard_no=" + idcard_no);
        System.out.println("real_name=" + real_name);
        System.out.println("login_name=" + login_name);
        System.out.println("status=" + status);
        System.out.println("page=" + p);
        //构建查询参数对象
        AccountPage page = new AccountPage();
        page.setIdcard_no(idcard_no);
        page.setLogin_name(login_name);
        page.setReal_name(real_name);
        page.setStatus(status);
        page.setPage(p);
        //调用AccountMapper查询
        List<Account> accounts = accountDao.findByCondition(page);
        model.addAttribute("accounts", accounts);
        //分页操作
        int totalPage;
        int totalRows = accountDao.findRows(page);
        if (totalRows % page.getPageSize() == 0)
            totalPage = totalRows / page.getPageSize();
        else
            totalPage = totalRows / page.getPageSize() + 1;
        page.setTotalPage(totalPage);
        //将条件*清空
        page.setIdcard_no(convert(page.getIdcard_no()));
        page.setLogin_name(convert(page.getLogin_name()));
        page.setReal_name(convert(page.getReal_name()));
        model.addAttribute("page", page);
        return "account/account_list";
    }

    @Transactional(readOnly = true)
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String showDetail(@PathVariable int id, Model model) {
        Account account = accountDao.findById(id);
        model.addAttribute("account", account);
        return "account/account_detail";
    }

    @Transactional
    @RequestMapping(value = "/{id}/changeStatus", method = RequestMethod.GET)
    public String changeStatus(@PathVariable int id, HttpSession session) {
        Account account = accountDao.findById(id);
        if (account.getStatus().equals("0"))
            account.setStatus("1");
        else
            account.setStatus("0");
        accountDao.setStatus(account);
        Page page = (Page) session.getAttribute("page");
        return "redirect:/account/account_list/*/*/*/-1/" + (page == null ? 1 : page.getPage());
    }

    @Transactional
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public boolean delete(@PathVariable int id) {
        accountDao.deleteById(id);
        accountDao.deleteServicesByAccountId(id);
        return true;
    }

    @Transactional(readOnly = true)
    @RequestMapping(value = "/{id}/toUpdate", method = RequestMethod.GET)
    public String toUpdate(@PathVariable int id, Model model) {
        Account account = accountDao.findById(id);
        model.addAttribute("account", account);
        return "account/account_modi";
    }

    @Transactional
    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public String update(Account account, HttpSession session) {
        accountDao.updateAccount(account);
        Page page = (Page) session.getAttribute("page");
        return "redirect:/account/account_list/*/*/*/-1/" + (page == null ? 1 : page.getPage());
    }

    public String convert(String s) {
        if ("*".equals(s))
            return "";
        else
            return s;
    }

    @RequestMapping("/toAdd")
    public String toAdd() {
        return "account/account_add";
    }

    @Transactional
    @RequestMapping("/add")
    public String add(Account account, HttpSession session) {
        accountDao.save(account);
        Page page = (Page) session.getAttribute("page");
        return "redirect:/account/account_list/*/*/*/-1/" + (page == null ? 1 : page.getTotalPage());
    }

}
