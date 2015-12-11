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
<!--<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
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
	margin-top: 0;
	margin-bottom: 0;
	font-size: 13px;
	font-family: Arial, 'Helvetica Neue', Helvetica, sans-serif;
}

#nomeEmpresa{
	font-size: 24px;
	font-family: Arial, 'Helvetica Neue', Helvetica, sans-serif;
 }

</style>
<script type="text/javascript">
function imprimir(){
	window.print();
	//var url = '/estrelacarnes/pedido/imprimirItens/' + ${pedido.id};
	//window.open(url, '_blank');
	return false;
}
</script>
</head>
<body onload="imprimir();" >
	<!--  onload="window.print()" -->
	
		<div align="center" >
			<label id="nomeEmpresa"><strong> ESTRELA CARNES</strong></label>
			WWW.ESTRELACARNES.COM.BR
			<br> CNPJ: 00.454.728/0001-93
			<br> TEL: 3351-2313
		</div>	
	<br>
	<div align="center">
		<strong>${pedido.cliente.nome}</strong>
		<br>(${pedido.cliente.celular})
	</div>
	
	<div align="left">
		<c:forEach var="item" items="${pedido.itens}">
	
			<p>${item.quantidade}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.tipo}&nbsp;&nbsp;${item.produto.nome}&nbsp;&nbsp;${item.preparo.nome}&nbsp;&nbsp; ${item.complemento.nome}
				<c:if test="${item.observacao ne ''}">
					<br>
				</c:if>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.observacao}</p>
	
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
				<td><Strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MODO:&nbsp;</strong>
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
		<strong>${pedido.cliente.nome}</strong> - (${pedido.cliente.celular})
	</div>
	<br>
	<c:if test="${entrega.tipoEntrega eq 'D'}">
		<li><Strong>Endereço: </Strong>${entrega.endereco.endereco} - ${entrega.endereco.complemento}</li>
		<li><strong>Bairro: </strong>${entrega.endereco.bairro}</li>
		<li><strong>Referência: </strong>${entrega.endereco.referencia}</li>
	</c:if>
</body>
</html>
