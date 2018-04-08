package com.ngoc.bookmanagement;

import com.ngoc.bookmanagement.interceptor.AuthenticateInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//@Configuration
public class SpringWebConfig implements WebMvcConfigurer {

    public void addInterceptors(InterceptorRegistry registry){
        registry.addInterceptor(new AuthenticateInterceptor())
                .addPathPatterns("/**");
    }
}
