/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/6/5
  Time: 10:00
*/
package com.lianwei.lssg.service.before;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lianwei.lssg.dao.before.*;
import com.lianwei.lssg.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class LssgMessageServiceImpl implements LssgMessageService{
    @Autowired
    private LssgMessageMapper lssgMessageMapper;
    @Autowired
    private LssgUserLoginMapper lssgUserLoginMapper;
    @Autowired
    private LssgUserInfoMapper lssgUserInfoMapper;
    @Autowired
    private LssgReplyMapper lssgReplyMapper;
    @Autowired
    private LssgProductMapper lssgProductMapper;

    @Transactional
    public PageInfo<LssgMessage> findMessageByProductId(Integer currentPage, Integer pageSize, Integer productId) {
        PageHelper.startPage(currentPage, pageSize);
        List<LssgMessage> lssgMessages = lssgMessageMapper.findMessageByProductId(productId);

        List<LssgReply> lssgReplyList = null;
        Map map = new HashMap();
        for(LssgMessage lssgMessage:lssgMessages){
            map.put("messageId",lssgMessage.getMessageId());
            map.put("replyProductId",lssgMessage.getLssgProduct().getProductId());
            System.out.println("---------0-------------->"+lssgMessage.getLssgUserLogin().getUserId());
            lssgReplyList = lssgReplyMapper.findAllReplyByMessageId(map);
            System.out.println("lssgReplyList----"+lssgReplyList);
            if(lssgReplyList.size()>0){
                for(LssgReply lssgReply:lssgReplyList){
                    System.out.println("---------1-------------->"+lssgReply.getReplyUserId());
                   /* LssgUserLogin lssgUserLogin =lssgUserLoginMapper.selectUserLoginInfoByUserId(lssgReply.getReplyUserId());
                    LssgUserInfo lssgUserInfo = lssgUserInfoMapper.selectOneByUserId(lssgReply.getReplyUserId());*/
                    LssgUserLogin lssgUserLogin;
                    LssgUserInfo lssgUserInfo;
                    lssgUserLogin =lssgUserLoginMapper.selectUserLoginInfoByUserId(lssgReply.getReplyUserId());
                    lssgUserInfo = lssgUserInfoMapper.selectOneByUserId(lssgReply.getReplyUserId());
                    lssgReply.setReplyName(lssgUserLogin.getUserName());
                    lssgReply.setReplyUrl(lssgUserInfo.getUserImg());
                    lssgReply.setLssgUserLogin(lssgUserLogin);
                    lssgReply.setLssgUserInfo(lssgUserInfo);
                    System.out.println("lssgReply.getToUserId()----->"+lssgReply.getToUserId());
                    System.out.println("lssgReply.getReplyName()----->"+lssgReply.getReplyName());

                }
            }
            lssgMessage.setLssgReplyList(lssgReplyList);
        }
        PageInfo<LssgMessage> pageInfo = new PageInfo<LssgMessage>(lssgMessages);
        return pageInfo;
    }

    public Integer insertOneMessage(LssgMessage lssgMessage) {
        return lssgMessageMapper.insertOneMessage(lssgMessage);
    }

    public Integer updateOneMessageInfo(Integer messageId) {
        return lssgMessageMapper.updateOneMessageInfo(messageId);
    }

    public List<LssgMessage> selectAllMessage() {
        return lssgMessageMapper.selectAllMessage();
    }

    public int querySize() {
        return lssgMessageMapper.querySize();
    }

    public PageInfo<LssgMessage> selectAllReplyWithPage(Integer currentPage, Integer pageSize, Integer userId) {
        PageHelper.startPage(currentPage, pageSize);
        List<LssgMessage> lssgMessageList = lssgMessageMapper.selectAllReplyInfoWithPage(userId);
        List<LssgReply> lssgReplyList = null;

        for(LssgMessage lssgMessage : lssgMessageList){
            Map map = new HashMap();
            map.put("messageId",lssgMessage.getMessageId());
            lssgReplyList = lssgReplyMapper.findAllReplyByMessageId(map);
            if(lssgReplyList.size()>0){
                for(LssgReply lssgReply:lssgReplyList){
                    System.out.println("---------1-------------->"+lssgReply.getReplyUserId());
                    LssgUserLogin lssgUserLogin =lssgUserLoginMapper.selectUserLoginInfoByUserId(lssgReply.getReplyUserId());
                    LssgUserInfo lssgUserInfo = lssgUserInfoMapper.selectOneByUserId(lssgReply.getReplyUserId());
                    lssgReply.setReplyName(lssgUserLogin.getUserName());
                    lssgReply.setReplyUrl(lssgUserInfo.getUserImg());
                    lssgReply.setLssgUserLogin(lssgUserLogin);
                    lssgReply.setLssgUserInfo(lssgUserInfo);
                }
            }
            //LssgUserInfo lssgUserInfo = lssgUserInfoMapper.selectOneByUserId(userId);
           // LssgUserLogin lssgUserLogin = lssgUserLoginMapper.selectUserLoginInfoByUserId(userId);
            lssgMessage.setLssgReplyList(lssgReplyList);
        }
        PageInfo<LssgMessage> pageInfo = new PageInfo<LssgMessage>(lssgMessageList);
        return pageInfo;
    }

    public PageInfo<LssgMessage> selectMyMessage(Integer currentPage, Integer pageSize, Integer userId) {
        PageHelper.startPage(currentPage, pageSize);
        List<LssgMessage> lssgMessages = lssgMessageMapper.selectMyMessage(userId);
        for(LssgMessage lssgMessage : lssgMessages){
            LssgUserLogin lssgUserLogin = lssgUserLoginMapper.selectUserLoginInfoByUserId(userId);
            LssgUserInfo lssgUserInfo = lssgUserInfoMapper.selectOneByUserId(userId);
            LssgProduct lssgProduct = lssgProductMapper.selectOneProductByProductId(lssgMessage.getLssgProduct().getProductId());
            lssgMessage.setLssgUserInfo(lssgUserInfo);
            lssgMessage.setLssgUserLogin(lssgUserLogin);
            lssgMessage.setLssgProduct(lssgProduct);

        }
        PageInfo<LssgMessage> pageInfo = new PageInfo<LssgMessage>(lssgMessages);
        return pageInfo;
    }


    public List<LssgMessage> query(Map map) {
        int count =(Integer) map.get("nums");//每一页显示的条数
        int start =( (Integer)map.get("curr")-1)*count;//每一页的开始下标
        map.put("start",start);
        System.out.println("进入到服务层的查询方法");
        List<LssgMessage> list = lssgMessageMapper.query(map);
        return list;
    }

    public int querySize2(Map map) {
        return lssgMessageMapper.querySize2(map);
    }

    public Integer changeStateMessage(LssgMessage lssgMessage) {
        return lssgMessageMapper.changeStateMessage(lssgMessage);
    }


}
