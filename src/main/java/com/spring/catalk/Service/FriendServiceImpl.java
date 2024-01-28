package com.spring.catalk.Service;

import com.spring.catalk.Dto.FriendDto;
import com.spring.catalk.Mapper.FriendMapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("friendService") @Repository
public class FriendServiceImpl implements FriendService {

    @Setter
    @Autowired
    private FriendMapper friendMapper;

    public List<FriendDto> findFriendList(int userNum){

        return friendMapper.selectFriendsList(userNum);
    }

    public int findFriendCount(int userNum){
        return friendMapper.selectFriendCount(userNum);
    }

}
