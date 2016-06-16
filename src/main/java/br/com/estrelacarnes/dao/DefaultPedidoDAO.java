package br.com.estrelacarnes.dao;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.joda.time.DateTime;

import br.com.estrelacarnes.model.Cliente;
import br.com.estrelacarnes.model.Complemento;
import br.com.estrelacarnes.model.Item;
import br.com.estrelacarnes.model.Pedido;
import br.com.estrelacarnes.model.Preparo;
import br.com.estrelacarnes.model.Produto;
import br.com.estrelacarnes.model.Quadro;

public class DefaultPedidoDAO implements PedidoDAO, Serializable{
	
	
	private static final long serialVersionUID = -4756737758015483441L;
	private final EntityManager entityManager;
	
	protected  DefaultPedidoDAO() {
		this(null);
	}
	
	@Inject
	public DefaultPedidoDAO(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	@Override
	public List<Produto> listarProdutosPorCategoria(Integer id) {
		List<Produto> lista = new ArrayList<Produto>();
		String sql = "select p from Produto p where p.categoria.id = :id order by p.nome asc";
		lista = entityManager.createQuery(sql, Produto.class).setParameter("id", id ).getResultList();
		return lista;
	}

	@Override
	public List<Preparo> listarPreparos() {
		List<Preparo> lista = new ArrayList<Preparo>();
		String sql = "select p from Preparo p order by p.nome asc";
		lista = entityManager.createQuery(sql, Preparo.class).getResultList();
		return lista;
	}

	@Override
	public List<Complemento> listarComplementos() {
		List<Complemento> lista = new ArrayList<Complemento>();
		String sql = "select p from Complemento p order by p.id asc";
		lista = entityManager.createQuery(sql, Complemento.class).getResultList();
		return lista;
	}

	@Override
	public void inserirItem(Item item) {
		this.entityManager.persist(item);
	}

	@Override
	public Pedido abrirPedido(Pedido pedido) {
		pedido = this.entityManager.merge(pedido);
		return pedido;
	}
	
	@Override
	public List<Item> listarItensPorPedido(Integer idPedido) {
		List<Item> lista = new ArrayList<Item>();
		String sql = "select i from Item i where pedido.id = " + idPedido + " order by i.id asc";
		lista = entityManager.createQuery(sql, Item.class).getResultList();
		return lista;
	}

	@Override
	public Pedido load(Pedido pedidoobj) {
		return this.entityManager.find(Pedido.class, pedidoobj.getId());
	}

	@Override
	public Item mostrarItem(Integer idItem) {
		return this.entityManager.find(Item.class, idItem);
	}

	@Override
	public Pedido load(Integer idPedido) {
		Pedido pedido = this.entityManager.find(Pedido.class, idPedido);
		pedido.setItens(listarItensPorPedido(idPedido));
		return pedido;
	}

	@Override
	public List<Pedido> listarPedidosAbertos() {
		List<Pedido> lista = new ArrayList<Pedido>();
		String sql = "select p from Pedido p where p.status = 'A'order by p.data desc";
		lista = entityManager.createQuery(sql, Pedido.class).getResultList();
		return lista;
	}

	@Override
	public void excluirItem(Item item) {
		Item obj = this.entityManager.merge(item );
		this.entityManager.remove(obj);
	}

	@Override
	public void excluirPedido(Pedido pedido) {
		Pedido obj = this.entityManager.merge(pedido);
		this.entityManager.remove(obj);
		
	}

	@Override
	public void excluirItensPedido(Pedido pedido) {
		Query sql = this.entityManager
				.createQuery("delete from Item i where i.pedido.id = " + pedido.getId());
		
		sql.executeUpdate();
		
	}

	@Override
	public void alterarItem(Item item) {
		Item obj = this.entityManager.merge(item);
		this.entityManager.merge(obj);
	}

	@Override
	public Pedido alterarPedido(Pedido pedidoObj) {
		return this.entityManager.merge(pedidoObj);
		
	}

	@Override
	public List<Pedido> listarPedidos(String parametro) {
		List<Pedido> lista = new ArrayList<Pedido>();
		String sql = "select p from Pedido p where p.status = '"+parametro+"' order by p.id asc";
		lista = entityManager.createQuery(sql, Pedido.class).getResultList();
		return lista;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Pedido> consultarPedido(String status, String inicio, String fim) {
		List<Pedido> lista = new ArrayList<Pedido>();
		String sql = "select *, DATE_FORMAT(p.data, '%m-%d-%Y') dataformatada  from Pedido p where 1 = 1 ";
				if (status != "" && status != null){
					String sqlStatus = " and  p.status = '"+status+"' ";
					sql = sql.concat(sqlStatus);
				}
				if (inicio != "" && inicio != null){
					
					 SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
					Date datainicio = new Date();
					try {
						datainicio = dateFormat.parse(inicio);
						Calendar cal = Calendar.getInstance();
						
					    cal.setTime(datainicio);
					    cal.add(Calendar.DAY_OF_MONTH, -1);
					    int year = cal.get(Calendar.YEAR);
					    int month = cal.get(Calendar.MONTH);
					    month = month+1;
					    String months = "";
					    String days = "";
					    if (month <10){
					    	months = "0" + month; 
					    }else{
					    	months = month + "";
					    }
					    int day = cal.get(Calendar.DAY_OF_MONTH);
					    if (day <10){
					    	days = "0" + day; 
					    }else{
					    	days = day + "";
					    }
					    inicio = months + "/" + days + "/" + year;
						String sqlInicio = " and  DATE_FORMAT(p.data, '%m/%d/%y') >= '"+inicio+"' ";
						sql = sql.concat(sqlInicio);
					} catch (ParseException e) {
						e.printStackTrace();
					}
					 
				}
				if (fim != "" && fim != null){
					
					 SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
					Date datafim = new Date();
					try {
						datafim = dateFormat.parse(fim);
						Calendar cal = Calendar.getInstance();
						
					    cal.setTime(datafim);
					    //cal.add(Calendar.DAY_OF_MONTH, -1);
					    int year = cal.get(Calendar.YEAR);
					    int month = cal.get(Calendar.MONTH);
					    int day = cal.get(Calendar.DAY_OF_MONTH);
					    month = month+1;
					    String months = "";
					    String days = "";
					    if (month <10){
					    	months = "0" + month; 
					    }else{
					    	months = month + "";
					    }
					    if (day <10){
					    	days = "0" + day; 
					    }else{
					    	days = day + "";
					    }
					    fim = months + "/" + days + "/" + year;
						String sqlFim = " and  DATE_FORMAT(p.data, '%m/%d/%y') <= '"+fim+"' ";
						sql = sql.concat(sqlFim);
					} catch (ParseException e) {
						e.printStackTrace();
					}
					 
				}
				sql = sql + " order by p.data desc"; 
		lista = entityManager.createNativeQuery(sql, Pedido.class).getResultList();
		return lista;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Pedido> listarPedidosEnviadosHoje() {
		List<Pedido> lista = new ArrayList<Pedido>();
		String inicio = "";
		String fim = "";
		
		//DateTimeFormatter dtf = DateTimeFormat.forPattern("dd-MM-yyyy");
		String pattern = "MM/dd/yyyy";
		DateTime dataInicio = new DateTime();
		DateTime dataFim = new DateTime(); 
		inicio = dataInicio.toString();
		dataInicio = dataInicio.minusDays(1);
		inicio = dataInicio.toString(pattern);
		fim = dataFim.toString(pattern);
		
		String sql = "select * from Pedido p where p.status = 'E' "
				+ "and  DATE_FORMAT(p.data, '%m/%d/%y') >= '"+inicio+"' "
				+ "and  DATE_FORMAT(p.data, '%m/%d/%y') <= '"+fim+"' "
				+ "order by p.data desc";
		lista = entityManager.createNativeQuery(sql, Pedido.class).getResultList();
		return lista;
	}

	@Override
	public List<Pedido> consultarHistoricoPedido(Cliente cliente) {
		List<Pedido> lista = new ArrayList<Pedido>();
		String sql = "select * from Pedido p, Entrega e p.id = e.idPedido where idCliente = "+cliente.getId()+" order by p.data desc limit 10 ";
		lista = entityManager.createNativeQuery(sql, Pedido.class).getResultList();
		return lista;
	}

	@Override
	public void inserirListaItens(List<Item> listaItens) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Quadro> listarQuadroEntregas(String tipoEntrega) {
		List<Quadro> lista = new ArrayList<Quadro>();
		String sql = "select q from Quadro q where q.entrega.pedido.status = 'A' and q.entrega.tipoEntrega = '"+ tipoEntrega +"' order by q.data desc";
		lista = entityManager.createQuery(sql, Quadro.class).getResultList();
		return lista;
	}

	
}
