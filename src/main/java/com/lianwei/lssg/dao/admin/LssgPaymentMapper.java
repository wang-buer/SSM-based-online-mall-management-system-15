package com.lianwei.lssg.dao.admin;

import com.lianwei.lssg.entity.LssgPayment;

import java.util.List;
import java.util.Map;

public interface LssgPaymentMapper {
    /**
     *
     * */
    List<LssgPayment> findAllPayment();

    /**
     *
     * */
    Integer addOnePayment(LssgPayment lssgPayment);

    /**
     *
     * */
    Integer delOnePayment(Integer paymentId);

    /**
     *
     * */
    Integer deleteBatchStateByPrimaryKeySelective(Integer[] paymentIds);
    /**
     *
     * */
    List<LssgPayment> findAllPaymentWithPage(Map map);

    /**
     *
     * */
    Integer querySize(Map map);

    /**
     *
     * */
    LssgPayment selectOneById(Integer paymentId);

    /**
     *
     * */
    Integer updateOnePayment(LssgPayment lssgPayment);

    Integer changeOnePayment(LssgPayment lssgPayment);
}
