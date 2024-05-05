package com.spring.catalk.Controller;

import com.spring.catalk.Dto.ProfileDto;
import com.spring.catalk.Dto.UserDto;
import com.spring.catalk.Service.ProfileService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller
@RequestMapping("/profile")
public class ProfileController {

    @Autowired
    @Qualifier("profileService")
    private ProfileService profileService;

    @RequestMapping(path = {"/profileMine"})
    public String showMyProfileMain(HttpSession session, Model model, int userNum) {
        ProfileDto myProfile =  profileService.getMyProfile(userNum);
        String UPLOAD_DIR = "/profile/";
        String realPath = System.getProperty("user.dir") + "/src/main/webapp/WEB-INF/views/resources" + UPLOAD_DIR;

        model.addAttribute("profile",myProfile);
        model.addAttribute("filePath",realPath);
        return "profile/profile_main_my";
    }

    @RequestMapping(path = {"/profileMain"})
    public String showProfileMain(HttpSession session, Model model, int userNum) {
        return "profile/profile_main";
    }

    @RequestMapping("/uploadProfileFile")
    public String handleFileUpload(@RequestParam("file") MultipartFile file, @RequestParam("ProfileNum") int ProfileNum, @RequestParam("profileMain") String profileMain, HttpSession session) {
        UserDto user = (UserDto) session.getAttribute("loginUser");
        if (!file.isEmpty()) {
            try {
                // 파일 이름 생성
                String originalFilename = file.getOriginalFilename();
                String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
                LocalDateTime now = LocalDateTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS");
                String fileName = now.format(formatter) + extension;

                // 파일을 서버에 저장
                String UPLOAD_DIR = "/profile/";
                String realPath = System.getProperty("user.dir") + "/src/main/webapp/WEB-INF/views/resources" + UPLOAD_DIR;
                String filePath = realPath + fileName;
                file.transferTo(new File(filePath));

                profileService.saveProfileFile(ProfileNum, fileName, profileMain);

            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "redirect:profile/profileMine?userNum="+user.getUserNum();
    }

}
