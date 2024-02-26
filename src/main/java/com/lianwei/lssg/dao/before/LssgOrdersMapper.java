package com.lianwei.lssg.dao.before;


import com.lianwei.lssg.entity.LssgOrderAction;
import com.lianwei.lssg.entity.LssgOrderItem;
import com.lianwei.lssg.entity.LssgOrders;

import java.util.List;
import java.util.Map;

public interface LssgOrdersMapper {

    /**
     *
     * */
    Integer addOrders(LssgOrders lssgOrders);

    /**
     *
     * */
    Integer addOrderAction(LssgOrderAction lssgOrderAction);


    /**
     *
     * */
    Integer addOrderItem(LssgOrderItem lssgOrderItem);

    /**
     *
     * */
    List<LssgOrders> findOrderByUserId(Integer userId);

    /**
     *
     * */
    LssgOrders findOneByOrderId(String orderId);


    /**
     *
     * */
    LssgOrders findOneByOrderIdAndUserId(Map map);

    /**
     *
     * */
    Integer updateOrderWithAddIdAndPayId(LssgOrders lssgOrders);

    /**
     *
     * */
    LssgOrderAction findOneActionByOrderId(String orderId);



    /**
     *
     * */
    Integer delOneOrder(String orderId);

    /**
     *
     * */
    Integer delOneActionByOrderId(String orderId);

    /**
     *
     * */
    Integer updateOrderActionByOrderId(LssgOrderAction lssgOrderAction);

    /**
     *
     * */
    List<LssgOrderAction> findSomeActionByMap(Map map);

    /**
     *
     * */
    List<LssgOrders> findOrderByMap(Map map);

    /**
     *
     * */
    List<LssgOrders> findAllOrderByMap(Map map);

    /**
     *
     * */
    List<LssgOrders> findAllOrderWithPage(Map map);

    /**
     *
     * */
    int querySize(Map map);

    /**
     *
     * */
    int deleteBatchStateByPrimaryKeySelective(String[] orderId);

    /**
     *
     * */
    List<LssgOrders> selectAllOrdersByUid(Integer uid);

    int querySizeByMap(Map map);

    Integer countOrderAction(LssgOrderAction lssgOrderAction);

}
