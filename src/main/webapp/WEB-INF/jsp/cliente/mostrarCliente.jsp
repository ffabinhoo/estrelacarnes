<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pt">
<head>
<meta charset="utf-8">
<title>Estrela Carnes</title>
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
					class="icon-bar"></span> </a> <a class="brand" href="/estrelacarnes">Estrela Carnes - Administração de Pedidos</a>
				<div class="nav-collapse">
					<ul class="nav pull-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-user"></i> <span
								class="pull-right ${not empty userInfo.user ? '' : 'hidden'}"> ${userInfo.user.name}</span> <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="javascript:;">Profile</a></li>
								<li><a href="${linkTo[IndexController].logout}">logout</a></li>

							</ul></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- /navbar -->
	<div class="subnavbar">
		<div class="subnavbar-inner">
			<div class="container">
				<ul class="mainnav">
					<li class="active"><a href="/estrelacarnes"><i class="icon-dashboard"></i><span>Painel de Controle</span> </a></li>
					<li><a href="${linkTo[AdminController].cadastrarPedido}"><i class="icon-star-empty"></i><span>Cadastrar Pedido</span></a>
					<li class="dropdown"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-long-arrow-down"></i> <span>Opções</span>
							<b class="caret"></b></a>
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
						<div class="control-group">											
							<label class="control-label" for="firstname">Nome</label>
							<div class="controls">
								<input class="span6" id="firstname" value="${cliente.nome}" type="text">
							</div>
							<label class="control-label" for="firstname">CPF</label>
							<div class="controls">
								<input class="span6" id="firstname" value="${cliente.cpf}" type="text">
							</div>
							<label class="control-label" for="firstname">Telefone Fixo</label>
							<div class="controls">
								<input class="span6" id="firstname" value="${cliente.telefone}" type="text">
							</div>
							<label class="control-label" for="firstname">Telefone Celular</label>
							<div class="controls">
								<input class="span6" id="firstname" value="${cliente.celular}" type="text">
							</div>
							<label class="control-label" for="firstname">e-mail</label>
							<div class="controls">
								<input class="span6" id="firstname" value="${cliente.email}" type="email">
							</div>  				
						</div>
					</div>
					<div class="span12">
						<c:if test="${cliente.enderecos.size() > 0}">
						<div class="widget widget-table action-table" id="listaClientes">
							<div class="widget-header">
								<i class="icon-th-list"></i>
								<h3>Endereços</h3>
							</div>
							<!-- /widget-header -->
							<div class="widget-content">
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>Endereço</th>
											<th>Cidade / UF</th>
											<th>CEP</th>
											<th class="td-actions"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="endereco" items="${cliente.enderecos}">
											<tr>
											
												<td>${endereco.endereco}</td>
												<td>${endereco.cidade} / ${endereco.uf}</td>
												<td>${endereco.cep}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</c:if>
					</div>
				</div>
			</div>
		</div>
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
		

		<script src="/estrelacarnes/js/jquery-1.7.2.min.js"></script>
		<script src="/estrelacarnes/js/excanvas.min.js"></script>
		<script src="/estrelacarnes/js/chart.min.js" type="text/javascript"></script>
		<script src="/estrelacarnes/js/bootstrap.js"></script>
		<script>
		
			
		</script>
</body>
</html>
