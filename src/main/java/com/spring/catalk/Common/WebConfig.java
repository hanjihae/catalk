package com.spring.catalk.Common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Autowired
    AuthInterceptor authInterceptor;

    public void addInterceptor(InterceptorRegistry registry){
        registry.addInterceptor(authInterceptor).addPathPatterns("/**/*").addPathPatterns("/**/**/*")
                .excludePathPatterns("/**/*.js").excludePathPatterns("/**/*.css")
                .excludePathPatterns("/**/**/*.js").excludePathPatterns("/**/**/*.css");
    }


}
