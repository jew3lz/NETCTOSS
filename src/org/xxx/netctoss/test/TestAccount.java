package org.xxx.netctoss.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.xxx.netctoss.dao.AccountMapper;
import org.xxx.netctoss.entity.Account;

/**
 * Created by JEWELZ on 19/6/15.
 */
public class TestAccount {
    ApplicationContext context = new ClassPathXmlApplicationContext("org/xxx/netctoss/config/spring-config.xml");
    //    CostMapper costMapper = context.getBean("costMapper", CostMapper.class);
    AccountMapper accountDao = context.getBean("accountMapper", AccountMapper.class);
//    CostMapper costMapper = context.getBean("costMapper",CostMapper.class);

    @org.junit.Test
    public void test(){
        Account account = accountDao.findById(1005);
        System.out.println(account.getStatus().getClass().getName());
        System.out.println(account.getStatus());
        if (account.getStatus() == "0")
            account.setStatus("1");
        else
            account.setStatus("0");
        accountDao.setStatus(account);
    }
//    public void test(){
//        AccountPage page = new AccountPage();
//        page.setStatus("-1");
//        page.setLogin_name("*");
//        page.setReal_name("*");
//        page.setIdcard_no("*");
////        System.out.println(page.getIdcard_no());
//        List<Account> list= Mapper.findByCondition(page);
//
//        for (Account account : list) {
////            System.out.println(account);
//        }
//        System.out.println(Mapper.findRows(page));
//    }
}
