/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/6/5
  Time: 8:34
*/
package com.lianwei.lssg.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class LssgMessage implements Serializable {
    private Integer messageId;
    private String messageName;
    private String messageEmail;
    private Integer productStars;
    private String messageContent;
    private Date messageTime;
    private Integer isShow;

    private LssgUserInfo lssgUserInfo;
    private LssgUserLogin lssgUserLogin;
    private LssgProduct lssgProduct;
    private List<LssgReply> lssgReplyList;      //一对多

    public Integer getMessageId() {
        return messageId;
    }

    public void setMessageId(Integer messageId) {
        this.messageId = messageId;
    }

    public String getMessageName() {
        return messageName;
    }

    public void setMessageName(String messageName) {
        this.messageName = messageName;
    }

    public String getMessageEmail() {
        return messageEmail;
    }

    public void setMessageEmail(String messageEmail) {
        this.messageEmail = messageEmail;
    }

    public Integer getProductStars() {
        return productStars;
    }

    public void setProductStars(Integer productStars) {
        this.productStars = productStars;
    }

    public String getMessageContent() {
        return messageContent;
    }

    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
    }

    public Date getMessageTime() {
        return messageTime;
    }

    public void setMessageTime(Date messageTime) {
        this.messageTime = messageTime;
    }

    public Integer getIsShow() {
        return isShow;
    }

    public void setIsShow(Integer isShow) {
        this.isShow = isShow;
    }

    public LssgUserInfo getLssgUserInfo() {
        return lssgUserInfo;
    }

    public void setLssgUserInfo(LssgUserInfo lssgUserInfo) {
        this.lssgUserInfo = lssgUserInfo;
    }

    public LssgProduct getLssgProduct() {
        return lssgProduct;
    }

    public void setLssgProduct(LssgProduct lssgProduct) {
        this.lssgProduct = lssgProduct;
    }

    public List<LssgReply> getLssgReplyList() {
        return lssgReplyList;
    }

    public void setLssgReplyList(List<LssgReply> lssgReplyList) {
        this.lssgReplyList = lssgReplyList;
    }

    public LssgUserLogin getLssgUserLogin() {
        return lssgUserLogin;
    }

    public void setLssgUserLogin(LssgUserLogin lssgUserLogin) {
        this.lssgUserLogin = lssgUserLogin;
    }


}
