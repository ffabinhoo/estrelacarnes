package br.com.estrelacarnes.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.RollbackException;

import org.hibernate.exception.ConstraintViolationException;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.InterceptionException;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Put;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.estrelacarnes.cep.CepResult;
import br.com.estrelacarnes.dao.ClienteDAO;
import br.com.estrelacarnes.dao.PedidoDAO;
import br.com.estrelacarnes.interceptor.UserInfo;
import br.com.estrelacarnes.model.Cliente;
import br.com.estrelacarnes.model.Endereco;
import br.com.estrelacarnes.model.Item;

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
	
	@Get("cliente")
	public void cadastrarCliente(){
		
	}
	
	@Post("/cliente/inserirCliente")
	public void inserirCliente(Cliente cliente){
		List<Endereco> lista = new ArrayList<Endereco>();
		cliente.setEnderecos(lista);
		Endereco endereco = cliente.getEndereco();
		endereco.setStatus("A");
		cliente.getEnderecos().add(endereco);
		clienteDAO.inserir(cliente);
		endereco.setCliente(cliente);
		clienteDAO.inserirEndereco(endereco);
		
		result.include("tipomsg", "success");
		result.include("mensagemNegrito", "Cliente ");
		result.include("mensagem", "inserido com sucesso.");
		result.redirectTo(ClienteController.class).mostrarCliente(cliente);
	}
	
	@Get("cliente/{cliente.id}")
	public void mostrarCliente(Cliente cliente){
		cliente = clienteDAO.load(cliente);
		result.include("cliente", cliente);
		
	}
	
	@Get("cliente/excluir/{cliente.id}")
	public void excluirCliente(Cliente cliente){
		try {
		clienteDAO.excluirEnderecoCliente(cliente);
		clienteDAO.excluirCliente(cliente);
		result.redirectTo(AdminController.class).consultarUsuario();
		}catch (ConstraintViolationException e) {
			result.include("tipo", "error");
			result.include("mensagemNegrito", "Erro.");
			result.include("mensagem", "Não é possível excluir Cliente que tenha histórico de Pedidos e Itens.");
			result.redirectTo(AdminController.class).consultarUsuario();
		}catch (InterceptionException e2){
			result.include("tipo", "error");
			result.include("mensagemNegrito", "Erro.");
			result.include("mensagem", "Não é possível excluir Cliente que tenha histórico de Pedidos e Itens.");
			result.redirectTo(AdminController.class).consultarUsuario();
		}catch (RollbackException e3){
			result.include("tipo", "error");
			result.include("mensagemNegrito", "Erro.");
			result.include("mensagem", "Não é possível excluir Cliente que tenha histórico de Pedidos e Itens.");
			result.redirectTo(AdminController.class).consultarUsuario();
		}
		
		
	}
	
	@Post("/cliente/buscarCEP")
	public void buscarCEP(Cliente cliente) {
		WebResource resource = Client.create().resource("http://104.236.248.13:8080/buscaCep/rest/cep/" + cliente.getEndereco().getCep());
        ClientResponse response = resource.type("application/x-www-form-urlencoded").get(ClientResponse.class); 
        CepResult cepResult = response.getEntity(CepResult.class);
        
		try {
			cliente.getEndereco().setCep(cliente.getEndereco().getCep());
			cliente.getEndereco().setEndereco(cepResult.getLogradouro());
			cliente.getEndereco().setComplemento(cepResult.getComplemento());
			cliente.getEndereco().setBairro(cepResult.getBairro());
			cliente.getEndereco().setCidade(cepResult.getCidade());
			cliente.getEndereco().setUf(cepResult.getUf());
			
			result.include("cliente", cliente);
			
			result.include("localizacao", cepResult.getLat() +"," + cepResult.getLng());
			result.redirectTo(ClienteController.class).cadastrarCliente();
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
	
	@Get("endereco/cadastrar")
	public void cadastrarEndereco(){
		
	}
	
	@Get("endereco/excluir/{endereco.id}/{cliente.id}")
	public void excluirEndereco(Endereco endereco, Cliente cliente){
		/*
		 * Item itemobj = pedidoDAO.mostrarItem(item.getId());
		Integer pedido = itemobj.getPedido().getId();
		pedidoDAO.excluirItem(item);
		result.redirectTo(AdminController.class).cadastrarPedido(pedido, "KG", "1","0");
		 */
		//cliente = endereco.getCliente();
		clienteDAO.excluirEndereco(endereco);
		result.redirectTo(ClienteController.class).mostrarCliente(cliente);
	}
	
	@Get("endereco/endereco/{endereco.id}")
	public void mostrarEndereco(Endereco endereco){
		System.out.println("mostrar exlcuir");
		//cliente = clienteDAO.load(cliente);
		//result.include("cliente", cliente);
		
	}
}
