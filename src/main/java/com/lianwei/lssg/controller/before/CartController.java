/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/12
  Time: 17:41
*/
package com.lianwei.lssg.controller.before;

import com.alibaba.fastjson.JSON;
import com.lianwei.lssg.cache.JedisClient;
import com.lianwei.lssg.entity.LssgCart;
import com.lianwei.lssg.entity.LssgCartItem;
import com.lianwei.lssg.entity.LssgProduct;
import com.lianwei.lssg.service.before.LssgProductService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("cart")
public class CartController {

    @Resource
    private JedisClient jedisClient;
    @Resource
    private LssgProductService lssgProductService;

    private static final String REDIS_CART = "cart";



    /**
     * 商品加入到购物车
     * */
    @RequestMapping("/addProductToCart")
    @ResponseBody
    public LssgCart addProductToCart(@RequestParam("productId")Integer productId, @RequestParam(value = "nums",required = false)String nums){

        //获取已登录的用户信息
        Subject subject = SecurityUtils.getSubject();
        String userLoginName = (String)subject.getPrincipal();
        LssgProduct lssgProduct = lssgProductService.selectOneProductByProductId(productId);
        /**
         * 判断lssgProduct是否为空
         * */

        String productNumState;
        if(lssgProduct.getProductNum()<=0){
            productNumState = "无货";
        }else {
            productNumState = "有货";
        }
        /**
         * 存在一个问题：当session超时后因该强制用户进行登入，只有登入成功才能做相应的操作
         * */
        if(("").equals(userLoginName)){
            System.out.println("session超时了");
            /*map.put("lssg",false);*/
            return null;
        }
        Boolean hexists = jedisClient.hexists(REDIS_CART, userLoginName);
        System.out.println("hexists---->"+hexists);
        LssgCart lssgCart = null;
        if(nums==null|| nums.equals("")){
            nums = String.valueOf(1);
        }
        BigDecimal num =new BigDecimal(nums);
        if(!hexists){
            lssgCart = new LssgCart();
            LssgCartItem lssgCartItem = new LssgCartItem(lssgProduct,num,lssgProduct.getProductMallPrice(),productNumState);
            lssgCartItem.setSubtotalPrice((lssgProduct.getProductMallPrice()).multiply(lssgCartItem.getBuyNum()));
            Map<String,LssgCartItem> lssgCartItemMap = new HashMap<String, LssgCartItem>();
            lssgCartItemMap.put(String.valueOf(lssgProduct.getProductId()),lssgCartItem);
            lssgCart.setCartItems(lssgCartItemMap);
            lssgCart.setTotalPrice(lssgCartItem.getSubtotalPrice());
        }else {
            lssgCart = JSON.parseObject(jedisClient.hget(REDIS_CART,userLoginName),LssgCart.class);
            if(lssgCart.getCartItems().containsKey(String.valueOf(lssgProduct.getProductId()))){
                LssgCartItem lssgCartItem = lssgCart.getCartItems().get(String.valueOf(lssgProduct.getProductId()));
                //数量
                lssgCartItem.setBuyNum(lssgCartItem.getBuyNum().add(num));
                //小计+商品的单价(由于是BigDecimal类型所以用他自己封装好的)
                lssgCartItem.setSubtotalPrice((lssgProduct.getProductMallPrice()).multiply(lssgCartItem.getBuyNum()));
                lssgCart.getCartItems().put(String.valueOf(lssgProduct.getProductId()),lssgCartItem);
            }else{
                //没买过，先创建新的购物项
                LssgCartItem lssgCartItem = new LssgCartItem(lssgProduct,num,lssgProduct.getProductMallPrice(),productNumState);

                lssgCartItem.setSubtotalPrice((lssgProduct.getProductMallPrice()).multiply(lssgCartItem.getBuyNum()));
                //存入购物车的Map集合
                lssgCart.getCartItems().put(String.valueOf(lssgProduct.getProductId()),lssgCartItem);

            }
            //计算总价格，并加入到购物车
            BigDecimal sum = new BigDecimal("0.00");
            Set<String> ks = lssgCart.getCartItems().keySet();
            for(String key: ks){
                LssgCartItem lssgCartItem = lssgCart.getCartItems().get(key);
                sum = sum.add(((lssgCartItem.getLssgProduct().getProductMallPrice()).multiply(lssgCartItem.getBuyNum())));
            }
            lssgCart.setTotalPrice(sum);
        }
        jedisClient.hset(REDIS_CART,userLoginName, JSON.toJSONString(lssgCart));
        System.out.println("添加成功！");
        jedisClient.hget(REDIS_CART,userLoginName);
        return JSON.parseObject(jedisClient.hget(REDIS_CART,userLoginName),LssgCart.class);
    }

    /**
     *购物车信息展示到前台购物车页
     * */
    @RequestMapping("/fromCartShowProduct")
    @ResponseBody
    public LssgCart fromCartShowProduct(){
        //获取已登录的用户信息
        Subject subject = SecurityUtils.getSubject();
        String userLoginName = (String) subject.getPrincipal();
        /**
         * 存在一个问题：当session超时后因该强制用户进行登入，只有登入成功才能做相应的操作
         * */
        if(("").equals(userLoginName)){
            System.out.println("session超时了");
            /*map.put("lssg",false);*/
            return null;
        }
        Boolean hexists = jedisClient.hexists(REDIS_CART, userLoginName);
        if(hexists){
            return JSON.parseObject(jedisClient.hget(REDIS_CART,userLoginName),LssgCart.class);
        }
       return null;
    }

    /**
     * 实现购物车页面通过+/-/输入 按钮来对商品的数量更新操作
     * */
    @RequestMapping("/updateCartProductNum")
    @ResponseBody
    public LssgCart decCartProductNum(@RequestParam("productId")Integer productId, @RequestParam("nums")String nums){
        //获取已登录的用户信息
        Subject subject = SecurityUtils.getSubject();
        String userLoginName = (String) subject.getPrincipal();
        LssgCart lssgCart = JSON.parseObject(jedisClient.hget(REDIS_CART,userLoginName),LssgCart.class);
        Map<String,LssgCartItem> lssgCartItemMap = lssgCart.getCartItems();
        LssgCartItem lssgCartItem = lssgCartItemMap.get(String.valueOf(productId));
        //购物项(该商品)原来的小计
        BigDecimal oldSubtotalPrice =  lssgCartItem.getSubtotalPrice();
        System.out.println("oldSubtotalPrice--->"+oldSubtotalPrice);
        BigDecimal num =new BigDecimal(nums);
        //更新购买数量
        lssgCartItem.setBuyNum(num);
        //更新小计
        lssgCartItem.setSubtotalPrice((lssgCartItem.getBuyNum()).multiply(lssgCartItem.getLssgProduct().getProductMallPrice()));
        //把购物项放到购物项(map)集合里
        lssgCartItemMap.put(String.valueOf(productId),lssgCartItem);
        lssgCart.setCartItems(lssgCartItemMap);
        //更新购物车总价   新的购物车总价 = 原来购物车总价 - 原来购物项的小计 + 新的购物项的小计
        lssgCart.setTotalPrice(lssgCart.getTotalPrice().subtract(oldSubtotalPrice).add(lssgCartItem.getSubtotalPrice()));
        //更新购物车到redis
        jedisClient.hset(REDIS_CART,userLoginName,JSON.toJSONString(lssgCart));
        //从redis中取出购物车传到到前台
        return JSON.parseObject(jedisClient.hget(REDIS_CART,userLoginName),LssgCart.class);
    }


    /**
     * 删除购物车中某一个购物项
     * */
    @RequestMapping("/delCartProduct")
    @ResponseBody
    public LssgCart delCartProduct(@RequestParam("productId")Integer productId, @RequestParam("nums")String nums){
        //获取已登录的用户信息
        Subject subject = SecurityUtils.getSubject();
        String userLoginName = (String) subject.getPrincipal();
        LssgCart lssgCart = JSON.parseObject(jedisClient.hget(REDIS_CART,userLoginName),LssgCart.class);
        Map<String,LssgCartItem> lssgCartItemMap = lssgCart.getCartItems();
        LssgCartItem lssgCartItem = lssgCartItemMap.get(String.valueOf(productId));


        BigDecimal num =new BigDecimal(nums);
        System.out.println("num---->"+num);
        //通过商品id删除该购物项
        lssgCartItemMap.remove(String.valueOf(productId));
        //更新总价 新的购物车总价 = 原来购物车总价 - 原来购物项的小计
        lssgCart.setTotalPrice(lssgCart.getTotalPrice().subtract(((lssgCartItem.getLssgProduct().getProductMallPrice()).multiply(num))));
        //更新购物车到redis
        jedisClient.hset(REDIS_CART,userLoginName,JSON.toJSONString(lssgCart));
        //从redis中取出购物车传到到前台
        return JSON.parseObject(jedisClient.hget(REDIS_CART,userLoginName),LssgCart.class);
    }


    /**
     * 清空购物车
     * */
    @RequestMapping("/emptyCart")
    public void emptyCart(){
        //获取已登录的用户信息
        Subject subject = SecurityUtils.getSubject();
        String userLoginName = (String) subject.getPrincipal();
        jedisClient.hdel(REDIS_CART,userLoginName);
    }

    /**
     *删除已结算的购物项
     * */
    @RequestMapping("/delProductByProductIds")
    @ResponseBody
    public LssgCart delProductByProductIds(@RequestParam(value="productIds[]")String[] productIds){
        //获取已登录的用户信息
        Subject subject = SecurityUtils.getSubject();
        String userLoginName = (String) subject.getPrincipal();
        LssgCart lssgCart = JSON.parseObject(jedisClient.hget(REDIS_CART,userLoginName),LssgCart.class);
        BigDecimal delTotalPrice =new BigDecimal("0.00");
        Map<String,LssgCartItem> lssgCartItemMap = lssgCart.getCartItems();
        for(String productId : productIds){
            LssgCartItem lssgCartItem = lssgCartItemMap.get(productId);
            // MySQL数据库中商品加上相对应的库存量
            delTotalPrice = delTotalPrice.add(lssgCartItem.getSubtotalPrice());
            //通过商品id删除该购物项
            lssgCartItemMap.remove(productId);
        }
        //更新总价 新的购物车总价 = 原来购物车总价 - 要结算购物项的小计
        lssgCart.setTotalPrice(lssgCart.getTotalPrice().subtract(delTotalPrice));
        //更新购物车到redis
        jedisClient.hset(REDIS_CART,userLoginName,JSON.toJSONString(lssgCart));
        //从redis中取出购物车传到到前台
        return JSON.parseObject(jedisClient.hget(REDIS_CART,userLoginName),LssgCart.class);

    }

    /**
     * 统计购物车中的购物项
     * */
    @RequestMapping("/countCartItme")
    @ResponseBody
    public Integer countCartItme(){
        //获取已登录的用户信息
        Subject subject = SecurityUtils.getSubject();
        String userLoginName = (String) subject.getPrincipal();
        LssgCart lssgCart = JSON.parseObject(jedisClient.hget(REDIS_CART,userLoginName),LssgCart.class);
        if(lssgCart==null){
            return 0;
        }
        return lssgCart.getCartItems().size();
    }


}
