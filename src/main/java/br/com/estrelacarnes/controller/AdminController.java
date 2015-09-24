package br.com.estrelacarnes.controller;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
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
	
	protected AdminController() {
		this(null, null, null, null);
	}
	
	@Inject
	public AdminController(Result result, PedidoDAO pedidoDAO, UserInfo userInfo,
			Validator validator) {
		this.result = result;
		this.pedidoDAO = pedidoDAO;
		this.userInfo = userInfo;
		this.validator = validator;
	}
	
	@Get("/")
	public void principal() {
	    
	}
	
	@Get("/cadastrarPedido")
	public void cadastrarPedido() {
		Item item = new Item();
		item.setQuantidade("1");
		result.include("quantidade", item .getQuantidade());
	}
	
	@Get("/cadastrarPedido/{categoria}/{tipo}/{quantidade}")
	public void cadastrarPedido(String categoria, String tipo, String quantidade) {
	    List<Produto> listaProdutos = pedidoDAO.listarProdutosPorCategoria(Integer.valueOf(categoria));
	    List<Preparo> listaPreparos = pedidoDAO.listarPreparos();
	    List<Complemento> listaComplementos = pedidoDAO.listarComplementos();
	    
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
		complementoobj.setId(Integer.valueOf(complemento));
		preparoobj.setId(Integer.valueOf(preparo));
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
		result.redirectTo(AdminController.class).cadastrarPedido(categoria, tipo, quantidade);
	}
	

}
