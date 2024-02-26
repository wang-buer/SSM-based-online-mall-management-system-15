/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/12
  Time: 12:39
*/
package com.lianwei.lssg.entity;

import java.io.Serializable;

public class LssgUserInfo implements Serializable {

    private Integer userInfoId;
    private String userRealname;
    private String userSex;
    private String userTel;
    private String userEmail;
    private String userImg;
    private String userAddr;

    private LssgUserLogin lssgUserLogin;

    public Integer getUserInfoId() {
        return userInfoId;
    }

    public void setUserInfoId(Integer userInfoId) {
        this.userInfoId = userInfoId;
    }

    public String getUserRealname() {
        return userRealname;
    }

    public void setUserRealname(String userRealname) {
        this.userRealname = userRealname;
    }

    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex;
    }

    public String getUserTel() {
        return userTel;
    }

    public void setUserTel(String userTel) {
        this.userTel = userTel;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserImg() {
        return userImg;
    }

    public void setUserImg(String userImg) {
        this.userImg = userImg;
    }

    public String getUserAddr() {
        return userAddr;
    }

    public void setUserAddr(String userAddr) {
        this.userAddr = userAddr;
    }

    public LssgUserLogin getLssgUserLogin() {
        return lssgUserLogin;
    }

    public void setLssgUserLogin(LssgUserLogin lssgUserLogin) {
        this.lssgUserLogin = lssgUserLogin;
    }

    @Override
    public String toString() {
        return "LssgUserInfo{" +
                "userInfoId=" + userInfoId +
                ", userRealname='" + userRealname + '\'' +
                ", userSex='" + userSex + '\'' +
                ", userTel='" + userTel + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", userImg='" + userImg + '\'' +
                ", userAddr='" + userAddr + '\'' +
                ", lssgUserLogin=" + lssgUserLogin +
                '}';
    }
}
