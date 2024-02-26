package com.lianwei.lssg.entity;

import java.io.Serializable;

public class LssgProductClass implements Serializable {
    private Integer productClassId;
    private String productClassName;
    private String productIsShow;
    private String productDescription;

    public Integer getProductClassId() {
        return productClassId;
    }

    public void setProductClassId(Integer productClassId) {
        this.productClassId = productClassId;
    }

    public String getProductClassName() {
        return productClassName;
    }

    public void setProductClassName(String productClassName) {
        this.productClassName = productClassName;
    }

    public String getProductIsShow() {
        return productIsShow;
    }

    public void setProductIsShow(String productIsShow) {
        this.productIsShow = productIsShow;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    @Override
    public String toString() {
        return "LssgProductClass{" +
                "productClassId=" + productClassId +
                ", productClassName='" + productClassName + '\'' +
                ", productIsShow='" + productIsShow + '\'' +
                ", productDescription='" + productDescription + '\'' +
                '}';
    }
}
