package com.spring.catalk.Controller;

import com.spring.catalk.Dto.FriendDto;
import com.spring.catalk.Dto.ProfileDto;
import com.spring.catalk.Dto.UserDto;
import com.spring.catalk.Service.FriendService;
import com.spring.catalk.Service.ProfileService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/friend")
public class FriendController {

    @Autowired
    @Qualifier("friendService")
    private FriendService friendService;

    @Autowired
    @Qualifier("profileService")
    private ProfileService profileService;

    @RequestMapping(path = {"/friend_list"})
    public String friends(HttpSession session, Model model) {
        //유저+프로필 정보 가져오기, 친구 리스트 가져오기
        UserDto user = (UserDto) session.getAttribute("loginUser");
        ProfileDto profile = profileService.findUserProfile(user.getUserNum());
        List<FriendDto> friends =  friendService.findFriendList(user.getUserNum());
        int friendCount = friendService.findFriendCount(user.getUserNum());

        model.addAttribute("profile",profile);
        model.addAttribute("friends",friends);
        model.addAttribute("friendCount",friendCount);
        
        return "friend/friend_list";
    }



}
