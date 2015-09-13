package br.com.estrelacarnes.model;


import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;


@Entity
public class User implements Serializable {

	private static final long serialVersionUID = 4548298563023480676L;

	@Id
	private Integer id;
	
	@NotNull
	@Length(min = 3, max = 20)
	@Pattern(regexp = "[a-z0-9_]+", message = "Login inválido")
	private String login;

	@NotNull
	@Length(min = 4, max = 20)
	private String password;

	@NotNull
	@Length(min = 3, max = 100)
	private String name;

	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	
}
