package org.xxx.netctoss.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.xxx.netctoss.dao.UserMapper;
import org.xxx.netctoss.entity.Admin;

/**
 * Created by JEWELZ on 24/6/15.
 */
public class TestUser {
    ApplicationContext context = new ClassPathXmlApplicationContext("org/xxx/netctoss/config/spring-config.xml");
    UserMapper Mapper = context.getBean("userMapper", UserMapper.class);

    @org.junit.Test
    public void test() {
        Admin admin = Mapper.findByName("bbb");
        admin.setTelephone("2333333");
        Mapper.update(admin);
    }
}
