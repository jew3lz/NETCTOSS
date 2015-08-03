package org.xxx.netctoss.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xxx.netctoss.annotation.MyBatisRepository;
import org.xxx.netctoss.dao.CostMapper;
import org.xxx.netctoss.entity.Cost;
import org.xxx.netctoss.vo.Page;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by JEWELZ on 17/6/15.
 */
@Controller
@MyBatisRepository
@RequestMapping("/test")
public class JSONTestController {
    @Resource
    private CostMapper costDao;

    public void setCostDao(CostMapper costDao) {
        this.costDao = costDao;
    }

    @RequestMapping("/test1")
    //JSON标记
    @ResponseBody
    public boolean f1() {
        return true;
    }

    @RequestMapping("/test2")
    @ResponseBody
    public Map<String, Object> test2() {
        Map map = new HashMap<String, Object>();
        map.put("login", false);
        map.put("error", "用户名错误");
        return map;
    }

    @RequestMapping("/test3")
    @ResponseBody
    public Cost f3() {
        Cost cost = costDao.findById(1);
        return cost;
    }

    @RequestMapping("/test4")
    @ResponseBody
    public List<Cost> f4() {
        Page page = new Page();
        List<Cost> costs = costDao.findPage(page);
        return costs;
    }
}
