package com.lianwei.lssg.service.before;

import com.github.pagehelper.PageInfo;
import com.lianwei.lssg.entity.LssgMessage;

import java.util.List;
import java.util.Map;

public interface LssgMessageService {
    /**
     *
     *
     */
    PageInfo<LssgMessage> findMessageByProductId(Integer currentPage, Integer pageSize,Integer productId);

    /**
     *
     * */
    Integer insertOneMessage(LssgMessage lssgMessage);

    /**
     *
     * */
    Integer updateOneMessageInfo(Integer messageId);

    List<LssgMessage> selectAllMessage();

    int querySize();

    PageInfo<LssgMessage> selectAllReplyWithPage(Integer currentPage, Integer pageSize,Integer userId);

    PageInfo<LssgMessage> selectMyMessage(Integer currentPage, Integer pageSize,Integer userId);


    //关键字查询
    List<LssgMessage> query(Map map);

    //查询用户表总条数
    int querySize2(Map map);

    Integer changeStateMessage(LssgMessage lssgMessage);
}
