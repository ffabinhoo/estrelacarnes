<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="iso-8859-1">
<title>Estrela Carnes</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="/estrelacarnes/css/bootstrap.min.css" rel="stylesheet">
<link href="/estrelacarnes/css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
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
<body onload="window.print()">
	<h2>
		<i class="icon-star-empty"></i> Estrela Carnes
	</h2>
	=================================================================================================
	<br>
	<br>
	<br>
	<h3>Cliente</h3>

	${pedido.cliente.nome} - ${pedido.cliente.celular}
	<br>
	<br>
	<h4>Tipo de Entrega</h4>
	<c:if test="${entrega.tipoEntrega eq 'D'}">
								Delivery - <fmt:formatDate pattern="dd/MM HH:mm" value="${entrega.data}" />
	</c:if>
	<c:if test="${entrega.tipoEntrega eq 'P'}">
								Pick-up - <fmt:formatDate pattern="dd/MM HH:mm" value="${entrega.data}" />
	</c:if>
	<br>
	<br>
	<c:if test="${entrega.tipoEntrega eq 'D'}">

		<h4>Endereço de Entrega</h4>
		${entrega.endereco.endereco} - ${entrega.endereco.complemento}
		<li><strong>Bairro: </strong>${entrega.endereco.bairro}</li>
		<li><strong>CEP: </strong>${entrega.endereco.cep}</li>
		<li><strong>Cidade: </strong>${entrega.endereco.cidade} / ${entrega.endereco.uf}</li>
		</ul>

	</c:if>
	<c:if test="${pedido.observacao ne null}">
		<br>
		<h4>Observação</h4>
		<label>${pedido.observacao}</label>
	</c:if>

	<h4>Valor(R$)</h4>
	<li><strong>Valor do Pedido:</strong> ${pedido.valor}</li>
	<li><strong>Valor do Frete:</strong> ${pedido.valorFrete}</li>
	<br>
	<h4>Itens do Pedido</h4>


	<c:forEach var="item" items="${pedido.itens}">

		<li>${item.quantidade}${item.tipo}|${item.categoria.nome}| ${item.produto.nome}| ${item.preparo.nome}| ${item.complemento.nome}|
			${item.observacao}</li>

	</c:forEach>




</body>
</html>
