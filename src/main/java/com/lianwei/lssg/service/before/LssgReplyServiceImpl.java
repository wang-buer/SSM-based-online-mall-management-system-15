/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/6/5
  Time: 10:20
*/
package com.lianwei.lssg.service.before;


import com.lianwei.lssg.dao.before.LssgMessageMapper;
import com.lianwei.lssg.dao.before.LssgReplyMapper;
import com.lianwei.lssg.dao.before.LssgUserInfoMapper;
import com.lianwei.lssg.dao.before.LssgUserLoginMapper;
import com.lianwei.lssg.entity.LssgMessage;
import com.lianwei.lssg.entity.LssgReply;
import com.lianwei.lssg.entity.LssgUserInfo;
import com.lianwei.lssg.entity.LssgUserLogin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class LssgReplyServiceImpl implements LssgReplyService{
    @Autowired
    private LssgReplyMapper lssgReplyMapper;
    @Autowired
    private LssgUserLoginMapper lssgUserLoginMapper;
    @Autowired
    private LssgUserInfoMapper lssgUserInfoMapper;
    @Autowired
    private LssgMessageMapper lssgMessageMapper;

    public Integer insertOneReply(LssgReply lssgReply) {
        return lssgReplyMapper.insertOneReply(lssgReply);
    }

    public Integer updateOneReplyInfo(Integer replyId) {
        return lssgReplyMapper.updateOneReplyInfo(replyId);
    }

    public LssgReply selectOneReplyByReplyId(Integer replyId) {
       LssgReply lssgReply = lssgReplyMapper.selectOneReplyByReplyId(replyId);
        LssgUserInfo lssgUserInfo = lssgUserInfoMapper.selectOneByUserId(lssgReply.getReplyUserId());
        LssgUserLogin lssgUserLogin = lssgUserLoginMapper.selectUserLoginInfoByUserId(lssgReply.getReplyUserId());
        lssgReply.setLssgUserLogin(lssgUserLogin);
        lssgReply.setLssgUserInfo(lssgUserInfo);
        return lssgReply;
    }

    public List<LssgReply> query(Map map) {
        int count =(Integer) map.get("nums");//每一页显示的条数
        int start =( (Integer)map.get("curr")-1)*count;//每一页的开始下标
        map.put("start",start);
        System.out.println("进入到服务层的查询方法");
        List<LssgReply> list = lssgReplyMapper.query(map);
        for(LssgReply lssgReply : list){
            LssgUserLogin lssgUserLogin = lssgUserLoginMapper.selectUserLoginInfoByUserId(lssgReply.getToUserId());
            LssgMessage lssgMessage = lssgMessageMapper.selectOneMessageByMessageId(lssgReply.getLssgMessage().getMessageId());
            lssgReply.setLssgMessage(lssgMessage);
            lssgReply.setLssgUserLogin(lssgUserLogin);
        }
        return list;
    }

    public int querySize(Map map) {
        return lssgReplyMapper.querySize(map);
    }

}
