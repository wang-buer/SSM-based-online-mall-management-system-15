/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/18
  Time: 19:56
*/
package com.lianwei.lssg.service.before;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lianwei.lssg.dao.before.LssgCollectProductsMapper;
import com.lianwei.lssg.entity.LssgCollectProducts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class LssgCollectProductsServiceImpl implements LssgCollectProductsService {
    @Autowired
    LssgCollectProductsMapper lssgCollectProductsMapper;

    public int addProductToCollect(LssgCollectProducts lssgCollectProducts) {
        return lssgCollectProductsMapper.addProductToCollect(lssgCollectProducts);
    }
    /**
     * 分页查询指定用户所有的收藏夹商品
     * */
    public PageInfo<LssgCollectProducts> selectCollectProductByUserId(Integer userId, Integer currentPage, Integer pageSize) {
        PageHelper.startPage(currentPage,pageSize);
        List<LssgCollectProducts> lssgCollectProducts = lssgCollectProductsMapper.selectCollectProductByUserId(userId);
        PageInfo<LssgCollectProducts> pageInfo = new PageInfo<LssgCollectProducts>(lssgCollectProducts);
        return pageInfo;
    }

    public LssgCollectProducts selectOneCollectProductByProductIdAndUid(Map map) {
        return lssgCollectProductsMapper.selectOneCollectProductByProductIdAndUid(map);
    }


    public int delCollectProduct(Map map) {
        return lssgCollectProductsMapper.delCollectProduct(map);
    }

    public Integer countCollectNum(String userName) {
        return lssgCollectProductsMapper.countCollectNum(userName);
    }
}
