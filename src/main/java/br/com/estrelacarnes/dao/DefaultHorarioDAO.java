package br.com.estrelacarnes.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import br.com.estrelacarnes.model.Cliente;
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
		this.entityManager.persist(horario);
	}

	@Override
	public Horario load(Horario horario) {
		return this.entityManager.find(Horario.class, horario.getId());
	}

	@Override
	public List<Horario> consultarTodosHorarios() {
		List<Horario> lista = new ArrayList<Horario>();
		String sql = "select i from Horario i order by ativo desc, horario asc";
		lista = entityManager.createQuery(sql, Horario.class).getResultList();
		return lista;
	}
	
	@Override
	public List<Horario> consultarTodosHorariosAtivos() {
		List<Horario> lista = new ArrayList<Horario>();
		String sql = "select i from Horario i where i.ativo = 'S' order by ativo desc, horario asc";
		lista = entityManager.createQuery(sql, Horario.class).getResultList();
		return lista;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Horario> consultarTodosHorariosDisponiveis(String horario) {
		List<Horario> lista = new ArrayList<Horario>();
		String sql = "select h.id, h.horario, q.data, count(h.id) from Horario h"
				+ " join Quadro q on H.id = q.idHorario "
				+ " where h.ativo = 'S' "
				+ " and DATE_FORMAT(Q.data,'%d/%m/%Y') =  "	+ horario		
				+ " group by H.id, H.horario, Q.data " 
				
				+ " order by ativo desc, horario asc";
		lista = entityManager.createNativeQuery(sql, Horario.class).getResultList();
		return lista;
	}

	@Override
	public void excluir(Horario horario) {
		horario = load(horario);
		Horario obj = this.entityManager.merge(horario);
		this.entityManager.remove(obj);
	}

	@Override
	public Horario update(Horario horario) {
		return this.entityManager.merge(horario);
	}

	@Override
	public Horario consultarPedidoHorario(Horario horario) {
		
		return null;
	}

	

	

	

	

	

	
	
	
	

}
