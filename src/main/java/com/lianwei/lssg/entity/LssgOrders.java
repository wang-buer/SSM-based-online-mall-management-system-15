/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/12
  Time: 12:41
*/
package com.lianwei.lssg.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class LssgOrders implements Serializable {
    private String orderId;                  //订单号
    private BigDecimal orderTotalPrice;      //订单总计
    private Date doOrderTime;                  //下单时间
    private String paymentName;                //起初设计多余
    private BigDecimal totalNum;                //订单商品总计（数量）
    private String notes;                       //留言信息
    private Integer orderState;

    private LssgUserLogin lssgUserLogin;          //用户信息实体
    private LssgOrderAction lssgOrderAction;    //订单状态信息实体
    private LssgAddress lssgAddress;            //
    private LssgPayment lssgPayment;


    //订单的订单项
    private List<LssgOrderItem> lssgOrderItemList = new ArrayList<LssgOrderItem>(); //一对多

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public BigDecimal getOrderTotalPrice() {
        return orderTotalPrice;
    }

    public void setOrderTotalPrice(BigDecimal orderTotalPrice) {
        this.orderTotalPrice = orderTotalPrice;
    }

    public Date getDoOrderTime() {
        return doOrderTime;
    }

    public void setDoOrderTime(Date doOrderTime) {
        this.doOrderTime = doOrderTime;
    }

    public BigDecimal getTotalNum() {
        return totalNum;
    }

    public void setTotalNum(BigDecimal totalNum) {
        this.totalNum = totalNum;
    }

    public LssgUserLogin getLssgUserLogin() {
        return lssgUserLogin;
    }

    public void setLssgUserLogin(LssgUserLogin lssgUserLogin) {
        this.lssgUserLogin = lssgUserLogin;
    }

    public String getPaymentName() {
        return paymentName;
    }

    public void setPaymentName(String paymentName) {
        this.paymentName = paymentName;
    }

    public LssgAddress getLssgAddress() {
        return lssgAddress;
    }

    public void setLssgAddress(LssgAddress lssgAddress) {
        this.lssgAddress = lssgAddress;
    }

    public List<LssgOrderItem> getLssgOrderItemList() {
        return lssgOrderItemList;
    }

    public void setLssgOrderItemList(List<LssgOrderItem> lssgOrderItemList) {
        this.lssgOrderItemList = lssgOrderItemList;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public Integer getOrderState() {
        return orderState;
    }

    public void setOrderState(Integer orderState) {
        this.orderState = orderState;
    }

    public LssgOrderAction getLssgOrderAction() {
        return lssgOrderAction;
    }

    public void setLssgOrderAction(LssgOrderAction lssgOrderAction) {
        this.lssgOrderAction = lssgOrderAction;
    }

    public LssgPayment getLssgPayment() {
        return lssgPayment;
    }

    public void setLssgPayment(LssgPayment lssgPayment) {
        this.lssgPayment = lssgPayment;
    }
}
