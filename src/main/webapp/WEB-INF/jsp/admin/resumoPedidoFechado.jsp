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
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<style>
#divBotaoItem {
	float: right;
	margin: 0px 0 0px 0px;
}

#divBotaoItemLista {
	margin: 5px 0 0px 0px;
	font: 10px/1.2em 'Open Sans';
}

#divSpan10 {
	
}
</style>
</head>
<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				
				<a class="brand" href="/estrelacarnes"> <!-- Estrela Carnes - Administração de Pedidos -->Titulo
				</a>
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
					<li class="active"><a href="/estrelacarnes"><i
							class="icon-dashboard"></i><span>Painel de Controle</span> </a></li>
					<li><a href="${linkTo[AdminController].consultarUsuario}"><i
							class="icon-star-empty"></i><span>Cadastrar Pedido</span></a>
					<li><a href="javascript:;" id="idMostrarTitulos"><i
							class="icon-adjust"></i><span>Mostrar/Esconder Títulos</span> </a></li>
					<li class="dropdown"><a href="javascript:;"
						class="dropdown-toggle" data-toggle="dropdown"> <i
							class="icon-long-arrow-down"></i> <span>Opções</span> <b
							class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li><a href="#">Cadastrar Cliente</a></li>
							<li><a href="#">Consultar Pedido</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="main">
		<div class="main-inner">
			<div class="container">
				<div class="row">
					<div class="span10" id="divSpan10">
						<div class="row">
							<div class="bs-example ${not empty mensagem ? '' : 'hidden'}">
								<div class="alert alert-${tipomsg}" id="mensagem">
									<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>${mensagemNegrito}</strong>
									${mensagem}
								</div>
							</div>
						</div>
						<div class="shortcuts">
							<a
								href="${linkTo[ClienteController].mostrarCliente}${pedido.cliente.id}"
								class="shortcut"><i class="icon-user"></i> <span
								class="shortcut-label">${pedido.cliente.nome} -
									${pedido.cliente.celular}</span> </a>
						</div>

						<div class="container">
							<div class="row">
								<div class="span2">
									<!-- Espaçosss -->
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
				
			</script>
</body>
</html>
