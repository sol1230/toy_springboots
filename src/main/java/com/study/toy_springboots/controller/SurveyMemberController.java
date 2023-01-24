package com.study.toy_springboots.controller;

import com.study.toy_springboots.service.SurveyMemberService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = { "/member", "" })
public class SurveyMemberController {
  @Autowired
  SurveyMemberService surveyMemberService;

  // 메인 페이지
  @RequestMapping(value = { "/main", "/", "" }, method = RequestMethod.GET) // localhost:8080/member/list
  public ModelAndView main(ModelAndView modelAndView) {
    modelAndView.setViewName("survey/a_main");
    return modelAndView;
  }

  // 회원가입 페이지
  @RequestMapping(value = "/signup_form", method = RequestMethod.GET)
  public ModelAndView signUp(
    @RequestParam Map<String, Object> params,
    ModelAndView modelAndView
  ) {
    modelAndView.setViewName("survey/signup_form");
    return new ModelAndView();
  }

  // 회원 가입
  @RequestMapping(value = { "/signup_done" }, method = RequestMethod.POST)
  public ModelAndView insert(
    @RequestParam Map<String, Object> params,
    ModelAndView modelAndView
  ) {
    Object resultMap = surveyMemberService.insertAndGetList(params);
    modelAndView.addObject("resultMap", resultMap);
    modelAndView.setViewName("survey/signup_done");
    return modelAndView;
  }

  // 회원 목록 페이지
  @RequestMapping(value = { "/list" }, method = RequestMethod.GET) // localhost:8080/member/list
  public ModelAndView list(
    @RequestParam Map<String, Object> params,
    ModelAndView modelAndView
  ) {
    Object resultMap = surveyMemberService.getList(params);
    modelAndView.addObject("resultMap", resultMap);
    modelAndView.setViewName("survey/user_management");
    return modelAndView;
  }

  // 회원 수정 페이지
  @RequestMapping(value = { "/edit/{uniqueId}" }, method = RequestMethod.GET)
  public ModelAndView edit(
    @RequestParam Map<String, Object> params,
    @PathVariable String uniqueId,
    ModelAndView modelAndView
  ) {
    params.put("UNIQUE_ID", uniqueId);
    Object resultMap = surveyMemberService.getOne(params);
    modelAndView.addObject("resultMap", resultMap);
    modelAndView.setViewName("survey/admin_userInfoModify");
    return modelAndView;
  }

  // 회원 수정 후 회원 목록 페이지
  @RequestMapping(value = { "/update" }, method = RequestMethod.POST)
  public ModelAndView update(
    @RequestParam Map<String, Object> params,
    ModelAndView modelAndView
  ) {
    Object resultMap = surveyMemberService.updateAndGetList(params);
    modelAndView.addObject("resultMap", resultMap);
    modelAndView.setViewName("survey/user_management");
    return modelAndView;
  }

  // 회원 삭제 후 회원 목록 페이지
  @RequestMapping(value = { "/delete{uniqueId}" }, method = RequestMethod.POST)
  public ModelAndView delete(
    @RequestParam Map<String, Object> params,
    @PathVariable String uniqueId,
    ModelAndView modelAndView
  ) {
    params.put("UNIQUE_ID", uniqueId);
    Object resultMap = surveyMemberService.deleteAndGetList(params);
    modelAndView.addObject("resultMap", resultMap);
    modelAndView.setViewName("survey/user_management");
    return modelAndView;
  }
}
