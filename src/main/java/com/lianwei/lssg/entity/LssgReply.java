/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/6/5
  Time: 8:34
*/
package com.lianwei.lssg.entity;

import java.io.Serializable;
import java.util.Date;

public class LssgReply implements Serializable {
    private Integer replyId;
    private String replyName;
    private Integer replyUserId;
    private String replyUrl;
    private Date replyTime;
    private String replyContent;
    private Integer replyIsShow;
    private Integer toUserId;
    private String replyToName;

    private LssgProduct lssgProduct;
    private LssgUserInfo lssgUserInfo;
    private LssgUserLogin lssgUserLogin;
    private LssgMessage lssgMessage;

    public Integer getReplyId() {
        return replyId;
    }

    public void setReplyId(Integer replyId) {
        this.replyId = replyId;
    }

    public String getReplyName() {
        return replyName;
    }

    public void setReplyName(String replyName) {
        this.replyName = replyName;
    }

    public String getReplyUrl() {
        return replyUrl;
    }

    public void setReplyUrl(String replyUrl) {
        this.replyUrl = replyUrl;
    }

    public Date getReplyTime() {
        return replyTime;
    }

    public void setReplyTime(Date replyTime) {
        this.replyTime = replyTime;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

    public Integer getReplyIsShow() {
        return replyIsShow;
    }

    public void setReplyIsShow(Integer replyIsShow) {
        this.replyIsShow = replyIsShow;
    }

    public LssgProduct getLssgProduct() {
        return lssgProduct;
    }

    public void setLssgProduct(LssgProduct lssgProduct) {
        this.lssgProduct = lssgProduct;
    }

    public LssgUserInfo getLssgUserInfo() {
        return lssgUserInfo;
    }

    public void setLssgUserInfo(LssgUserInfo lssgUserInfo) {
        this.lssgUserInfo = lssgUserInfo;
    }

    public LssgUserLogin getLssgUserLogin() {
        return lssgUserLogin;
    }

    public void setLssgUserLogin(LssgUserLogin lssgUserLogin) {
        this.lssgUserLogin = lssgUserLogin;
    }

    public LssgMessage getLssgMessage() {
        return lssgMessage;
    }

    public void setLssgMessage(LssgMessage lssgMessage) {
        this.lssgMessage = lssgMessage;
    }

    public Integer getReplyUserId() {
        return replyUserId;
    }

    public void setReplyUserId(Integer replyUserId) {
        this.replyUserId = replyUserId;
    }

    public Integer getToUserId() {
        return toUserId;
    }

    public void setToUserId(Integer toUserId) {
        this.toUserId = toUserId;
    }

    public String getReplyToName() {
        return replyToName;
    }

    public void setReplyToName(String replyToName) {
        this.replyToName = replyToName;
    }
}
