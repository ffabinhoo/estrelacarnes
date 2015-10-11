package br.com.estrelacarnes.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Put;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.estrelacarnes.cep.CepResult;
import br.com.estrelacarnes.dao.ClienteDAO;
import br.com.estrelacarnes.dao.PedidoDAO;
import br.com.estrelacarnes.interceptor.UserInfo;
import br.com.estrelacarnes.model.Cliente;
import br.com.estrelacarnes.model.Endereco;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;


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
	
	@Get("cliente/excluir/{cliente.id}")
	public void excluirCliente(Cliente cliente){
		clienteDAO.excluirCliente(cliente);
		result.redirectTo(AdminController.class).principal();
	}
	
	@Get("/cliente/{cliente.id}/buscarCEP/{cep}")
	public void buscarCEP(String cep) {
		WebResource resource = Client.create().resource("http://www.agendafoodtruck.com.br/buscaCep/rest/cep/" + cep);
        ClientResponse response = resource.type("application/x-www-form-urlencoded").get(ClientResponse.class); 
        CepResult cepResult = response.getEntity(CepResult.class);
		try {
			result.include("endereco", cepResult.getLogradouro());
			result.include("cep", cep);
			result.include("localizacao", cepResult.getLat() +"," + cepResult.getLng());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Put("cliente/alterar")
	public void alterarCliente(Cliente cliente){
		clienteDAO.atualizar(cliente);
		result.include("tipomsg", "success");
		result.include("mensagemNegrito", "Cliente ");
		result.include("mensagem", "alterado com sucesso.");
		result.redirectTo(ClienteController.class).mostrarCliente(cliente);
	}
	
	@Get("endereco/excluir/{endereco.id}")
	public void excluirEndereco(Endereco endereco){
		System.out.println("endereco exlcuir");
	}
	
	@Get("endereco/endereco/{endereco.id}")
	public void mostrarEndereco(Endereco endereco){
		System.out.println("mostrar exlcuir");
		//cliente = clienteDAO.load(cliente);
		//result.include("cliente", cliente);
		
	}
}
