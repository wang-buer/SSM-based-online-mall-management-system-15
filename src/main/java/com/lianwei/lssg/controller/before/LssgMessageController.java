/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/6/5
  Time: 10:05
*/
package com.lianwei.lssg.controller.before;

import com.github.pagehelper.PageInfo;
import com.lianwei.lssg.entity.LssgMessage;
import com.lianwei.lssg.entity.LssgProduct;
import com.lianwei.lssg.entity.LssgReply;
import com.lianwei.lssg.entity.LssgUserLogin;
import com.lianwei.lssg.service.before.LssgMessageService;
import com.lianwei.lssg.service.before.LssgReplyService;
import com.lianwei.lssg.utils.DateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("message")
public class LssgMessageController {
    @Resource
    private LssgMessageService lssgMessageService;
    @Resource
    private HttpServletRequest request;
    @Resource
    private LssgReplyService lssgReplyService;

    /**
     *
     * */
    @RequestMapping("/sentOneMessage")
    @ResponseBody
    public Integer sentOneMessage(@RequestParam("productId")Integer productId,
                                  @RequestParam("productStars")Integer productStars,
                                  @RequestParam("messageContent")String messageContent){
        LssgMessage lssgMessage = new LssgMessage();
        LssgProduct lssgProduct = new LssgProduct();
        lssgProduct.setProductId(productId);
        HttpSession session = request.getSession();
        LssgUserLogin lssgUserLogin = (LssgUserLogin) session.getAttribute("lssgUserLogin");
        lssgMessage.setLssgUserLogin(lssgUserLogin);
        lssgMessage.setMessageContent(messageContent);
        lssgMessage.setProductStars(productStars);
        lssgMessage.setLssgProduct(lssgProduct);
        lssgMessage.setMessageTime(DateUtils.nowTime());
        return lssgMessageService.insertOneMessage(lssgMessage);
    }

    /**
     *
     * */
    @RequestMapping("/sentReplyMessage")
    @ResponseBody
    public Integer sentReplyMessage(@RequestParam("productId")Integer productId,
                                    @RequestParam(value=("userId"),required = false)Integer userId,
                                    @RequestParam("messageId") Integer messageId,
                                    @RequestParam("replyContent")String replyContent){
        LssgProduct lssgProduct = new LssgProduct();
        LssgMessage lssgMessage = new LssgMessage();
        lssgMessage.setMessageId(messageId);
        LssgReply lssgReply = new LssgReply();

        if(userId!=0){
            lssgReply.setToUserId(userId);
        }
        lssgProduct.setProductId(productId);
        HttpSession session = request.getSession();
        LssgUserLogin lssgUserLogin = (LssgUserLogin) session.getAttribute("lssgUserLogin");
        lssgReply.setLssgUserLogin(lssgUserLogin);
        lssgReply.setReplyUserId(lssgUserLogin.getUserId());
        lssgReply.setLssgProduct(lssgProduct);
        lssgReply.setLssgMessage(lssgMessage);
        lssgReply.setReplyTime(DateUtils.nowTime());
        lssgReply.setReplyContent(replyContent);
        return lssgReplyService.insertOneReply(lssgReply);
    }

    /**
     *
     * */
    @RequestMapping("/findMessageByProductIdWithPage")
    @ResponseBody
    public PageInfo<LssgMessage> findMessageByProductIdWithPage(@RequestParam("currentPage") Integer currentPage,
                                                                @RequestParam("pageSize") Integer pageSize,
                                                                @RequestParam("productId")Integer productId){
        PageInfo pageInfo = lssgMessageService.findMessageByProductId(currentPage,pageSize,productId);
        return pageInfo;
    }

    /**
     *
     * */
    @RequestMapping("/delOneInfo")
    @ResponseBody
    public Integer delOneInfo(@RequestParam("messageId")Integer messageId,
                              @RequestParam("replyId")Integer replyId){
        Integer i = 0;
        if(messageId!=0){
          i = lssgMessageService.updateOneMessageInfo(messageId);
        }
        if(replyId!=0){
            i = lssgReplyService.updateOneReplyInfo(replyId);
        }
        return i;
    }

    @RequestMapping("/findAllMessage")
    @ResponseBody
    public List<LssgMessage> findAllMessage(){
        return lssgMessageService.selectAllMessage();
    }

    @RequestMapping("/messageCount")
    @ResponseBody
    public int messageCount(){
        return lssgMessageService.querySize();
    }


    @RequestMapping("findAllReplyWithPageByUid")
    @ResponseBody
    public PageInfo<LssgMessage> findAllReplyWithPageByUid(@RequestParam("currentPage") Integer currentPage,
                                                           @RequestParam("pageSize") Integer pageSize){
        HttpSession session = request.getSession();
        LssgUserLogin lssgUserLogin = (LssgUserLogin) session.getAttribute("lssgUserLogin");
        return lssgMessageService.selectAllReplyWithPage(currentPage,pageSize,lssgUserLogin.getUserId());
    }

    @RequestMapping("findMyMessage")
    @ResponseBody
    public PageInfo<LssgMessage> findMyMessage(@RequestParam("currentPage") Integer currentPage,
                                                           @RequestParam("pageSize") Integer pageSize){
        HttpSession session = request.getSession();
        LssgUserLogin lssgUserLogin = (LssgUserLogin) session.getAttribute("lssgUserLogin");
        return lssgMessageService.selectMyMessage(currentPage,pageSize,lssgUserLogin.getUserId());
    }


    @RequestMapping("/findByPage")
    @ResponseBody
    public Map findByPage(@RequestBody Map map, @RequestParam("query") String query) {
        map.put("query",query);
        List<LssgMessage> list = this.lssgMessageService.query(map);
        Map map1 = new HashMap();
        map1.put("count", lssgMessageService.querySize2(map));
        map1.put("data", list);
        map1.put("code", 0);
        map1.put("msg", "");
        return map1;
    }

    @RequestMapping("/update")
    @ResponseBody
    public int edit(@RequestBody LssgMessage lssgMessage) {
        int result = this.lssgMessageService.changeStateMessage(lssgMessage);
        return result;
    }
}
