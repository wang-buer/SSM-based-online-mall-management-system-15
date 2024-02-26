/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/12
  Time: 21:15
*/
package com.lianwei.lssg.service.before;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lianwei.lssg.dao.before.LssgProductMapper;
import com.lianwei.lssg.entity.CountEntity;
import com.lianwei.lssg.entity.LssgProduct;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class LssgProductServiceImpl implements LssgProductService {
    @Resource
    private LssgProductMapper lssgProductMapper;

    /**
     *
     * */
    public LssgProduct selectOneProductByProductId(Integer productId) {
        return lssgProductMapper.selectOneProductByProductId(productId);
    }

    public List<LssgProduct> selectAllProductByProductClassId(Integer productClassId) {
        return lssgProductMapper.selectAllProductByProductClassId(productClassId);
    }

    public int deleteByPrimaryKey(Integer productId) {
        return lssgProductMapper.deleteByPrimaryKey(productId);
    }

    public  int  batchDelete(Integer[] productIds){
        return   lssgProductMapper.batchDelete(productIds);
    }

    public int insert(LssgProduct lssgProduct) {
        return lssgProductMapper.insert(lssgProduct);
    }

    public int insertSelective(LssgProduct lssgProduct) {
        return lssgProductMapper.insertSelective(lssgProduct);
    }

    public LssgProduct selectByPrimaryKey(Integer productId) {
        return lssgProductMapper.selectByPrimaryKey(productId);
    }

    public int updateByPrimaryKeySelective(LssgProduct lssgProduct) {
        return lssgProductMapper.updateByPrimaryKeySelective(lssgProduct);
    }

    public int updateByPrimaryKey(LssgProduct lssgProduct) {
        return lssgProductMapper.updateByPrimaryKey(lssgProduct);
    }


    public List<LssgProduct> query(Map map) {
        int count =(Integer) map.get("nums");//每一页显示的条数
        int start =( (Integer)map.get("curr")-1)*count;//每一页的开始下标
        map.put("start",start);
        System.out.println("进入到服务层的查询方法");
        List<LssgProduct> list = lssgProductMapper.query(map);
        return list;
    }

    public int querySize(Map map) {
        return lssgProductMapper.querySize(map);
    }

    public List<LssgProduct> selectLssgProductByProductClassId(Integer productId) {
        return lssgProductMapper.selectLssgProductByProductClassId(productId);
    }

    public List<LssgProduct> selectBySomeProductByMap(Map map) {
        return lssgProductMapper.selectBySomeProductByMap(map);
    }


    /**
     *
     * @param map
     * @param currentPage
     * @param pageSize
     * @return
     */
    public PageInfo<LssgProduct> selectAllProductByMapWithPage(Map map, Integer currentPage, Integer pageSize) {
        PageHelper.startPage(currentPage, pageSize);
        List<LssgProduct> lssgProducts = lssgProductMapper.selectAllProductByMapWithPage(map);
        PageInfo<LssgProduct> pageInfo = new PageInfo<LssgProduct>(lssgProducts);
        return pageInfo;
    }

    /**
     *
     * @param productId
     * @return
     */
    @Transactional
    public List<LssgProduct> selectSomeLikeProduct(Integer productId) {
        Map map = new HashMap();
        LssgProduct lssgProduct = lssgProductMapper.selectOneProductByProductId(productId);
        map.put("productClassId",lssgProduct.getLssgProductClass().getProductClassId());
        char[] charArray = lssgProduct.getProductName().toCharArray();
        for(char i:charArray){
            map.put("query",i);
            System.out.println("i------>"+i);
        }

        return lssgProductMapper.selectSomeLikeProduct(map);
    }

    /**
     *
     * @param productId
     * @return
     */
    @Transactional
    public List<LssgProduct> selectHotLikeProduct(Integer productId) {
        LssgProduct lssgProduct = lssgProductMapper.selectOneProductByProductId(productId);
        Map map = new HashMap();
        map.put("productClassId",lssgProduct.getLssgProductClass().getProductClassId());
        map.put("isHot",lssgProduct.getIsHot());
        return lssgProductMapper.selectBySomeProductByMap(map);
    }

    public List<CountEntity> groupCountSelect() {
        return lssgProductMapper.groupCountSelect();
    }

    public List<CountEntity> countProduct() {
        return lssgProductMapper.countProduct();
    }

    public List<CountEntity> countProductAndClass() {
        return lssgProductMapper.countProductAndClass();
    }

    public List<CountEntity> countProductByOneWeek(int classId) {
        return lssgProductMapper.countProductByOneWeek(classId);
    }

    public PageInfo<LssgProduct> selectProductByProductNameWithPage(Map map, Integer currentPage, Integer pageSize) {
        PageHelper.startPage(currentPage, pageSize);
        List<LssgProduct> lssgProducts = lssgProductMapper.selectSomeProductByQueryWithPage(map);
        PageInfo<LssgProduct> pageInfo = new PageInfo<LssgProduct>(lssgProducts);
        return pageInfo;
    }

    public List<LssgProduct> selectProductSmallPrice() {
        return lssgProductMapper.selectProductSmallPrice();
    }
}
