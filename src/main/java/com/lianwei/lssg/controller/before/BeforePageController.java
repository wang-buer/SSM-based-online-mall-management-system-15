/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/8
  Time: 18:54
*/
package com.lianwei.lssg.controller.before;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 专门用于显示前台页面的控制器
 */
@Controller
@RequestMapping("beforePage")
public class BeforePageController {

    /**
     * index.jsp  beforePage/toIndex
     * */
    @RequestMapping("/toIndex")
    public String toIndex(){
        return "prefixViews/index";
    }

    /**
     * head.jsp
     * */
    @RequestMapping("/toHead")
    public String toHead(){
        return "prefixViews/head";
    }

    /**
     * foot.jsp
     * */
    @RequestMapping("/toFoot")
    public String toFoot(){
        return "prefixViews/foot";
    }
    /*头顶部导航栏*/
    /**
     * regist.jsp  beforePage/toRegist
     * */
    @RequestMapping("/toRegist")
    public String toRegist(){
        return "prefixViews/regist";
    }

    /**
     * login.jsp
     * */
    @RequestMapping("/toLogin")
    public String toLogin(){
        return "prefixViews/login";
    }

    /**
     * order.jsp
     * */
    @RequestMapping("/toOrder")
    public String toOrder(){
        return "prefixViews/order/order";
    }

    /**
     * wishlist.jsp
     * */
    @RequestMapping("/toWishList")
    public String toWishList(){
        return "prefixViews/wishlist/wishlist";
    }

    /**
     * cart.jsp
     * */
    @RequestMapping("/toCart")
    public String toCart(){
        return "prefixViews/car/car";
    }

    /**
     * checkout.jsp
     * */
    @RequestMapping("/toCheckout")
    public String toCheckout(){
        return "prefixViews/order/checkout";
    }

    /**
     * notices.jsp
     * */
    @RequestMapping("/toNotices")
    public String toNotices(){
        return "prefixViews/news/notices";
    }

    /**
     * vegetables-list.jsp
     * */
    @RequestMapping("/toVegetablesList")
    public String toVegetablesList(){
        return "prefixViews/product/vegetables-list";
    }

    /**
     * fruits-list.jsp
     * */
    @RequestMapping("/toFruitsList")
    public String toFruitsList(){
        return "prefixViews/product/fruits-list";
    }


    /**
     * product-details.jsp
     * */
    @RequestMapping("/toProductDetails")
    public String toProductDetails(){
        return "prefixViews/product/product-details";
    }

    /**
     * orderSuccess.jsp
     * */
    @RequestMapping("/toOrderSuccess")
    public String toOrderSuccess(){
        return "prefixViews/order/orderSuccess";
    }

    /**
     * my-account.jsp
     * */
    @RequestMapping("/toMyAccount")
    public String toMyAccount(){
        return "prefixViews/userInfo/my-account";
    }

    /**
     *about.jsp
     * */
    @RequestMapping("/toAbout")
    public String toAbout(){
        return "prefixViews/other/about";
    }

    /**
     *404.jsp
     * */
    @RequestMapping("/to404")
    public String to404(){
        return "prefixViews/other/404";
    }


    /**
     *faq.jsp
     * */
    @RequestMapping("/toFaq")
    public String toFaq(){
        return "prefixViews/other/faq";
    }

    /**
     *about.jsp
     * */
    @RequestMapping("/toServices")
    public String toServices(){
        return "prefixViews/other/services";
    }



}
