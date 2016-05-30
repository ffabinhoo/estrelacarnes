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
		List<Pedido> listaPedidosEnviadosHoje = pedidoDAO.listarPedidosEnviadosHoje();
		
	    List<Pedido> listaPedidosAbertos = pedidoDAO.listarPedidosAbertos();
	    for (int i = 0; i < listaPedidosAbertos.size(); i++) {
			Entrega entrega = new Entrega();
			if (listaPedidosAbertos.get(i).getIdEntrega()!=null){
				entrega.setId(Integer.valueOf(listaPedidosAbertos.get(i).getIdEntrega()));
				entrega = entregaDAO.load(entrega);
				listaPedidosAbertos.get(i).setTipoEntrega(entrega.getTipoEntrega());
			}
			
			
		}
	    for (int i = 0; i < listaPedidosEnviadosHoje.size(); i++) {
			Entrega entrega = new Entrega();
			if (listaPedidosEnviadosHoje.get(i).getIdEntrega()!=null){
				entrega.setId(Integer.valueOf(listaPedidosEnviadosHoje.get(i).getIdEntrega()));
				entrega = entregaDAO.load(entrega);
				listaPedidosEnviadosHoje.get(i).setTipoEntrega(entrega.getTipoEntrega());
			}
			
			
		}
	    
	    result.include("listaPedidosEnviadosHoje", listaPedidosEnviadosHoje);
	    result.include("listaPedidosAbertos", listaPedidosAbertos);
	    
	}
	
	@Get("/pedido/consultar")
	public void consultarPedido(){
		
	}
	
	@Post("/pedido/consultar")
	public void consultarPedido(String status, String inicio, String fim){
		List<Pedido> listaPedidos = pedidoDAO.consultarPedido(status, inicio, fim);
		
		for (int i = 0; i < listaPedidos.size(); i++) {
			Entrega entrega = new Entrega();
			if (listaPedidos.get(i).getIdEntrega()!=null){
				entrega.setId(Integer.valueOf(listaPedidos.get(i).getIdEntrega()));
				entrega = entregaDAO.load(entrega);
				listaPedidos.get(i).setTipoEntrega(entrega.getTipoEntrega());
			}
			
			
		}
		result.include("inicio", inicio);
		result.include("fim",fim);
		result.include("statusBusca", status);
		result.include("listaPedidos", listaPedidos);
	}
	
	/*@Get("/pedido/consultar/fechados")
	public void consultarPedidosFechados(){
		String fechados = "F";
		List<Pedido> listaPedidosFechados = pedidoDAO.listarPedidos(fechados);
		result.include("listaPedidosFechados", listaPedidosFechados);
	}*/
	@Get("/pedido/consultar/enviadosHoje")
	public void consultarPedidosEnviadosHoje(){
		//String fechados = "F";
		List<Pedido> listaPedidosEnviadosHoje = pedidoDAO.listarPedidosEnviadosHoje();
		result.include("listaPedidosEnviadosHoje", listaPedidosEnviadosHoje);
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
	
	@Get("/manterHorario")
	public void manterHorario() {
		System.out.println("Administrar Sistema");
	}
	
	
	
	@Post("/pedido/copiar")
	public void copiarPedido(Pedido pedido){
		pedido = pedidoDAO.load(pedido.getId());
		List<Item> listaItens = pedido.getItens();
		Pedido pedidoNovo = new Pedido();
		pedidoNovo.setCliente(pedido.getCliente());
		pedidoNovo.setData(new Date());
		pedidoNovo.setStatus("A");
		pedidoNovo.setObservacao(pedido.getObservacao());
		pedidoNovo = pedidoDAO.abrirPedido(pedidoNovo);
		Pedido pedidonew = pedidoDAO.load(pedidoNovo.getId());
		
		for (int i = 0; i < listaItens.size(); i++) {
			Item itemN = clonarItemPedido(listaItens.get(i),pedidonew);
			pedidoDAO.inserirItem(itemN);
		}
		result.redirectTo(AdminController.class).cadastrarPedido(pedidonew.getId(), "KG", "1","0");
	}
	
	private Item clonarItemPedido(Item item, Pedido pedidonew) {
		 //item = pedidoDAO.mostrarItem(item.getId());
		 Item itemNew = new Item();
		 itemNew.setCategoria(item.getCategoria());
		 itemNew.setComplemento(item.getComplemento());
		 itemNew.setObservacao(item.getObservacao());
		 itemNew.setPedido(pedidonew);
		 itemNew.setPreparo(item.getPreparo());
		 itemNew.setProduto(item.getProduto());
		 itemNew.setQuantidade(item.getQuantidade());
		 itemNew.setTipo(item.getTipo());
		 
		 
		 return itemNew;
		
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
		if (observacao != null){
			item.setObservacao(observacao.toUpperCase());
		}
		item.setProduto(produtoobj);
		item.setQuantidade(quantidade);
		item.setTipo(tipo);
		
		pedidoobj.setId(idPedido);
		item.setPedido(pedidoobj);
		
		pedidoDAO.inserirItem(item);

		result.include("idPedido", pedidoobj.getId());
		tipo = "KG";
		quantidade = "1";
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
		pedido = pedidoDAO.load(pedido);
		pedidoDAO.excluirItensPedido(pedido);
		if (pedido.getIdEntrega()!=null){
			Entrega entrega = new Entrega();
			entrega.setId(Integer.valueOf(pedido.getIdEntrega()));
			entrega = entregaDAO.load(entrega);
			entregaDAO.excluir(entrega);
		}
		pedidoDAO.excluirPedido(pedido);
		result.redirectTo(AdminController.class).principal();
		
	}
	
	
	@Get("/pedido/resumoPedido/{pedido.id}")
	public void resumoPedido(Pedido pedido){
		Pedido pedidoObj = pedidoDAO.load(pedido.getId());
		Entrega entrega = new Entrega();
		if (pedido.getIdEntrega()!=null){
			entrega.setId(Integer.valueOf(pedidoObj.getIdEntrega()));
			entrega = entregaDAO.load(entrega);
			result.include("entrega", entrega);
		}else{
			result.include("entrega", entrega);
		}
		
		result.include("pedido", pedidoObj);
	}
	
	
	
	@Post("/pedido/enviar/{pedido.id}")
	public void enviarPedido(Pedido pedido){
		Pedido pedidoObj = pedidoDAO.load(pedido.getId());
		pedidoObj.setStatus("A");
		pedidoDAO.alterarPedido(pedidoObj);
		result.redirectTo(AdminController.class).resumoPedido(pedidoObj);
	}
	
	@Post("/pedido/enviar/saida/{pedido.id}")

	public void enviarPedidoSaida(Pedido pedido, String pedidoValor, String pedidoValorFrete){
		Pedido pedidoObj = new Pedido();
		pedidoObj = pedidoDAO.load(pedido.getId());
		pedidoObj.setStatus("E");
		//pedidoObj.setValor(pedidoValor);
		//pedidoObj.setValorFrete(pedidoValorFrete);

		pedidoObj.setData(new Date());//Atualiza data de envio do pedido
		Entrega entrega = new Entrega();
		entrega.setId(Integer.valueOf(pedidoObj.getIdEntrega()));
		entrega = entregaDAO.load(entrega);
		entrega.setData(new Date());
		pedidoDAO.alterarPedido(pedidoObj);
		entregaDAO.alterar(entrega);
		result.redirectTo(AdminController.class).pedidoEnviado(pedidoObj);
	}
	
	@Get("/pedido/layout")
	public void layout(){
				
	}
	
	
	
	@Post("/pedido/entrega")
	public void prepararEntrega(Pedido pedido, Endereco endereco, String tipoEntrega){
		//validator.addIf(entrega.getTipoEntrega() == null, new SimpleMessage("Tipo entrega", "A Tipo de Entrega deve ser preenchido"));	
				//validator.onErrorForwardTo(this).erro(pedido);
		//tipoEntrega = entrega.getTipoEntrega();
		if (tipoEntrega==null){
			result.include("tipomsg", "error");
			result.include("mensagemNegrito", "Erro! ");
			result.include("mensagem", "Selecione o Tipo de Entrega do Pedido ");
			result.redirectTo(AdminController.class).resumoPedido(pedido);
		}
		if (tipoEntrega!=null){
			String observacao = pedido.getObservacao();
			String valor = pedido.getValor();
			String valorFrete = pedido.getValorFrete();
			pedido = pedidoDAO.load(pedido.getId());
			pedido.setObservacao(observacao);
			pedido.setValor(valor);
			pedido.setValorFrete(valorFrete);
			if (endereco.getId()!=null){
				endereco = clienteDAO.consultarEndereco(endereco);
			}else{
				endereco = null;
			}
			Entrega entrega = new Entrega();
			entrega.setCliente(pedido.getCliente());
			entrega.setEndereco(endereco);
			entrega.setPedido(pedido);
			entrega.setTipoEntrega(tipoEntrega);
			entrega.setData(new Date());
			pedido.setStatus("A");
			if (pedido.getIdEntrega()==null){
				entregaDAO.incluir(entrega);
				pedido.setIdEntrega(entrega.getId().toString());
			}else{
				entrega.setId(Integer.valueOf(pedido.getIdEntrega()));
				entregaDAO.alterar(entrega);
			}
			
			pedido = pedidoDAO.alterarPedido(pedido);
			result.redirectTo(AdminController.class).principal();
		}
		
		
		
	}
	@Get("/pedido/pedidoEnviado/{pedido.id}")
	public void pedidoEnviado(Pedido pedido){
		Entrega entrega = new Entrega();
		Pedido pedidoObj = pedidoDAO.load(pedido.getId());
		
		entrega.setId(Integer.valueOf(pedidoObj.getIdEntrega()));
		entrega = entregaDAO.load(entrega);
		result.include("pedido", pedidoObj);
		result.include("entrega", entrega);
	}
	
	@Get("/pedido/imprimir/{pedido.id}")
	public void imprimir(Pedido pedido){
		Entrega entrega = new Entrega();
		Pedido pedidoObj = pedidoDAO.load(pedido.getId());
		
		entrega.setId(Integer.valueOf(pedidoObj.getIdEntrega()));
		entrega = entregaDAO.load(entrega);
		result.include("pedido", pedidoObj);
		result.include("entrega", entrega);
	}
	
	@Get("/pedido/imprimirItens/{pedido.id}")
	public void imprimirItens(Pedido pedido){
		Pedido pedidoObj = pedidoDAO.load(pedido.getId());
		
		result.include("pedido", pedidoObj);
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
