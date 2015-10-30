package br.com.estrelacarnes.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

@Entity
public class Pedido implements Serializable{
	
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GenericGenerator(name="idPedido", strategy="increment")
	@GeneratedValue(generator="idPedido")
	private Integer id;
	
	private String valor;
	
	private String valorFrete;
	
	@Transient
	private String total;
	
	private String status;
	
	private String idEntrega;
	
	private Date data;
	
	private String observacao;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "idCliente")
	private Cliente cliente = new Cliente();
	
	//@OneToOne(fetch = FetchType.EAGER, mappedBy="pedido")
	//@Transient
	//private Entrega entrega = new Entrega();
	
	@Transient
	private String tipoEntrega;
	
	@Transient
	List<Item> itens = new ArrayList<Item>();

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getIdEntrega() {
		return idEntrega;
	}

	public void setIdEntrega(String idEntrega) {
		this.idEntrega = idEntrega;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public List<Item> getItens() {
		return itens;
	}

	public void setItens(List<Item> itens) {
		this.itens = itens;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public String getTipoEntrega() {
		return tipoEntrega;
	}

	public void setTipoEntrega(String tipoEntrega) {
		this.tipoEntrega = tipoEntrega;
	}

	public String getValorFrete() {
		return valorFrete;
	}

	public void setValorFrete(String valorFrete) {
		this.valorFrete = valorFrete;
	}

	public String getTotal() {
		Float val1 = 0F;
		Float val2 = 0F;
		if (getValor()!=null){ 
			val1 = Float.parseFloat(getValor().replace(",", "."));
		}
		if (getValorFrete()!=null){ //Caso seja Pick-up
			val2 = Float.parseFloat(getValorFrete().replace(",", "."));
		}
		Float tot = val1 + val2;
		
		return String.format("%.2f", tot);
	}

	
	

	
}
