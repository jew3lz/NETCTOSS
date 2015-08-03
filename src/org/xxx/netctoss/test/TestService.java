package org.xxx.netctoss.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.xxx.netctoss.dao.ServiceMapper;
import org.xxx.netctoss.vo.ServiceLine;
import org.xxx.netctoss.vo.ServicePage;

import java.util.List;

/**
 * Created by JEWELZ on 23/6/15.
 */
public class TestService {
    ApplicationContext context = new ClassPathXmlApplicationContext("org/xxx/netctoss/config/spring-config.xml");
    //    CostMapper costMapper = context.getBean("costMapper", CostMapper.class);
    ServiceMapper Mapper = context.getBean("serviceMapper", ServiceMapper.class);

    @org.junit.Test
    public void test() {
        ServicePage page = new ServicePage();
        page.setOs_username("*");
        page.setIdcard_no("330682196903190613");
        page.setUnix_host("*");
        page.setStatus("1");
        page.setPage(1);
        List<ServiceLine> lines = Mapper.findByCondition(page);
        for (ServiceLine line : lines) {
            System.out.println(line.getId() + " " + line.getAccount_id() + " " + line.getIdcard_no() + " " + line.getCost_descr() + " " + line.getOs_username());
        }
    }
}
