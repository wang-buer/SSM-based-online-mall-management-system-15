/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/12
  Time: 12:34
*/
package com.lianwei.lssg.entity;

import java.io.Serializable;
import java.math.BigDecimal;

public class LssgOrderItem implements Serializable {
    private Integer orderItemId;        //订单项id
    private BigDecimal orderProductNum;    //购买数量
    private BigDecimal subtotalPrice;   //小计
    private BigDecimal orderProductWeight;  //重量（/kg）
    private Integer state;

    private LssgProduct lssgProduct;
    private LssgOrders lssgOrders;

    public Integer getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(Integer orderItemId) {
        this.orderItemId = orderItemId;
    }

    public BigDecimal getOrderProductNum() {
        return orderProductNum;
    }

    public void setOrderProductNum(BigDecimal orderProductNum) {
        this.orderProductNum = orderProductNum;
    }

    public BigDecimal getSubtotalPrice() {
        return subtotalPrice;
    }

    public void setSubtotalPrice(BigDecimal subtotalPrice) {
        this.subtotalPrice = subtotalPrice;
    }

    public BigDecimal getOrderProductWeight() {
        return orderProductWeight;
    }

    public void setOrderProductWeight(BigDecimal orderProductWeight) {
        this.orderProductWeight = orderProductWeight;
    }

    public LssgProduct getLssgProduct() {
        return lssgProduct;
    }

    public void setLssgProduct(LssgProduct lssgProduct) {
        this.lssgProduct = lssgProduct;
    }

    public LssgOrders getLssgOrders() {
        return lssgOrders;
    }

    public void setLssgOrders(LssgOrders lssgOrders) {
        this.lssgOrders = lssgOrders;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "LssgOrderItem{" +
                "orderItemId=" + orderItemId +
                ", orderProductNum=" + orderProductNum +
                ", subtotalPrice=" + subtotalPrice +
                ", orderProductWeight=" + orderProductWeight +
                ", state=" + state +
                ", lssgProduct=" + lssgProduct +
                ", lssgOrders=" + lssgOrders +
                '}';
    }
}
