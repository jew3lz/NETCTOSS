package org.xxx.netctoss.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.xxx.netctoss.dao.AdminMapper;
import org.xxx.netctoss.entity.Admin;
import org.xxx.netctoss.entity.Privilege;
import org.xxx.netctoss.entity.PrivilegeReader;
import org.xxx.netctoss.vo.AdminInfoPage;

import java.util.List;

/**
 * Created by JEWELZ on 24/6/15.
 */
public class TestAdminInfo {
    ApplicationContext context = new ClassPathXmlApplicationContext("org/xxx/netctoss/config/spring-config.xml");
    AdminMapper Mapper = context.getBean("adminMapper", AdminMapper.class);

    @org.junit.Test
    public void test() {
        AdminInfoPage page = new AdminInfoPage();
        page.setPriId(-1);
        page.setRoleName("*");
        page.setPage(1);
        List<Admin> lines = Mapper.findByPage(page);
        for (Admin line : lines) {
//            System.out.println(line);
        }

        List<Privilege> list = PrivilegeReader.getModules();
        for (Privilege privilege : list) {
            System.out.println(privilege.getId() + " *** " +privilege.getName());
        }
        for (Privilege privilege : list) {
            privilege.setUrls(PrivilegeReader.getUrlsById(privilege.getId()));
        }
        for (Privilege privilege : list) {
//            System.out.println(privilege.getId() +" "+privilege.getName() + " " + privilege.getUrls());
        }

    }
}
