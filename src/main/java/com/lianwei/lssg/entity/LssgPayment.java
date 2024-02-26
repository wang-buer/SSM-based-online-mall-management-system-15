/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/12
  Time: 12:57
*/
package com.lianwei.lssg.entity;

import java.io.Serializable;

public class LssgPayment implements Serializable {
    private Integer paymentId;
    private String paymentName;
    private Integer paymentState;
    private String paymentImg;

    public Integer getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(Integer paymentId) {
        this.paymentId = paymentId;
    }

    public String getPaymentName() {
        return paymentName;
    }

    public void setPaymentName(String paymentName) {
        this.paymentName = paymentName;
    }

    public Integer getPaymentState() {
        return paymentState;
    }

    public void setPaymentState(Integer paymentState) {
        this.paymentState = paymentState;
    }

    public String getPaymentImg() {
        return paymentImg;
    }

    public void setPaymentImg(String paymentImg) {
        this.paymentImg = paymentImg;
    }
}
