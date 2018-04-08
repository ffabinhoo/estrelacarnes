<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="iso-8859-1">
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
    <style type="text/css">
    </style>
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
				</div>
			</div>
		</div>
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
				</ul>
			</div>
		</div>
	</div>
	<div class="main">
		<div class="main-inner">
			<div class="container">
			<div class="row">
				<div class="bs-example ${not empty mensagem ? '' : 'hidden'}">
					<div class="alert alert-${tipo}" id="mensagem">
						<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>${mensagemNegrito}</strong>
						${mensagem}
					</div>
				</div>
			</div>
			<form id="cadastrarPedido" class="form-horizontal" action="${linkTo[AdminController].alterarItem}" method="post">	
				<div class="row">
					<div class="span12">
						
						<input type="hidden" id="idPedido" name="idPedido" value="${item.pedido.id}">
						<input type="hidden" id="idItem" name="idItem" value="${item.id}">
						<div class="widget widget-table action-table">
							<div class="widget-header" id="idTituloQuantidade">
								<i class="icon-th-list"></i>
								<h3>Quantidade</h3>
							</div>
							<div class="widget-content">
								<div class="controls">
									<input class="span1" id="quantidade" name="quantidade" type="text" value="${item.quantidade}" required/>
									<label class="checkbox inline"> <input type="radio" name="tipo" id="tipo" value="KG" ${'KG' == item.tipo ? 'checked' : ''} required> KG</label>
									<label class="checkbox inline"><input type="radio" name="tipo" id="tipo" value="UN" ${'UN' == item.tipo ? 'checked' : ''} required> Unidade</label>
								</div>
							</div>
						</div>
						<div class="widget widget-table action-table" >
							<div class="widget-header" id="idTituloCategoria">
								<i class="icon-th-list"></i>
								<h3>Categoria</h3>
							</div>
							<div class="widget-content">
								<div class="controls">
									<label class="radio inline"> <input type="radio" id="categoria" name="categoria" value="1" ${1 == item.categoria.id ? 'checked' : ''} disabled>
										BOVINO
									</label> <label class="radio inline"> <input type="radio" id="categoria" name="categoria" value="2" ${2 == item.categoria.id ? 'checked' : ''} disabled>
										AVES
									</label> <label class="radio inline"> <input type="radio" id="categoria" name="categoria" value="3" ${3 == item.categoria.id ? 'checked' : ''} disabled>
										SUÍNO
									</label> <label class="radio inline"> <input type="radio" id="categoria" name="categoria" value="4" ${4 == item.categoria.id ? 'checked' : ''} disabled>
										LINGUIÇA
									</label> <label class="radio inline"> <input type="radio" id="categoria" name="categoria" value="5" ${5 == item.categoria.id ? 'checked' : ''} disabled>
										PEIXES
									</label> <label class="radio inline"> <input type="radio" id="categoria" name="categoria" value="6" ${6 == item.categoria.id ? 'checked' : ''} disabled>
										GOURMET
									</label> <label class="radio inline"> <input type="radio" id="categoria" name="categoria" value="7" ${7 == item.categoria.id ? 'checked' : ''} disabled>
										CORDEIRO
									</label> <label class="radio inline"> <input type="radio" id="categoria" name="categoria" value="8" ${8 == item.categoria.id ? 'checked' : ''} disabled>
										ANGUS
									</label> <label class="radio inline"> <input type="radio" id="categoria" name="categoria" value="9" ${9 == item.categoria.id ? 'checked' : ''} disabled>
										ESPETINHO
									</label> <label class="radio inline"> <input type="radio" id="categoria" name="categoria" value="10" ${10 == item.categoria.id ? 'checked' : ''} disabled>
										EMBUTIDOS
									</label> <label class="radio inline"> <input type="radio" id="categoria" name="categoria" value="11" ${11 == item.categoria.id ? 'checked' : ''} disabled>
										DIVERSOS
									</label>
									
								</div>
							</div>
						</div>
						
						<div class="widget widget-table action-table" >
							<div class="widget-header" id="idTituloProduto">
								<i class="icon-th-list"></i>
								<h3>Produto</h3>
							</div>
							<div class="controls">
								<div class="row">
									<div class="col-sm-3 col-md-6 col-lg-12">
									<c:forEach var="produtoobj" items="${listaProdutos}" varStatus="i">
										<c:if test="${i.count % 8 == 0}">
											<br /> 
										</c:if>
										<div class="span2">
											<input type="radio" id="produto" name="produto" value="${produtoobj.id}" ${item.produto.id == produtoobj.id ? 'checked' : ''}  required/>${produtoobj.nome.trim()}
										</div>
									</c:forEach>
									</div>
								</div>
							</div>
						</div>
						<div class="widget widget-table action-table" >
							<div class="widget-header" id="idTituloPreparo">
								<i class="icon-th-list"></i>
								<h3>Preparo</h3>
							</div>
							<div class="widget-content">
								<div class="controls">
									<c:forEach var="preparoobj" items="${listaPreparos}">
										<label class="checkbox inline"> <input type="radio" id="preparo" name="preparo" value="${preparoobj.id}" ${item.preparo.id == preparoobj.id ? 'checked' : ''} />${preparoobj.nome}
										</label>
									</c:forEach>
								</div>
							</div>
						</div>
						
						<div class="widget widget-table action-table">
							<div class="widget-header" id="idTituloComplemento">
								<i class="icon-th-list"></i>
								<h3>Complemento</h3>
							</div>
							<div class="widget-content">
								<div class="controls">
									<c:forEach var="complementoobj" items="${listaComplementos}">
										<label class="checkbox inline"> <input type="radio" id="complemento" name="complemento" value="${complementoobj.id}" ${item.complemento.id == complementoobj.id ? 'checked' : ''} />${complementoobj.nome}
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
									<textarea rows="5" cols="5" class="span4" name="observacao" id="observacao">${item.observacao}</textarea>
								</div>
							</div>
						</div>
						
						
						<div class="form-actions">
							<button type="submit" id="submit" name="_method" value="PUT" class="btn btn-primary">Alterar Item</button>
						</div>
						
						<!-- /widget-header -->
						
					</div>
				</div>
				</form>
			</div> <!-- Fim Div Container -->
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /main-inner -->
	
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

	<script src="/estrelacarnes/js/jquery-1.7.2.min.js"></script>
	<script src="/estrelacarnes/js/excanvas.min.js"></script>
	<script src="/estrelacarnes/js/chart.min.js" type="text/javascript"></script>
	<script src="/estrelacarnes/js/bootstrap.js"></script>
	<script>
	$('#observacao').val($('#observacao').val().toUpperCase());

	$('#observacao').keyup(function() {
	    $(this).val($(this).val().toUpperCase());
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
	            (charCode != 44 || $(element).val().indexOf(',') != -1) &&      // “.” CHECK DOT, AND ONLY ONE.
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
