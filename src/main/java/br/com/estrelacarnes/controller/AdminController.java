package br.com.estrelacarnes.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.joda.time.DateTime;
import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Put;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.caelum.vraptor.view.Results;
import br.com.estrelacarnes.dao.ClienteDAO;
import br.com.estrelacarnes.dao.EntregaDAO;
import br.com.estrelacarnes.dao.HorarioDAO;
import br.com.estrelacarnes.dao.PedidoDAO;
import br.com.estrelacarnes.dao.QuadroDAO;
import br.com.estrelacarnes.interceptor.UserInfo;
import br.com.estrelacarnes.model.Categoria;
import br.com.estrelacarnes.model.Cliente;
import br.com.estrelacarnes.model.Complemento;
import br.com.estrelacarnes.model.Endereco;
import br.com.estrelacarnes.model.Entrega;
import br.com.estrelacarnes.model.Horario;
import br.com.estrelacarnes.model.Item;
import br.com.estrelacarnes.model.Pedido;
import br.com.estrelacarnes.model.Preparo;
import br.com.estrelacarnes.model.Produto;
import br.com.estrelacarnes.model.Quadro;

@Controller
public class AdminController {
	private final Result result;
	private final Validator validator;
	private final PedidoDAO pedidoDAO;
	private final UserInfo userInfo;
	private final ClienteDAO clienteDAO;
	private final EntregaDAO entregaDAO;
	private final HorarioDAO horarioDAO;
	private final QuadroDAO quadroDAO;
	
	protected AdminController() {
		this(null, null, null, null, null, null, null,null);
	}
	
	@Inject
	public AdminController(Result result, PedidoDAO pedidoDAO, ClienteDAO clienteDAO, EntregaDAO entregaDAO, HorarioDAO horarioDAO, QuadroDAO quadroDAO,UserInfo userInfo,
			Validator validator) {
		this.result = result;
		this.pedidoDAO = pedidoDAO;
		this.clienteDAO = clienteDAO;
		this.entregaDAO = entregaDAO;
		this.horarioDAO = horarioDAO;
		this.quadroDAO = quadroDAO; 
		this.userInfo = userInfo;
		this.validator = validator;
	}
	
	@Get("/pedido/EnviadosHoje")
	public void enviadosHoje() {
		//List<Pedido> listaPedidosEnviadosHoje = pedidoDAO.listarPedidosEnviadosHoje();
		List<Quadro> listaPedidosEnviadosHoje = pedidoDAO.listarQuadroPedidosEnviadosHoje();
		
	    List<Pedido> listaPedidosAbertos = pedidoDAO.listarPedidosAbertos();
	    for (int i = 0; i < listaPedidosAbertos.size(); i++) {
			Entrega entrega = new Entrega();
			if (listaPedidosAbertos.get(i).getIdEntrega()!=null){
				entrega.setId(Integer.valueOf(listaPedidosAbertos.get(i).getIdEntrega()));
				entrega = entregaDAO.load(entrega);
				listaPedidosAbertos.get(i).setTipoEntrega(entrega.getTipoEntrega());
			}
			
			
		}
	    /*for (int i = 0; i < listaPedidosEnviadosHoje.size(); i++) {
			Entrega entrega = new Entrega();
			if (listaPedidosEnviadosHoje.get(i).getIdEntrega()!=null){
				entrega.setId(Integer.valueOf(listaPedidosEnviadosHoje.get(i).getIdEntrega()));
				entrega = entregaDAO.load(entrega);
				listaPedidosEnviadosHoje.get(i).setTipoEntrega(entrega.getTipoEntrega());
			}
			
			
		}*/
	    
	    result.include("listaPedidosEnviadosHoje", listaPedidosEnviadosHoje);
	    result.include("listaPedidosAbertos", listaPedidosAbertos);
	    
	}
	
	@Get("/pedido/consultar")
	public void consultarPedido(){
		
	}
	
	@Get("/")
	public void principal(){
		List<Quadro> listaPedidosDelivery = pedidoDAO.listarQuadroEntregasDelivery();
		List<Quadro> listaPedidosPickup = pedidoDAO.listarQuadroEntregasPickup();
		
		for (int i = 0; i < listaPedidosDelivery.size(); i++) {
			Entrega entrega = new Entrega();
			if (listaPedidosDelivery.get(i).getEntrega().getPedido().getIdEntrega()!=null){
				entrega.setId(Integer.valueOf(listaPedidosDelivery.get(i).getEntrega().getPedido().getIdEntrega()));
				entrega = entregaDAO.load(entrega);
				listaPedidosDelivery.get(i).getEntrega().getPedido().setTipoEntrega(entrega.getTipoEntrega());
			}
			
			
		}
		
		for (int i = 0; i < listaPedidosPickup.size(); i++) {
			Entrega entrega = new Entrega();
			if (listaPedidosPickup.get(i).getEntrega().getPedido().getIdEntrega()!=null){
				entrega.setId(Integer.valueOf(listaPedidosPickup.get(i).getEntrega().getPedido().getIdEntrega()));
				entrega = entregaDAO.load(entrega);
				listaPedidosPickup.get(i).getEntrega().getPedido().setTipoEntrega(entrega.getTipoEntrega());
			}
			
			
		}
		
		 result.include("listaPedidosDelivery", listaPedidosDelivery);
		 result.include("listaPedidosPickup", listaPedidosPickup);
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
	
	@Get("/data")
	public void data(){
		
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
		List<Horario> listaHorario = new ArrayList<Horario>();
		listaHorario = horarioDAO.consultarTodosHorarios();
		result.include("listaHorario", listaHorario);
		System.out.println("Administrar Sistema");
	}
	
	@Get("/alterarHorario/{idHorario}/{status}")
	public void alterarHorario(Integer idHorario, String status){
		Horario horario = new Horario();
		horario.setId(idHorario);
		horario = horarioDAO.load(horario);
		horario.setAtivo(status);
		horarioDAO.update(horario );
		result.include("tipomsg", "success");
		result.include("mensagemNegrito", "Horário ");
		result.include("mensagem", "alterado com sucesso.");
		result.redirectTo(AdminController.class).manterHorario();
		
	}
	
	@Get("/excluirHorario/{idHorario}")
	public void excluirHorario(Integer idHorario){
		Horario horario = new Horario();
		horario.setId(idHorario);
		horario = horarioDAO.load(horario);
		horarioDAO.consultarPedidoHorario(horario);
		horarioDAO.excluir(horario);
		result.include("tipomsg", "success");
		result.include("mensagemNegrito", "Horário ");
		result.include("mensagem", "excluído com sucesso.");
		result.redirectTo(AdminController.class).manterHorario();
	}
	
	@Get("/mostrarHorario/{horario.id}")
	public void mostrarHorario(Horario horario){
		horario = horarioDAO.load(horario);
		
		result.include("horario", horario);
		
	}
	
	@Post
	public void cadastrarHorario(Horario horario){
		String[] horaSplit = horario.getHorario().split(";");
		Integer hora = Integer.valueOf(horaSplit[0].substring(0, 2));
		if (hora <12){
			horario.setTurno(1);
		}else if (hora >12 &&hora < 18){
			horario.setTurno(2);
		}else{
			horario.setTurno(3);
		}
		horario.setAtivo("N");
		horarioDAO.incluir(horario);
		result.include("tipomsg", "success");
		result.include("mensagemNegrito", "Horário ");
		result.include("mensagem", "incluído com sucesso.");
		result.redirectTo(AdminController.class).manterHorario();
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
			//Achar Quadro e excluir
			Quadro quadro = quadroDAO.consultarQuadroPorEntrega(Integer.valueOf(pedido.getIdEntrega()));
			quadroDAO.excluir(quadro );
			
		}
		pedidoDAO.excluirPedido(pedido);
		result.redirectTo(AdminController.class).principal();
		
	}
	
	
	@Get("/pedido/resumoPedido/{pedido.id}")
	public void resumoPedido(Pedido pedido){
		
		
		Pedido pedidoObj = pedidoDAO.load(pedido.getId());
		Entrega entrega = new Entrega();
		Quadro quadro = new Quadro();
		Horario horario = new Horario();
		Integer contador = 0;
		
		quadro = horarioDAO.consultarEntregaNoQuadro(pedido.getId());
		if (quadro != null){
			horario = horarioDAO.load(quadro.getHorario());
			String dateTime =quadro.getData().toString();
			// Format for input
			DateTimeFormatter dtf = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss.0");
			// Parsing the date
			DateTime jodatime = dtf.parseDateTime(dateTime);
			// Format for output
			DateTimeFormatter dtfOut = DateTimeFormat.forPattern("ddMMyyyy");
			// Printing the date
			
			contador = horarioDAO.totalHorarioDisponivel(horario.getId().toString(), dtfOut.print(jodatime) );
		}else{
			horario = null;
		}
		
		if (pedido.getIdEntrega()!=null){
			entrega.setId(Integer.valueOf(pedidoObj.getIdEntrega()));
			entrega = entregaDAO.load(entrega);
			result.include("entrega", entrega);
		}else{
			result.include("entrega", entrega);
		}
		
		result.include("quadro", quadro);
		result.include("horario", horario);
		result.include("pedido", pedidoObj);
		result.include("contador", contador);
		
		
	}
	
		
	@Get("/pedido/horarioDisponivel/{pedido}/{horario}")
	public void horarioDisponivel(Integer pedido, String horario){
		System.out.println(horario);
		List<Horario> listaHorarios = horarioDAO.consultarTodosHorariosAtivos();
		//List<Horario> listaHorariosContador = horarioDAO.consultarTodosHorariosDisponiveis(horario);
		result.use(Results.json()).from(listaHorarios).serialize();
	}
	
	@Get("/pedido/totalHorarioDisponivel/{idHorario}/{data}")
	public void totalHorarioDisponivel(String idHorario, String data){
		Integer contador = horarioDAO.totalHorarioDisponivel(idHorario, data);
		result.use(Results.json()).from(contador).serialize();
	}
	
	
	
	@Post("/pedido/enviar/{pedido.id}")
	public void enviarPedido(Pedido pedido){
		Pedido pedidoObj = pedidoDAO.load(pedido.getId());
		pedidoObj.setStatus("A");
		pedidoDAO.alterarPedido(pedidoObj);
		result.redirectTo(AdminController.class).resumoPedido(pedidoObj);
	}
	
	@Post("/pedido/enviar/saida/{pedido.id}")

	public void enviarPedidoSaida(Pedido pedido){
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
	
	@Post("/pedido/gravar")
	public void gravarPedido(Pedido pedido, Endereco endereco, String tipoEntrega, Quadro quadro){
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
		if (quadro.getHorario().getId()!=null){
			/*VALIDAR DATA SE É PASSADO*/
			if (validarData(quadro.getData(), pedido)){

			pedido.setStatus("A");

			if (pedido.getIdEntrega()==null){
				entregaDAO.incluir(entrega);
				pedido.setIdEntrega(entrega.getId().toString());
				quadro.setEntrega(entrega);
				quadro.setData(quadro.getData());
				quadroDAO.incluir(quadro);
			}else{
				entrega.setId(Integer.valueOf(pedido.getIdEntrega()));
				entregaDAO.alterar(entrega);
				Quadro quadroObj = quadroDAO.consultarQuadroPorEntrega(entrega.getId());
				quadroObj.setData(quadro.getData());
				quadroObj.setHorario(quadro.getHorario());
				quadroDAO.update(quadroObj);
			}
				pedido = pedidoDAO.alterarPedido(pedido);
				
			}
		}
		result.redirectTo(AdminController.class).resumoPedido(pedido);
	}
	
	@Post("/pedido/entrega")
	public void prepararEntrega(Pedido pedido, Endereco endereco, String tipoEntrega, Quadro quadro){
		
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
			/************Quadro***********/
			if (quadro.getHorario().getId()==null||quadro.getData()==null){
				result.include("tipomsg", "error");
				result.include("mensagemNegrito", "Erro! ");
				result.include("mensagem", "Data e Horário devem ser informados!");
				result.forwardTo(AdminController.class).resumoPedido(pedido);
			}
			
			if (quadro.getHorario().getId()!=null){
				/*VALIDAR DATA SE É PASSADO*/
				if (validarData(quadro.getData(), pedido)){

				pedido.setStatus("A");
	
				if (pedido.getIdEntrega()==null){
					entregaDAO.incluir(entrega);
					pedido.setIdEntrega(entrega.getId().toString());
					quadro.setEntrega(entrega);
					quadroDAO.incluir(quadro);
				}else{
					entrega.setId(Integer.valueOf(pedido.getIdEntrega()));
					entregaDAO.alterar(entrega);
					Quadro quadroObj = quadroDAO.consultarQuadroPorEntrega(entrega.getId());
					quadroObj.setData(quadro.getData());
					quadroObj.setHorario(quadro.getHorario());
					quadroDAO.update(quadroObj);
				}
					pedido = pedidoDAO.alterarPedido(pedido);
					result.redirectTo(AdminController.class).principal();
				}
			}
		}
	}
	
	@Post("/pedido/direto")
	public void enviarPedidoSaidaDireto(Pedido pedido, Endereco endereco, String tipoEntrega, Quadro quadro){
		
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
			/************Quadro***********/
			if (quadro.getHorario().getId()==null||quadro.getData()==null){
				result.include("tipomsg", "error");
				result.include("mensagemNegrito", "Erro! ");
				result.include("mensagem", "Data e Horário devem ser informados!");
				result.forwardTo(AdminController.class).resumoPedido(pedido);
			}
			
			if (quadro.getHorario().getId()!=null){
				/*VALIDAR DATA SE É PASSADO*/
				if (validarData(quadro.getData(), pedido)){

				pedido.setStatus("A");
	
				if (pedido.getIdEntrega()==null){
					entregaDAO.incluir(entrega);
					pedido.setIdEntrega(entrega.getId().toString());
					quadro.setEntrega(entrega);
					quadroDAO.incluir(quadro);
				}else{
					entrega.setId(Integer.valueOf(pedido.getIdEntrega()));
					entregaDAO.alterar(entrega);
					Quadro quadroObj = quadroDAO.consultarQuadroPorEntrega(entrega.getId());
					quadroObj.setData(quadro.getData());
					quadroObj.setHorario(quadro.getHorario());
					quadroDAO.update(quadroObj);
				}
					pedido = pedidoDAO.alterarPedido(pedido);
					//result.redirectTo(AdminController.class).principal();
					/*AQUI VAI O ENVIO DO PEDIDO DIRETO */
					
					Pedido pedidoObj = new Pedido();
					pedidoObj = pedidoDAO.load(pedido.getId());
					pedidoObj.setStatus("E");
					
					pedidoObj.setData(new Date());//Atualiza data de envio do pedido
					Entrega entregaNEW = new Entrega();
					entregaNEW.setId(Integer.valueOf(pedidoObj.getIdEntrega()));
					entregaNEW = entregaDAO.load(entrega);
					entregaNEW.setData(new Date());
					pedidoDAO.alterarPedido(pedidoObj);
					entregaDAO.alterar(entregaNEW);
					result.redirectTo(AdminController.class).pedidoEnviado(pedidoObj);
					
				}
			}
		}
		
		
	}
	
	private boolean validarData(Date dataCampo, Pedido pedido) {
		boolean retorno = false;
		LocalDate dataCampoNovo = new LocalDate(dataCampo);
		LocalDateTime agora = new LocalDateTime(new Date());
		LocalDate forCompare = agora.toLocalDate();
		
		System.out.println("equal : " + forCompare.isAfter(dataCampoNovo));
		
			if (forCompare.isEqual(dataCampoNovo) || forCompare.isBefore(dataCampoNovo)){
				return true;
			}else{
				result.include("tipomsg", "error");
				result.include("mensagemNegrito", "Erro! ");
				result.include("mensagem", "Data anterior a data de hoje!");
				result.forwardTo(AdminController.class).resumoPedido(pedido);
				
			}
		
		
		
		return retorno;
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
