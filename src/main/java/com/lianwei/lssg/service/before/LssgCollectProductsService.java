package com.lianwei.lssg.service.before;

import com.github.pagehelper.PageInfo;
import com.lianwei.lssg.entity.LssgCollectProducts;

import java.util.List;
import java.util.Map;

public interface LssgCollectProductsService {
    /**
     *
     * */
    int addProductToCollect(LssgCollectProducts lssgCollectProducts);

    /**
     *
     * */
    PageInfo<LssgCollectProducts> selectCollectProductByUserId(Integer userId, Integer currentPage, Integer pageSize);

    /**
     *
     * */
    LssgCollectProducts selectOneCollectProductByProductIdAndUid(Map map);

    /**
     *
     * */
    int delCollectProduct(Map map);

    Integer countCollectNum(String userName);

}
