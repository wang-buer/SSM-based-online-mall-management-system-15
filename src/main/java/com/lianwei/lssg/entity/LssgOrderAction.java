/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/12
  Time: 12:55
*/
package com.lianwei.lssg.entity;

import java.io.Serializable;
import java.util.Date;

public class LssgOrderAction implements Serializable {
    private Integer orderActionId;
    private String orderId;
    private String orderPayStatus;
    private String shoppingStatus;
    private Date lastPayTime;
    private Date sentProductTime;
    private Integer state;
    private Integer orderStatus;

    public Integer getOrderActionId() {
        return orderActionId;
    }

    public void setOrderActionId(Integer orderActionId) {
        this.orderActionId = orderActionId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getOrderPayStatus() {
        return orderPayStatus;
    }

    public void setOrderPayStatus(String orderPayStatus) {
        this.orderPayStatus = orderPayStatus;
    }

    public String getShoppingStatus() {
        return shoppingStatus;
    }

    public void setShoppingStatus(String shoppingStatus) {
        this.shoppingStatus = shoppingStatus;
    }

    public Date getLastPayTime() {
        return lastPayTime;
    }

    public void setLastPayTime(Date lastPayTime) {
        this.lastPayTime = lastPayTime;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Date getSentProductTime() {
        return sentProductTime;
    }

    public void setSentProductTime(Date sentProductTime) {
        this.sentProductTime = sentProductTime;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }
}
