package br.com.estrelacarnes.controller;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.estrelacarnes.dao.PedidoDAO;
import br.com.estrelacarnes.interceptor.UserInfo;
import br.com.estrelacarnes.model.Categoria;
import br.com.estrelacarnes.model.Complemento;
import br.com.estrelacarnes.model.Item;
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
	
	@Get("/cadastrarPedido/{categoria.id}/{item.tipo}/{item.quantidade}")
	public void cadastrarPedido(Categoria categoria, Item item, Item item2) {
	    List<Produto> listaProdutos = pedidoDAO.listarProdutosPorCategoria(categoria.getId());
	    List<Preparo> listaPreparos = pedidoDAO.listarPreparos();
	    List<Complemento> listaComplementos = pedidoDAO.listarComplementos();
	    
	    result.include("listaProdutos", listaProdutos);
	    result.include("listaPreparos", listaPreparos);
	    result.include("listaComplementos", listaComplementos);
	    result.include("idCategoria", categoria.getId());
	    result.include("tipo", item.getTipo());
	    result.include("quantidade", item.getQuantidade());
	}
	
	

}
