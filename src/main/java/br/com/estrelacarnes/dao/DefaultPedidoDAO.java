package br.com.estrelacarnes.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.estrelacarnes.model.Cliente;
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
	
	


}
