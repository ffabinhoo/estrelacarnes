package br.com.estrelacarnes.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.estrelacarnes.model.Horario;

public class DefaultHorarioDAO implements HorarioDAO, Serializable{
	
	
	private static final long serialVersionUID = -4756737758015483441L;
	private final EntityManager entityManager;
	
	protected  DefaultHorarioDAO() {
		this(null);
	}
	
	@Inject
	public DefaultHorarioDAO(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	@Override
	public void incluir(Horario horario) {
		
	}

	@Override
	public Horario load(Horario horario) {
		return this.entityManager.find(Horario.class, horario.getId());
	}

	@Override
	public List<Horario> consultarTodosHorarios() {
		List<Horario> lista = new ArrayList<Horario>();
		String sql = "select i from Horario i ";
		lista = entityManager.createQuery(sql, Horario.class).getResultList();
		return lista;
	}
	
	@Override
	public List<Horario> consultarTodosHorariosAtivos() {
		List<Horario> lista = new ArrayList<Horario>();
		String sql = "select i from Horario i where i.ativo = 'S'";
		lista = entityManager.createQuery(sql, Horario.class).getResultList();
		return lista;
	}

	@Override
	public void excluir(Horario horario) {
		
	}

	@Override
	public Horario update(Horario horario) {
		return this.entityManager.merge(horario);
	}

	

	

	

	

	
	
	
	

}
