package org.xxx.netctoss.controller;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.xxx.netctoss.dao.AccountMapper;
import org.xxx.netctoss.dao.CostMapper;
import org.xxx.netctoss.dao.ServiceMapper;
import org.xxx.netctoss.entity.Account;
import org.xxx.netctoss.entity.Cost;
import org.xxx.netctoss.entity.Service;
import org.xxx.netctoss.vo.ServiceLine;
import org.xxx.netctoss.vo.ServicePage;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.List;

/**
 * Created by JEWELZ on 23/6/15.
 */
@RequestMapping("/service")
@Controller
public class ServiceController {
    @Resource
    private ServiceMapper serviceDao;

    @Resource
    private CostMapper costDao;

    @Resource
    private AccountMapper accountDao;

    @RequestMapping(value = "/list/{os_username}/{unix_host}/{idcard_no}/{status}/{page}", method = RequestMethod.GET)
    @Transactional(readOnly = true)
    public String service_list(@PathVariable("os_username") String os_username, @PathVariable("unix_host") String unix_host,
                               @PathVariable("idcard_no") String idcard_no, @PathVariable("status") String status,
                               @PathVariable("page") Integer p, Model model) {
        System.out.println("---------------");
        System.out.println("os_username=" + os_username);
        System.out.println("unix_host=" + unix_host);
        System.out.println("idcard_no=" + idcard_no);
        System.out.println("status=" + status);
        System.out.println("page=" + p);
        System.out.println("---------------");
        ServicePage page = new ServicePage();
        page.setOs_username(os_username);
        page.setUnix_host(unix_host);
        page.setIdcard_no(idcard_no);
        page.setStatus(status);
        page.setPage(p);
        //调用serviceDao查询
        List<ServiceLine> lines = serviceDao.findByCondition(page);
        model.addAttribute("services", lines);
        int totalPage;
        int totalRows = serviceDao.findRows(page);
        if (totalRows % page.getPageSize() == 0)
            totalPage = totalRows / page.getPageSize();
        else
            totalPage = totalRows / page.getPageSize() + 1;
        page.setTotalPage(totalPage);
        page.setOs_username(convert(os_username));
        page.setUnix_host(convert(unix_host));
        page.setIdcard_no(convert(idcard_no));
        model.addAttribute("page", page);
        return "service/service_list";
    }

    @Transactional(readOnly = true)
    @ResponseBody
    @RequestMapping(value = "/findAccount/{idcardNo}", method = RequestMethod.GET)
    public Account findAccount(@PathVariable("idcardNo") String idcard_no) {
        System.out.println(accountDao.findByIdCardNo(idcard_no));
        return accountDao.findByIdCardNo(idcard_no);
    }

    @Transactional(readOnly = true)
    @RequestMapping(value = "/toAdd", method = RequestMethod.GET)
    public String toAdd(Model model) {
        List<Cost> costs = costDao.findAll();
        model.addAttribute("costs", costs);
        return "service/service_add";
    }

    @Transactional
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(Service service) {
        service.setStatus("0");
        service.setCreate_date(new Timestamp(System.currentTimeMillis()));
        serviceDao.save(service);
        return "redirect:/service/list/*/*/*/-1/1";
    }

    public String convert(String s) {
        if ("*".equals(s))
            return "";
        else
            return s;
    }
}
