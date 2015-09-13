package br.com.estrelacarnes.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.estrelacarnes.dao.UserDao;
import br.com.estrelacarnes.interceptor.Public;
import br.com.estrelacarnes.interceptor.UserInfo;
import br.com.estrelacarnes.model.User;

@Controller
public class IndexController {

	private final Result result;
	private final Validator validator;
	private final UserDao userDao;
	private final UserInfo userInfo;

	/**
	 * @deprecated CDI eyes only
	 */
	protected IndexController() {
		this(null, null, null, null);
	}

	@Inject
	public IndexController(Result result, UserDao userDao, UserInfo userInfo, Validator validator) {
		this.result = result;
		this.userDao = userDao;
		this.userInfo = userInfo;
		this.validator = validator;

	}

	
	
	@Post
	@Public
	public void login(String login, String password) {
		final User currentUser = userDao.find(login, password);
		validator.check(currentUser != null, new SimpleMessage("login", "invalid_login_or_password"));
		validator.onErrorUsePageOf(this).login();
		userInfo.login(currentUser);
		result.redirectTo(AdminController.class).principal();
	}
	
	@Public
	@Get
	public void login() {
	}
	
	public void logout() {
	    userInfo.logout();
	    // after logging out, we want to be redirected to home index.
	    // you can use "this" to redirect to another logic from this controller
	    result.redirectTo(this).login();
	}
	
}