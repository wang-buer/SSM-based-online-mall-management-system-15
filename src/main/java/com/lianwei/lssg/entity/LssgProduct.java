package com.lianwei.lssg.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class LssgProduct implements Serializable {
    private Integer productId;

    private LssgProductClass lssgProductClass;

    private String productName;

    private Date productUpTime;

    private Date productDownTime;

    private String productPhoto;

    private String smallPhoto;

    private String bigPhoto;

    private BigDecimal productMarketPrice;

    private BigDecimal productMallPrice;

    private Integer productNum;

    private Integer soldNum;

    private BigDecimal productWeight;

    private BigDecimal promotePrice;

    private Date promoteStartDate;

    private Date promoteEndDate;

    private BigDecimal fregiht;

    private Integer isBest;

    private Integer isNew;

    private Integer isHot;

    private Integer isSpecial;

    private Integer isState;

    private String productAddr;

    private String productNotes;

    private String productEffect;

    private static final long serialVersionUID = 1L;

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

    public Date getProductUpTime() {
        return productUpTime;
    }

    public void setProductUpTime(Date productUpTime) {
        this.productUpTime = productUpTime;
    }

    public Date getProductDownTime() {
        return productDownTime;
    }

    public void setProductDownTime(Date productDownTime) {
        this.productDownTime = productDownTime;
    }

    public String getProductPhoto() {
        return productPhoto;
    }

    public void setProductPhoto(String productPhoto) {
        this.productPhoto = productPhoto;
    }

    public String getSmallPhoto() {
        return smallPhoto;
    }

    public void setSmallPhoto(String smallPhoto) {
        this.smallPhoto = smallPhoto;
    }

    public String getBigPhoto() {
        return bigPhoto;
    }

    public void setBigPhoto(String bigPhoto) {
        this.bigPhoto = bigPhoto;
    }

    public BigDecimal getProductMarketPrice() {
        return productMarketPrice;
    }

    public void setProductMarketPrice(BigDecimal productMarketPrice) {
        this.productMarketPrice = productMarketPrice;
    }

    public BigDecimal getProductMallPrice() {
        return productMallPrice;
    }

    public void setProductMallPrice(BigDecimal productMallPrice) {
        this.productMallPrice = productMallPrice;
    }

    public Integer getProductNum() {
        return productNum;
    }

    public void setProductNum(Integer productNum) {
        this.productNum = productNum;
    }

    public Integer getSoldNum() {
        return soldNum;
    }

    public void setSoldNum(Integer soldNum) {
        this.soldNum = soldNum;
    }

    public BigDecimal getProductWeight() {
        return productWeight;
    }

    public void setProductWeight(BigDecimal productWeight) {
        this.productWeight = productWeight;
    }

    public BigDecimal getPromotePrice() {
        return promotePrice;
    }

    public void setPromotePrice(BigDecimal promotePrice) {
        this.promotePrice = promotePrice;
    }

    public Date getPromoteStartDate() {
        return promoteStartDate;
    }

    public void setPromoteStartDate(Date promoteStartDate) {
        this.promoteStartDate = promoteStartDate;
    }

    public Date getPromoteEndDate() {
        return promoteEndDate;
    }

    public void setPromoteEndDate(Date promoteEndDate) {
        this.promoteEndDate = promoteEndDate;
    }

    public BigDecimal getFregiht() {
        return fregiht;
    }

    public void setFregiht(BigDecimal fregiht) {
        this.fregiht = fregiht;
    }

    public Integer getIsBest() {
        return isBest;
    }

    public void setIsBest(Integer isBest) {
        this.isBest = isBest;
    }

    public Integer getIsNew() {
        return isNew;
    }

    public void setIsNew(Integer isNew) {
        this.isNew = isNew;
    }

    public Integer getIsHot() {
        return isHot;
    }

    public void setIsHot(Integer isHot) {
        this.isHot = isHot;
    }

    public Integer getIsSpecial() {
        return isSpecial;
    }

    public void setIsSpecial(Integer isSpecial) {
        this.isSpecial = isSpecial;
    }

    public Integer getIsState() {
        return isState;
    }

    public void setIsState(Integer isState) {
        this.isState = isState;
    }

    public String getProductAddr() {
        return productAddr;
    }

    public void setProductAddr(String productAddr) {
        this.productAddr = productAddr;
    }

    public String getProductNotes() {
        return productNotes;
    }

    public void setProductNotes(String productNotes) {
        this.productNotes = productNotes;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public LssgProductClass getLssgProductClass() {
        return lssgProductClass;
    }

    public void setLssgProductClass(LssgProductClass lssgProductClass) {
        this.lssgProductClass = lssgProductClass;
    }

    public String getProductEffect() {
        return productEffect;
    }

    public void setProductEffect(String productEffect) {
        this.productEffect = productEffect;
    }
}