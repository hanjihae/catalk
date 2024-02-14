package com.spring.catalk.Mapper;

import com.spring.catalk.Dto.FriendDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface FriendMapper {

    @Select("SELECT f.friendNum, f.friendName, u.userName, p.profileName, p.ProfileMessage " +
            "FROM friend f JOIN user u ON f.friendNum = u.userNum LEFT JOIN profile p ON u.userNum = p.userNum AND u.userActive = 1 " +
            "WHERE f.userNum = #{userNum}")
    public List<FriendDto> selectFriendsList(int userNum);

    @Select("select count(*) from friend f left join user u on f.userNum = u.userNum and u.userActive = 1  where f.userNum = #{userNum}")
    public int selectFriendCount(int userNum);

    @Select("SELECT f.friendNum, f.friendName, u.userName, p.profileName, p.ProfileMessage " +
            "FROM friend f JOIN user u ON f.friendNum = u.userNum LEFT JOIN profile p ON u.userNum = p.userNum AND u.userActive = 1 " +
            "WHERE f.userNum = #{userNum} AND f.friendName LIKE '%#{searchVal}%' ")
    public List<FriendDto> selectMyFriendsList(int userNum, String searchVal);

    @Select("select count(*) from friend f left join user u on f.userNum = u.userNum and u.userActive = 1  where f.userNum = #{userNum} AND f.friendName LIKE '%#{searchVal}%' ")
    public int selectMyFriendCount(int userNum, String searchVal);
}
