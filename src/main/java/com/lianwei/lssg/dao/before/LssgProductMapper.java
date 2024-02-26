/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/12
  Time: 21:09
*/
package com.lianwei.lssg.dao.before;

import com.lianwei.lssg.entity.CountEntity;
import com.lianwei.lssg.entity.LssgProduct;

import java.util.List;
import java.util.Map;

public interface LssgProductMapper {
    /**
     *
     * */
    LssgProduct selectOneProductByProductId(Integer productId);

    /**
     *
     * */
    List<LssgProduct> selectAllProductByProductClassId(Integer productClassId);

    int deleteByPrimaryKey(Integer productId);

    //  {"ids":List<String> ids}  将参数转化为键值对的形式
    int   batchDelete(Integer[] productIds);

    int insert(LssgProduct lssgProduct);

    int insertSelective(LssgProduct lssgProduct);

    LssgProduct selectByPrimaryKey(Integer productId);

    int updateByPrimaryKeySelective(LssgProduct lssgProduct);

    int updateByPrimaryKey(LssgProduct lssgProductcord);


    //关键字查询
    List<LssgProduct> query(Map map);

    //查询用户表总条数
    int querySize(Map map);

    List<LssgProduct> selectLssgProductByProductClassId(Integer productId);
    
    /**
     * 
     * */
    List<LssgProduct> selectBySomeProductByMap(Map map);


    /**
     *
     * */
    List<LssgProduct> selectAllProductByMapWithPage(Map map);

    /**
     *
     * */
    List<LssgProduct> selectSomeLikeProduct(Map map);

    List<CountEntity> groupCountSelect();

    List<CountEntity> countProduct();

    List<CountEntity> countProductAndClass();

    List<CountEntity> countProductByOneWeek(int classId);

    List<LssgProduct> selectSomeProductByQueryWithPage(Map map);


    List<LssgProduct> selectProductSmallPrice();

}
