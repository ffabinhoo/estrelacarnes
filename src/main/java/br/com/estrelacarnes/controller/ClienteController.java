package br.com.estrelacarnes.controller;


import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.RollbackException;

import org.hibernate.exception.ConstraintViolationException;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.InterceptionException;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Put;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.estrelacarnes.cep.CepResult;
import br.com.estrelacarnes.dao.ClienteDAO;
import br.com.estrelacarnes.dao.EntregaDAO;
import br.com.estrelacarnes.dao.PedidoDAO;
import br.com.estrelacarnes.interceptor.UserInfo;
import br.com.estrelacarnes.model.Cliente;
import br.com.estrelacarnes.model.Endereco;
import br.com.estrelacarnes.model.Entrega;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;
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
	private final EntregaDAO entregaDAO;
	
	protected ClienteController() {
		this(null, null, null, null, null, null);
	}
	
	@Inject
	public ClienteController(Result result, PedidoDAO pedidoDAO, ClienteDAO clienteDAO, EntregaDAO entregaDAO,  UserInfo userInfo,
			Validator validator) {
		this.result = result;
		this.pedidoDAO = pedidoDAO;
		this.clienteDAO = clienteDAO;
		this.entregaDAO = entregaDAO;
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
	
	@Post("/endereco/inserirEndereco")
	public void inserirEndereco(Cliente cliente){
		List<Endereco> lista = new ArrayList<Endereco>();
		cliente.setEnderecos(lista);
		Endereco endereco = cliente.getEndereco();
		endereco.setStatus("A");
		cliente.getEnderecos().add(endereco);
		//clienteDAO.inserir(cliente);
		endereco.setCliente(cliente);
		clienteDAO.inserirEndereco(endereco);
		
		result.include("tipomsg", "success");
		result.include("mensagemNegrito", "Endereço ");
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
		List<Entrega> lista = entregaDAO.consultarEntregasCliente(cliente);
		
		if (lista.size()>0){
			result.include("tipomsg", "error");
			result.include("mensagemNegrito", "Erro.");
			result.include("mensagem", "Não é possível excluir Cliente que tenha histórico de Pedidos e Itens.");
		}else{
		
			try {
			clienteDAO.excluirEnderecoCliente(cliente);
			clienteDAO.excluirCliente(cliente);
			result.include("tipomsg", "success");
			result.include("mensagemNegrito", "Cliente ");
			result.include("mensagem", "excluído com sucesso.");
			
			}catch (ConstraintViolationException e) {
				result.include("tipomsg", "error");
				result.include("mensagemNegrito", "Erro.");
				result.include("mensagem", "Não é possível excluir Cliente que tenha histórico de Pedidos e Itens.");
			}catch (InterceptionException e2){
				result.include("tipomsg", "error");
				result.include("mensagemNegrito", "Erro.");
				result.include("mensagem", "Não é possível excluir Cliente que tenha histórico de Pedidos e Itens.");
			}catch (RollbackException e3){
				result.include("tipomsg", "error");
				result.include("mensagemNegrito", "Erro.");
				result.include("mensagem", "Não é possível excluir Cliente que tenha histórico de Pedidos e Itens.");
			}
		}
		
		result.redirectTo(AdminController.class).consultarUsuario();
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
	
	@Post("/endereco/buscarEnderecoCEP")
	public void buscarEnderecoCEP(Cliente cliente) {
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
			result.include("cep", cliente.getEndereco().getCep());
			result.include("endereco", cliente.getEndereco().getEndereco());
			result.include("complemento", cliente.getEndereco().getComplemento());
			result.include("bairro", cliente.getEndereco().getBairro());
			result.include("cidade", cliente.getEndereco().getCidade());
			result.include("uf", cliente.getEndereco().getUf());
			
			result.include("localizacao", cepResult.getLat() +"," + cepResult.getLng());
			result.redirectTo(ClienteController.class).cadastrarEndereco(cliente);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Post("/endereco/buscarEnderecoEditarCEP")
	public void buscarEnderecoEditarCEP(Cliente cliente, Endereco endereco) {
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
			cliente.getEndereco().setId(endereco.getId());
			
			/*result.include("cliente", cliente);
			result.include("cep", cliente.getEndereco().getCep());
			result.include("endereco", cliente.getEndereco().getEndereco());
			result.include("complemento", cliente.getEndereco().getComplemento());
			result.include("bairro", cliente.getEndereco().getBairro());
			result.include("cidade", cliente.getEndereco().getCidade());
			result.include("uf", cliente.getEndereco().getUf());*/
			
			result.include("endereco", cliente.getEndereco());
			result.include("cliente", cliente);
			
			result.include("localizacao", cepResult.getLat() +"," + cepResult.getLng());
			result.redirectTo(ClienteController.class).editarEndereco(cliente.getEndereco(), cliente);
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
	
	@Get("endereco/cadastrar/{cliente.id}")
	public void cadastrarEndereco(Cliente cliente){
		cliente = clienteDAO.load(cliente);
		result.include("cliente", cliente);
	}
	
	@Get("endereco/excluir/{endereco.id}/{cliente.id}")
	public void excluirEndereco(Endereco endereco, Cliente cliente){
		List<Entrega> lista = entregaDAO.consultarEnderecoEntrega(endereco);
		
		if (lista.size()>0){
			result.include("tipomsg", "error");
			result.include("mensagemNegrito", "Erro.");
			result.include("mensagem", "Não é possível excluir Endereço que tenha histórico de Pedidos");
		}else{
			clienteDAO.excluirEndereco(endereco);
		}
		
		/*try{
			clienteDAO.excluirEndereco(endereco);
		}catch (MySQLIntegrityConstraintViolationException e4){
			result.include("tipomsg", "error");
			result.include("mensagemNegrito", "Erro.");
			result.include("mensagem", "Não é possível excluir Endereço que tenha histórico de Pedidos");
			
		} catch (Exception e) {
			result.include("tipomsg", "error");
			result.include("mensagemNegrito", "Erro.");
			result.include("mensagem", "Não é possível excluir Endereço que tenha histórico de Pedidos");
			
		}*/
		result.redirectTo(ClienteController.class).mostrarCliente(cliente);
		
	}
	
	@Get("endereco/editar/{endereco.id}/{cliente.id}")
	public void editarEndereco(Endereco endereco, Cliente cliente){
		
		if (cliente.getEndereco()==null){
			cliente = clienteDAO.load(cliente);
			endereco = clienteDAO.consultarEndereco(endereco);
			result.include("cliente", cliente);
			result.include("endereco", endereco);
		}else{
			cliente = clienteDAO.load(cliente);
			cliente.setEndereco(endereco);
			cliente.getEndereco().setId(endereco.getId());
			result.include("cliente", cliente);
			result.include("endereco", endereco);
		}
	}
	
	@Post("/endereco/alterarEndereco")
	public void alterarEndereco(Cliente cliente){
		List<Endereco> lista = new ArrayList<Endereco>();
		cliente.setEnderecos(lista);
		Endereco endereco = cliente.getEndereco();
		endereco.setStatus("A");
		cliente.getEnderecos().add(endereco);
		endereco.setCliente(cliente);
		clienteDAO.alterarEndereco(endereco);
		
		result.include("tipomsg", "success");
		result.include("mensagemNegrito", "Endereço ");
		result.include("mensagem", "alterado com sucesso.");
		result.redirectTo(ClienteController.class).mostrarCliente(cliente);
	}
	
	
}
