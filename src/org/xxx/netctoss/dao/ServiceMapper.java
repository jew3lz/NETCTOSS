package org.xxx.netctoss.dao;

import org.xxx.netctoss.annotation.MyBatisRepository;
import org.xxx.netctoss.entity.Service;
import org.xxx.netctoss.vo.ServiceLine;
import org.xxx.netctoss.vo.ServicePage;

import java.util.List;

/**
 * Created by JEWELZ on 23/6/15.
 */
@MyBatisRepository
public interface ServiceMapper {

    List<ServiceLine> findByCondition(ServicePage page);

    int findRows(ServicePage page);

    void save(Service service);

}
