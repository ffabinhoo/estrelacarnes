package br.com.estrelacarnes.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Put;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.estrelacarnes.dao.ClienteDAO;
import br.com.estrelacarnes.dao.EntregaDAO;
import br.com.estrelacarnes.dao.PedidoDAO;
import br.com.estrelacarnes.interceptor.UserInfo;
import br.com.estrelacarnes.model.Categoria;
import br.com.estrelacarnes.model.Cliente;
import br.com.estrelacarnes.model.Complemento;
import br.com.estrelacarnes.model.Endereco;
import br.com.estrelacarnes.model.Entrega;
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
	private final EntregaDAO entregaDAO;
	
	protected AdminController() {
		this(null, null, null, null, null, null);
	}
	
	@Inject
	public AdminController(Result result, PedidoDAO pedidoDAO, ClienteDAO clienteDAO, EntregaDAO entregaDAO, UserInfo userInfo,
			Validator validator) {
		this.result = result;
		this.pedidoDAO = pedidoDAO;
		this.clienteDAO = clienteDAO;
		this.entregaDAO = entregaDAO;
		this.userInfo = userInfo;
		this.validator = validator;
	}
	
	@Get("/")
	public void principal() {
	    List<Pedido> listaPedidosAbertos = pedidoDAO.listarPedidosAbertos();
	    result.include("listaPedidosAbertos", listaPedidosAbertos);
	    
	}
	
	@Get("/pedido/consultar/fechados")
	public void consultarPedidosFechados(){
		String fechados = "F";
		List<Pedido> listaPedidosFechados = pedidoDAO.listarPedidos(fechados);
		result.include("listaPedidosFechados", listaPedidosFechados);
	}
	
	
	@Put("/item/alterar")
	public void alterarItem(String idItem, String quantidade, String tipo, String produto, String complemento, String preparo, String observacao, Integer idPedido){
		System.out.println("alterar item" + idItem);
		Item item = new Item();
		item = pedidoDAO.mostrarItem(Integer.valueOf(idItem));
		Produto produtoobj = new Produto();
		Pedido pedidoobj = new Pedido();
		produtoobj.setId(Integer.valueOf(produto));
		if (complemento != null){
			Complemento complementoobj = new Complemento();
			complementoobj.setId(Integer.valueOf(complemento));
			item.setComplemento(complementoobj);
		}
		if (preparo!= null){
			Preparo preparoobj = new Preparo();
			preparoobj.setId(Integer.valueOf(preparo));
			item.setPreparo(preparoobj);
		}
		
		item.setObservacao(observacao);
		item.setProduto(produtoobj);
		item.setQuantidade(quantidade);
		item.setTipo(tipo);
		
		pedidoobj.setId(idPedido);
		item.setPedido(pedidoobj);
		
		pedidoDAO.alterarItem(item);

		result.include("idPedido", pedidoobj.getId());
		result.include("tipomsg", "success");
		result.include("mensagemNegrito", "Item ");
		result.include("mensagem", "alterado com sucesso.");
		//result.redirectTo(AdminController.class).mostrarItem(item.getId(), tipo, quantidade, item.getCategoria().getId().toString());
		result.redirectTo(AdminController.class).cadastrarPedido(pedidoobj.getId(), "KG", "1", "0");
		
		
	}
	
	@Post("/consultarUsuario")
	public void consultarUsuario(String telefone, String nome){
		List<Cliente> listaCliente = new ArrayList<Cliente>();
		if (telefone == null && nome == null){
			listaCliente = clienteDAO.listarTodosUsuarios();
		}
		
		if (telefone != null){
			listaCliente = clienteDAO.consultarUsuarioPorTelefone(telefone);
		} 
		if (nome != null){
			listaCliente = clienteDAO.consultarUsuarioPorNome(nome);
		}
		result.include("listaCliente", listaCliente);
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
		
		Pedido pedido = new Pedido();
		pedido.setCliente(cliente);
		pedido.setStatus("A");
		pedido.setData(new Date());
		pedido = pedidoDAO.abrirPedido(pedido);
		
		result.include("idPedido", pedido.getId());
		result.include("quantidade", "1");
		result.redirectTo(AdminController.class).cadastrarPedido(pedido.getId(), "KG", "1","0");
	}
	
	@Get("/cadastrarPedido/{idPedido}/{tipo}/{quantidade}/{categoria}")
	public void cadastrarPedido(Integer idPedido, String tipo, String quantidade, String categoria) {
		List<Produto> listaProdutos = null;
    	List<Preparo> listaPreparos = null;
    	List<Complemento> listaComplementos = null;
		if (!categoria.equals("0")){
	    	listaProdutos = pedidoDAO.listarProdutosPorCategoria(Integer.valueOf(categoria));
	    	listaPreparos = pedidoDAO.listarPreparos();
	    	listaComplementos = pedidoDAO.listarComplementos();
	    }	   
		Pedido pedido = new Pedido();
		pedido.setId(idPedido);
		pedido = pedidoDAO.load(pedido);
		
		List<Item> listaItensPorPedido = pedidoDAO.listarItensPorPedido(idPedido);
		result.include("listaItensPedido", listaItensPorPedido);
		
		result.include("listaProdutos", listaProdutos);
	    result.include("listaPreparos", listaPreparos);
	    result.include("listaComplementos", listaComplementos);
	    result.include("idCategoria", Integer.valueOf(categoria));
	    result.include("pedido", pedido );
	    result.include("tipo", tipo);
	    result.include("quantidade", quantidade);
	}
	
	
	@Post("/mostrarItem")
	public void editarItem(Integer idItem) {
		List<Produto> listaProdutos = null;
    	List<Preparo> listaPreparos = null;
    	List<Complemento> listaComplementos = null;
		
		Item item = pedidoDAO.mostrarItem(idItem);
		listaProdutos = pedidoDAO.listarProdutosPorCategoria(item.getCategoria().getId());
    	listaPreparos = pedidoDAO.listarPreparos();
    	listaComplementos = pedidoDAO.listarComplementos();
		result.include("item", item);
		result.include("listaProdutos", listaProdutos);
	    result.include("listaPreparos", listaPreparos);
	    result.include("listaComplementos", listaComplementos);
	    result.redirectTo(AdminController.class).mostrarItem(item.getId(), item.getTipo(), item.getQuantidade(), item.getCategoria().getId().toString());
	}
	
	@Get("/mostrarItem/{idItem}/{tipo}/{quantidade}/{categoria}")
	public void mostrarItem(Integer idItem, String tipo, String quantidade, String categoria) {
		List<Produto> listaProdutos = null;
    	List<Preparo> listaPreparos = null;
    	List<Complemento> listaComplementos = null;
		
		Item item = pedidoDAO.mostrarItem(idItem);
		listaProdutos = pedidoDAO.listarProdutosPorCategoria(item.getCategoria().getId());
    	listaPreparos = pedidoDAO.listarPreparos();
    	listaComplementos = pedidoDAO.listarComplementos();
		result.include("item", item);
		result.include("listaProdutos", listaProdutos);
	    result.include("listaPreparos", listaPreparos);
	    result.include("listaComplementos", listaComplementos);
	    result.include("idCategoria", Integer.valueOf(categoria));
	    result.include("pedido", item.getPedido() );
	    result.include("tipo", tipo);
	    result.include("quantidade", quantidade);
	}
	
	@Post
	public void inserirItem(String quantidade, String tipo, String categoria, String produto, String complemento, String preparo, String observacao, Integer idPedido){
		Item item = new Item();
		Categoria categoriaobj = new Categoria();
		Produto produtoobj = new Produto();
		Pedido pedidoobj = new Pedido();
		categoriaobj.setId(Integer.valueOf(categoria));
		produtoobj.setId(Integer.valueOf(produto));
		if (complemento != null){
			Complemento complementoobj = new Complemento();
			complementoobj.setId(Integer.valueOf(complemento));
			item.setComplemento(complementoobj);
		}else{
			item.setComplemento(null);
		}
		if (preparo!= null){
			Preparo preparoobj = new Preparo();
			preparoobj.setId(Integer.valueOf(preparo));
			item.setPreparo(preparoobj);
		}else{
			item.setPreparo(null);
		}
		
		item.setCategoria(categoriaobj);
		item.setObservacao(observacao);
		item.setProduto(produtoobj);
		item.setQuantidade(quantidade);
		item.setTipo(tipo);
		
		pedidoobj.setId(idPedido);
		item.setPedido(pedidoobj);
		
		pedidoDAO.inserirItem(item);

		result.include("idPedido", pedidoobj.getId());
		result.redirectTo(AdminController.class).cadastrarPedido(pedidoobj.getId(), tipo, quantidade, categoria);
	}
	
	@Delete("/item/excluir/{item.id}")
	public void excluirItem(Item item){
		Item itemobj = pedidoDAO.mostrarItem(item.getId());
		Integer pedido = itemobj.getPedido().getId();
		pedidoDAO.excluirItem(item);
		result.redirectTo(AdminController.class).cadastrarPedido(pedido, "KG", "1","0");
		
	}
	
	@Get("/pedido/excluir/{pedido.id}")
	public void excluirPedido(Pedido pedido){
		pedidoDAO.excluirItensPedido(pedido);
		pedidoDAO.excluirPedido(pedido);
		result.redirectTo(AdminController.class).principal();
		
	}
	
	
	@Get("/pedido/resumoPedido/{pedido.id}")
	public void resumoPedido(Pedido pedido){
		Pedido pedidoObj = pedidoDAO.load(pedido.getId());
		result.include("pedido", pedidoObj);
	}
	
	
	
	@Post("/pedido/enviar/{pedido.id}")
	public void enviarPedido(Pedido pedido){
		Pedido pedidoObj = pedidoDAO.load(pedido.getId());
		//pedidoObj.setStatus("F");
		pedidoDAO.alterarPedido(pedidoObj);
		result.redirectTo(AdminController.class).resumoPedido(pedidoObj);
	}
	
	@Get("/pedido/layout")
	public void layout(){
				
	}
	
	@Post("/pedido/entrega")
	public void prepararEntrega(Pedido pedido, Endereco endereco, Entrega entrega){
		//validator.addIf(entrega.getTipoEntrega() == null, new SimpleMessage("Tipo entrega", "A Tipo de Entrega deve ser preenchido"));	
				//validator.onErrorForwardTo(this).erro(pedido);
		String tipoEntrega = entrega.getTipoEntrega();
		if (tipoEntrega==null||endereco==null ||entrega==null){
			result.include("tipomsg", "error");
			result.include("mensagemNegrito", "Erro! ");
			result.include("mensagem", "Selecione o Tipo de Entrega do Pedido ");
		}
		if (tipoEntrega!=null){
			pedido = pedidoDAO.load(pedido.getId());
			endereco = clienteDAO.consultarEndereco(endereco);
			entrega.setCliente(pedido.getCliente());
			entrega.setEndereco(endereco);
			entrega.setPedido(pedido);
			entrega.setData(new Date());
			pedido.setStatus("E");
			
			entregaDAO.incluir(entrega);
			pedido.setIdEntrega(entrega.getId().toString());
			pedido = pedidoDAO.alterarPedido(pedido);
			result.include("pedido", pedido);
			
		}
		result.redirectTo(AdminController.class).principal();
		
		
	}
	
	/*@Get("/erro")
	public void erro(Pedido pedido){
		result.include("tipomsg", "error");
		result.include("mensagemNegrito", "Erro! ");
		result.include("mensagem", "Selecione o Tipo de Entrega do Pedido ");
		result.redirectTo(AdminController.class).resumoPedido(pedido);
	}
	
	*/

}
