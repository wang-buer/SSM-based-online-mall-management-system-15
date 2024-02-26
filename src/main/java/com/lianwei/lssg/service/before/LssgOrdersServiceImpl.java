/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/21
  Time: 16:49
*/
package com.lianwei.lssg.service.before;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lianwei.lssg.dao.before.LssgAddressMapper;
import com.lianwei.lssg.dao.before.LssgOrderItemMapper;
import com.lianwei.lssg.dao.before.LssgOrdersMapper;
import com.lianwei.lssg.dao.before.LssgUserLoginMapper;
import com.lianwei.lssg.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class LssgOrdersServiceImpl implements LssgOrdersService{
    @Autowired
    private LssgOrdersMapper lssgOrdersMapper;
    @Autowired
    private LssgOrderItemMapper lssgOrderItemMapper;
    @Autowired
    private LssgAddressMapper lssgAddressMapper;
    @Autowired
    private LssgUserLoginMapper lssgUserLoginMapper;
    @Autowired
    private LssgProductService lssgProductService;
    /**
     *
     * */
    @Transactional
    public Integer submitOrder(LssgOrders lssgOrders) {
        List<LssgOrderItem> lssgOrderItemList = lssgOrders.getLssgOrderItemList();
        for(LssgOrderItem lssgOrderItem : lssgOrderItemList){
            lssgOrdersMapper.addOrderItem(lssgOrderItem);
        }
        return lssgOrdersMapper.addOrders(lssgOrders);
    }
    /**
     *
     * */
    public Integer updateOrderWithAddIdAndPayId(LssgOrders lssgOrders) {
        return lssgOrdersMapper.updateOrderWithAddIdAndPayId(lssgOrders);
    }

    public LssgOrders findOneByOrderId(String orderId) {
        return lssgOrdersMapper.findOneByOrderId(orderId);
    }

    public Integer addOrderAction(LssgOrderAction lssgOrderAction) {
        return lssgOrdersMapper.addOrderAction(lssgOrderAction);
    }

    public LssgOrderAction findOneActionByOrderId(String orderId) {
        return lssgOrdersMapper.findOneActionByOrderId(orderId);
    }

    public Integer delOneOrder(String orderId) {
        return lssgOrdersMapper.delOneOrder(orderId);
    }

    public Integer delOneActionByOrderId(String orderId) {
        return lssgOrdersMapper.delOneActionByOrderId(orderId);
    }

    public Integer updateOrderActionByOrderId(LssgOrderAction lssgOrderAction) {
        return lssgOrdersMapper.updateOrderActionByOrderId(lssgOrderAction);
    }

    /**
     * 根据用户ID查询订单分页显示
     * */
    @Transactional
    public PageInfo<LssgOrders> findOrderByUserId(Integer userId, Integer currentPage, Integer pageSize) {
        PageHelper.startPage(currentPage, pageSize);
        List<LssgOrders> lssgOrdersListl = lssgOrdersMapper.findOrderByUserId(userId);
        List<LssgOrderItem> lssgOrderItemList;
        for(LssgOrders lssgOrders : lssgOrdersListl){
            lssgOrderItemList = lssgOrderItemMapper.findAllOrderItemByOid(lssgOrders.getOrderId());
           // LssgOrderAction lssgOrderAction = lssgOrdersMapper.findOneActionByOrderId(lssgOrders.getOrderId());
            LssgAddress lssgAddress = lssgAddressMapper.selectOneAddressById(lssgOrders.getLssgAddress().getAddressId());
            lssgOrders.setLssgOrderItemList(lssgOrderItemList);
            //lssgOrders.setLssgOrderAction(lssgOrderAction);
            lssgOrders.setLssgAddress(lssgAddress);
        }
        PageInfo<LssgOrders> lssgOrdersPageInfo = new PageInfo<LssgOrders>(lssgOrdersListl);
        return lssgOrdersPageInfo;
    }
    public List<LssgOrderAction> findSomeActionByMap(Map map) {
        List<LssgOrderAction> lssgOrderActionList = lssgOrdersMapper.findSomeActionByMap(map);
        return lssgOrderActionList;
    }

    /**
     * 根据订单状态（未支付、待收货、待发货）查询所有订单信息分页显示
     * */
    @Transactional
    public PageInfo<LssgOrders> findAllOrderByAction(Map map, Integer currentPage, Integer pageSize) {
        PageHelper.startPage(currentPage, pageSize);
        List<LssgOrders> lssgOrdersList = lssgOrdersMapper.findOrderByMap(map);
        List<LssgOrderItem> lssgOrderItemList;
        for(LssgOrders lssgOrders : lssgOrdersList){
            lssgOrderItemList = lssgOrderItemMapper.findAllOrderItemByOid(lssgOrders.getOrderId());
            LssgAddress lssgAddress = lssgAddressMapper.selectOneAddressById(lssgOrders.getLssgAddress().getAddressId());
            lssgOrders.setLssgOrderItemList(lssgOrderItemList);
            lssgOrders.setLssgAddress(lssgAddress);
        }
        PageInfo<LssgOrders> lssgOrdersPageInfo = new PageInfo<LssgOrders>(lssgOrdersList);
        return lssgOrdersPageInfo;
    }

    public PageInfo<LssgOrders> findAllOrderByMap(Map map, Integer currentPage, Integer pageSize) {
        PageHelper.startPage(currentPage, pageSize);
        List<LssgOrders> lssgOrdersList = lssgOrdersMapper.findAllOrderByMap(map);
        List<LssgOrderItem> lssgOrderItemList;
        for(LssgOrders lssgOrders : lssgOrdersList){
            lssgOrderItemList = lssgOrderItemMapper.findAllOrderItemByOid(lssgOrders.getOrderId());
            LssgAddress lssgAddress = lssgAddressMapper.selectOneAddressById(lssgOrders.getLssgAddress().getAddressId());
            lssgOrders.setLssgOrderItemList(lssgOrderItemList);
            lssgOrders.setLssgAddress(lssgAddress);
        }
        PageInfo<LssgOrders> lssgOrdersPageInfo = new PageInfo<LssgOrders>(lssgOrdersList);
        return lssgOrdersPageInfo;
    }

    public List<LssgOrders> findAllOrderWithPage(Map map) {
        int count =(Integer) map.get("nums");//每一页显示的条数
        int start =((Integer)map.get("curr")-1)*count;//每一页的开始下标
        map.put("start",start);
        System.out.println("进入到服务层的查询方法");
        List<LssgOrders> lssgOrdersList = lssgOrdersMapper.findAllOrderWithPage(map);
        for(LssgOrders lssgOrders : lssgOrdersList){
            LssgAddress lssgAddress = lssgAddressMapper.selectOneAddressById(lssgOrders.getLssgAddress().getAddressId());
            lssgOrders.setLssgAddress(lssgAddress);
        }
        return lssgOrdersList;
    }

    public int querySize(Map map) {
        return lssgOrdersMapper.querySize(map);
    }

    public int deleteBatchStateByPrimaryKeySelective(String[] orderId) {
        return lssgOrdersMapper.deleteBatchStateByPrimaryKeySelective(orderId);
    }

    @Transactional
    public LssgOrderItem isBuyByProductId(Integer productId,Integer uid) {
        LssgOrderItem lssgOrderItem1 = null;
        List<LssgOrders> lssgOrdersList = lssgOrdersMapper.selectAllOrdersByUid(uid);

        for(LssgOrders lssgOrders : lssgOrdersList){
            Map map = new HashMap();
            map.put("productId",productId);
            map.put("orderId",lssgOrders.getOrderId());
            lssgOrderItem1 = lssgOrderItemMapper.findAllOrderItemByOidAndPid(map);
            if(lssgOrderItem1!=null){
                break;
            }
        }
        return lssgOrderItem1;
    }


    /**
     *
     * @param orderId
     * @return
     */
    @Transactional
    public LssgOrders findOneOrder(String orderId) {
        LssgOrders lssgOrders = lssgOrdersMapper.findOneByOrderId(orderId);
        LssgAddress lssgAddress = lssgAddressMapper.selectOneAddressById(lssgOrders.getLssgAddress().getAddressId());
        LssgOrderAction lssgOrderAction = lssgOrdersMapper.findOneActionByOrderId(orderId);
        List<LssgOrderItem> lssgOrderItemList = lssgOrderItemMapper.findAllOrderItemByOid(lssgOrders.getOrderId());
        LssgUserLogin lssgUserLogin = lssgUserLoginMapper.selectUserLoginInfoByUserId(lssgAddress.getLssgUserLogin().getUserId());
        lssgOrders.setLssgUserLogin(lssgUserLogin);
        lssgOrders.setLssgOrderItemList(lssgOrderItemList);
        lssgOrders.setLssgAddress(lssgAddress);
        lssgOrders.setLssgOrderAction(lssgOrderAction);
        return lssgOrders;
    }

    public List<LssgOrders> findSomeOrderByMap(Map map) {
        List<LssgOrders> lssgOrdersList = lssgOrdersMapper.findOrderByMap(map);
        for(LssgOrders lssgOrders : lssgOrdersList){
            List<LssgOrderItem> lssgOrderItemList = lssgOrderItemMapper.findAllOrderItemByOid(lssgOrders.getOrderId());
            lssgOrders.setLssgOrderItemList(lssgOrderItemList);

        }
        return lssgOrdersList;
    }

    public int querySizeByMap(Map map) {
        return lssgOrdersMapper.querySizeByMap(map);
    }

    public Integer countOrderAction(LssgOrderAction lssgOrderAction) {
        return lssgOrdersMapper.countOrderAction(lssgOrderAction);
    }


}
