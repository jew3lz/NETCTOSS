package org.xxx.netctoss.dao;

import org.xxx.netctoss.annotation.MyBatisRepository;
import org.xxx.netctoss.entity.Admin;

/**
 * Created by JEWELZ on 19/6/15.
 */
@MyBatisRepository
public interface UserMapper {

    Admin findByName(String name);

    void update(Admin admin);

    void changePwd(Admin admin);

}
