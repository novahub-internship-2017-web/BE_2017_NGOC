package com.ngoc.bookmanagement.Interceptor;

import com.ngoc.bookmanagement.constant.Constant;
import com.ngoc.bookmanagement.model.Book;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.repository.BookRepository;
import com.ngoc.bookmanagement.service.BookService;
import com.ngoc.bookmanagement.service.BookServiceImpl;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class BookInterceptor implements HandlerInterceptor{

    private static final Logger logger = Logger.getLogger(BookInterceptor.class);

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        logger.info("BookInterceptor, preHandle, url = " + request.getRequestURI());

        String url = request.getRequestURI();

        url = url.substring(url.indexOf("book/") + 5);

        if(url.indexOf("/") > 0) {
            url = url.substring(0, url.indexOf("/"));
        }

        try{
            long idBookOfPage = Long.parseLong(url);

            return true;
        }
        catch(NumberFormatException exception){
            response.sendRedirect(request.getContextPath() + "/404");
            return false;
        }
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        logger.info("BookInterceptor, postHandle, url = " + request.getRequestURI());

        String uri = request.getRequestURI();

        if(uri.endsWith("/edit")) {
            HttpSession session = request.getSession();
            User userLogin = (User) session.getAttribute(Constant.userLoginSession);

            try {
                Book book = (Book) request.getAttribute(Constant.bookAttribute);

                System.out.println(book);

                if (book.getUser_id() != userLogin.getId()) {
                    response.sendRedirect(request.getContextPath() + "/403");
                }
            } catch (NumberFormatException exception) {
                response.sendRedirect(request.getContextPath() + "/404");
            }
        }
    }
}
