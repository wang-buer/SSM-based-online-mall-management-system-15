package com.lianwei.lssg.dao.before;

import com.lianwei.lssg.entity.LssgAddress;

import java.util.List;

public interface LssgAddressMapper {
    /**
     *
     * */
    Integer addOneAddress(LssgAddress lssgAddress);

    /**
     *
     * */
    List<LssgAddress> selectAllAddressByUserId(Integer userId);

    /**
     *
     * */
    LssgAddress selectOneAddressById(Integer addressId);

    /**
     *
     * */
    Integer delOneAddressById(Integer addressId);

    /**
     *
     * */
    Integer updateOneAddressById(LssgAddress lssgAddress);
}
