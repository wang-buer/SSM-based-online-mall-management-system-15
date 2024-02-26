/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/6/12
  Time: 20:09
*/
package com.lianwei.lssg.entity;

import java.io.Serializable;
import java.util.Date;

public class CountEntity implements Serializable {
    private Integer value;
    private String name;
    private Date daytime;
    private String type;
    private Integer[] data;

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDaytime() {
        return daytime;
    }

    public void setDaytime(Date daytime) {
        this.daytime = daytime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer[] getData() {
        return data;
    }

    public void setData(Integer[] data) {
        this.data = data;
    }
}
