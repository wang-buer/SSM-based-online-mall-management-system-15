/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/22
  Time: 20:16
*/
package com.lianwei.lssg.service.before;

import com.lianwei.lssg.dao.before.LssgOrderItemMapper;
import com.lianwei.lssg.entity.LssgOrderItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class LssgOrderItemServiceImpl implements LssgOrderItemService{
    @Autowired
    private LssgOrderItemMapper lssgOrderItemMapper;
    /**
     *
     * */
    public List<LssgOrderItem> findAllOrderItemByOid(String orderId) {
        return lssgOrderItemMapper.findAllOrderItemByOid(orderId);
    }


    public Integer delOneOrderItem(String orderId) {
        return lssgOrderItemMapper.delOneOrderItem(orderId);
    }
}
