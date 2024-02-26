/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/6/1
  Time: 16:25
*/
package com.lianwei.lssg.entity;


import java.io.Serializable;
import java.util.Date;

public class LssgPublicInfo implements Serializable {
    private Integer publicInfoId;
    private String publicInfoTitle;
    private String publicInfoContent;
    private String publicInfoImg;
    private Date publicInfoTime;
    private Integer publicInfoState;
    private String publicInfoUser;

    private LssgPublicClass lssgPublicClass;

    public Integer getPublicInfoId() {
        return publicInfoId;
    }

    public void setPublicInfoId(Integer publicInfoId) {
        this.publicInfoId = publicInfoId;
    }

    public String getPublicInfoTitle() {
        return publicInfoTitle;
    }

    public void setPublicInfoTitle(String publicInfoTitle) {
        this.publicInfoTitle = publicInfoTitle;
    }

    public String getPublicInfoContent() {
        return publicInfoContent;
    }

    public void setPublicInfoContent(String publicInfoContent) {
        this.publicInfoContent = publicInfoContent;
    }

    public String getPublicInfoImg() {
        return publicInfoImg;
    }

    public void setPublicInfoImg(String publicInfoImg) {
        this.publicInfoImg = publicInfoImg;
    }

    public Date getPublicInfoTime() {
        return publicInfoTime;
    }

    public void setPublicInfoTime(Date publicInfoTime) {
        this.publicInfoTime = publicInfoTime;
    }

    public Integer getPublicInfoState() {
        return publicInfoState;
    }

    public void setPublicInfoState(Integer publicInfoState) {
        this.publicInfoState = publicInfoState;
    }

    public LssgPublicClass getLssgPublicClass() {
        return lssgPublicClass;
    }

    public void setLssgPublicClass(LssgPublicClass lssgPublicClass) {
        this.lssgPublicClass = lssgPublicClass;
    }

    public String getPublicInfoUser() {
        return publicInfoUser;
    }

    public void setPublicInfoUser(String publicInfoUser) {
        this.publicInfoUser = publicInfoUser;
    }

    @Override
    public String toString() {
        return "LssgPublicInfo{" +
                "publicInfoId=" + publicInfoId +
                ", publicInfoTitle='" + publicInfoTitle + '\'' +
                ", publicInfoContent='" + publicInfoContent + '\'' +
                ", publicInfoImg='" + publicInfoImg + '\'' +
                ", publicInfoTime=" + publicInfoTime +
                ", publicInfoState=" + publicInfoState +
                ", publicInfoUser='" + publicInfoUser + '\'' +
                ", lssgPublicClass=" + lssgPublicClass +
                '}';
    }
}
