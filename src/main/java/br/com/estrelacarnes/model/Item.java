package br.com.estrelacarnes.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Item implements Serializable{
	
	
	private static final long serialVersionUID = 1L;

	@Id
	private Integer id;
	
	private String tipo;
	
	private String quantidade;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idCategoria")
	private Categoria categoria = new Categoria();
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idProduto")
	private Produto produto = new Produto();
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idPreparo")
	private Preparo preparo = new Preparo();
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idComplemento")
	private Complemento complemento = new Complemento();
	
	
	
	private String observacao;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(String quantidade) {
		this.quantidade = quantidade;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

	public Preparo getPreparo() {
		return preparo;
	}

	public void setPreparo(Preparo preparo) {
		this.preparo = preparo;
	}

	public Complemento getComplemento() {
		return complemento;
	}

	public void setComplemento(Complemento complemento) {
		this.complemento = complemento;
	}

	

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	

}
