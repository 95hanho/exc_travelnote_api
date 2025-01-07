package me._hanho.travelnote.service;

import me._hanho.travelnote.model.Token;
import me._hanho.travelnote.model.User;

public interface UserService {

	User getUser(User user);

	Token getToken(Token token);

	int insertToken(Token token);

	int updateToken(Token token);

	User getUser(Token token);

}
