package com.study.toy_springboots.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SurveyMemberDao {
  @Autowired
  private SqlSessionTemplate sqlSessionTemplate;

  public Object getList(String sqlMapId, Object dataMap) {
    Object result = sqlSessionTemplate.selectList(sqlMapId, dataMap);
    return result;
  }

  public Object insertOne(String sqlMapId, Object dataMap) {
    Object result = sqlSessionTemplate.insert(sqlMapId, dataMap);
    return result;
  }

  public Object getOne(String sqlMapId, Object dataMap) {
    Object result = sqlSessionTemplate.selectOne(sqlMapId, dataMap);
    return result;
  }

  public Object updateOne(String sqlMapId, Object dataMap) {
    Object result = sqlSessionTemplate.update(sqlMapId, dataMap);
    return result;
  }

  public Object deleteOne(String sqlMapId, Object dataMap) {
    Object result = sqlSessionTemplate.delete(sqlMapId, dataMap);
    return result;
  }
}
