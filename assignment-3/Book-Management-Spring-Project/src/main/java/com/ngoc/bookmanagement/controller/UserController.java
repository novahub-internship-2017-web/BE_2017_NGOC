package com.ngoc.bookmanagement.controller;

import com.ngoc.bookmanagement.constant.Constant;
import com.ngoc.bookmanagement.exception.UserNullException;
import com.ngoc.bookmanagement.model.Avatar;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.service.AvatarService;
import com.ngoc.bookmanagement.service.PasswordService;
import com.ngoc.bookmanagement.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import java.io.File;

@Controller
@MultipartConfig(maxFileSize = 1024*1024*1024)
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private AvatarService avatarService;

    @Autowired
    private PasswordService passwordService;

    private static final Logger logger = Logger.getLogger(UserController.class);

    @GetMapping(value = {"/user/{id}", "/admin/user/{id}"})
    public String userGet(@PathVariable("id") long id,
                          Model model,
                          HttpServletRequest request) throws UserNullException {
        logger.info(request.getRequestURI() + ", method = GET");
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        User user = userService.get(id);
        request.setAttribute(Constant.userAvatarUrlAttribute, user.getAvatar().getUrl());

        if(user == null) {
            logger.error(request.getRequestURI() +  ", method = GET, message = User isn't exist");
            throw new UserNullException("User isn't exist");
        }

        model.addAttribute("user", user);
        logger.info(request.getRequestURI() + ", method = GET, message = get user " + id + " successfully");
        request.setAttribute(Constant.idAttribute, id);
        return "user";
    }

    @PostMapping(value = {"/user/{id}", "/admin/user/{id}"})
    public String userPost(@PathVariable("id") long id,
                          @ModelAttribute("user") User user,
                          @RequestParam("avatarImage") @Nullable MultipartFile avatar,
                          Model model,
                          HttpServletRequest request) {
        logger.info(request.getRequestURI());
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        User userTemp = userService.get(id);
        Avatar avatarTemp = avatarService.get(userTemp.getAvatar_id());

        try {
            String fileName = avatar.getOriginalFilename();

            String urlTargetFolder = request.getServletContext().getRealPath("/");
            String urlProject = urlTargetFolder;
            String urlFiles = urlProject + "images";

            File folder = new File(urlFiles);
            if(!folder.exists())
                folder.mkdir();

            File file = new File(urlFiles, "avatar-" + id + ".jpg");
            System.out.println(urlFiles + File.separator + "avatar-" + id + ".jpg");
            avatar.transferTo(file);
            avatarTemp.setFile(avatar);
            avatarTemp.setUrl(File.separator + "images" + File.separator + "avatar-" + id + ".jpg");
            avatarService.update(userTemp.getAvatar_id(), avatarTemp);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("message", "upload failed");
        }


        userService.updateProfile(id, user);
        user = userService.get(id);
        userService.writeSession(user, request);

        logger.info(request.getRequestURI() + ", method = POST, message = update user " + id + " successfully");
        request.setAttribute(Constant.userAvatarUrlAttribute, user.getAvatar().getUrl());
        request.setAttribute(Constant.successMessageSession, "Change profile successfully");
        model.addAttribute("user", user);

        return "user";
    }

    @GetMapping(value = {"/user/{id}/Change-Password", "/admin/user/{id}/Change-Password"})
    public String changePasswordGet(@PathVariable("id") long id,
                                    Model model,
                                    HttpServletRequest request){
        logger.info(request.getRequestURI() + ", method = GET");
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        User user = userService.get(id);

        model.addAttribute("user", user);

        return "userChangePassword";
    }

    @PostMapping(value = {"/user/{id}/Change-Password", "/admin/user/{id}/Change-Password"})
    public String changePasswordPost(@PathVariable("id") long id,
                                     @ModelAttribute("user") User user,
                                     BindingResult result,
                                     HttpServletRequest request) {
        logger.info(request.getRequestURI() + ", method = POST");
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        if(!result.hasErrors()) {
            User currentUser = userService.get(id);
            String oldPassword = user.getPassword();
            String newPassword = user.getMatchingPassword();
            String reNewPassword = user.getRePassword();

            if (!passwordService.encryptPassword(oldPassword).equals(currentUser.getEncryptingPassword())) {
                result.rejectValue("password", "User.password", "Current password isn't true");
                request.setAttribute(Constant.errorMessageSession, "Current password isn't true");
            } else {
                if (!newPassword.equals(reNewPassword)) {
                    result.rejectValue("rePassword", "User.rePassword", "New password isn't equal Renew Password");
                    request.setAttribute(Constant.errorMessageSession, "New password isn't equal Renew Password");
                } else {
                    currentUser.setPassword(newPassword);
                    userService.updatePassword(id, newPassword);

                    if(!(request.getRequestURI().indexOf("/admin/user") >= 0))
                        userService.writeSession(currentUser, request);
                    request.setAttribute(Constant.successMessageSession, "Change password successfully");
                }
            }
        }

        return "userChangePassword";
    }
}
