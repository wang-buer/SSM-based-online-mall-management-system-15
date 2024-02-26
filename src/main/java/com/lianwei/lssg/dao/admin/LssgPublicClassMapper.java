package com.lianwei.lssg.dao.admin;

import com.lianwei.lssg.entity.LssgPublicClass;

import java.util.List;
import java.util.Map;

public interface LssgPublicClassMapper {
    /**
     *
     * */
    Integer addOnePublicClass(LssgPublicClass lssgPublicClass);

    /**
     *
     * */
    Integer delOnePublicClass(Map map);

    /**
     *
     * */
    Integer delOnePublicClassById(Integer publicClassId);

    /**
     *
     * */
    List<LssgPublicClass> findAllPublicClass(Map map);

    /**
     *
     * */
    Integer querySize(Map map);

    /**
     *
     * */
    Integer deleteBatchStateByPrimaryKeySelective(Integer[] publicClassId);

    /**
     *
     * */
    List<LssgPublicClass> selectAllPublicClass();

    /**
     *
     * */
    List<LssgPublicClass> selectAllPublicClassByLocation(Integer locationId);
}
