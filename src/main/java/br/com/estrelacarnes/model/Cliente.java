package br.com.estrelacarnes.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

@Entity
public class Cliente implements Serializable{
	
	private static final long serialVersionUID = 2899932356197002126L;
	
	@Id
	@GenericGenerator(name="idCliente", strategy="increment")
	@GeneratedValue(generator="idCliente")
	private Integer id;
	
	private String nome;
	

	@OneToMany(mappedBy = "cliente", targetEntity=Endereco.class, fetch=FetchType.EAGER)
	private List<Endereco> enderecos;
	
	@Transient
	private Endereco endereco;
	
	private String assinante;
	
	private String foto;
	
	private String facebook;
	
	private String twitter;
	
	private String instagram;
	
	private String email;
	
	private String telefone;
	
	private String slide;
	
	private String destaque;
	
	private String celular;
	
	private String cpf;
	
	
	
	 

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

	
	public String getAssinante() {
		return assinante;
	}

	public void setAssinante(String assinante) {
		this.assinante = assinante;
	}

	
	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	public String getFacebook() {
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	public String getTwitter() {
		return twitter;
	}

	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}

	public String getInstagram() {
		return instagram;
	}

	public void setInstagram(String instagram) {
		this.instagram = instagram;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getSlide() {
		return slide;
	}

	public void setSlide(String slide) {
		this.slide = slide;
	}

	
	public String getDestaque() {
		return destaque;
	}

	public void setDestaque(String destaque) {
		this.destaque = destaque;
	}

	
	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public List<Endereco> getEnderecos() {
		return enderecos;
	}

	public void setEnderecos(List<Endereco> enderecos) {
		this.enderecos = enderecos;
	}

	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	

}
