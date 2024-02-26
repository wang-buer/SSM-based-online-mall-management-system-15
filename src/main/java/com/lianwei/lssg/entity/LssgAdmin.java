/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/6/3
  Time: 14:05
*/
package com.lianwei.lssg.entity;

import java.io.Serializable;
import java.util.Date;

public class LssgAdmin implements Serializable {
    private Integer adminId;
    private String adminName;
    private String adminPwd;
    private String adminEmail;
    private Date adminRegistTime;
    private Date adminLastLoginTime;
    private String adminState;
    private String adminImg;

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getAdminPwd() {
        return adminPwd;
    }

    public void setAdminPwd(String adminPwd) {
        this.adminPwd = adminPwd;
    }

    public String getAdminEmail() {
        return adminEmail;
    }

    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail;
    }

    public Date getAdminRegistTime() {
        return adminRegistTime;
    }

    public void setAdminRegistTime(Date adminRegistTime) {
        this.adminRegistTime = adminRegistTime;
    }

    public Date getAdminLastLoginTime() {
        return adminLastLoginTime;
    }

    public void setAdminLastLoginTime(Date adminLastLoginTime) {
        this.adminLastLoginTime = adminLastLoginTime;
    }

    public String getAdminState() {
        return adminState;
    }

    public void setAdminState(String adminState) {
        this.adminState = adminState;
    }

    public String getAdminImg() {
        return adminImg;
    }

    public void setAdminImg(String adminImg) {
        this.adminImg = adminImg;
    }
}
