/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/11
  Time: 22:49
*/
package com.lianwei.lssg.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

public class LssgCart implements Serializable {

    private Map<String, LssgCartItem> cartItems = new HashMap<String, LssgCartItem>();

    private BigDecimal totalPrice;

    public Map<String, LssgCartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(Map<String, LssgCartItem> cartItems) {
        this.cartItems = cartItems;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }
}
