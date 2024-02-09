package com.spring.catalk.Service;

import com.spring.catalk.Dto.ChatsDto;
import java.util.List;

public interface ChatsService {

    public List<ChatsDto> getChatListByUserNum(int userNum);
}
