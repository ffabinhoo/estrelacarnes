package br.com.estrelacarnes.cep;

import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement
//@XStreamAlias("CepResult")
public class CepResult {
   
	//@XStreamAlias("cep")
	private String cep;
	//@XStreamAlias("logradouro")
    private String logradouro;
    private String complemento;
    //@XStreamAlias("bairro")
    private String bairro;
    //@XStreamAlias("cidade")
    private String cidade;
    //@XStreamAlias("uf")
    private String uf;
    //@XStreamAlias("lat")
    private String lat;
    //@XStreamAlias("cep")
    private String lng;
    
    public CepResult(){};
    
    public CepResult(String cep, String logradouro, String complemento,
			String bairro, String cidade, String uf, String lat, String lng) {
		super();
		this.cep = cep;
		this.logradouro = logradouro;
		this.complemento = complemento;
		this.bairro = bairro;
		this.cidade = cidade;
		this.uf = uf;
		this.lat = lat;
		this.lng = lng;
	}
    
    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getLogradouro() {
        return logradouro;
    }

    public void setLogradouro(String logradouro) {
        this.logradouro = logradouro;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getUf() {
        return uf;
    }

    public void setUf(String uf) {
        this.uf = uf;
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getLng() {
        return lng;
    }

    public void setLng(String lng) {
        this.lng = lng;
    }
}