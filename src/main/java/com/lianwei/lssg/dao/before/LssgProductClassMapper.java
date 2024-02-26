package com.lianwei.lssg.dao.before;

import com.lianwei.lssg.entity.LssgProductClass;

import java.util.List;
import java.util.Map;

public interface LssgProductClassMapper {

    LssgProductClass selectByPrimaryKey(Integer productClassId) ;

    List<LssgProductClass> findByAll();

    int deleteByPrimaryKey(Integer productClassId);

    int insert(LssgProductClass lssgProductClass);

    int insertSelective(LssgProductClass lssgProductClass);


    int updateByPrimaryKeySelective(LssgProductClass lssgProductClass);

    int updateByPrimaryKey(LssgProductClass lssgProductClass);


    //关键字查询
    List<LssgProductClass> query(Map map);

    //查询用户表总条数
    int querySize(Map map);

    List<LssgProductClass> selectLssgProductByProductClassId(Integer productClassId);
}
