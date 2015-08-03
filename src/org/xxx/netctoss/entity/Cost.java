package org.xxx.netctoss.entity;

import java.io.Serializable;
import java.sql.Date;

/**
 * Created by JEWELZ on 15/6/15.
 */
public class Cost implements Serializable {
    //TODO Validator
    private Integer cost_id;
    private String name;
    private Integer base_duration;
    private Double base_cost;
    private Double unit_cost;
    private String status;
    private String descr;
    private Date creatime;
    private Date startime;
    private String cost_type;

    @Override
    public String toString() {
        return "Cost{" +
                "cost_id=" + cost_id +
                ", name='" + name + '\'' +
                ", base_duration=" + base_duration +
                ", base_cost=" + base_cost +
                ", unit_cost=" + unit_cost +
                ", status='" + status + '\'' +
                ", descr='" + descr + '\'' +
                ", creatime=" + creatime +
                ", startime=" + startime +
                ", cost_type='" + cost_type + '\'' +
                '}';
    }

    public Cost() {
    }

    public Cost(Integer cost_id, String name, Integer base_duration, Double base_cost, Double unit_cost, String status, String descr, Date creatime, Date startime, String cost_type) {
        this.cost_id = cost_id;
        this.name = name;
        this.base_duration = base_duration;
        this.base_cost = base_cost;
        this.unit_cost = unit_cost;
        this.status = status;
        this.descr = descr;
        this.creatime = creatime;
        this.startime = startime;
        this.cost_type = cost_type;
    }

    public Integer getCost_id() {
        return cost_id;
    }

    public void setCost_id(Integer cost_id) {
        this.cost_id = cost_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getBase_duration() {
        return base_duration;
    }

    public void setBase_duration(Integer base_duration) {
        this.base_duration = base_duration;
    }

    public Double getBase_cost() {
        return base_cost;
    }

    public void setBase_cost(Double base_cost) {
        this.base_cost = base_cost;
    }

    public Double getUnit_cost() {
        return unit_cost;
    }

    public void setUnit_cost(Double unit_cost) {
        this.unit_cost = unit_cost;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public Date getCreatime() {
        return creatime;
    }

    public void setCreatime(Date creatime) {
        this.creatime = creatime;
    }

    public Date getStartime() {
        return startime;
    }

    public void setStartime(Date startime) {
        this.startime = startime;
    }

    public String getCost_type() {
        return cost_type;
    }

    public void setCost_type(String cost_type) {
        this.cost_type = cost_type;
    }
}
