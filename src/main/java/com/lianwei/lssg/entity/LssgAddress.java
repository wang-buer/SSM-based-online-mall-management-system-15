/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/12
  Time: 14:39
*/
package com.lianwei.lssg.entity;

import java.io.Serializable;

public class LssgAddress implements Serializable {
    private Integer addressId;
    private String addressUserName;
    private String addressName;
    private String addressAddr;
    private Integer addressState;
    private String addressTel;
    private String addressContent;

    private LssgUserLogin lssgUserLogin;

    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    public String getAddressUserName() {
        return addressUserName;
    }

    public void setAddressUserName(String addressUserName) {
        this.addressUserName = addressUserName;
    }

    public String getAddressName() {
        return addressName;
    }

    public void setAddressName(String addressName) {
        this.addressName = addressName;
    }

    public String getAddressAddr() {
        return addressAddr;
    }

    public void setAddressAddr(String addressAddr) {
        this.addressAddr = addressAddr;
    }

    public Integer getAddressState() {
        return addressState;
    }

    public void setAddressState(Integer addressState) {
        this.addressState = addressState;
    }

    public String getAddressTel() {
        return addressTel;
    }

    public void setAddressTel(String addressTel) {
        this.addressTel = addressTel;
    }

    public String getAddressContent() {
        return addressContent;
    }

    public void setAddressContent(String addressContent) {
        this.addressContent = addressContent;
    }


    public LssgUserLogin getLssgUserLogin() {
        return lssgUserLogin;
    }

    public void setLssgUserLogin(LssgUserLogin lssgUserLogin) {
        this.lssgUserLogin = lssgUserLogin;
    }
}
