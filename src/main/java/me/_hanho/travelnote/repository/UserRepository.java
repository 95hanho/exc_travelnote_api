package me._hanho.travelnote.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import me._hanho.travelnote.mapper.UserMapper;
import me._hanho.travelnote.model.Token;
import me._hanho.travelnote.model.User;

@Repository
public class UserRepository {
	
	@Autowired
	private UserMapper userMapper;

	public User getUser(User user) {
		return userMapper.getUser(user);
	}

	public Token getToken(Token token) {
		return userMapper.getToken(token);
	}

	public int insertToken(Token token) {
		return userMapper.insertToken(token);
	}

	public int updateToken(Token token) {
		return userMapper.updateToken(token);
	}

}