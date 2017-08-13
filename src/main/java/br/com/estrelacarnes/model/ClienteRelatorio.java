package br.com.estrelacarnes.model;

import javax.persistence.Transient;

public class ClienteRelatorio{
	
	
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	

	private String nome;
	
	@Transient
	private Endereco endereco;

	@Transient
	private String quantidade;
	
	@Transient
	private String soma;
	
	@Transient
	private Pedido pedido;
	
	@Transient
	private Entrega entrega;

	public Pedido getPedido() {
		return pedido;
	}

	public void setPedido(Pedido pedido) {
		this.pedido = pedido;
	}

	public Entrega getEntrega() {
		return entrega;
	}

	public void setEntrega(Entrega entrega) {
		this.entrega = entrega;
	}

	public String getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(String quantidade) {
		this.quantidade = quantidade;
	}

	public String getSoma() {
		return soma;
	}

	public void setSoma(String soma) {
		this.soma = soma;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	

}
