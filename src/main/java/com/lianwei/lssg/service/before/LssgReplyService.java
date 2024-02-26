package com.lianwei.lssg.service.before;

import com.lianwei.lssg.entity.LssgReply;

import java.util.List;
import java.util.Map;

public interface LssgReplyService {

   /*List<LssgReply> findAllReplyByMessageId(Integer messageId);*/

    /**
     *
     * */
    Integer insertOneReply(LssgReply lssgReply);

    Integer updateOneReplyInfo(Integer replyId);

    LssgReply selectOneReplyByReplyId(Integer replyId);

    //关键字查询
    List<LssgReply> query(Map map);

    //查询用户表总条数
    int querySize(Map map);
}
