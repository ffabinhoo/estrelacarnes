<%@page language="java" contentType="text/html; charset=iso-8859-1" pageEncoding="iso-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pt">
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
    textarea { text-transform: uppercase; }
    text { text-transform: uppercase; }
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
	<!-- /navbar -->
		<jsp:include page="../admin/menu.jsp" />
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
				<form id="formCadastrarCliente" method="post" action="${linkTo[ClienteController].inserirCliente}" style="float: left; padding: 1px;">
				<div class="row" >
					<div class="span6" style="background-color:">
						
							<div class="control-group">
								<label class="control-label" for="cliente.nome">Nome *</label>
								<div class="controls">
									<input class="span6" name="cliente.nome" value="${cliente.nome}" id="nome" type="text" required>
								</div>
								<label class="control-label" id="cliente.celular" >Telefone Celular *</label>
								<div class="controls">
									<input class="span6" name="cliente.celular" value="${cliente.celular}" type="text" required>
								</div>
								<label class="control-label" for="cliente.telefone">Telefone Fixo</label>
								<div class="controls">
									<input class="span6" name="cliente.telefone" value="${cliente.telefone}" type="text">
								</div>
								
								<label class="control-label" for="cpf" >CPF</label>
								<div class="controls">
									<input class="span6" name="cliente.cpf" id="cpf" value="${cliente.cpf}" type="text">
								</div>
								
								<label class="control-label" for="cliente.email">e-mail</label>
								<div class="controls">
									<input class="span6" name="cliente.email" id="email" value="${cliente.email}" type="email">
								</div>
								
								<h2>Endereço</h2>
								
								<div class="controls">
									<label class="control-label" for="cep">CEP *</label>
									<input class="span6" id="cep" name="cliente.endereco.cep" value="${cliente.endereco.cep}" type="text" required="required">
									<!-- <a href="" class="btn btn-small btn-primary" id="linkbuscacep" onclick="montaurl();">Buscar CEP</a> -->
										<button name="buscarCep" value="buscarCep" class="btn btn-primary btn-small" id="buscarCep">
									Buscar CEP</button>
								</div>
								<label class="control-label" >Endereco</label>
								<div class="controls">
									<input class="span6" name="cliente.endereco.endereco" value="${cliente.endereco.endereco}" type="text"  id="endereco">
								</div>
								<label class="control-label"  >Complemento</label>
								<div class="controls">
									<input class="span6" name="cliente.endereco.complemento" value="${cliente.endereco.complemento}" type="text" id="complemento">
								</div>
								<label class="control-label">Referência</label>
								<div class="controls">
									<input class="span6" name="cliente.endereco.referencia" value="${cliente.endereco.referencia}" type="text" id="referencia">
								</div>
								<label class="control-label">Bairro</label>
								<div class="controls">
									<input class="span6" name="cliente.endereco.bairro" value="${cliente.endereco.bairro}" type="text" id="bairro">
								</div>
								<label class="control-label">Cidade</label>
								<div class="controls">
									<input class="span6" name="cliente.endereco.cidade" value="${cliente.endereco.cidade}" type="text" id="cidade">
								</div>
								<label class="control-label">UF</label>
								<div class="controls">
									<input class="span6" name="cliente.endereco.uf" value="${cliente.endereco.uf}" type="text" id="uf">
								</div>
								
								<div class="form-actions">
									<button name="inserir" value="inserir" class="btn btn-primary btn-small" id="inserirCliente">
									Salvar Alterações</button>

									<button class="btn btn-small" id="voltarCliente" type="button">Voltar</button>
								</div>
							</div>
					</div>
					
					
					
					</div>
				</form>
			</div>
			<div id="confirmCliente" class="modal hide fade">
				<div class="modal-body">Confirma exclusão do Pedido?</div>
				<div class="modal-footer">
					<button type="button" data-dismiss="modal" class="btn btn-primary" id="delete">Excluir</button>
					<button type="button" data-dismiss="modal" class="btn">Cancelar</button>
				</div>
			</div>
			<div class="span12">
				
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


	<script src="/estrelacarnes/js/jquery-1.8.3.min.js"></script>
	<script src="/estrelacarnes/js/jquery-1.7.2.min.js"></script>
	<script src="/estrelacarnes/js/jquery.maskedinput.min.js"></script>
	<script src="/estrelacarnes/js/excanvas.min.js"></script>
	<script src="/estrelacarnes/js/chart.min.js" type="text/javascript"></script>
	<script src="/estrelacarnes/js/bootstrap.js"></script>
	
	
	
	<script>
	$('#nome').val($('#nome').val().toUpperCase());
	$('#email').val($('#email').val().toUpperCase());
	$('#endereco').val($('#endereco').val().toUpperCase());
	$('#complemento').val($('#complemento').val().toUpperCase());
	$('#referencia').val($('#referencia').val().toUpperCase());
	$('#bairro').val($('#bairro').val().toUpperCase());
	$('#cidade').val($('#cidade').val().toUpperCase());
	$('#uf').val($('#uf').val().toUpperCase());
	
	$('#nome').keyup(function() {
	    $(this).val($(this).val().toUpperCase());
	});

	$('#email').keyup(function() {
	    $(this).val($(this).val().toUpperCase());
	});
	$('#endereco').keyup(function() {
	    $(this).val($(this).val().toUpperCase());
	});
	$('#complemento').keyup(function() {
	    $(this).val($(this).val().toUpperCase());
	});
	$('#referencia').keyup(function() {
	    $(this).val($(this).val().toUpperCase());
	});
	$('#bairro').keyup(function() {
	    $(this).val($(this).val().toUpperCase());
	});
	$('#cidade').keyup(function() {
	    $(this).val($(this).val().toUpperCase());
	});
	$('#uf').keyup(function() {
	    $(this).val($(this).val().toUpperCase());
	});
	
	
	
		$('input[type=text]').val (function () {
		    return this.value.toUpperCase();
		})
		document.getElementById("voltarCliente").onclick = function() {
			var url = '/estrelacarnes';
			window.location.href = url;
		};
		$( "#buscarCep" ).click(function() {
			$('#formCadastrarCliente').attr('action', "/estrelacarnes/cliente/buscarCEP");
			  $( "#formCadastrarCliente" ).submit();
		});
		 $(function() {
			
				$("#cpf").mask("999.999.999-99");
				$("#cep").mask("99999-999");
		});

		 $( document ).ready(function() {
			  $( "#nome" ).focus();
		});	

		/* function montaurl(){
			var yourElement = document.getElementById('linkbuscacep');
			var url = '/estrelacarnes/cliente/buscarCEP/' + document.getElementById('cep').value; 
			yourElement.setAttribute('href', url);
			document.submit(url);
			
			
		} */
	</script>
</body>
</html>
