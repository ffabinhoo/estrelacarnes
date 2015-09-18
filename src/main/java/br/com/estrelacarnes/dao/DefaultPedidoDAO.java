package br.com.estrelacarnes.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.estrelacarnes.model.Complemento;
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
	
	


}
