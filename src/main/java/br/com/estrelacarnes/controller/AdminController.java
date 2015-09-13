package br.com.estrelacarnes.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.estrelacarnes.dao.ClienteDAO;
import br.com.estrelacarnes.interceptor.UserInfo;

@Controller
public class AdminController {
	private final Result result;
	private final Validator validator;
	private final ClienteDAO clienteDAO;
	private final UserInfo userInfo;
	
	protected AdminController() {
		this(null, null, null, null);
	}
	
	@Inject
	public AdminController(Result result, ClienteDAO clienteDAO, UserInfo userInfo,
			Validator validator) {
		this.result = result;
		this.clienteDAO = clienteDAO;
		this.userInfo = userInfo;
		this.validator = validator;
	}
	
	@Get("/")
	public void principal() {
	    
	}

}
