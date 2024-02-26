/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/12
  Time: 10:59
*/
package com.lianwei.lssg.entity;

import java.io.Serializable;
import java.math.BigDecimal;

public class LssgCartItem implements Serializable {
    private LssgProduct lssgProduct;
    private BigDecimal buyNum;     //购买总重量
    private BigDecimal subtotalPrice;
    private String cartState;   //商品库存状态（无货、有货、补货中）

    public LssgCartItem() {
    }

    public LssgCartItem(LssgProduct lssgProduct, BigDecimal buyNum, BigDecimal subtotalPrice, String cartState) {
        this.lssgProduct = lssgProduct;
        this.buyNum = buyNum;
        this.subtotalPrice = subtotalPrice;
        this.cartState = cartState;
    }

    public LssgProduct getLssgProduct() {
        return lssgProduct;
    }

    public void setLssgProduct(LssgProduct lssgProduct) {
        this.lssgProduct = lssgProduct;
    }

    public BigDecimal getBuyNum() {
        return buyNum;
    }

    public void setBuyNum(BigDecimal buyNum) {
        this.buyNum = buyNum;
    }

    public BigDecimal getSubtotalPrice() {
        return subtotalPrice;
    }

    public void setSubtotalPrice(BigDecimal subtotalPrice) {
        this.subtotalPrice = subtotalPrice;
    }

    public String getCartState() {
        return cartState;
    }

    public void setCartState(String cartState) {
        this.cartState = cartState;
    }
}
