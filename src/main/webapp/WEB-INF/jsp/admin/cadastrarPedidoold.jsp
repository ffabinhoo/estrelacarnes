<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Estrela Carnes</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="/estrelacarnes/css/bootstrap.min.css" rel="stylesheet">
<link href="/estrelacarnes/css/bootstrap-responsive.min.css" rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
	rel="stylesheet">
<link href="/estrelacarnes/css/font-awesome.css" rel="stylesheet">
<link href="/estrelacarnes/css/style.css" rel="stylesheet">
<link href="/estrelacarnes/css/pages/dashboard.css" rel="stylesheet">
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
	<div class="subnavbar">
		<div class="subnavbar-inner">
			<div class="container">
				<ul class="mainnav">
					<li class="active"><a href="#"><i class="icon-dashboard"></i><span>Pedidos</span>
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
									<a href="${linkTo[AdminController].cadastrarPedido}" class="shortcut"><i
										class="shortcut-icon icon-star-empty"></i><span
										class="shortcut-label">Adicionar Pedido</span> </a>
									<a  href="javascript:;" class="shortcut" id="pedidosHoje"><i
										class="shortcut-icon icon-list-alt" ></i><span
										class="shortcut-label">Pedidos de Hoje</span> </a>	
									<a
										href="javascript:;" class="shortcut"><i
										class="shortcut-icon icon-user"></i><span
										class="shortcut-label">Cadastrar Usuário</span> </a>
								</div>
								<!-- /shortcuts -->
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


<div class="span12">
	<div class="widget widget-table action-table">
		<div class="widget-header">
			<i class="icon-th-list"></i>
			<h3>Mix de Produtos</h3>
		</div>
		<!-- /widget-header -->
		<div class="widget-content">
			<form id="cadastrarPedido" class="form-horizontal">
				<fieldset>

					<div class="control-group">&nbsp;</div>
					<!-- /control-group -->
					<div class="control-group">
						<label class="control-label" for="radiobtns"><strong>Quantidade</strong></label>

						<div class="controls">
							<div class="input-prepend input-append">
								<span class="add-on"><input type="radio"
									id="quantidadekg" name="quantidade" value="1"></span> <input
									class="span1" id="kilograma" type="text" disabled> <span
									class="add-on">KG</span>
							</div>
							<br />
							<div class="input-prepend input-append">
								<span class="add-on"><input type="radio"
									id="quantidadeun" name="quantidade" value="2"></span> <input
									class="span1" id="unidade" type="text" disabled> <span
									class="add-on">UN</span>
							</div>
						</div>
						<!-- /controls -->
					</div>
					<!-- /control-group -->

					<div class="control-group">
						<label class="control-label"><strong>Categoria</strong></label>


						<div class="controls">
									 <label class="radio inline"> <input type="radio" id="categoria"
								name="categoria" value="1" ${1 == idCategoria ? 'checked' : ''}> Bovino
							</label> <label class="radio inline"> <input type="radio" id="categoria"
								name="categoria" value="2"  ${2 == idCategoria ? 'checked' : ''}> Suíno
							</label> <label class="radio inline"> <input type="radio" id="categoria"
								name="categoria" value="3"  ${3 == idCategoria ? 'checked' : ''}> Ave
							</label> <label class="radio inline"> <input type="radio" id="categoria"
								name="categoria" value="4"  ${4 == idCategoria ? 'checked' : ''}> Peixe
							</label> <label class="radio inline"> <input type="radio" id="categoria"
								name="categoria" value="5"  ${4 == idCategoria ? 'checked' : ''}> Cordeiro
							</label> <label class="radio inline"> <input type="radio" id="categoria"
								name="categoria" value="6"  ${6 == idCategoria ? 'checked' : ''}> Angus
							</label> <label class="radio inline"> <input type="radio" id="categoria"
								name="categoria" value="7"  ${7 == idCategoria ? 'checked' : ''}> Linguiça
							</label>

						</div>
						<!-- /controls -->
					</div>
					<!-- /control-group -->
					<div class="control-group">
						<label class="control-label" for="firstname">Produto</label>
						<div class="controls">
							
								<c:forEach var="produto" items="${listaProdutos}">
									<label class="checkbox inline"> <input type="radio" id="produto" name="produto" value="${produto.id}" />${produto.nome} </label> 
								</c:forEach>
							
						</div>
						<!-- /controls -->
					</div>
					
					
					<!-- /control-group -->

					<div class="control-group">
						<label class="control-label" for="preparo">Preparo</label>
						<div class="controls">
							<c:forEach var="preparo" items="${listaPreparos}">
								<label class="checkbox inline"> <input type="radio" id="preparo" name="preparo" value="${preparo.id}" />${preparo.nome} </label> 
							</c:forEach>
						</div>
						<!-- /controls -->
					</div>
					<!-- /control-group -->

					<div class="control-group">
						<label class="control-label" for="complemento">Complemento</label>
						<div class="controls">
							<c:forEach var="complemento" items="${listaComplementos}">
								<label class="checkbox inline"> <input type="radio" id="complemento" name="preparo" value="${complemento.id}" />${complemento.nome} </label> 
							</c:forEach>
						</div>
						<!-- /controls -->
					</div>
					<!-- /control-group -->

					<div class="control-group">
						<label class="control-label" for="password2">Observação</label>
						<div class="controls">
							<textarea rows="10" cols="10" class="span4"></textarea>

						</div>
						<!-- /controls -->
					</div>
					<!-- /control-group -->

					<div class="control-group">
						<label class="control-label">Modo de Entrega</label>
						<div class="controls">
							<label class="checkbox inline"> <input type="radio"
								name="entrega"> Pick-Up
							</label> <label class="checkbox inline"> <input type="radio"
								name="entrega"> Delivery
							</label>
						</div>
						<!-- /controls -->
					</div>
					<!-- /control-group -->

					<br />
					<div class="form-actions">
						<button type="submit" class="btn btn-primary">Salvar</button>
						<button class="btn">Cancelar</button>
					</div>
					<!-- /form-actions -->
				</fieldset>
			</form>
		</div>
		<!-- /widget-content -->

	</div>
</div>
<script src="/estrelacarnes/js/jquery-1.7.2.min.js"></script>
<script src="/estrelacarnes/js/excanvas.min.js"></script>
<script src="/estrelacarnes/js/chart.min.js" type="text/javascript"></script>
<script src="/estrelacarnes/js/bootstrap.js"></script>
<script language="javascript" type="text/javascript"
		src="js/full-calendar/fullcalendar.min.js"></script>
<script>
	$(function() {

		 $('#quantidadekg').click(function() {
			$('#kilograma').prop('disabled', false);
			$('#unidade').prop('disabled', true);
		});

		$('#quantidadeun').click(function() {
			$('#kilograma').prop('disabled', true);
			$('#unidade').prop('disabled', false);
		}); 
	});
	
	$("input:radio[name=categoria]").click(function() {
	    var value = $(this).val();
	    window.location = "/estrelacarnes/cadastrarPedido/" + value;
	});
</script>