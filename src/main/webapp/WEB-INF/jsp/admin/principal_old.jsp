<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css"	href="/administracao/css/bootstrap.min.css">
<script type="text/javascript" src="/administracao/js/jquery.min.js"></script>
<script type="text/javascript" src="/administracao/js/bootstrap.min.js"></script>
<title>Administração Salões DF</title>
<meta charset="utf-8">
</head>
<body>
	<div class="container">
		<div class="row">
			<span class="pull-right ${not empty userInfo.user ? '' : 'hidden'}">
				${userInfo.user.name} (<a href="${linkTo[IndexController].logout}">logout</a>)
			</span>
		</div>
		<div class="row">
			<nav class="navbar navbar-custom">
				<div class="container-fluid">
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li><a href="${linkTo[AdminController].principal}">Principal</a></li>
						</ul>
						
						<ul class="nav navbar-nav">
							<li><a href="${linkTo[ClienteController].cadastrar}">Cadastrar Cliente</a></li>
						</ul>
						<ul class="nav navbar-nav">
							<li><a href="${linkTo[CardapioController].cadastrar}">Cadastrar Serviços</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		<div class="row">
				<ul>
				 
				<li><a href="${linkTo[ClienteController].cadastrar}">Cadastrar Cliente</a></li>
				<li><a href="${linkTo[CardapioController].cadastrar}">Cadastrar Cardápio</a></li>
				
				</ul>
		</div>
		
	</div>
</body>
</html>