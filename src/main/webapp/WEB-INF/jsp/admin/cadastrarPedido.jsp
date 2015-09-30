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
	<div class="subnavbar">
		<div class="subnavbar-inner">
			<div class="container">
				<ul class="mainnav">
					<li class="active"><a href="/estrelacarnes"><i class="icon-dashboard"></i><span>Painel de Controle</span> </a></li>
					<li><a href="${linkTo[AdminController].consultarUsuario}" ><i class="icon-star-empty"></i><span>Cadastrar Pedido</span></a>
					<li><a href="javascript:;" id="idMostrarTitulos"><i class="icon-adjust"></i><span>Mostrar/Esconder Títulos</span>
					</a></li>
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

						<%-- <div class="widget">
							
							<div class="widget-content">
								<div class="shortcuts">
										<a href="javascript:;" class="shortcut"><i class="shortcut-icon icon-user"></i><span class="shortcut-label">${cliente.nome} - ${cliente.celular}</span> </a>
								</div>
								<!-- /shortcuts -->
							</div>
							<!-- /widget-content -->
						</div>
						 --%>
						<div class="shortcuts align-left">
							<a href="javascript:;" class="shortcut"><i class="shortcut-icon icon-user"></i><span class="shortcut-label">${pedido.cliente.nome} - ${pedido.cliente.celular}</span> </a>
						</div>
						<form id="cadastrarPedido" class="form-horizontal" action="${linkTo[AdminController].inserirItem}" method="post">
						<input type="hidden" id="idPedido" name="idPedido" value="${pedido.id}">
						<div class="widget widget-table action-table" id="listaPedidosHoje">
							<div class="widget-header" id="idTituloQuantidade">
								<i class="icon-th-list"></i>
								<h3>Quantidade</h3>
							</div>
							<div class="widget-content">
								<div class="controls">
									<input class="span1" id="quantidade" name="quantidade" type="text" value="${quantidade}" required/>
									<label class="checkbox inline"> <input type="radio" name="tipo" id="tipo" value="KG" ${'KG' == tipo ? 'checked' : ''} required> KG</label>
									<label class="checkbox inline"><input type="radio" name="tipo" id="tipo" value="UN" ${'UN' == tipo ? 'checked' : ''} required> Unidade</label>
								</div>
							</div>
						</div>
						
						<div class="widget widget-table action-table" id="listaPedidosHoje">
							<div class="widget-header" id="idTituloCategoria">
								<i class="icon-th-list"></i>
								<h3>Categoria</h3>
							</div>
							<div class="widget-content">
								<div class="controls">
									<label class="radio inline"> <input type="radio" id="categoria" name="categoria" value="1" ${1 == idCategoria ? 'checked' : ''} required>
										Bovino
									</label> <label class="radio inline"> <input type="radio" id="categoria" name="categoria" value="2" ${2 == idCategoria ? 'checked' : ''} required>
										Suíno
									</label> <label class="radio inline"> <input type="radio" id="categoria" name="categoria" value="3" ${3 == idCategoria ? 'checked' : ''} required>
										Ave
									</label> <label class="radio inline"> <input type="radio" id="categoria" name="categoria" value="4" ${4 == idCategoria ? 'checked' : ''} required>
										Peixe
									</label> <label class="radio inline"> <input type="radio" id="categoria" name="categoria" value="5" ${4 == idCategoria ? 'checked' : ''} required>
										Cordeiro
									</label> <label class="radio inline"> <input type="radio" id="categoria" name="categoria" value="6" ${6 == idCategoria ? 'checked' : ''} required>
										Angus
									</label> <label class="radio inline"> <input type="radio" id="categoria" name="categoria" value="7" ${7 == idCategoria ? 'checked' : ''} required>
										Linguiça
									</label>
								</div>
							</div>
						</div>
						
						<div class="widget widget-table action-table" id="listaPedidosHoje">
							<div class="widget-header" id="idTituloProduto">
								<i class="icon-th-list"></i>
								<h3>Produto</h3>
							</div>
							<div class="controls">
								<div class="row">
									<div class="col-sm-3 col-md-6 col-lg-12">
									<c:forEach var="produto" items="${listaProdutos}" varStatus="i">
										<c:if test="${i.count % 8 == 0}">
											<br /> 
										</c:if>
										<div class="span2">
											<input type="radio" id="produto" name="produto" value="${produto.id}" required/>${produto.nome.trim()}
										</div>
									</c:forEach>
									</div>
								</div>
							</div>
						</div>
						<div class="widget widget-table action-table" id="listaPedidosHoje">
							<div class="widget-header" id="idTituloPreparo">
								<i class="icon-th-list"></i>
								<h3>Preparo</h3>
							</div>
							<div class="widget-content">
								<div class="controls">
									<c:forEach var="preparo" items="${listaPreparos}">
										<label class="checkbox inline"> <input type="radio" id="preparo" name="preparo" value="${preparo.id}" />${preparo.nome}
										</label>
									</c:forEach>
								</div>
							</div>
						</div>
						
						<div class="widget widget-table action-table" id="listaPedidosHoje">
							<div class="widget-header" id="idTituloComplemento">
								<i class="icon-th-list"></i>
								<h3>Complemento</h3>
							</div>
							<div class="widget-content">
								<div class="controls">
									<c:forEach var="complemento" items="${listaComplementos}">
										<label class="checkbox inline"> <input type="radio" id="complemento" name="complemento" value="${complemento.id}" />${complemento.nome}
										</label>
									</c:forEach>
								</div>
							</div>
						</div>
						
						<div class="widget widget-table action-table" id="idDivObservacao">
							<div class="widget-header" id="idTituloObservacao">
								<i class="icon-th-list"></i>
								<h3>Observação</h3>
							</div>
							<div class="widget-content">
								<div class="controls">
									<textarea rows="5" cols="5" class="span4"></textarea>
								</div>
							</div>
						</div>
						
						
						<div class="form-actions">
							<button type="submit" class="btn btn-primary">Incluir Item</button>
							<button class="btn">Cancelar</button>
						</div>
						
						<!-- /widget-header -->
						<div class="widget-content">
							
							<fieldset>
								<!-- /control-group -->
							<div class="control-group">
								<c:forEach var="item" items="${listaItensPedido}">
								${item.id} - ${item.categoria.nome} - ${item.produto.nome} - ${item.preparo.nome} - ${item.complemento.nome}<br/>
								</c:forEach>
							</div>
							</fieldset>
							
						</div>
							
							
							<!-- <div class="input-prepend input-append">
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
							</div> -->

						<!-- /widget-content -->
					</div>
				</div>
				</form>
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

	<script src="/estrelacarnes/js/jquery-1.7.2.min.js"></script>
	<script src="/estrelacarnes/js/excanvas.min.js"></script>
	<script src="/estrelacarnes/js/chart.min.js" type="text/javascript"></script>
	<script src="/estrelacarnes/js/bootstrap.js"></script>
	<script>
		$(function() {
			$("#idTituloCategoria").hide();
			$("#idTituloProduto").hide();
			$("#idTituloPreparo").hide();
			$("#idTituloObservacao").hide();
			$("#idTituloComplemento").hide();
			$("#idTituloQuantidade").hide();
			$("#idDivObservacao").hide();


			$("input:radio[name=preparo]").click(function() {
				if ($( "input:radio[name=preparo]:checked" )){
					$("#idDivObservacao").show();						
				} else {
					$("#idDivObservacao").hide();
				}
			});
			
			$("#idMostrarTitulos").click(function() {
				$("#idTituloCategoria").toggle("slow");
				$("#idTituloProduto").toggle("slow");
				$("#idTituloPreparo").toggle("slow");
				$("#idTituloObservacao").toggle("slow");
				$("#idTituloComplemento").toggle("slow");
				$("#idTituloQuantidade").toggle("slow");
				
			});
		});
		/* $(function() {

			 $('#quantidadekg').click(function() {
				$('#kilograma').prop('disabled', false);
				$('#unidade').prop('disabled', true);
			});

			$('#quantidadeun').click(function() {
				$('#kilograma').prop('disabled', true);
				$('#unidade').prop('disabled', false);
			}); 
		}); */
		//var tipo = $("input:radio[name=tipo]").val();
		
		$("input:radio[name=categoria]").click(function() {
			var categoria = $(this).val();
			var tipo = $( "input:radio[name=tipo]:checked" ).val();
			var quantidade = $( "input:text[name=quantidade]" ).val();
			var idPedido = $('#idPedido').val();
			
			if (quantidade == ""){
				quantidade = 1;
			}
			
			window.location = "/estrelacarnes/cadastrarPedido/" + idPedido + "/" + tipo + "/" + quantidade + "/" + categoria;
			//$( "#cadastrarPedido" ).submit();
		});

		
		
		$( "#quantidade" ).focus(function() {
			
  			$( "input:text[name=quantidade]" ).val("");
		});

		$('#quantidade').keypress(function (event) {
            return isNumber(event, this)
        });

		function isNumber(evt, element) {
	        var charCode = (evt.which) ? evt.which : event.keyCode
	        if (
	            (charCode != 45 || $(element).val().indexOf('-') != -1) &&      // “-” CHECK MINUS, AND ONLY ONE.
	            (charCode != 46 || $(element).val().indexOf('.') != -1) &&      // “.” CHECK DOT, AND ONLY ONE.
	            (charCode < 48 || charCode > 57))
	            return false;
	        return true;
	    } 

		
		$(document).ready(function() {
			$('#idBusca').on('click', function() {
				var telefone = $('#telefone').val();
				window.location = "/estrelacarnes/consultarUsuario/" + telefone;
			});
		});
	</script>   	
	


</body>
</html>
