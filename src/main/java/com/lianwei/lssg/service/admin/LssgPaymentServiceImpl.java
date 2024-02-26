/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/25
  Time: 8:41
*/
package com.lianwei.lssg.service.admin;

import com.lianwei.lssg.dao.admin.LssgPaymentMapper;
import com.lianwei.lssg.entity.LssgPayment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class LssgPaymentServiceImpl implements LssgPaymentService{
    @Autowired
    private LssgPaymentMapper lssgPaymentMapper;

    public List<LssgPayment> findAllPayment() {
        return lssgPaymentMapper.findAllPayment();
    }

    public Integer addOnePayment(LssgPayment lssgPayment) {
        return lssgPaymentMapper.addOnePayment(lssgPayment);
    }

    public Integer delOnePayment(Integer paymentId) {
        return lssgPaymentMapper.delOnePayment(paymentId);
    }

    public Integer deleteBatchStateByPrimaryKeySelective(Integer[] paymentIds) {
        return lssgPaymentMapper.deleteBatchStateByPrimaryKeySelective(paymentIds);
    }

    public List<LssgPayment> findAllPaymentWithPage(Map map) {
        int count =(Integer) map.get("nums");//每一页显示的条数
        int start =((Integer)map.get("curr")-1)*count;//每一页的开始下标
        map.put("start",start);
        return lssgPaymentMapper.findAllPaymentWithPage(map);
    }

    public Integer querySize(Map map) {
        return lssgPaymentMapper.querySize(map);
    }

    public LssgPayment selectOneById(Integer paymentId) {
        return lssgPaymentMapper.selectOneById(paymentId);
    }

    public Integer updateOnePayment(LssgPayment lssgPayment) {
        return lssgPaymentMapper.updateOnePayment(lssgPayment);
    }

    public Integer changeOnePayment(LssgPayment lssgPayment) {
        return lssgPaymentMapper.changeOnePayment(lssgPayment);
    }
}
