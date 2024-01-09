package com.spring.catalk.Common;

import com.spring.catalk.Dto.UserDto;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class AuthInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
        System.out.println("preHandle");
        String uri = req.getRequestURI();

        HttpSession session = req.getSession();
        UserDto user = (UserDto) session.getAttribute("loginUser");

        if (user == null) {
            if (uri.contains("/friends") || uri.contains("/chats") || uri.contains("/my-profile")) {// 로그인 안 하면 볼 수 없는 페이지
                resp.sendRedirect("home");
                return false;
            }
        }else{
            if (uri.contains("/showSignUp") || uri.contains("/home") ) {// 로그인 하면 볼 수 없는 페이지
                resp.sendRedirect("friends");
                return false;
            }
        }
        if (user != null && user.getUserType().equals("User") ) {

            if (uri.contains("admin")) {
                resp.sendRedirect("friends");
                return false;
            }
        }
        return true;

    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    }


}
