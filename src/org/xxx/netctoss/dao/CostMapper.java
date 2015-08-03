package org.xxx.netctoss.dao;

import org.xxx.netctoss.annotation.MyBatisRepository;
import org.xxx.netctoss.entity.Cost;
import org.xxx.netctoss.vo.Page;

import java.util.List;

/**
 * Created by JEWELZ on 15/6/15.
 */
@MyBatisRepository
public interface CostMapper {
    List<Cost> findAll();

    void deleteCost(int cost_id);

    void addCost(Cost cost);

    Cost findById(int cost_id);

    void updateCost(Cost cost_id);

    void startCost(int cost_id);

    List<Cost> findPage(Page page);

    int findRows();

    Cost findByName(String name);
}
