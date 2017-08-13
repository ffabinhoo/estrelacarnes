package br.com.estrelacarnes.dao;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.estrelacarnes.model.Cliente;
import br.com.estrelacarnes.model.ClienteRelatorio;
import br.com.estrelacarnes.model.Endereco;


public class DefaultClienteDAO implements ClienteDAO, Serializable{
	
	private static final long serialVersionUID = -4756737758015483441L;
	private final EntityManager entityManager;
	
	protected  DefaultClienteDAO() {
		this(null);
	}
	
	@Inject
	public DefaultClienteDAO(EntityManager entityManager) {
		this.entityManager = entityManager;
	}
	
	@Override
	public void add(Cliente cliente) {
		this.entityManager.persist(cliente);
	}

	@Override
	public Cliente load(Cliente cliente) {
		return this.entityManager.find(Cliente.class, cliente.getId());
	}
	
	@Override
	public List<Cliente> listAll() {
		return entityManager.createQuery("select m from Cliente m", Cliente.class).getResultList();
	}

	@Override
	public void delete(Cliente cliente) {
		Cliente obj = this.entityManager.merge(cliente);
		this.entityManager.remove(obj);
	}

	@Override
	public void atualizar(Cliente cliente) {
		this.entityManager.merge(cliente);
	}
	
	public Integer retornaMaxId(){
		Integer valor = entityManager.createQuery("select max(id)+1 from Cliente ", Integer.class).getSingleResult();
		return valor;
	}

	@Override
	public List<Cliente> consultarUsuarioPorTelefone(String telefone) {
		return entityManager.createQuery("select c from Cliente c where c.celular like '%" + telefone + "%'", Cliente.class).getResultList();
	}

	@Override
	public void excluirCliente(Cliente cliente) {
		cliente = load(cliente);
		Cliente obj = this.entityManager.merge(cliente);
		this.entityManager.remove(obj);
	}

	@Override
	public void inserir(Cliente cliente) {
		this.entityManager.persist(cliente);
	}

	@Override
	public List<Cliente> consultarUsuarioPorNome(String nome) {
		return entityManager.createQuery("select c from Cliente c where LOWER(c.nome) like '%" + nome.toLowerCase() + "%'", Cliente.class).getResultList();
	}

	@Override
	public void inserirEndereco(Endereco endereco) {
		this.entityManager.persist(endereco);
	}

	@Override
	public List<Cliente> listarTodosUsuarios() {
		return entityManager.createQuery("select c from Cliente c", Cliente.class).getResultList();
	}

	@Override
	public void excluirEnderecoCliente(Cliente cliente) {
		Query sql = this.entityManager
				.createQuery("delete from Endereco i where i.cliente.id = " + cliente.getId());
		sql.executeUpdate();
	}

	@Override
	public void excluirItensCliente(Cliente cliente) {
		Query sql = this.entityManager
				.createQuery("delete from Item i where i.pedido.cliente.id = " + cliente.getId());
		sql.executeUpdate();
		
	}

	@Override
	public void excluirPedidosCliente(Cliente cliente) {
		Query sql = this.entityManager
				.createQuery("delete from Pedido i where i.pedido.cliente.id = " + cliente.getId());
		sql.executeUpdate();
	}

	@Override
	public void excluirEndereco(Endereco endereco) {
		Query sql = this.entityManager
				.createQuery("delete from Endereco i where i.endereco.id = " + endereco.getId());
		
		sql.executeUpdate();
		
	}

	@Override
	public Endereco consultarEndereco(Endereco endereco) {
		return this.entityManager.find(Endereco.class, endereco.getId());
	}

	@Override
	public void alterarEndereco(Endereco endereco) {
		this.entityManager.merge(endereco);
	}

	@Override
	public List<ClienteRelatorio> relatorioClientesPedidos(String telBusca, String nomeBusca) {
		
		String sql = "select c.id, c.nome, c.telefone, c.celular, p.id pedido, e.id entrega, "
				+ " count(p.id) qtd, sum(CAST(replace(p.valor, ',','.') as DECIMAL(12,2))) soma from cliente c, Pedido p, Entrega e "
				+ " where c.id = p.idCliente "
				+ " and p.idEntrega = e.id "
				+ " AND c.nome like  '%"	+ nomeBusca	+ "%'"	
				+ " AND c.celular like  '%"	+ telBusca	+ "%'"
				+ " group by select c.id, c.nome, c.telefone, c.celular, p.id pedido, e.id entrega "
				+ " "
				; 
		System.out.println(sql);
		Object valor = entityManager.createNativeQuery(sql).getSingleResult();
		String retorno = valor.toString();
		return null;
	}

}
