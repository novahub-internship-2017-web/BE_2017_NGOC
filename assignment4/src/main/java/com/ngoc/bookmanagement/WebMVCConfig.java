package com.ngoc.bookmanagement;

import com.ngoc.bookmanagement.interceptor.AuthenticationInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;

@Configuration
public class WebMVCConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new AuthenticationInterceptor())
                .addPathPatterns("/admin/**")
                .addPathPatterns("/user/**");
    }

    @Override
  	public void addResourceHandlers(ResourceHandlerRegistry registry) {
    	registry.addResourceHandler("/resources/js/**").addResourceLocations("classpath:/static/js/");
        registry.addResourceHandler("/resources/css/**").addResourceLocations("classpath:/static/css/");
  	}
}
