package com.study.toy_springboots.configurations;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfiguration {

  public SecurityFilterChain filterChain(HttpSecurity httpSecurity)
    throws Exception {
    // 권한 주기
    httpSecurity
      .authorizeRequests()
      // .antMatchers("/").access("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
      .antMatchers("/")
      .authenticated() // 로그인 여부만 판단
      .antMatchers("/admin")
      .access("hasRole('ROLE_ADMIN')")
      .anyRequest()
      .permitAll(); // 설정한 url외 모두 접근 가능

    // 로그인
    httpSecurity
      .formLogin()
      .loginPage("loginForm")
      .loginProcessingUrl("/login")
      .defaultSuccessUrl("/");

    return httpSecurity.build();
  }
}
