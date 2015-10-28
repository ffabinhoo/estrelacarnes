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
</style>
</head>
<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="brand" href="/estrelacarnes">Estrela Carnes -
					Administração de Pedidos</a>
				<div class="nav-collapse">
					<ul class="nav pull-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="icon-user"></i> <span
								class="pull-right ${not empty userInfo.user ? '' : 'hidden'}">
									${userInfo.user.name}</span> <b class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a href="javascript:;">Profile</a></li>
								<li><a href="${linkTo[IndexController].logout}">logout</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="subnavbar">
		<div class="subnavbar-inner">
			<div class="container">
				<ul class="mainnav">
					<li class="active"><a href="/estrelacarnes"><i class="icon-dashboard"></i><span>Painel de Controle</span></a></li>
					<li><a href="${linkTo[AdminController].consultarUsuario}"><i class="icon-star-empty"></i><span>Cadastrar Pedido</span></a></li>
					<li><a href="${linkTo[AdminController].consultarPedido}"><i class="icon-search"></i><span>Consultar Pedido</span></a></li>
					<li><a href="${linkTo[ClienteController].cadastrarCliente}"><i class="icon-user"></i><span>Cadastrar Cliente</span></a></li>
					<li><a href="${linkTo[AdminController].consultarUsuario}"><i class="icon-zoom-in"></i><span>Consultar Cliente</span></a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="main">
		<div class="main-inner">
			<div class="container">
				<div class="row">
					<div class="span12" id="divSpan10">
						<div class="row">
							<div class="bs-example ${not empty mensagem ? '' : 'hidden'}">
								<div class="alert alert-${tipomsg}" id="mensagem">
									<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>${mensagemNegrito}</strong>
									${mensagem}
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="span12">
						
						<div class="widget widget-nopad">
							<div class="widget-header">
								<i class="icon-list-alt"></i>
								<h3>Cliente</h3>
							</div>
							<div class="widget-content">
								<div class="shortcuts">
									<a
										href="${linkTo[ClienteController].mostrarCliente}${pedido.cliente.id}"
										class="shortcut"><i class="icon-user"></i> <span
										class="shortcut-label">${pedido.cliente.nome} -
											${pedido.cliente.celular}</span> </a>
								</div>
							</div>
						</div>
					</div>
					
					<div class="span12">
						<h3>Pedido para Entrega 
							<c:if test="${entrega.tipoEntrega eq 'D'}">
								Delivery - <fmt:formatDate pattern="dd/MM HH:mm" value="${entrega.data}" />
							</c:if>
							<c:if test="${entrega.tipoEntrega eq 'P'}">
								Pick-up - <fmt:formatDate pattern="dd/MM HH:mm" value="${entrega.data}" />
							</c:if>
						</h3>
					</div>
					<div class="span12">
						<br/>
					</div>
					<c:if test="${entrega.tipoEntrega eq 'D'}">
					<div class="span12">
						<div class="widget widget-nopad">
							<div class="widget-header">
								<i class="icon-list-alt"></i>
								<h3>Endereço de Entrega</h3>
							</div>
							<div class="widget-content">
								<div class="pricing-plans plans-1">
									<div class="plan-container">
										<div class="plan green">
											<div class="plan-header">
												<div class="plan-title">${entrega.endereco.endereco}-
													${entrega.endereco.complemento}</div>
											</div>
											<div class="plan-features">
												<ul>
													<li></li>
													<li><strong>Bairro: </strong>${entrega.endereco.bairro}</li>
													<li><strong>CEP: </strong>${entrega.endereco.cep}</li>
													<li><strong>Cidade: </strong>${entrega.endereco.cidade}
														/ ${entrega.endereco.uf}</li>
												</ul>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
					</c:if>
					<div class="span12">
						<div class="widget widget-table action-table" id="idDivObservacao">
								<div class="widget-header" id="idTituloObservacao">
									<i class="icon-th-list"></i>
									<h3>Observação</h3>
								</div>
								<div class="widget-content">
									<label>${pedido.observacao}</label>
								</div>
						</div>
					</div>
					<div class="span12">
						<div class="widget widget-table action-table" id="idDivObservacao">
								<div class="widget-header" id="idTituloObservacao">
									<i class="icon-th-list"></i>
									<h3>Valor(R$)</h3>
								</div>
								<div class="widget-content">
									<li><strong>Valor do Pedido:</strong> ${pedido.valor}</li>
									<br />
									<li><strong>Valor do Frete:</strong> ${pedido.valorFrete}</li>
								</div>
						</div>
					</div>
					<div class="span12">
						<div class="widget-header">
							<i class="icon-list-alt"></i>
							<h3>Itens do Pedido</h3>
						</div>
						<!-- /widget-header -->
						<div class="widget-content">
							<div class="widget big-stats-container">
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>Quantidade/Unidade</th>
											<th>Categoria</th>
											<th>Produto</th>
											<th>Preparo</th>
											<th>Complemento</th>
											<th>Observação</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${pedido.itens}">
											<tr>
												<td>${item.quantidade}${item.tipo}</td>
												<td>${item.categoria.nome}</td>
												<td>${item.produto.nome}</td>
												<td>${item.preparo.nome}</td>
												<td>${item.complemento.nome}</td>
												<td>${item.observacao}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="form-actions">
							<div class="pull-right">
								<form id="formVerPedido" method="get"
									action="/estrelacarnes/cadastrarPedido/${pedido.id}/KG/1/0"
									style="float: left; padding: 1px;">
									<button class="btn btn-small" id="voltarPedido" type="button">Voltar</button>
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="extra">
		<div class="extra-inner">
			<div class="container">
				<div class="row">
					<div class="span3">
						<h4>Sobre Estrela Carnes</h4>

					</div>
					<!-- /span3 -->
					<div class="span3">
						<h4>Suporte</h4>

					</div>
					<!-- /span3 -->
					<div class="span3"></div>
					<!-- /span3 -->
					<div class="span3"></div>
					<!-- /span3 -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /extra-inner -->
	</div>

	<script src="/estrelacarnes/js/jquery-1.7.2.min.js"></script>
	<script src="/estrelacarnes/js/excanvas.min.js"></script>
	<script src="/estrelacarnes/js/chart.min.js" type="text/javascript"></script>
	<script src="/estrelacarnes/js/bootstrap.js"></script>
	<script>
		document.getElementById("voltarPedido").onclick = function() {
			//var url = '/estrelacarnes';
			//window.location.href = url;
			event.preventDefault();
		    history.back(1);
		};
	</script>
</body>
</html>
