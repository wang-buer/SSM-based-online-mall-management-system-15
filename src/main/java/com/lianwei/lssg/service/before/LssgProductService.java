package com.lianwei.lssg.service.before;

import com.github.pagehelper.PageInfo;
import com.lianwei.lssg.entity.CountEntity;
import com.lianwei.lssg.entity.LssgProduct;

import java.util.List;
import java.util.Map;

public interface LssgProductService {
    /**
     *
     * */
    LssgProduct selectOneProductByProductId(Integer productId);

    /**
     *
     * */
    List<LssgProduct> selectAllProductByProductClassId(Integer productClassId);

    /**
     *
     * @param productId
     * @return
     */
    int deleteByPrimaryKey(Integer productId);

    int  batchDelete(Integer[] productIds);

    int insert(LssgProduct productId);

    int insertSelective(LssgProduct lssgProduct);

    LssgProduct selectByPrimaryKey(Integer productId);

    int updateByPrimaryKeySelective(LssgProduct lssgProduct);

    int updateByPrimaryKey(LssgProduct lssgProduct);




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
    PageInfo<LssgProduct> selectAllProductByMapWithPage(Map map,Integer currentPage,Integer pageSize);

    /**
     *
     * */
    List<LssgProduct> selectSomeLikeProduct(Integer productId);

    /**
     *
     * */
    List<LssgProduct> selectHotLikeProduct(Integer productId);

    List<CountEntity> groupCountSelect();

    List<CountEntity> countProduct();

    List<CountEntity> countProductAndClass();

    List<CountEntity> countProductByOneWeek(int classId);

    PageInfo<LssgProduct> selectProductByProductNameWithPage(Map map,Integer currentPage,Integer pageSize);

    List<LssgProduct> selectProductSmallPrice();
}
