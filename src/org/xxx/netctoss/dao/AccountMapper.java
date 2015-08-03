package org.xxx.netctoss.dao;

import org.xxx.netctoss.annotation.MyBatisRepository;
import org.xxx.netctoss.entity.Account;
import org.xxx.netctoss.vo.AccountPage;

import java.util.List;

/**
 * Created by JEWELZ on 19/6/15.
 */
@MyBatisRepository
public interface AccountMapper {
    List<Account> findByCondition(AccountPage page);

    int findRows(AccountPage page);

    Account findById(int id);

    void setStatus(Account account);

    void deleteById(int id);

    void deleteServicesByAccountId(int id);

    void updateAccount(Account account);

    void save(Account account);

    Account findByIdCardNo(String idcard_no);

}
