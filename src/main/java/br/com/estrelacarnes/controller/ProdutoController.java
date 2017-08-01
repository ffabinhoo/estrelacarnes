package br.com.estrelacarnes.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.estrelacarnes.dao.PedidoDAO;
import br.com.estrelacarnes.interceptor.UserInfo;

@Controller
public class ProdutoController {
	private final Result result;
	private final Validator validator;
	private final PedidoDAO pedidoDAO;
	private final UserInfo userInfo;
	
	protected ProdutoController() {
		this(null, null, null, null);
	}
	
	@Inject
	public ProdutoController(Result result, PedidoDAO pedidoDAO,UserInfo userInfo,Validator validator) {
		this.result = result;
		this.pedidoDAO = pedidoDAO;
		this.userInfo = userInfo;
		this.validator = validator;
	}
	
	

}
