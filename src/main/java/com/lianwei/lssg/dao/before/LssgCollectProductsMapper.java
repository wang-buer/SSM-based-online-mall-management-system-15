package com.lianwei.lssg.dao.before;

import com.lianwei.lssg.entity.LssgCollectProducts;

import java.util.List;
import java.util.Map;

public interface LssgCollectProductsMapper {
    /**
     *
     * */
    int addProductToCollect(LssgCollectProducts lssgCollectProducts);

    /**
     *
     * */
    List<LssgCollectProducts> selectCollectProductByUserId(Integer userId);


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
