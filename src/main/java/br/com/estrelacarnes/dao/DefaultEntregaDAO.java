package br.com.estrelacarnes.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.estrelacarnes.model.Categoria;
import br.com.estrelacarnes.model.Cliente;
import br.com.estrelacarnes.model.Endereco;
import br.com.estrelacarnes.model.Entrega;
import br.com.estrelacarnes.model.Item;
import br.com.estrelacarnes.model.Pedido;

public class DefaultEntregaDAO implements EntregaDAO, Serializable{
	
	
	private static final long serialVersionUID = -4756737758015483441L;
	private final EntityManager entityManager;
	
	protected  DefaultEntregaDAO() {
		this(null);
	}
	
	@Inject
	public DefaultEntregaDAO(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	@Override
	public void incluir(Entrega entrega) {
		this.entityManager.persist(entrega);
	}

	@Override
	public Entrega load(Entrega entrega) {
		return this.entityManager.find(Entrega.class, entrega.getId());
	}
	
	@Override
	public Entrega carregarEntregaPeloPedido(Pedido pedido){
		return entityManager.createQuery("select e from Entrega e where e.pedido.id = " + pedido.getId(),  Entrega.class).getSingleResult();
	}

	@Override
	public List<Entrega> consultarEnderecoEntrega(Endereco endereco) {
		List<Entrega> lista = new ArrayList<Entrega>();
		String sql = "select i from Entrega i where i.endereco.id = " + endereco.getId() + " ";
		lista = entityManager.createQuery(sql, Entrega.class).getResultList();
		return lista;
	}

	@Override
	public List<Entrega> consultarEntregasCliente(Cliente cliente) {
		List<Entrega> lista = new ArrayList<Entrega>();
		String sql = "select i from Entrega i where i.cliente.id = " + cliente.getId() + " ";
		lista = entityManager.createQuery(sql, Entrega.class).getResultList();
		return lista;
	}

	@Override
	public void alterar(Entrega entrega) {
		this.entityManager.merge(entrega);
		
	}

	@Override
	public void excluir(Entrega entrega) {
		this.entityManager.remove(entrega);
		
	}

	

	

	

	

	
	
	
	

}
