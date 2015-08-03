package org.xxx.netctoss.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.xxx.netctoss.dao.RoleMapper;
import org.xxx.netctoss.entity.Role;
import org.xxx.netctoss.entity.RolePrivilege;

import java.util.List;

/**
 * Created by JEWELZ on 15/6/15.
 */
public class TestFindAll {
    ApplicationContext context = new ClassPathXmlApplicationContext("org/xxx/netctoss/config/spring-config.xml");
//    CostMapper costMapper = context.getBean("costMapper", CostMapper.class);
    RoleMapper Mapper = context.getBean("roleMapper",RoleMapper.class);

    @Test
    public void test() {
//        System.out.println(costMapper.findPage(new Page(3, 3)));
        List<Role> roles = Mapper.findAll();
        for (Role role : roles) {
            List<RolePrivilege> privileges = role.getPris();
            System.out.println(privileges+role.getPrisName());
        }
    }
}


