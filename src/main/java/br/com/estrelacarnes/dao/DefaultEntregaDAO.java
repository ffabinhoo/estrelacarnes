package br.com.estrelacarnes.dao;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.estrelacarnes.model.Categoria;
import br.com.estrelacarnes.model.Entrega;
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

	

	

	

	
	
	
	

}
