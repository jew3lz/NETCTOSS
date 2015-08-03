package org.xxx.netctoss.vo;

/**
 * Created by JEWELZ on 16/6/15.
 */
public class Page {
    //页数,默认1
    private Integer page = 1;
    //页面数据量,默认3
    private Integer pageSize = 3;
    //最大页数,默认1
    private Integer totalPage = 1;


    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    @Override
    public String toString() {
        return "Page{" +
                "page=" + page +
                ", pageSize=" + pageSize +
                '}';
    }

    //利用page和pageSize计算Begin起点和End结束点
    public Integer getBegin() {
        return (page - 1) * pageSize;
    }

    public Integer getEnd() {
        return page * pageSize + 1;
    }

    public Page() {
    }

    public Page(Integer page, Integer pageSize) {
        this.page = page;
        this.pageSize = pageSize;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }
}
