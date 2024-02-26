package com.lianwei.lssg.service.before;

import com.github.pagehelper.PageInfo;
import com.lianwei.lssg.entity.LssgOrderAction;
import com.lianwei.lssg.entity.LssgOrderItem;
import com.lianwei.lssg.entity.LssgOrders;


import java.util.List;
import java.util.Map;

public interface LssgOrdersService {
    /**
     * 提交订单
     * */
    Integer submitOrder(LssgOrders lssgOrders);

    /**
     *
     * */
    Integer updateOrderWithAddIdAndPayId(LssgOrders lssgOrders);


    /**
     *
     * */
    LssgOrders findOneByOrderId(String orderId);

    /**
     *
     * */
    Integer addOrderAction(LssgOrderAction lssgOrderAction);

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
    PageInfo<LssgOrders> findOrderByUserId(Integer userId,Integer currentPage, Integer pageSize);

    /**
     *
     * */
    List<LssgOrderAction> findSomeActionByMap(Map map);

    /**
     * 根据订单状态（未支付、待收货、待发货）查询所有订单信息分页显示
     * */
    PageInfo<LssgOrders> findAllOrderByAction(Map map, Integer currentPage, Integer pageSize);

    /**
     *
     * */
    PageInfo<LssgOrders> findAllOrderByMap(Map map, Integer currentPage, Integer pageSize);


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
     * 通过productId判断用户是否购买过改商品
     * */
    LssgOrderItem isBuyByProductId(Integer productId,Integer uid);


    LssgOrders findOneOrder(String orderId);

    List<LssgOrders> findSomeOrderByMap(Map map);

    int querySizeByMap(Map map);

    Integer countOrderAction(LssgOrderAction lssgOrderAction);
}
