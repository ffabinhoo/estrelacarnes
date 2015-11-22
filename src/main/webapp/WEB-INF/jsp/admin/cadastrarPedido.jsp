<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
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
				<!-- <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar">a</span>
					<span class="icon-bar">b</span>
					<span class="icon-bar">c</span>
				</a> -->
				<a class="brand" href="/estrelacarnes">
					Estrela Carnes - Administração de Pedidos
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
					<li class="active"><a href="/estrelacarnes"><i class="icon-dashboard"></i><span>Painel de Controle</span></a></li>
					<li><a href="${linkTo[AdminController].consultarUsuario}"><i class="icon-star-empty"></i><span>Cadastrar Pedido</span></a></li>
					<li><a href="${linkTo[AdminController].consultarPedido}"><i class="icon-search"></i><span>Consultar Pedido</span></a></li>
					<li><a href="${linkTo[ClienteController].cadastrarCliente}"><i class="icon-user"></i><span>Cadastrar Cliente</span></a></li>
					<li><a href="${linkTo[AdminController].consultarUsuario}"><i class="icon-zoom-in"></i><span>Consultar Cliente</span></a></li>
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

						<form id="cadastrarPedido" class="form-horizontal"
							action="${linkTo[AdminController].inserirItem}" method="post">
							<input type="hidden" id="idPedido" name="idPedido"
								value="${pedido.id}">
							<div class="widget widget-table action-table">
								<div class="widget-header" id="idTituloQuantidade">
									<i class="icon-th-list"></i>
									<h3>Quantidade</h3>
								</div>
								<div class="widget-content">
									<!-- <div class="controls"> -->
									<input class="span1" id="quantidade" name="quantidade"
										type="text" value="${quantidade}" required /> <label
										class="checkbox inline"> <input type="radio"
										name="tipo" id="tipo" value="KG"
										${'KG' == tipo ? 'checked' : ''} required> KG
									</label> <label class="checkbox inline"><input type="radio"
										name="tipo" id="tipo" value="UN"
										${'UN' == tipo ? 'checked' : ''} required> Unidade</label>
									<!-- </div> -->
								</div>
							</div>

							<div class="widget widget-table action-table">
								<div class="widget-header" id="idTituloCategoria">
									<i class="icon-th-list"></i>
									<h3>Categoria</h3>
								</div>
								<div class="widget-content">
									<!-- <div class="controls"> -->
									<label class="radio inline"> <input type="radio"
										id="categoria" name="categoria" value="1"
										${1 == idCategoria ? 'checked' : ''} required> Bovino
									</label> <label class="radio inline"> <input type="radio"
										id="categoria" name="categoria" value="2"
										${2 == idCategoria ? 'checked' : ''} required> Suíno
									</label> <label class="radio inline"> <input type="radio"
										id="categoria" name="categoria" value="3"
										${3 == idCategoria ? 'checked' : ''} required> Ave
									</label> <label class="radio inline"> <input type="radio"
										id="categoria" name="categoria" value="4"
										${4 == idCategoria ? 'checked' : ''} required> Peixe
									</label> <label class="radio inline"> <input type="radio"
										id="categoria" name="categoria" value="5"
										${5 == idCategoria ? 'checked' : ''} required>
										Cordeiro
									</label> <label class="radio inline"> <input type="radio"
										id="categoria" name="categoria" value="6"
										${6 == idCategoria ? 'checked' : ''} required> Angus
									</label> <label class="radio inline"> <input type="radio"
										id="categoria" name="categoria" value="7"
										${7 == idCategoria ? 'checked' : ''} required>
										Linguiça
									</label> <label class="radio inline"> <input type="radio"
										id="categoria" name="categoria" value="8"
										${8 == idCategoria ? 'checked' : ''} required>
										Espetinho
									</label></label> <label class="radio inline"> <input type="radio"
										id="categoria" name="categoria" value="9"
										${9 == idCategoria ? 'checked' : ''} required>
										Gourmet
									</label></label> <label class="radio inline"> <input type="radio"
										id="categoria" name="categoria" value="10"
										${10 == idCategoria ? 'checked' : ''} required>
										Embutidos
									</label></label> <label class="radio inline"> <input type="radio"
										id="categoria" name="categoria" value="11"
										${11 == idCategoria ? 'checked' : ''} required>
										Diversos
									</label>
									<!-- </div> -->
								</div>
							</div>

							<div class="widget widget-table action-table">
								<div class="widget-header" id="idTituloProduto">
									<i class="icon-th-list"></i>
									<h3>Produto</h3>
								</div>
								<!-- <div class="controls"> -->
								<div class="row">
									<div class="col-sm-3 col-md-6 col-lg-12">
										<c:forEach var="produto" items="${listaProdutos}"
											varStatus="i">
											<c:if test="${i.count % 8 == 0}">
												<br />
											</c:if>
											<div class="span2">
												<label>
													<%-- <input type="radio" id="produto" name="produto" value="${produto.id}" required />${fn:toLowerCase(produto.nome.trim())} --%>
														 <input type="radio" id="produto" name="produto" value="${produto.id}" required />${produto.nome.trim()}
												</label>
											</div>
										</c:forEach>
									</div>
								</div>
								<!-- </div> -->
							</div>
							<div class="widget widget-table action-table">
								<div class="widget-header" id="idTituloPreparo">
									<i class="icon-th-list"></i>
									<h3>Preparo</h3>
								</div>
								<div class="widget-content">
									<!-- <div class="controls"> -->
									<c:forEach var="preparo" items="${listaPreparos}">
										<label class="checkbox inline"> 
											<%-- <input type="radio"	id="preparo" name="preparo" value="${preparo.id}" />${fn:toLowerCase(preparo.nome)} --%>
											<input type="radio"	id="preparo" name="preparo" value="${preparo.id}" />${preparo.nome}
										</label>
									</c:forEach>
									<!-- </div> -->
								</div>
							</div>

							<div class="widget widget-table action-table">
								<div class="widget-header" id="idTituloComplemento">
									<i class="icon-th-list"></i>
									<h3>Complemento</h3>
								</div>
								<div class="widget-content">
									<!-- <div class="controls"> -->
									<c:forEach var="complemento" items="${listaComplementos}">
										<label class="checkbox inline">
											<%-- <input type="radio" id="complemento" name="complemento" value="${complemento.id}" />${fn:toLowerCase(complemento.nome)} --%>
											<input type="radio" id="complemento" name="complemento" value="${complemento.id}" />${complemento.nome}
										</label>
									</c:forEach>
									<!-- </div> -->
								</div>
							</div>

							<div class="widget widget-table action-table"
								id="idDivObservacao">
								<div class="widget-header" id="idTituloObservacao">
									<i class="icon-th-list"></i>
									<h3>Observação</h3>
								</div>
								<div class="widget-content">
									<textarea rows="5" cols="5" class="span4" id="observacao"
										name="observacao"></textarea>
								</div>
							</div>
							<button type="submit" class="btn btn-primary">Incluir
								Item</button>
					</div>
					<div class="span2-fluid" id="divBotaoItem">
						<div class="widget-content">
							<button type="submit" class="btn btn-primary">Incluir
								Item</button>
							<br />
							<div id="divBotaoItemLista">
								<c:forEach var="item" items="${listaItensPedido}" varStatus="n">
										${item.quantidade} ${item.tipo} - ${item.produto.nome}<br />
								</c:forEach>
							</div>

						</div>
					</div>
				</div>


				</form>
				<div class="container">
					<div class="row">
						<div class="span10">
							<div class="widget-content">
								<fieldset>
									<table class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>Qtd/Unid</th>
												<th>Categoria</th>
												<th>Produto</th>
												<th>Preparo</th>
												<th>Complemento</th>
												<th>Observação</th>
												<th class="td-actions"></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${listaItensPedido}">
												<tr>
													<td>${item.quantidade}${item.tipo}</td>
													<td>${item.categoria.nome}</td>
													<td>${item.produto.nome}</td>
													<td>${item.preparo.nome}</td>
													<td>${item.complemento.nome}</td>
													<td>${item.observacao}</td>
													<td class="td-actions">
														<form id="formItem" method="post"
															action="${linkTo[AdminController].editarItem}"
															style="float: left; padding: 5px;">
															<input type="hidden" id="idItem" name="idItem"
																value="${item.id}">
															<button class="button btn btn-success btn-small"
																id="editarItem">Editar Item</button>
														</form>
														<form id="formItem" method="post"
															action="${linkTo[AdminController].excluirItem}${item.id}"
															style="float: left; padding: 5px;">
															<input type="hidden" id="idItem" name="idItem"
																value="${item.id}">
															<button name="_method" value="DELETE"
																class="button btn btn-danger btn-small" id="excluirItem">Excluir
																Item</button>
															<!-- <a href="" class="btn btn-danger btn-small"><i	class="btn-icon-only icon-remove"></i></a> -->
														</form>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>

								</fieldset>

							</div>
							<div class="form-actions">
								<div class="pull-right">
									<form id="formEnviarPedido" method="post"
										action="${linkTo[AdminController].enviarPedido}${pedido.id}">
										<c:if test="${listaItensPedido.size() > 0}">
											<button id="enviarPedido" name="enviarPedido" class="btn btn-primary">Próximo</button>
										</c:if>
										<button class="btn btn-small" id="voltarPedido" type="button">Voltar</button>
									</form>

								</div>
								<%-- <div id="confirm" class="modal hide fade">
									<div class="modal-body"><h3>Confirma enviar o Pedido?</h3>
									<br />
									Cliente: ${pedido.cliente.nome} <br />
									Data e hora abertura do Pedido: <fmt:formatDate pattern="dd/MM HH:mm" value="${pedido.data}" /> <br /> 
									Quantidade de Itens do pedido: ${listaItensPedido.size()}
									
									</div>
									
									<div class="modal-footer">
										<button type="button" data-dismiss="modal"
											class="btn btn-primary" id="confirmar">Confirmar</button>
										<button type="button" data-dismiss="modal" class="btn">Cancelar</button>
									</div>
								</div> --%>
							</div>
						</div>
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
	$('#observacao').val($('#observacao').val().toUpperCase());

	$('#observacao').keyup(function() {
	    $(this).val($(this).val().toUpperCase());
	});
	
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
		document.getElementById("voltarPedido").onclick = function() {
				var url = '/estrelacarnes';
				window.location.href = url;
		};

		/* $('button[name="enviarPedido"]').on('click', function(e){
		    var $form=$(this).closest('form'); 
		    e.preventDefault();
		    $('#confirm').modal({ backdrop: 'static', keyboard: false })
		        .one('click', '#confirmar', function() {
		            $form.trigger('submit'); // submit the form
		        });
		        // .one() is NOT a typo of .on()
		});  */
	</script>



</body>
</html>
