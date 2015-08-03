package org.xxx.netctoss.controller;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.xxx.netctoss.dao.CostMapper;
import org.xxx.netctoss.entity.Cost;
import org.xxx.netctoss.vo.Page;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by JEWELZ on 15/6/15.
 */
@Controller
@RequestMapping("/fee")
@SessionAttributes("page")
public class FeeController {
    @Resource
    private CostMapper costDao;

    @RequestMapping(value = "/toAdd", method = RequestMethod.GET)
    public String toAdd() {
        return "fee/fee_add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @Transactional
    //将表单参数封装乘cost对象传入,需要JSP表单中组件name属性与Cost保持一致
    public String addCost(Cost cost, HttpSession session) {
        costDao.addCost(cost);
        Page page = (Page) session.getAttribute("page");
        //调用dao.addCost方法
        return "redirect:/fee/list/" + (page == null ? 1 : page.getTotalPage());
    }

    //对应的/fee/list/1请求
    @RequestMapping(value = "/list/{pageNum}", method = RequestMethod.GET)
    @Transactional(readOnly = true)
    //默认显示第一页,一页三条
    public String listCosts(@PathVariable("pageNum") int pageNum, Model model) {
        Page page = new Page();
        page.setPage(pageNum);
        List<Cost> list = costDao.findPage(page);
        int totalPage;
        int totalRows = costDao.findRows();
        if (totalRows % page.getPageSize() == 0)
            totalPage = totalRows / page.getPageSize();
        else
            totalPage = totalRows / page.getPageSize() + 1;
        page.setTotalPage(totalPage);
        model.addAttribute("page", page);
        model.addAttribute("costs", list);
        return "fee/fee_list";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @ResponseBody
//    @Transactional(noRollbackFor = {IOException.class})
    @Transactional
    //处理AJAX
    public boolean deleteCost(@PathVariable(value = "id") Integer cost_id) {
        if (cost_id != null) costDao.deleteCost(cost_id);
        //            throw new IOException("模拟异常");
        return true;
    }

    @RequestMapping(value = "/{id}/toUpdate", method = RequestMethod.GET)
    @Transactional(readOnly = true)
    public String toUpdate(@PathVariable("id") Integer id, Model model) {
        Cost cost = costDao.findById(id);
        model.addAttribute("cost", cost);
        return "fee/fee_modi";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    @Transactional
    public String update(Cost cost, HttpSession session) {
        costDao.updateCost(cost);
        Page page = (Page) session.getAttribute("page");
        return "redirect:/fee/list/" + (page == null ? 1 : page.getPage());
    }

    @RequestMapping(value = "/{id}/startCost", method = RequestMethod.GET)
    public String startCost(@PathVariable("id") int id, HttpSession session) {
        costDao.startCost(id);
        Page page = (Page) session.getAttribute("page");
        return "redirect:/fee/list/" + (page == null ? 1 : page.getPage());
    }

    @RequestMapping("/check/{name}")
    @ResponseBody
    @Transactional(readOnly = true)
    public boolean check(@PathVariable("name") String name) {
        Cost cost = costDao.findByName(name);
        return cost == null;
    }

    @Transactional(readOnly = true)
    @RequestMapping(value = "/{id}/detail", method = RequestMethod.GET)
    public String showDetail(@PathVariable int id, Model model) {
        Cost cost = costDao.findById(id);
        model.addAttribute("cost", cost);
        return "/fee/fee_detail";
    }
}
