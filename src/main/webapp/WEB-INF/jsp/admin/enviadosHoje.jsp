<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pt">
<head>
<meta charset="utf-8">
<title>Camperia Carnes</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="/estrelacarnes/css/bootstrap.min.css" rel="stylesheet">
<link href="/estrelacarnes/css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
<link href="/estrelacarnes/css/font-awesome.css" rel="stylesheet">
<link href="/estrelacarnes/css/style.css" rel="stylesheet">
<link href="/estrelacarnes/css/pages/dashboard.css" rel="stylesheet">
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

</head>

<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span class="icon-bar"></span><span class="icon-bar"></span><span
					class="icon-bar"></span> </a> <a class="brand" href="/estrelacarnes">Camperia Carnes - Administração de Pedidos</a>
				<div class="nav-collapse">
					<ul class="nav pull-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-user"></i> <span
								class="pull-right ${not empty userInfo.user ? '' : 'hidden'}"> ${userInfo.user.name}</span> <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="javascript:;">Profile</a></li>
								<li><a href="${linkTo[IndexController].logout}">logout</a></li>
 
							</ul></li>
					</ul>
					<form class="navbar-search pull-right">
						<input type="text" class="search-query" placeholder="Search">
					</form>
				</div>
				<!--/.nav-collapse -->
			</div>
			<!-- /container -->
		</div>
		<!-- /navbar-inner -->
	</div>
	<!-- /navbar -->
	<div class="subnavbar">
		<div class="subnavbar-inner">
			<div class="container">
				<ul class="mainnav">
					<li class="active"><a href="/estrelacarnes"><i class="icon-dashboard"></i><span>Painel de Controle</span></a></li>
					<li><a href="${linkTo[AdminController].consultarUsuario}"><i class="icon-star-empty"></i><span>Cadastrar Pedido</span></a></li>
					<li><a href="${linkTo[AdminController].consultarPedido}"><i class="icon-search"></i><span>Consultar Pedido</span></a></li>
					<li><a href="${linkTo[ClienteController].cadastrarCliente}"><i class="icon-user"></i><span>Cadastrar Cliente</span></a></li>
					<li><a href="${linkTo[AdminController].consultarUsuario}"><i class="icon-zoom-in"></i><span>Consultar Cliente</span></a></li>
					<li class="dropdown">					
						<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-cog"></i>
							<span>Administração</span>
							<b class="caret"></b>
						</a>	
					
						<ul class="dropdown-menu">
	                        <li><a href="#">Produtos</a></li>
							<li><a href="${linkTo[AdminController].manterHorario}">Horários</a></li>
	                    </ul>    				
					</li>
					<!-- <li><a href="#"><i class="icon-list-alt"></i><span>Relatórios</span>
					</a></li> -->
					<!-- <li class="dropdown"><a href="javascript:;"
						class="dropdown-toggle" data-toggle="dropdown"> <i
							class="icon-long-arrow-down"></i> <span>Opções</span> <b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">Cadastrar Cliente</a></li>
							<li><a href="#">Consultar Pedido</a></li>
							

						</ul></li> -->
				</ul>
			</div>
			<!-- /container -->
		</div>
		<!-- /subnavbar-inner -->
	</div>
	<!-- /subnavbar -->
	<div class="main">
		<div class="main-inner">
			<div class="container">
				<div class="row">
					<div class="bs-example ${not empty mensagem ? '' : 'hidden'}">
						<div class="alert alert-${tipomsg}" id="mensagem">
							<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>${mensagemNegrito}</strong>
							${mensagem}
						</div>
					</div>
				</div>
				<div class="row">
					<div class="span12">

						<div class="widget">
							<div class="widget-header">
								<i class="icon-bookmark"></i>
								<h3>Ícones</h3>
							</div>
							<!-- /widget-header -->
							<div class="widget-content">
								<div class="shortcuts">
									<a href="${linkTo[AdminController].principal}" class="shortcut"><i class="shortcut-icon icon-calendar"></i>
										<span class="shortcut-label">Quadro de Entregas</span> </a>
									<a href="${linkTo[AdminController].enviadosHoje}" id="pedidosEnviadosHoje" class="shortcut"><i class="shortcut-icon icon-inbox"></i>
										<span class="shortcut-label">Pedidos Enviados e Abertos</span> </a> 
									<a href="${linkTo[AdminController].consultarPedido}" class="shortcut"><i class="shortcut-icon icon-search"></i>
										<span class="shortcut-label">Consultar Pedidos</span> </a>
								</div>
								<!-- /shortcuts -->
							</div>
							<!-- /widget-content -->
						</div>
						
						<div class="widget widget-table action-table" id="listaPedidosEnviadosHoje">
							<div class="widget-header">
								<i class="icon-th-list"></i>
								<h3>Pedidos Enviados Hoje</h3>
							</div>
							<!-- /widget-header -->
							<div class="widget-content">
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>Cliente - Celular</th>
											<th>Data</th>
											<th>Entrega</th>
											<th>Horário</th>
											<th class="td-actions"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="quadro" items="${listaPedidosEnviadosHoje}">
											<tr>
												<td><a href="${linkTo[ClienteController].mostrarCliente}${quadro.entrega.pedido.cliente.id}">
													${quadro.entrega.pedido.cliente.nome} - ${quadro.entrega.pedido.cliente.celular}</a></td>
												<td><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${quadro.entrega.pedido.data}" /></td>
												<td>
													<c:if test="${quadro.entrega.tipoEntrega eq 'D'}">
														Delivery
													</c:if>
													<c:if test="${quadro.entrega.tipoEntrega eq 'P'}">
														Pick-up
													</c:if>
													
												</td>
												<td>
												${quadro.horario.horario}
												</td>
												
												<td class="td-actions" style="width: 150px;">
													<form id="formVerPedido" method="get" action="${linkTo[AdminController].pedidoEnviado}${quadro.entrega.pedido.id}" style="float: left; padding: 1px;">
														<button id="detalhePedido" name="detalhePedido" class="button btn-small btn-primary">Detalhes</button>
													</form>
													<%-- <form id="formVerPedido" method="get" action="${linkTo[AdminController].imprimirItens}${pedido.id}" style="float: left; padding: 1px;"> --%>
													<%-- <button id="detalhePedido" name="detalhePedido" class="button btn-small btn" onclick="window.open('${linkTo[AdminController].imprimirItens}${pedido.id}')"><i class="icon-print"></i>Print</button> --%>
													<!-- </form> -->
													
													
												</td>

											</tr>
											
											
										</c:forEach>

									</tbody>
								</table>
							</div>
							<!-- /widget-content -->
						</div>
						
						
						<div class="widget widget-table action-table" id="listaPedidosHoje">
							<div class="widget-header">
								<i class="icon-th-list"></i>
								<h3>Pedidos em Aberto</h3>
							</div>
							<!-- /widget-header -->
							<div class="widget-content">
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>Cliente - Celular</th>
											<th>Data</th>
											<th>Entrega</th>
											<th class="td-actions"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="pedido" items="${listaPedidosAbertos}">
											<tr>
												<td><a href="${linkTo[ClienteController].mostrarCliente}${pedido.cliente.id}">
													${pedido.cliente.nome} - ${pedido.cliente.celular}</a></td>
												<td><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${pedido.data}" /></td>
												<td>
													<c:if test="${pedido.tipoEntrega eq 'D'}">
														Delivery
													</c:if>
													<c:if test="${pedido.tipoEntrega eq 'P'}">
														Pick-up
													</c:if>
													<c:if test="${pedido.tipoEntrega eq null}">
														Não selecionado
													</c:if>
												</td>
												
												<td class="td-actions" style="width: 200px;">
													<%-- <button id="detalhePedido" name="detalhePedido" class="button btn-small btn" onclick="window.open('${linkTo[AdminController].imprimirItens}${pedido.id}')"><i class="icon-print"></i>Print</button> --%>
													<form id="formVerPedido" method="get" action="/estrelacarnes/cadastrarPedido/${pedido.id}/KG/1/0" style="float: left; padding: 1px;">
														<button class="button btn btn-success btn-small" id="verPedido">Editar</button>
													</form>
													<form id="formExcluirPedido" method="get" action="${linkTo[AdminController].excluirPedido}${pedido.id}"
														style="float: left; padding: 1px;">
														<button name="_method" value="DELETE" class="button btn btn-danger btn-small" id="excluirPedido">Excluir</button>
													</form>
													<c:if test="${pedido.idEntrega ne null}">
														<form id="formEnviarPedidoSaida" method="post" action="${linkTo[AdminController].enviarPedidoSaida}${pedido.id}" 
															style="float: left; padding: 1px;">
															<!-- <input type="hidden" name="pedidoValor" id="valorPedido" value="">
															<input type="hidden" name="pedidoValorFrete" id="valorPedidoFrete" value="">
 -->
																<button id="enviarPedidoSaida" name="enviarPedidoSaida" class="button btn-small btn-primary">Enviar</button>
														</form>
													</c:if>
												</td>

											</tr>
											<div id="confirm" class="modal hide fade">
												<div class="modal-body"><h4>Confirma exclusão do Pedido?</h4></div>
												<div class="modal-footer">
													<button type="button" data-dismiss="modal" class="btn btn-primary" id="delete">Excluir</button>
													<button type="button" data-dismiss="modal" class="btn">Cancelar</button>
												</div>
											</div>
											<div id="confirmEnviar" class="modal hide fade">
												<div class="modal-body"><h3>Confirma enviar o Pedido?</h3>
													<br />
													<!-- <label class="control-label" for="valor">Valor do Pedido(R$):</label>
													<input type="text" id="valor" name="valor">
													<label class="control-label" for="valorFrete">Valor do Frete(R$):</label>
													<input type="text" id="valorFrete" name="valorFrete">
												<br /> -->
												</div>
												
												<div class="modal-footer">
													<button type="button" data-dismiss="modal"
														class="btn btn-primary" id="confirmar">Confirmar</button>
													<button type="button" data-dismiss="modal" class="btn">Cancelar</button>
												</div>
											</div>
										</c:forEach>

									</tbody>
								</table>
							</div>
							<!-- /widget-content -->
						</div>
						
						
						
						
						
						
					</div>
					<!-- /span6 -->

					<!-- /span6 -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /main-inner -->
	</div>
	<!-- /main -->
	<div class="extra">
		<div class="extra-inner">
			<div class="container">
				<div class="row">
					<div class="span3">
						<h4>Sobre Camperia Carnes</h4>

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

	<!-- Le javascript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<script src="/estrelacarnes/js/jquery-1.7.2.min.js"></script>
	<script src="/estrelacarnes/js/excanvas.min.js"></script>
	<script src="/estrelacarnes/js/chart.min.js" type="text/javascript"></script>
	<script src="/estrelacarnes/js/bootstrap.js"></script>
	<script language="javascript" type="text/javascript" src="/estrelacarnes/js/full-calendar/fullcalendar.min.js"></script>
 	<script src="js/base.js"></script>
	<script>
		$(function() {
			$("#listaPedidosHoje").show();
			$("#listaPedidosEnviadosHoje").show();
			$("#pedidosHoje").click(function() {
				$("#listaPedidosHoje").toggle("slow");
			});
		});
		$(function() {
			/* $("#listaPedidosEnviadosHoje").hide(); */
			$("#pedidosEnviadosHoje").click(function() {
				$("#listaPedidosHoje").show();	
				$("#listaPedidosEnviadosHoje").toggle("slow");
			});
		});
		$('button[name="_method"]').on('click', function(e) {
			var $form = $(this).closest('form');
			e.preventDefault();
			$('#confirm').modal({
				backdrop : 'static',
				keyboard : false
			}).one('click', '#delete', function() {
				$form.trigger('submit'); // submit the form
			});
		});

		 $('button[name="enviarPedidoSaida"]').on('click', function(e){
		    var $form=$(this).closest('#formEnviarPedidoSaida'); 
		    
		    e.preventDefault();
		    
		    $('#confirmEnviar').modal({ backdrop: 'static', keyboard: false })
		        .one('click', '#confirmar', function(e) {
		        	/* var valor = $('#valor').val();
		        	var valorFrete = $('#valorFrete').val();
			        
			        $("#valorPedido").val(valor);
			        $("#valorPedidoFrete").val(valorFrete);
			        var valor = $('#valor').val();
			        var valorFrete = $('#valorFrete').val(); */
			        
		            $form.trigger('submit'); // submit the form
		        });
		});
	 	  
	</script>

</body>
</html>
