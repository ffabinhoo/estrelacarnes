<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="iso-8859-1">
<title>Estrela Carnes</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="/estrelacarnes/css/bootstrap.min.css" rel="stylesheet">
<link href="/estrelacarnes/css/bootstrap-responsive.min.css"
	rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
	rel="stylesheet">
<link href="/estrelacarnes/css/font-awesome.css" rel="stylesheet">
<link href="/estrelacarnes/css/style.css" rel="stylesheet">
<link href="/estrelacarnes/css/pages/dashboard.css" rel="stylesheet">
<link href="/estrelacarnes/css/pages/plans.css" rel="stylesheet">
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<style type="text/css">
body {
	margin: 0;
	padding: 0;
}

</style>
</head>
<body>
	<!--  onload="window.print()" -->
	
		<div align="center">
			<i class="icon-star-empty"></i>
			<label><strong><font size="5"> Estrela Carnes</font></strong></label>
			WWW.ESTRELACARNES.COM.BR
			<br> CNPJ: 00.454.728/0001-93
			<br>
		</div>	
	<br>
	<div align="center">
		Cliente:&nbsp;<strong><font size="3">${pedido.cliente.nome}</font></strong>
		<br>(${pedido.cliente.celular})
	</div>
	
	<div align="left">
		<c:forEach var="item" items="${pedido.itens}">
	
			<li>${item.quantidade}${item.tipo}|	${item.produto.nome}| ${item.preparo.nome}| ${item.complemento.nome}
				<br>
				${item.observacao}</li>
	
		</c:forEach>
	</div>
	
	<div align="right">
		<table>
			<tr><td>SUBTOTAL:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>R$&nbsp;&nbsp;&nbsp;</td><td>${pedido.valor}</td></tr>
			<tr><td>TX DE ENTREGA:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>R$&nbsp;&nbsp;&nbsp;</td><td>${pedido.valorFrete}</td></tr>
			<tr><td></td><td></td><td></td></tr>
			<tr><td></td><td></td><td></td></tr>
			<tr><td></td><td></td><td></td></tr>
			<tr><td><strong>TOTAL</strong>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>R$&nbsp;&nbsp;&nbsp;</td><td>${pedido.total}</td></tr>
		</table>
	</div>
	
	<div align="left">
	<c:if test="${pedido.observacao ne null}">
		<br>
		<strong>OBS.:</strong>${pedido.observacao}
	</c:if>	
	</div>	

	<br>
	<br>
	<div align="left">
		<table>
			<tr>
				<td><Strong>DATA:&nbsp;</strong><fmt:formatDate pattern="dd/MM HH:mm"	value="${entrega.data}" /></td>
				<td><Strong>MODO:&nbsp;</strong>
					<c:if test="${entrega.tipoEntrega eq 'D'}">
						DELIVERY
					</c:if>
					<c:if test="${entrega.tipoEntrega eq 'P'}">
						PICK-UP
					</c:if>
				</td>
			</tr>
		</table>
	</div>
	<br>
	<div align="left">
		<Strong>RECEBIMENTO:</strong>________________________________________________________________
		<br>
		
									 ===============================================================
		
	</div>
	
	<br>
	<div align="left">
		<strong><font size="2">${pedido.cliente.nome}</font></strong>:(${pedido.cliente.celular})
	</div>
	<c:if test="${entrega.tipoEntrega eq 'D'}">

		<Strong>Endereço de Entrega</Strong><br>
		${entrega.endereco.endereco} - ${entrega.endereco.complemento}
		<li><strong>Bairro: </strong>${entrega.endereco.bairro}</li>
		<li><strong>Referência: </strong>${entrega.endereco.referencia}</li>
		<li><strong>CEP: </strong>${entrega.endereco.cep}</li>
		<li><strong>Cidade: </strong>${entrega.endereco.cidade} /
			${entrega.endereco.uf}</li>
		</ul>

	</c:if>
	

	



</body>
</html>
