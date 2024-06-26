package com.spring.catalk.Controller;

import com.spring.catalk.Dto.FriendDto;
import com.spring.catalk.Dto.ProfileDto;
import com.spring.catalk.Dto.UserDto;
import com.spring.catalk.Service.FriendService;
import com.spring.catalk.Service.ProfileService;
import com.spring.catalk.Service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/friend")
public class FriendController {

    @Autowired
    @Qualifier("userService")
    private UserService userService;

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
        List<FriendDto> friends = friendService.findFriendList(user.getUserNum());
        int friendCount = friendService.findFriendCount(user.getUserNum());

        model.addAttribute("profile",profile);
        model.addAttribute("friends",friends);
        model.addAttribute("friendCount",friendCount);
        
        return "friend/friend_list";
    }


    @RequestMapping(value ="/friend_list_inner")
    public String findMyFriend(String searchVal, HttpSession session, Model model) throws IOException {
        UserDto user = (UserDto) session.getAttribute("loginUser");
        ProfileDto profile = profileService.findUserProfile(user.getUserNum());
        List<FriendDto> friends = friendService.findMyFriendList(user.getUserNum(), searchVal);
        int friendCount = friendService.findMyFriendCount(user.getUserNum(), searchVal);

        model.addAttribute("profile", profile);
        model.addAttribute("friends", friends);
        model.addAttribute("friendCount", friendCount);

        return "friend/friend_list_inner";
    }

    @RequestMapping(value ="/findFriendPopup")
    public String findNewFriend() { return "friend/findFriendPopup"; }


    @RequestMapping(value ="/findFriendPopupList")
    public String findNewFriendList(String findFriendSearch, HttpSession session, Model model) {
        //내 친구 아닌 사람들 중 검색어랑 연관 있는 리스트
        UserDto user = (UserDto) session.getAttribute("loginUser");
        List<UserDto> userList = userService.findUserList(user.getUserNum(), findFriendSearch);

        model.addAttribute("userList", userList);
        return "friend/findFriendPopup";
    }

    @RequestMapping(value ="/addNewFriend") @ResponseBody
    public String addNewFriend(@RequestParam int newFriendNo, HttpSession session) {
        //내 친구 아닌 사람들 중 검색어랑 연관 있는 리스트
        UserDto user = (UserDto) session.getAttribute("loginUser");
        friendService.addNewFriend(user.getUserNum(), newFriendNo);
        return "data";
    }


}
