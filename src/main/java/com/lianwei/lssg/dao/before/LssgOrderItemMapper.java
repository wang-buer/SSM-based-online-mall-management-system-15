package com.lianwei.lssg.dao.before;

import com.lianwei.lssg.entity.LssgOrderItem;

import java.util.List;
import java.util.Map;

public interface LssgOrderItemMapper {
    /**
     *
     * */
    List<LssgOrderItem> findAllOrderItemByOid(String orderId);

    /**
     *
     * */
    LssgOrderItem findAllOrderItemByOidAndPid(Map map);

    /**
     *
     * */
    Integer delOneOrderItem(String orderId);
}
