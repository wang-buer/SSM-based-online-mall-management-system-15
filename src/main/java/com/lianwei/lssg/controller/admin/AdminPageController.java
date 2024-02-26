/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/7
  Time: 23:14
*/
package com.lianwei.lssg.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 专门用于显示后台页面的控制器
 */
@Controller
@RequestMapping("page")
public class AdminPageController {
    /**
     * index.jsp  page/toIndex
     * */
    @RequestMapping("/toIndex")
    public String toIndex(){
        return "suffixViews/index";
    }

    /**
     * welcome.jsp
     * */
    @RequestMapping("/toWelcome")
    public String toWelcome(){
        return "suffixViews/welcome";
    }


    /**
     *notice-list.jsp
     * */
    @RequestMapping("/toNoticeList")
    public String toNoticeList(){
        return "suffixViews/notice/notice-list";
    }


    /**
     * admin-info.jsp
     * */
    @RequestMapping("/toAdminInfo")
    public String toAdminInfo(){
        return "suffixViews/admin/admin-info";
    }

    /**
     * admin-add.jsp
     * */
    @RequestMapping("/toAdminAdd")
    public String toAdminAdd(){
        return "suffixViews/admin/admin-add";
    }


    /**
     * articletype-list.jsp
     * */
    @RequestMapping("/toArticleTypeList")
    public String toArticleTypeList(){
        return "suffixViews/product/producttype-list";
    }

    /**
     * article-list.jsp
     * */
    @RequestMapping("/toArticleList")
    public String toArticleList(){
        return "suffixViews/product/product-list";
    }

    /**
     * admin-list.jsp
     * */
    @RequestMapping("/toAdminList")
    public String toAdminList(){
        return "suffixViews/admin/admin-list";
    }

    /**
     *member-list.jsp
     * */
    @RequestMapping("/toMemberList")
    public String toMemberDel(){
        return "suffixViews/member/member-list";
    }

    /**
     * noticetype-list.jsp
     * */
    @RequestMapping("/toNoticeTypeList")
    public String toNoticeTypeList(){
        return "suffixViews/notice/noticetype-list";
    }

    /**
     * payment.jsp
     * */
    @RequestMapping("/toPayment")
    public String toPayment(){
        return "suffixViews/pay/payment";
    }


    /**
     *
     * */
    @RequestMapping("/toPaymentAdd")
    public String toPaymentAdd(){
        return "suffixViews/pay/payment-add";
    }

    /**
     *
     * */
    @RequestMapping("/toPaymentEdit")
    public String toPaymentEdit(){
        return "suffixViews/pay/payment-edit";
    }

    /**
     * order-list.jsp
     * */
    @RequestMapping("/toOrderList")
    public String toOrderList(){
        return "suffixViews/order/order-list";
    }

    /**
     * orderList.jsp
     * */
    @RequestMapping("/toOrderList1")
    public String toOrderList1(){
        return "suffixViews/order/orderList";
    }

    /**
     * order-details
     * */
    @RequestMapping("/toOrderDetails")
    public String toOrderDetails(){
        return "suffixViews/order/order-view";
    }

    /**
     * content-reply-list.jsp
     * */
    @RequestMapping("/toContentReplyList")
    public String toContentList(){
        return "suffixViews/contents/content-reply-list";
    }

    /**
     * content-message-list.jsp
     * */
    @RequestMapping("/toContentMessageList")
    public String toArticleTypeAdd(){
        return "suffixViews/contents/content-message-list";
    }

    /**
     * notice-type-add.jsp
     * */
    @RequestMapping("/toNoticeTypeAdd")
    public String toNoticeTypeAdd(){
        return "suffixViews/notice/notice-type-add";
    }

    /**
     * contentadd.jsp
     * */
    @RequestMapping("/toContentAdd")
    public String toContentAdd(){
        return "suffixViews/contents/contentadd";
    }

    /**
     * notice-add.jsp
     * */
    @RequestMapping("/toNoticeAdd")
    public String toNoticeAdd(){
        return "suffixViews/notice/notice-add";
    }

    /**
     * notice-edit.jsp
     * */
    @RequestMapping("/toNoticeEdit")
    public String toNoticeEdit(){
        return "suffixViews/notice/notice-edit";
    }

    /**
     *
     * */
    @RequestMapping("/toSendOrder")
    public String toSendOrder(){
        return "suffixViews/order/orderUpdate";
    }


    /**
     *
     * */
    @RequestMapping("/toProductClassAdd")
    public String toProductClassAdd(){
        return "suffixViews/product/productClass-add";
    }



}
