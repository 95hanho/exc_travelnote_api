package me._hanho.travelnote.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import me._hanho.travelnote.model.Token;
import me._hanho.travelnote.model.User;
import me._hanho.travelnote.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserRepository UserDAO;

	@Override
	public User getUser(User user) {
		return UserDAO.getUser(user);
	}

	@Override
	public Token getToken(Token token) {
		return UserDAO.getToken(token);
	}

	@Override
	public int insertToken(Token token) {
		return UserDAO.insertToken(token);
	}

	@Override
	public int updateToken(Token token) {
		return UserDAO.updateToken(token);
	}

	@Override
	public User getUser(Token token) {
		return UserDAO.getUser(token);
	}

}
