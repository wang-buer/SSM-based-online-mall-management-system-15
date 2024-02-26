package com.lianwei.lssg.dao.before;

import com.lianwei.lssg.entity.LssgMessage;

import java.util.List;
import java.util.Map;

public interface LssgMessageMapper {

    /**
     *
     * */
    Integer insertOneMessage(LssgMessage lssgMessage);

    /**
     *
     * */
    List<LssgMessage> findMessageByProductId(Integer productId);

    /**
     *
     * */
    Integer updateOneMessageInfo(Integer messageId);

    List<LssgMessage> selectAllMessage();

    int querySize();

    List<LssgMessage> selectAllReplyInfoWithPage(Integer userId);

    List<LssgMessage> selectMyMessage(Integer userId);


    //关键字查询
    List<LssgMessage> query(Map map);

    //查询用户表总条数
    int querySize2(Map map);

    LssgMessage selectOneMessageByMessageId(Integer messageId);

    Integer changeStateMessage(LssgMessage lssgMessage);
}
