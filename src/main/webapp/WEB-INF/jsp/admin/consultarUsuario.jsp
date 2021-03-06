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
					<!-- <form class="navbar-search pull-right">
						<input type="text" class="search-query" placeholder="Search">
					</form> -->
				</div>
				<!--/.nav-collapse -->
			</div>
			<!-- /container -->
		</div>
		<!-- /navbar-inner -->
	</div>
	<!-- /navbar -->
		<jsp:include page="menu.jsp" />
	<!-- /subnavbar -->
	<div class="main">
		<div class="main-inner">
			<div class="container">
				<div class="row">
					<div class="bs-example ${not empty mensagem ? '' : 'hidden'}">
						<div class="alert alert-${tipomsg}" id="mensagem">
							<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>${mensagemNegrito}</strong> ${mensagem}
						</div>
					</div>
				</div>
				<div class="row">
					<div class="span12">
						<div class="widget widget-table action-table" id="buscaUsuario">
							<form action="${linkTo[AdminController].consultarUsuario}" method="post" id="formConsulta">
								
								<input type="text" class="" placeholder="Nome" id="nome" name="nome" value=""> <!-- <a href="#" id="idBuscaNome"><i
									class="icon-search"></i></a> --><br />
									<input type="text" class="" placeholder="Telefone" id="telefone" name="telefone" value=""> <!-- <a href="#" id="idBusca"><i
									class="icon-search"></i></a> --><br />
									<div class="form-actions">
										<button  class="btn btn-primary btn-small" id="buscar">Buscar</button>
										<button class="btn btn-small" id="voltarCliente" type="button">Voltar</button>
										
										
									</div>	
							</form>
							<form action="${linkTo[ClienteController].exportar}" method="post" id="formExportar">
								<input type="hidden" name="nomeBusca" value="${nomeBusca}" id="nomeBusca">
								<input type="hidden" name="telBusca" value="${telBusca}" id="telefoneBusca">
								<div class="pull-right">
									<button id="exportar" name="exportar" class="btn" >Exportar Lista</button>
								</div>
							</form>
						</div>
					</div>
					<!-- /row -->
					<c:if test="${listaCliente.size() > 0}">
						<div class="widget widget-table action-table" id="listaClientes">
							<div class="widget-header">
								<i class="icon-th-list"></i>
								<h3>Clientes</h3>
							</div>
							<!-- /widget-header -->
							<div class="widget-content">
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>Nome do Cliente</th>
											<th>Telefone</th>
											<th>CPF</th>
											<th class="td-actions"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="cliente" items="${listaCliente}">
											<tr>
											
												<td><a href="${linkTo[ClienteController].mostrarCliente}${cliente.id}">${cliente.nome}</a></td>
												<td>${cliente.celular}</td>
												<td>${cliente.cpf}</td>
												<td class="td-actions" style="width: 200px;">
													<form action="${linkTo[AdminController].cadastrarPedidoNovo}" method="post" id="formAbrirPedido" style="float: left; padding: 1px;">
														<input type="hidden" id="idCliente" name="idCliente" value="${cliente.id}">
														<button class="button btn btn-success btn-small" id="abrirPedido">Abrir Pedido</button>
													</form>
													<form id="formExcluirCliente" method="get" action="${linkTo[ClienteController].excluirCliente}${cliente.id}" 
														style="float: left; padding: 1px;">
														<button name="_method" value="DELETE" class="button btn btn-danger btn-small" id="excluirCliente">Excluir Cliente</button>
													</form>
												</td>
											</tr>
										<div id="confirm" class="modal hide fade">
										  <div class="modal-body">
										    Confirma exclusão do Cliente?<br />
										    (Todo o Histórico do cliente também será excluído)
										  </div>
										  <div class="modal-footer">
										    <button type="button" data-dismiss="modal" class="btn btn-primary" id="delete">Excluir</button>
										    <button type="button" data-dismiss="modal" class="btn">Cancelar</button>
										  </div>
										</div>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- /widget-content -->
						</div>
					</c:if>
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
		</div>

		<script src="/estrelacarnes/js/jquery-1.7.2.min.js"></script>
		<script src="/estrelacarnes/js/excanvas.min.js"></script>
		<script src="/estrelacarnes/js/chart.min.js" type="text/javascript"></script>
		<script src="/estrelacarnes/js/bootstrap.js"></script>
		<script>
		$(function() {
			$("#nome").focus();
		});
			
			document.getElementById("voltarCliente").onclick = function() {
				var url = '/estrelacarnes';
				window.location.href = url;
			};
			
			
			
			$( "#exportar" ).click(function() {
				$('#formExportar').attr('action', "/estrelacarnes/cliente/exportar");
				  $( "#formExportar" ).submit();
			});
			
			
			
			$('button[name="_method"]').on('click', function(e){
			    var $form=$(this).closest('form'); 
			    e.preventDefault();
			    $('#confirm').modal({ backdrop: 'static', keyboard: false })
			        .one('click', '#delete', function() {
			            $form.trigger('submit'); // submit the form
			        });
			        // .one() is NOT a typo of .on()
			});
			
		</script>
</body>
</html>
