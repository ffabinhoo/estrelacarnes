package br.com.estrelacarnes.dao;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.estrelacarnes.model.Categoria;

public class DefaultCategoriaDAO implements CategoriaDAO, Serializable{
	
	
	private static final long serialVersionUID = -4756737758015483441L;
	private final EntityManager entityManager;
	
	protected  DefaultCategoriaDAO() {
		this(null);
	}
	
	@Inject
	public DefaultCategoriaDAO(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	

	

	@Override
	public List<Categoria> listCategoriaAll() {
		return entityManager.createQuery("select c from Categoria c", Categoria.class).getResultList();
	}

	@Override
	public Categoria load(Categoria categoria) {
		return this.entityManager.find(Categoria.class, categoria.getId());
	}

	
	
	

}
