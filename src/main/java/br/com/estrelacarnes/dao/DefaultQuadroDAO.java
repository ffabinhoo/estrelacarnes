package br.com.estrelacarnes.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;

import br.com.estrelacarnes.model.Quadro;
import br.com.estrelacarnes.model.User;

public class DefaultQuadroDAO implements QuadroDAO, Serializable{
	
	private static final long serialVersionUID = -4756737758015483441L;
	private final EntityManager entityManager;
	
	protected  DefaultQuadroDAO() {
		this(null);
	}
	
	@Inject
	public DefaultQuadroDAO(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	@Override
	public void incluir(Quadro quadro) {
		this.entityManager.persist(quadro);
	}

	@Override
	public Quadro load(Quadro quadro) {
		return this.entityManager.find(Quadro.class, quadro.getId());
	}

	@Override
	public List<Quadro> consultarTodosQuadros() {
		List<Quadro> lista = new ArrayList<Quadro>();
		String sql = "select i from Quadro i order by ativo desc, quadro asc";
		lista = entityManager.createQuery(sql, Quadro.class).getResultList();
		return lista;
	}
	
	@Override
	public Quadro consultarQuadroPorEntrega(Integer entrega) {
		try {
			Quadro quadro = entityManager
				.createQuery("select u from Quadro u where u.entrega.id = :entrega ", Quadro.class)
					.setParameter("entrega", entrega)
					.getSingleResult();
			return quadro;
		} catch (NoResultException e) {
			return null;
		}
	}
	
	@Override
	public void excluir(Quadro quadro) {
		quadro = load(quadro);
		Quadro obj = this.entityManager.merge(quadro);
		this.entityManager.remove(obj);
	}

	@Override
	public Quadro update(Quadro quadro) {
		return this.entityManager.merge(quadro);
	}

	

}
