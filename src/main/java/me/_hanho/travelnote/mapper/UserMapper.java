package me._hanho.travelnote.mapper;

import org.apache.ibatis.annotations.Mapper;

import me._hanho.travelnote.model.Token;
import me._hanho.travelnote.model.User;

@Mapper
public interface UserMapper {

	User getUser(User user);

	Token getToken(Token token);

	int insertToken(Token token);

	int updateToken(Token token);

}