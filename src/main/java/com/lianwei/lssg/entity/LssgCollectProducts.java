/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/11
  Time: 22:20
*/
package com.lianwei.lssg.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class LssgCollectProducts implements Serializable {
    private Integer collectId;
    private Integer userId;
    private Integer productId;
    private String productName;
    private String productImg;
    private Integer productNum;
    private BigDecimal productPrice;
    private Date addCollectTime;
    private String collectState;

    public Integer getCollectId() {
        return collectId;
    }

    public void setCollectId(Integer collectId) {
        this.collectId = collectId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public Integer getProductNum() {
        return productNum;
    }

    public void setProductNum(Integer productNum) {
        this.productNum = productNum;
    }

    public Date getAddCollectTime() {
        return addCollectTime;
    }

    public BigDecimal getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(BigDecimal productPrice) {
        this.productPrice = productPrice;
    }

    public void setAddCollectTime(Date addCollectTime) {
        this.addCollectTime = addCollectTime;
    }

    public String getCollectState() {
        return collectState;
    }

    public void setCollectState(String collectState) {
        this.collectState = collectState;
    }

    @Override
    public String toString() {
        return "LssgCollectProducts{" +
                "collectId=" + collectId +
                ", userId=" + userId +
                ", productId=" + productId +
                ", productName='" + productName + '\'' +
                ", productImg='" + productImg + '\'' +
                ", productNum=" + productNum +
                ", productPrice=" + productPrice +
                ", addCollectTime=" + addCollectTime +
                ", collectState='" + collectState + '\'' +
                '}';
    }
}