package com.lianwei.lssg.service.admin;

import com.lianwei.lssg.entity.LssgPublicInfo;

import java.util.List;
import java.util.Map;

public interface LssgPublicInfoService {
    /**
     *
     * */
    List<LssgPublicInfo> findAllPublicInfoWithPage(Map map);

    /**
     *
     * */
    Integer querySize(Map map);

    /**
     *
     * */
    Integer delOnePublicInfo(Map map);

    /**
     *
     * */
    Integer addOnePublicInfo(LssgPublicInfo lssgPublicInfo);

    /**
     *
     * */
    Integer delOnePublicInfoById(Integer publicInfoId);

    /**
     *
     * */
    Integer deleteBatchStateByPrimaryKeySelective(Integer[] publicInfoIds);

    /**
     *
     * */
    LssgPublicInfo selectOneById(Integer publicInfoId);

    /**
     *
     * */
    Integer updateOneById(LssgPublicInfo lssgPublicInfo);

    /**
     *
     * */
    List<LssgPublicInfo> findOneByClassId(Map map);

    List<LssgPublicInfo> selectPublicClassByIdWithLimit(Integer publicClassId);
}
