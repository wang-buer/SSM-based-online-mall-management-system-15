/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/18
  Time: 20:00
*/
package com.lianwei.lssg.controller.before;

import com.github.pagehelper.PageInfo;
import com.lianwei.lssg.entity.LssgCollectProducts;
import com.lianwei.lssg.entity.LssgProduct;
import com.lianwei.lssg.entity.LssgUserLogin;
import com.lianwei.lssg.service.before.LssgCollectProductsService;
import com.lianwei.lssg.service.before.LssgProductService;
import com.lianwei.lssg.utils.DateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("collect")
public class LssgCollectProductsController {
    @Resource
    LssgCollectProductsService lssgCollectProductsService;
    @Resource
    HttpServletRequest request;
    @Resource
    private LssgProductService lssgProductService;
    /**
     * 商品加入到收藏夹
     * */
    @RequestMapping(value = "/addToCollect",method = RequestMethod.POST)
    @ResponseBody
    public Integer addToCollect(@RequestParam("productId")Integer productId){
        LssgCollectProducts lssgCollectProducts = new LssgCollectProducts();
        HttpSession session = request.getSession();
        LssgUserLogin lssgUserLogin = (LssgUserLogin) session.getAttribute("lssgUserLogin");
        LssgProduct lssgProduct = lssgProductService.selectOneProductByProductId(productId);
        lssgCollectProducts.setProductId(productId);
        lssgCollectProducts.setProductImg(lssgProduct.getProductPhoto());
        lssgCollectProducts.setProductName(lssgProduct.getProductName());
        lssgCollectProducts.setProductNum(lssgProduct.getProductNum());
        lssgCollectProducts.setProductPrice(lssgProduct.getProductMallPrice());
        lssgCollectProducts.setUserId(lssgUserLogin.getUserId());
        lssgCollectProducts.setAddCollectTime(DateUtils.nowTime());
        return lssgCollectProductsService.addProductToCollect(lssgCollectProducts);
    }
    /**
     *
     * */
    @RequestMapping("/findOneProductInCollect")
    @ResponseBody
    public Map findOneProductInCollect(@RequestParam("productId")Integer productId){
        System.out.println("productId--->"+productId);
        HttpSession session = request.getSession();
        LssgUserLogin lssgUserLogin = (LssgUserLogin) session.getAttribute("lssgUserLogin");
        Map map1 = new HashMap();
        map1.put("productId",productId);
        map1.put("userId",lssgUserLogin.getUserId());
        Map map = new HashMap();
        LssgCollectProducts lssgCollectProducts =lssgCollectProductsService.selectOneCollectProductByProductIdAndUid(map1);
        if(lssgCollectProducts==null){
            map.put("data",false);
        }else{
            map.put("data",true);
        }
        return map;
    }

    /**
     *分页显示
     * */
    @RequestMapping("/showCollect")
    @ResponseBody
    public PageInfo<LssgCollectProducts> showCollect(@RequestParam("currentPage")Integer currentPage,
                                                     @RequestParam("pageSize")Integer pageSize){
        HttpSession session = request.getSession();
        LssgUserLogin lssgUserLogin = (LssgUserLogin) session.getAttribute("lssgUserLogin");
        return lssgCollectProductsService.selectCollectProductByUserId(lssgUserLogin.getUserId(),currentPage,pageSize);
    }

    /**
     *
     * */
    @RequestMapping("/delCollectProduct")
    @ResponseBody
    public Integer delCollectProduct(@RequestParam("productId")Integer productId){
        HttpSession session = request.getSession();
        LssgUserLogin lssgUserLogin = (LssgUserLogin) session.getAttribute("lssgUserLogin");
        Map map = new HashMap();
        map.put("userId",lssgUserLogin.getUserId());
        map.put("productId",productId);
        return lssgCollectProductsService.delCollectProduct(map);
    }


    @RequestMapping("/countCollect")
    @ResponseBody
    public Integer countCollect(@RequestParam("userName")String userName){
        return lssgCollectProductsService.countCollectNum(userName);
    }


    /**
     * 商品加入到收藏夹
     * */
   /* @RequestMapping(value = "/addToCollect",method = RequestMethod.POST)
    @ResponseBody
    public Integer addToCollect(@RequestBody LssgCollectProducts lssgCollectProducts){
        System.out.println("lssgCollectProducts---->"+lssgCollectProducts);
        HttpSession session = request.getSession();
        LssgUserLogin lssgUserLogin = (LssgUserLogin) session.getAttribute("lssgUserLogin");
        lssgCollectProducts.setUserId(lssgUserLogin.getUserId());
        lssgCollectProducts.setAddCollectTime(DateUtils.nowTime());
        return lssgCollectProductsService.addProductToCollect(lssgCollectProducts);
    }*/

}
