package com.spring.catalk.Service;

import com.spring.catalk.Dto.ChatsDto;
import com.spring.catalk.Mapper.ChatsMapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("chatsService")
@Repository
public class ChatsServiceImpl implements ChatsService {

    @Setter
    @Autowired
    private ChatsMapper chatsMapper;

    public List<ChatsDto> getChatListByUserNum(int userNum) {
        return chatsMapper.getChatListByUserNum(userNum);
    }
}
