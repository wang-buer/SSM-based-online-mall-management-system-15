/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/24
  Time: 10:10
*/
package com.lianwei.lssg.service.before;

import com.lianwei.lssg.dao.before.LssgAddressMapper;
import com.lianwei.lssg.entity.LssgAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class LssgAddressServiceImpl implements LssgAddressService{
    @Autowired
    private LssgAddressMapper lssgAddressMapper;
    public Integer addOneAddress(LssgAddress lssgAddress) {
        return lssgAddressMapper.addOneAddress(lssgAddress);
    }

    public List<LssgAddress> selectAllAddressByUserId(Integer userId) {
        return lssgAddressMapper.selectAllAddressByUserId(userId);
    }

    public LssgAddress selectOneAddressById(Integer addressId) {
        return lssgAddressMapper.selectOneAddressById(addressId);
    }

    public Integer delOneAddressById(Integer addressId) {
        return lssgAddressMapper.delOneAddressById(addressId);
    }

    public Integer updateOneAddressById(LssgAddress lssgAddress) {
        return lssgAddressMapper.updateOneAddressById(lssgAddress);
    }


}
