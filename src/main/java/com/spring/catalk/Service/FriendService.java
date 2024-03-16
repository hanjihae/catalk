package com.spring.catalk.Service;

import com.spring.catalk.Dto.FriendDto;

import java.util.List;

public interface FriendService {

    public List<FriendDto> findFriendList(int userNum);

    public int findFriendCount(int userNum);

    public List<FriendDto> findMyFriendList(int userNum, String searchVal);

    public int findMyFriendCount(int userNum, String searchVal);

    public void addNewFriend(int userNum, int newFriendNo);
}
