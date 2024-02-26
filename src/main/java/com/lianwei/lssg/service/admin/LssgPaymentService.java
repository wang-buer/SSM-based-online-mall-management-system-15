package com.lianwei.lssg.service.admin;

import com.lianwei.lssg.entity.LssgPayment;

import java.util.List;
import java.util.Map;

public interface LssgPaymentService {
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
