<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pt">
<head>
<meta charset="utf-8">
<title>Estrela Carnes</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
	rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/pages/dashboard.css" rel="stylesheet">
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"><span class="icon-bar"></span><span
					class="icon-bar"></span><span class="icon-bar"></span> </a> <a
					class="brand" href="/estrelacarnes">Estrela Carnes - Administração
					de Pedidos</a>
				<div class="nav-collapse">
					<ul class="nav pull-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><i class="icon-user"></i> <span
								class="pull-right ${not empty userInfo.user ? '' : 'hidden'}">
									${userInfo.user.name}</span> <b class="caret"></b></a>
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
					<li class="active"><a href="/estrelacarnes"><i class="icon-dashboard"></i><span>Pedidos</span>
					</a></li>
					<!-- <li><a href="#"><i class="icon-list-alt"></i><span>Relatórios</span>
					</a></li> -->
					<li class="dropdown"><a href="javascript:;"
						class="dropdown-toggle" data-toggle="dropdown"> <i
							class="icon-long-arrow-down"></i> <span>Opções</span> <b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">Cadastrar Cliente</a></li>
							<li><a href="#">Consultar Pedido</a></li>

						</ul></li>
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
					<div class="span12">

						<div class="widget">
							<div class="widget-header">
								<i class="icon-bookmark"></i>
								<h3>Ícones</h3>
							</div>
							<!-- /widget-header -->
							<div class="widget-content">
								<div class="shortcuts">
									<a href="${linkTo[AdminController].consultarUsuario}" class="shortcut"><i
										class="shortcut-icon icon-star-empty"></i><span
										class="shortcut-label">Adicionar Pedido</span> </a>
									<a  href="javascript:;" class="shortcut" id="pedidosHoje"><i
										class="shortcut-icon icon-list-alt" ></i><span
										class="shortcut-label">Pedidos Abertos</span> </a>	
									<a
										href="javascript:;" class="shortcut"><i
										class="shortcut-icon icon-user"></i><span
										class="shortcut-label">Cadastrar Usuário</span> </a>
								</div>
								<!-- /shortcuts -->
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
											<th>Número do Pedido</th>
											<th>Cliente - Celular</th>
											<th>Data</th>
											<th class="td-actions"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="pedido" items="${listaPedidosAbertos}">
										<tr>
											<td style="width: 200px;">${pedido.id}</td>
											<td><a href="${linkTo[ClienteController].mostrarCliente}${pedido.cliente.id}">${pedido.cliente.nome} - ${pedido.cliente.celular}</a></td>
											<td><fmt:formatDate pattern="dd/MM HH:mm" value="${pedido.data}" /></td>
											<td class="td-actions" style="width: 200px;">
												<form id="formVerPedido" method="get" action="cadastrarPedido/${pedido.id}/KG/1/0" 
													style="float: left; padding: 1px;">
													<button class="button btn btn-success btn-small" id="verPedido">Editar</button>
												</form>
												<form id="formExcluirPedido" method="get" action="${linkTo[AdminController].excluirPedido}${pedido.id}" 
													style="float: left; padding: 1px;">
													<button name="_method" value="DELETE" class="button btn btn-danger btn-small" id="excluirPedido">Excluir</button>
												</form>
											</td>
										
										</tr>
										<div id="confirm" class="modal hide fade">
										  <div class="modal-body">
										    Confirma exclusão do Pedido?
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

	<!-- Le javascript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<script src="js/jquery-1.7.2.min.js"></script>
	<script src="js/excanvas.min.js"></script>
	<script src="js/chart.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.js"></script>
	<script language="javascript" type="text/javascript"
		src="js/full-calendar/fullcalendar.min.js"></script>

	<script src="js/base.js"></script>
<script>
$(function(){
    $("#listaPedidosHoje").show();
		$( "#pedidosHoje" ).click(function() {
		  	$( "#listaPedidosHoje" ).toggle( "slow" );
		});
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
