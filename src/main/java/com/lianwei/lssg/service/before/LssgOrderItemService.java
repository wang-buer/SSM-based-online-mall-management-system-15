package com.lianwei.lssg.service.before;

import com.lianwei.lssg.entity.LssgOrderItem;

import java.util.List;
import java.util.Map;

public interface LssgOrderItemService {
    /**
     *
     * */
    List<LssgOrderItem> findAllOrderItemByOid(String orderId);


    /**
     *
     * */
    Integer delOneOrderItem(String orderId);
}
