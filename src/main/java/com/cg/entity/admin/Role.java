package com.cg.entity.admin;

/**
 * 角色role实体
 *
 * @author: xuwenhao
 */
public class Role {

    private Long id;

    private String name;

    /**
     * 角色备注
     */
    private String remark;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

}
