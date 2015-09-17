package br.com.estrelacarnes.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

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
	public List<Produto> listarProdutosPorCategoria(String id) {
		List<Produto> lista = new ArrayList<Produto>();
		String sql = "select p "
				+ "from Produto  where p.idCategoria = :id order by p.nome asc";
		

		lista = entityManager.createQuery(sql, Produto.class)
				.setParameter("id", id ).getResultList();

		
		return lista;
	}
	
	


}
