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
							<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>${mensagemNegrito}</strong> ${mensagem}
						</div>
					</div>
				</div>
				<div class="row">
				 <div class="span12">
						<div class="widget widget-table action-table" id="buscaUsuario">
							<form action="${linkTo[AdminController].cadastrarHorario}" method="post" id="formConsulta">
								
								<input type="text" class="" placeholder="Horário" id="horario" name="horario.horario" value=""> 
								<input type="text" class="" placeholder="Quantidade" id="quantidade" name="horario.quantidade" value="">
									
									<div class="form-actions">
										<button  class="btn btn-primary btn-small" id="buscar">Cadastrar</button>
										
									</div>	
							</form>
						</div>
					</div>
				</div>
				<div class="row">
					
					
					
					<div class="span12">
					
					</div>
					<!-- /widget-header -->
							<div class="widget-content">
								
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>Horário</th>
											<th>Quantidade</th>
											<th>Ativo/Inativo</th>
											<th class="td-actions"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="horario" items="${listaHorario}">
											<tr>
												<td><a href="${linkTo[AdminController].mostrarHorario}${horario.id}">${horario.horario}</a></td>
												<td>${horario.quantidade}</td>
												<td>
													<input type="checkbox" name="ativo" value="${horario.id}" ${'S' == horario.ativo ? 'checked' : ''}>
												</td>
												
												<td class="td-actions" style="width: 200px;">
													<form id="formExcluirHorario" method="get" action="${linkTo[AdminController].excluirHorario}${horario.id}" 
															style="float: left; padding: 1px;">
															<button name="_method" value="DELETE" class="button btn btn-danger btn-small" id="excluirHorario">Excluir</button>
													</form>
												</td>
											</tr>
											<div id="confirm" class="modal hide fade">
												  <div class="modal-body">
												    Confirma exclusão do Horário?<br />
												    (Todo o Histórico do horário será perdido)
												  </div>
												  <div class="modal-footer">
												    <button type="button" data-dismiss="modal" class="btn btn-primary" id="delete">Excluir</button>
												    <button type="button" data-dismiss="modal" class="btn">Cancelar</button>
												  </div>
										</div>
										</c:forEach>
									</tbody>
								</table>
								</form>
							</div>
							<!-- /widget-content -->
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

	<script src="/estrelacarnes/js/jquery-1.7.2.min.js"></script>
	<script src="/estrelacarnes/js/jquery.maskedinput.min.js"></script>
	<script src="/estrelacarnes/js/excanvas.min.js"></script>
	<script src="/estrelacarnes/js/chart.min.js" type="text/javascript"></script>
	<script src="/estrelacarnes/js/bootstrap.js"></script>
	<script>
	
	$(function() {
		$("#horario").mask("99:99 - 99:99"); 
});
	
	$("input:checkbox[name=ativo]").click(function() {
		var valor_ativo = $(this).val();
		//var tipo = $( "input:checkbox[name=ativo]:checked" ).val();
		
		if($(this).is(':checked'))
			window.location = "/estrelacarnes/alterarHorario/" + valor_ativo + "/S"; 
			
        else
        	window.location = "/estrelacarnes/alterarHorario/" + valor_ativo + "/N";
		
		
		
		//window.location = "/estrelacarnes/cadastrarPedido/" + idPedido + "/" + tipo + "/" + quantidade + "/" + categoria;
		//$( "#cadastrarPedido" ).submit();
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
