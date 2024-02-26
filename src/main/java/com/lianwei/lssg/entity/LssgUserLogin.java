/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/7
  Time: 18:31
*/
package com.lianwei.lssg.entity;

import java.io.Serializable;
import java.util.Date;

public class LssgUserLogin implements Serializable {
    private Integer userId;
    private String userName;
    private String userPwd;
    private Integer loginIsActive;
    private Date registTime;
    private Date lastTime;
    private Integer userState;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public Integer getLoginIsActive() {
        return loginIsActive;
    }

    public void setLoginIsActive(Integer loginIsActive) {
        this.loginIsActive = loginIsActive;
    }

    public Date getRegistTime() {
        return registTime;
    }

    public void setRegistTime(Date registTime) {
        this.registTime = registTime;
    }

    public Date getLastTime() {
        return lastTime;
    }

    public void setLastTime(Date lastTime) {
        this.lastTime = lastTime;
    }

    public Integer getUserState() {
        return userState;
    }

    public void setUserState(Integer userState) {
        this.userState = userState;
    }

    @Override
    public String toString() {
        return "LssgUserLogin{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", userPwd='" + userPwd + '\'' +
                ", loginIsActive=" + loginIsActive +
                ", registTime=" + registTime +
                ", lastTime=" + lastTime +
                ", userState=" + userState +
                '}';
    }
}
