/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/21
  Time: 19:56
*/
package com.lianwei.lssg.controller.before;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.lianwei.lssg.cache.JedisClient;
import com.lianwei.lssg.entity.*;
import com.lianwei.lssg.service.admin.LssgPaymentService;
import com.lianwei.lssg.service.before.LssgAddressService;
import com.lianwei.lssg.service.before.LssgOrderItemService;
import com.lianwei.lssg.service.before.LssgOrdersService;
import com.lianwei.lssg.service.before.LssgProductService;
import com.lianwei.lssg.utils.DateUtils;
import com.lianwei.lssg.utils.OrderCodeFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("order")
public class LssgOrderController {
    @Resource
    private LssgOrdersService lssgOrdersService;
    @Resource
    private LssgOrderItemService lssgOrderItemService;
    @Resource
    private LssgAddressService lssgAddressService;
    @Resource
    private LssgProductService lssgProductService;
    @Resource
    private LssgPaymentService lssgPaymentService;
    @Resource
    HttpServletRequest request;
    @Resource
    private JedisClient jedisClient;

    private static final String REDIS_CART = "cart";
    /**
     *订单生成
     * */
    @RequestMapping("/submitOrder")
    @ResponseBody
    public Map submitOrder(@RequestParam("productIds")String[] productIds, @RequestParam("totalMoney")BigDecimal totalMoney,
                           @RequestParam("totalNum")Integer totalNum){
        HttpSession session = request.getSession();
        LssgUserLogin lssgUserLogin = (LssgUserLogin) session.getAttribute("lssgUserLogin");
        Map map = new HashMap();
        //创建订单
        LssgOrders lssgOrders = new LssgOrders();
        //生成订单号
        lssgOrders.setOrderId(OrderCodeFactory.getOrderCode(Long.valueOf(lssgUserLogin.getUserId())));
        //订单总计
        lssgOrders.setOrderTotalPrice(totalMoney);
        //订单商品数量
        lssgOrders.setTotalNum(BigDecimal.valueOf(totalNum));
        //下单时间
        lssgOrders.setDoOrderTime(DateUtils.nowTime());
        //订单属于哪个用户
        lssgOrders.setLssgUserLogin(lssgUserLogin);
        //
        LssgCart lssgCart = JSON.parseObject(jedisClient.hget(REDIS_CART,lssgUserLogin.getUserName()),LssgCart.class);
        Map<String, LssgCartItem> lssgCartItemMap = lssgCart.getCartItems();

        //取出购物项
        for (String productId : productIds) {
            LssgCartItem lssgCartItem = lssgCartItemMap.get(productId);
            //创建订单项
            LssgOrderItem lssgOrderItem = new LssgOrderItem();
            lssgOrderItem.setOrderProductNum(lssgCartItem.getBuyNum());
            lssgOrderItem.setSubtotalPrice(lssgCartItem.getSubtotalPrice());
            lssgOrderItem.setLssgProduct(lssgCartItem.getLssgProduct());
            lssgOrderItem.setLssgOrders(lssgOrders);
            //将订单项添加到订单的订单项集合中
            lssgOrders.getLssgOrderItemList().add(lssgOrderItem);
        }
        int i = lssgOrdersService.submitOrder(lssgOrders);
        if(i>0){
            map.put("data",true);
            map.put("orderId",lssgOrders.getOrderId());
            System.out.println(map.get("orderId"));
        }else{
            map.put("data",false);
        }
        return map;
    }
    /**
     * 核对订单(商品清单)
     * */
    @RequestMapping("/checkOrderToProduct")
    @ResponseBody
    public List<LssgOrderItem> checkOrderToProduct(@RequestParam("orderId")String orderId){
        System.out.println("orderId--->"+orderId);
        return lssgOrderItemService.findAllOrderItemByOid(orderId);
    }

    /**
     * 提交订单(用户地址、支付方式、留言信息、订单状态等)
     * */
    @RequestMapping("/submitWithOrder")
    @ResponseBody
    @Transactional
    public Integer submitWithOrder(@RequestParam("orderId")String orderId,@RequestParam("addressId")Integer addressId,
                                   @RequestParam("paymentId")Integer paymentId,@RequestParam("notes")String notes){
    LssgOrders lssgOrders = lssgOrdersService.findOneByOrderId(orderId);
    LssgAddress lssgAddress = lssgAddressService.selectOneAddressById(addressId);
    LssgPayment lssgPayment = lssgPaymentService.selectOneById(paymentId);
    //订单状态初始化
    LssgOrderAction lssgOrderAction = new LssgOrderAction();
    lssgOrderAction.setOrderId(orderId);
    lssgOrderAction.setOrderStatus(3);
    lssgOrdersService.addOrderAction(lssgOrderAction);
    List<LssgOrderItem> lssgOrderItemList = lssgOrderItemService.findAllOrderItemByOid(orderId);
    for(LssgOrderItem lssgOrderItem :lssgOrderItemList){

        LssgProduct lssgProduct = lssgProductService.selectOneProductByProductId(lssgOrderItem.getLssgProduct().getProductId());
        lssgProduct.setProductNum(lssgProduct.getProductNum()-(lssgOrderItem.getOrderProductNum().intValue()));
        lssgProductService.updateByPrimaryKeySelective(lssgProduct);
    }

    //更新提交订单时间
    lssgOrders.setDoOrderTime(DateUtils.nowTime());
    //
    lssgOrders.setLssgAddress(lssgAddress);
    //
    lssgOrders.setPaymentName(lssgPayment.getPaymentName());
    lssgOrders.setLssgPayment(lssgPayment);
    //
    lssgOrders.setNotes(notes);
    return lssgOrdersService.updateOrderWithAddIdAndPayId(lssgOrders);
    }

    /**
     * 查询一个订单（订单提交成功，订单信息）
     * */
    @RequestMapping("/findOneOrder")
    @ResponseBody
    public LssgOrders findOneOrder(@RequestParam("orderId")String orderId){
        LssgOrders lssgOrders = lssgOrdersService.findOneByOrderId(orderId);
        LssgAddress lssgAddress = lssgAddressService.selectOneAddressById(lssgOrders.getLssgAddress().getAddressId());

        lssgOrders.setLssgAddress(lssgAddress);
        return lssgOrders;
    }

    /**
     * 订单支付超时，自动取消订单
     * */
    @RequestMapping("/timeOutOrder")
    @ResponseBody
    @Transactional
    public Integer timeOutOrder(@RequestParam("orderId")String orderId){
        LssgOrderAction lssgOrderAction = lssgOrdersService.findOneActionByOrderId(orderId);
        lssgOrderAction.setOrderStatus(2);
        //修改商品库存
        List<LssgOrderItem> lssgOrderItemList = lssgOrderItemService.findAllOrderItemByOid(orderId);
        for(LssgOrderItem lssgOrderItem :lssgOrderItemList){

            LssgProduct lssgProduct = lssgProductService.selectOneProductByProductId(lssgOrderItem.getLssgProduct().getProductId());
            lssgProduct.setProductNum(lssgProduct.getProductNum()+(lssgOrderItem.getOrderProductNum().intValue()));
            lssgProductService.updateByPrimaryKeySelective(lssgProduct);
        }
        return lssgOrdersService.updateOrderActionByOrderId(lssgOrderAction);
    }

    /**
     * 更新一个订单（订单提交成功，订单支付，订单状态）
     * */
    @RequestMapping("/payComple")
    @ResponseBody
    public Integer payComple(@RequestParam("orderId")String orderId){
        LssgOrderAction lssgOrderAction = lssgOrdersService.findOneActionByOrderId(orderId);
        lssgOrderAction.setOrderPayStatus("已支付");
        lssgOrderAction.setOrderStatus(4);
        lssgOrderAction.setLastPayTime(DateUtils.nowTime());
        return lssgOrdersService.updateOrderActionByOrderId(lssgOrderAction);
    }

    /**
     * 根据用户ID查询所有订单
     * */
    @RequestMapping("/showAllOrder")
    @ResponseBody
    public PageInfo<LssgOrders> showAllOrder(@RequestParam("currentPage") Integer currentPage,@RequestParam("pageSize")Integer pageSize){
        HttpSession session = request.getSession();
        LssgUserLogin lssgUserLogin = (LssgUserLogin) session.getAttribute("lssgUserLogin");
        PageInfo pageInfo = lssgOrdersService.findOrderByUserId(lssgUserLogin.getUserId(),currentPage,pageSize);
        return pageInfo;
    }
    /**
     * 根据订单状态（未支付、待收货、待发货）查询所有订单信息分页显示
     * */
    @RequestMapping("/showAllOrderByNoPay")
    @ResponseBody
    public PageInfo<LssgOrders> showAllOrderByNoPay(@RequestParam(value="orderPayStatus",required = false)String orderPayStatus,
                                                  @RequestParam(value="shoppingStatus",required = false)String shoppingStatus,
                                                  @RequestParam("currentPage") Integer currentPage,
                                                  @RequestParam("pageSize")Integer pageSize){
        HttpSession session = request.getSession();
        LssgUserLogin lssgUserLogin = (LssgUserLogin) session.getAttribute("lssgUserLogin");
        System.out.println("orderPayStatus----->"+orderPayStatus);
        System.out.println("shoppingStatus---->"+shoppingStatus);
        Map map = new HashMap();
        map.put("orderPayStatus",orderPayStatus);
        map.put("shoppingStatus",shoppingStatus);
        map.put("userId",lssgUserLogin.getUserId());
        PageInfo pageInfo = lssgOrdersService.findAllOrderByAction(map,currentPage,pageSize);
        return pageInfo;
    }

    /**
     *
     * */
    @RequestMapping("/showAllOrderByMap")
    @ResponseBody
    public PageInfo<LssgOrders> showAllOrderByMap(@RequestParam(value="paymentName",required = false)String paymentName,
                                                  @RequestParam(value="orderId",required = false)String orderId,
                                                  @RequestParam(value="statTime",required = false)String statTime,
                                                  @RequestParam(value="endTime",required = false)String endTime,
                                                  @RequestParam("currentPage") Integer currentPage,
                                                  @RequestParam("pageSize")Integer pageSize){


        Map map = new HashMap();
        PageInfo pageInfo = null;
        map.put("paymentName",paymentName);
        map.put("statTime",statTime);
        map.put("endTime",endTime);
        map.put("orderId",orderId);
        pageInfo = lssgOrdersService.findAllOrderByMap(map,currentPage,pageSize);
        return pageInfo;
    }


    /**
     *
     * */
    @RequestMapping("/showOrderPage")
    @ResponseBody
    public Map showOrderPage(@RequestBody Map map){
        List<LssgOrders> lssgOrdersList = lssgOrdersService.findAllOrderWithPage(map);

        Map map1 = new HashMap();
        map1.put("count", lssgOrdersService.querySize(map));
        map1.put("data", lssgOrdersList);
        map1.put("code", 0);
        map1.put("msg", "");
        return map1;
    }

    /**
     *
     * */
    @RequestMapping("/deleteSelectOrders")
    @ResponseBody
    public int deleteSelectOrders(@RequestBody String[] orderIds){
        for (String orderId : orderIds) {
            System.out.println(orderId);
        }
        return lssgOrdersService.deleteBatchStateByPrimaryKeySelective(orderIds);
    }

    /**
     * 删除一个订单
     * */
    @RequestMapping("/delOneOrder")
    @ResponseBody
    @Transactional
    public Integer delOneOrder(@RequestBody String orderId){
        lssgOrdersService.delOneActionByOrderId(orderId);       //删除这条订单状态数据
        lssgOrderItemService.delOneOrderItem(orderId);          //删除订单项
        return lssgOrdersService.delOneOrder(orderId);          //删除这个订单
    }

    /**
     * 更新一个订单（订单发货）
     * */
    @RequestMapping("/sendOneOrder")
    @ResponseBody
    public Integer sendOneOrder(@RequestParam("orderId")String orderId,@RequestParam("status")String shoppingStatus){
        LssgOrderAction lssgOrderAction = lssgOrdersService.findOneActionByOrderId(orderId);
        lssgOrderAction.setShoppingStatus(shoppingStatus);
        lssgOrderAction.setSentProductTime(DateUtils.nowTime());
        lssgOrderAction.setOrderStatus(5);
        return lssgOrdersService.updateOrderActionByOrderId(lssgOrderAction);
    }

    /**
     * 更新一个订单（确认收货）
     * */
    @RequestMapping("/confirmOrder")
    @ResponseBody
    public Integer confirmOrder(@RequestBody LssgOrderAction lssgOrderAction){
        lssgOrderAction.setOrderStatus(1);
        return lssgOrdersService.updateOrderActionByOrderId(lssgOrderAction);
    }



    /**
     *
     * */
    @RequestMapping("/isBuyProduct")
    @ResponseBody
    public boolean isBuyProduct(@RequestParam("productId")Integer productId){
        HttpSession session = request.getSession();
        LssgUserLogin lssgUserLogin = (LssgUserLogin) session.getAttribute("lssgUserLogin");
        LssgOrderItem lssgOrderItem = lssgOrdersService.isBuyByProductId(productId,lssgUserLogin.getUserId());
        return lssgOrderItem != null;
    }

    @RequestMapping("/findOneOrderByOrder")
    @ResponseBody
    public LssgOrders findOneOrderByOrder(@RequestParam("orderId") String orderId){
        return lssgOrdersService.findOneOrder(orderId);
    }

    @RequestMapping("/totalOrders")
    @ResponseBody
    public int totalOrders(){
        Map map = new HashMap();
        return lssgOrdersService.querySize(map);
    }

    @RequestMapping("/selectSomeOrderByMap")
    @ResponseBody
    public List<LssgOrders> selectSomeOrderByMap(@RequestBody Map map){
        HttpSession session = request.getSession();
        LssgUserLogin lssgUserLogin = (LssgUserLogin) session.getAttribute("lssgUserLogin");
        map.put("userId",lssgUserLogin.getUserId());
        return lssgOrdersService.findSomeOrderByMap(map);
    }

    @RequestMapping("/countSizeByMap")
    @ResponseBody
    public int countSizeByMap(@RequestBody Map map){
        HttpSession session = request.getSession();
        LssgUserLogin lssgUserLogin = (LssgUserLogin) session.getAttribute("lssgUserLogin");
        map.put("userId",lssgUserLogin.getUserId());
        return lssgOrdersService.querySizeByMap(map);
    }

    @RequestMapping("/countOrderActionByMap")
    @ResponseBody
    public Integer countOrderActionByMap(@RequestBody LssgOrderAction lssgOrderAction){
        return lssgOrdersService.countOrderAction(lssgOrderAction);
    }
}
