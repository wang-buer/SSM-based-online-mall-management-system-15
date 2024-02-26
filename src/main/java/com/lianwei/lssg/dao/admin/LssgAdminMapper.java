package com.lianwei.lssg.dao.admin;

import com.lianwei.lssg.entity.LssgAdmin;

import java.util.List;
import java.util.Map;

public interface LssgAdminMapper {

    /**
     *
     * */
    Integer insertAdmin(LssgAdmin lssgAdmin);

    /**
     *
     * */
    LssgAdmin selectOneAdmin(LssgAdmin lssgAdmin);

    /**
     *
     * */
    List<LssgAdmin> findAllAdminWithPage(Map map);

    /**
     *
     * */
    Integer querySize(Map map);

    /**
     *
     * */
    Integer updateOneAdmin(LssgAdmin lssgAdmin);

    /**
     *
     * */
    Integer delOneAdminById(Integer adminId);


    /**
     *
     * */
    Integer deleteBatchStateByPrimaryKeySelective(Integer[] adminIds);


}
