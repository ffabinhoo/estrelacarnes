package br.com.estrelacarnes.controller;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.estrelacarnes.dao.ClienteDAO;
import br.com.estrelacarnes.dao.PedidoDAO;
import br.com.estrelacarnes.interceptor.UserInfo;
import br.com.estrelacarnes.model.Categoria;
import br.com.estrelacarnes.model.Cliente;
import br.com.estrelacarnes.model.Complemento;
import br.com.estrelacarnes.model.Item;
import br.com.estrelacarnes.model.Pedido;
import br.com.estrelacarnes.model.Preparo;
import br.com.estrelacarnes.model.Produto;

@Controller
public class AdminController {
	private final Result result;
	private final Validator validator;
	private final PedidoDAO pedidoDAO;
	private final UserInfo userInfo;
	private final ClienteDAO clienteDAO;
	
	protected AdminController() {
		this(null, null, null, null, null);
	}
	
	@Inject
	public AdminController(Result result, PedidoDAO pedidoDAO, ClienteDAO clienteDAO, UserInfo userInfo,
			Validator validator) {
		this.result = result;
		this.pedidoDAO = pedidoDAO;
		this.clienteDAO = clienteDAO;
		this.userInfo = userInfo;
		this.validator = validator;
	}
	
	@Get("/")
	public void principal() {
	    
	}
	
	
	
	@Post("/consultarUsuario")
	public void consultarUsuario(String telefone){
		List<Cliente> listaCliente = clienteDAO.consultarUsuarioPorTelefone(telefone);
		result.include("listaCliente", listaCliente);
		//result.redirectTo(AdminController.class).consultarUsuario(telefone);
	}
	
	@Get("/consultarUsuario")
	public void consultarUsuario() {
		System.out.println("consultar usuario");
	}
	
	@Post("/cadastrarPedido")
	public void cadastrarPedidoNovo(Integer idCliente) {
		Cliente cliente = new Cliente();
		cliente.setId(idCliente);
		cliente = clienteDAO.load(cliente );
		result.include(cliente);
		result.include("quantidade", "1");
		result.redirectTo(AdminController.class).cadastrarPedido(cliente.getId(), "KG", "1","0");
	}
	
	@Get("/cadastrarPedido/{idCliente}/{tipo}/{quantidade}/{categoria}")
	public void cadastrarPedido(Integer idCliente, String tipo, String quantidade, String categoria) {
		List<Produto> listaProdutos = null;
    	List<Preparo> listaPreparos = null;
    	List<Complemento> listaComplementos = null;
		if (!categoria.equals("0")){
	    	listaProdutos = pedidoDAO.listarProdutosPorCategoria(Integer.valueOf(categoria));
	    	listaPreparos = pedidoDAO.listarPreparos();
	    	listaComplementos = pedidoDAO.listarComplementos();
	    }	   
	    Cliente clienteobj = new Cliente();
		if (idCliente!= null){
			clienteobj.setId(idCliente);
			clienteobj = clienteDAO.load(clienteobj );
		}
		result.include("cliente", clienteobj);
	    
		result.include("listaProdutos", listaProdutos);
	    result.include("listaPreparos", listaPreparos);
	    result.include("listaComplementos", listaComplementos);
	    result.include("idCategoria", Integer.valueOf(categoria));
	    result.include("tipo", tipo);
	    result.include("quantidade", quantidade);
	}
	
	
	
	@Post
	public void inserirItem(String quantidade, String tipo, String categoria, String produto, String complemento, String preparo, String observacao){
		Item item = new Item();
		Categoria categoriaobj = new Categoria();
		Produto produtoobj = new Produto();
		Preparo preparoobj = new Preparo();
		Complemento complementoobj = new Complemento();
		Pedido pedidoobj = new Pedido();
		Cliente clienteobj = new Cliente();
		
		clienteobj.setId(1);
		categoriaobj.setId(Integer.valueOf(categoria));
		produtoobj.setId(Integer.valueOf(produto));
		if (complemento != null){
			complementoobj.setId(Integer.valueOf(complemento));
		}
		if (preparo!= null){
			preparoobj.setId(Integer.valueOf(preparo));
		}
		pedidoobj.setCliente(clienteobj);
		
		
		item.setCategoria(categoriaobj);
		item.setComplemento(complementoobj);
		item.setObservacao(observacao);
		item.setPreparo(preparoobj);
		item.setProduto(produtoobj);
		
		item.setQuantidade(quantidade);
		item.setTipo(tipo);
		pedidoobj = pedidoDAO.abrirPedido(pedidoobj);
		
		item.setPedido(pedidoobj);
		
		pedidoDAO.inserirItem(item);
		result.redirectTo(AdminController.class).cadastrarPedido(clienteobj.getId(), categoria, tipo, quantidade);
	}
	

}
