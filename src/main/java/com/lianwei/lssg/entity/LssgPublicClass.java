/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/6/1
  Time: 16:32
*/
package com.lianwei.lssg.entity;

import java.io.Serializable;

public class LssgPublicClass implements Serializable {
    private Integer publicClassId;
    private String publicClassName;
    private Integer publicClassState;
    private String publicDescription;
    private Integer publicClassLocation;
    private String publicClassImg;

    public String getPublicClassImg() {
        return publicClassImg;
    }

    public void setPublicClassImg(String publicClassImg) {
        this.publicClassImg = publicClassImg;
    }

    public Integer getPublicClassLocation() {
        return publicClassLocation;
    }

    public void setPublicClassLocation(Integer publicClassLocation) {
        this.publicClassLocation = publicClassLocation;
    }

    public Integer getPublicClassId() {
        return publicClassId;
    }

    public void setPublicClassId(Integer publicClassId) {
        this.publicClassId = publicClassId;
    }

    public String getPublicClassName() {
        return publicClassName;
    }

    public void setPublicClassName(String publicClassName) {
        this.publicClassName = publicClassName;
    }

    public Integer getPublicClassState() {
        return publicClassState;
    }

    public void setPublicClassState(Integer publicClassState) {
        this.publicClassState = publicClassState;
    }

    public String getPublicDescription() {
        return publicDescription;
    }

    public void setPublicDescription(String publicDescription) {
        this.publicDescription = publicDescription;
    }

    @Override
    public String toString() {
        return "LssgPublicClass{" +
                "publicClassId=" + publicClassId +
                ", publicClassName='" + publicClassName + '\'' +
                ", publicClassState=" + publicClassState +
                ", publicDescription='" + publicDescription + '\'' +
                '}';
    }
}
