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

import br.com.estrelacarnes.model.Complemento;
import br.com.estrelacarnes.model.Item;
import br.com.estrelacarnes.model.Pedido;
import br.com.estrelacarnes.model.Preparo;
import br.com.estrelacarnes.model.Produto;

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
		String sql = "select p from Pedido p where p.status = 'A'order by p.id asc";
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
					    if (month <10){
					    	months = "0" + month; 
					    }else{
					    	months = month + "";
					    }
					    int day = cal.get(Calendar.DAY_OF_MONTH);
					    inicio = months + "/" + day + "/" + year;
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
					    cal.add(Calendar.DAY_OF_MONTH, -1);
					    int year = cal.get(Calendar.YEAR);
					    int month = cal.get(Calendar.MONTH);
					    month = month+1;
					    String months = "";
					    if (month <10){
					    	months = "0" + month; 
					    }else{
					    	months = month + "";
					    }
					    int day = cal.get(Calendar.DAY_OF_MONTH);
					    inicio = months + "/" + day + "/" + year;
						String sqlFim = " and  DATE_FORMAT(p.data, '%m/%d/%y') <= '"+fim+"' ";
						sql = sql.concat(sqlFim);
					} catch (ParseException e) {
						e.printStackTrace();
					}
					 
				}
		lista = entityManager.createNativeQuery(sql, Pedido.class).getResultList();
		return lista;
	}

}
