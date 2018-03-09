package com.ngoc.bookmanagement.controller;

import com.ngoc.bookmanagement.model.MyFile;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import java.io.File;

@Controller
@MultipartConfig(maxFileSize = 1024*1024*1024)
public class UploadController {

    @GetMapping(value = "/upload")
    public String index(Model model) {
        model.addAttribute("myFile", new MyFile());
        return "uploadFile";
    }

    @PostMapping(value = "/upload")
    public String uploadFile(MyFile myFile, Model model, HttpServletRequest request)
    {
        try {
            MultipartFile multipartFile = myFile.getMultipartFile();
            String fileName = multipartFile.getOriginalFilename();

            String urlTargetFolder = request.getServletContext().getRealPath("/");
            String urlProject = urlTargetFolder;
            String urlFiles = urlProject + "images";

            File folder = new File(urlFiles);
            if(!folder.exists())
                folder.mkdir();

            File file = new File(urlFiles, "image.jpg");
            System.out.println(urlFiles + File.separator + fileName);
            multipartFile.transferTo(file);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("message", "upload failed");
        }

        return "uploadFile";
    }
}
