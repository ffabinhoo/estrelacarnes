package br.com.estrelacarnes.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.estrelacarnes.dao.ClienteDAO;
import br.com.estrelacarnes.dao.PedidoDAO;
import br.com.estrelacarnes.interceptor.UserInfo;
import br.com.estrelacarnes.model.Cliente;

@Controller
public class ClienteController {
	
	private final Result result;
	private final Validator validator;
	private final PedidoDAO pedidoDAO;
	private final UserInfo userInfo;
	private final ClienteDAO clienteDAO;
	
	protected ClienteController() {
		this(null, null, null, null, null);
	}
	
	@Inject
	public ClienteController(Result result, PedidoDAO pedidoDAO, ClienteDAO clienteDAO, UserInfo userInfo,
			Validator validator) {
		this.result = result;
		this.pedidoDAO = pedidoDAO;
		this.clienteDAO = clienteDAO;
		this.userInfo = userInfo;
		this.validator = validator;
	}
	
	@Get("cliente/{cliente.id}")
	public void mostrarCliente(Cliente cliente){
		cliente = clienteDAO.load(cliente);
		result.include("cliente", cliente);
		
	}
	

}
