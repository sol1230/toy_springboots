package com.study.toy_springboots.service;

import com.study.toy_springboots.dao.SurveyMemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AttachFileService {
  @Autowired
  SurveyMemberDao surveyMemberDao;

  // 회원 가입
  public Object insertOne(Object dataMap) {
    String sqlMapId = "SurveyMember.insertWithUID";
    Object result = surveyMemberDao.insertOne(sqlMapId, dataMap);
    return result;
  }

  // 회원 삭제
  public Object deleteOne(Object dataMap) {
    String sqlMapId = "SurveyMember.deleteByUID";
    Object result = surveyMemberDao.deleteOne(sqlMapId, dataMap);
    return result;
  }

  // 회원 정보 수정
  public Object updateOne(Object dataMap) {
    String sqlMapId = "SurveyMember.updateByUID";
    Object result = surveyMemberDao.updateOne(sqlMapId, dataMap);
    return result;
  }

  // 회원 목록
  public Object getList(Object dataMap) {
    String sqlMapId = "SurveyMember.selectListByUID";
    Object result = surveyMemberDao.getList(sqlMapId, dataMap);
    return result;
  }

  // 선택된 회원 정보
  public Object getOne(Object dataMap) {
    String sqlMapId = "SurveyMember.selectByUID";
    Object result = surveyMemberDao.getOne(sqlMapId, dataMap);
    return result;
  }

  // 회원 삭제 후 목록
  public Object deleteAndGetList(Object dataMap) {
    Object result = this.deleteOne(dataMap);
    result = this.getList(dataMap);
    return result;
  }

  // 회원 정보 수정 후 목록
  public Object updateAndGetList(Object dataMap) {
    Object result = this.updateOne(dataMap);
    result = this.getList(dataMap);
    return result;
  }

  // 회원 정보 추가 후 목록
  public Object insertAndGetList(Object dataMap) {
    Object result = this.insertOne(dataMap);
    result = this.getList(dataMap);
    return result;
  }

  // 사진 추가
  public Object insertWithFilesAndGetList(Object dataMap) {
    // insert files
    Object result = this.insertMulti(dataMap);
    result = this.getList(dataMap);
    return result;
  }

  public Object insertMulti(Object dataMap) {
    String sqlMapId = "SurveyMember.insertFile";
    Object result = surveyMemberDao.getList(sqlMapId, dataMap);
    return result;
  }
}
