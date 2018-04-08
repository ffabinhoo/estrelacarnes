<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<link href="/estrelacarnes/css/bootstrap-datepicker.css" rel="stylesheet">
<link href="/estrelacarnes/css/pages/plans.css" rel="stylesheet">

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
				<a class="brand" href="/estrelacarnes">Camperia Carnes - Administração de Pedidos</a>
				<div class="nav-collapse">
					<ul class="nav pull-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i> <span
								class="pull-right ${not empty userInfo.user ? '' : 'hidden'}"> ${userInfo.user.name}</span> <b class="caret"></b>
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
					<div class="span12" id="divSpan10">
						<div class="row">
							<div class="bs-example ${not empty mensagem ? '' : 'hidden'}">
								<div class="alert alert-${tipomsg}" id="mensagem">
									<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>${mensagemNegrito}</strong> ${mensagem}
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="span12">
						<div class="widget widget-nopad">
							<div class="widget-header">
								<i class="icon-list-alt"></i>
								<h3>Cliente</h3>
							</div>
							<div class="widget-content">
								<div class="shortcuts">
									<a href="${linkTo[ClienteController].mostrarCliente}${pedido.cliente.id}" class="shortcut"><i class="icon-user"></i> <span
										class="shortcut-label">${pedido.cliente.nome} - ${pedido.cliente.celular}</span> </a>
								</div>
							</div>
						</div>
					</div>
					<form id="formEnviarPedido" method="post" action="${linkTo[AdminController].prepararEntrega}">
						<%-- <input type="hidden" value="" id="idEndereco" name="endereco.id">
						<input type="hidden" value="" id="idTipoEntrega" name="tipoEntrega">
						<input type="hidden" value="${pedido.id}" id="idPedido" name="pedido.id"> --%>
						<!-- valor de entrega -->
						<div class="span12" id="divValores">
							<ul>
								<li>
									<label class="control-label" for="valor">Valor do Pedido(R$):</label>
									<input type="text" id="valor" name="pedido.valor" value="${pedido.valor}" required>
								</li>
								<li id="frete">	
									<label class="control-label" for="valorFrete">Valor do Frete(R$):</label>
									<input type="text" id="valorFrete" name="pedido.valorFrete" value="${pedido.valorFrete}">
								</li>
							</ul>
						</div>
						<div class="span12">
							<div class="widget widget-table action-table"
								id="idDivObservacao">
								<div class="widget-header" id="idTituloObservacao">
									<i class="icon-th-list"></i>
									<h3>Observação</h3>
								</div>
								<div class="widget-content">
									<textarea rows="3" cols="5" class="span4" id="observacao"
										name="pedido.observacao">${pedido.observacao}</textarea>
								</div>
							</div>
							<div class="widget widget-table action-table" id="idDivObservacao">
								<div class="widget-header" id="idTituloObservacao">
									<i class="icon-th-list"></i>
									<h3>Horário</h3>
								</div>
								<div id="inicio">
											<c:if test="${quadro!=null}">
												<fmt:formatDate var="fmtDate" value="${quadro.data}" pattern="dd/MM/yyyy"/>
											<input class="datepicker" value="${fmtDate}" name="quadro.data" required>
											</c:if>
											<c:if test="${quadro==null}">
												<input class="datepicker" name="quadro.data" required>
											</c:if>
       
								</div>
								
								<div class="widget-content" id="divHorario">
									<select id="selectHorario" onchange="" name="quadro.horario.id" required>
										<c:if test="${horario!=null}">
											<option value="${horario.id}">${horario.horario}</option>
										</c:if>
										
									</select>
									<br>
									<div id="divTotal" >
										 AGENDADO(S) <b>${contador}</b> PEDIDO(S) PARA ENTREGA NESTA DATA/HORÁRIO
									</div>
								</div>
							</div>
							<div class="widget">
								<div class="widget-header">
									<i class="icon-th-large"></i>
									<h3>Escolha Tipo de Entrega</h3>
								</div>
								<div class="widget-content">
									<label class="radio inline"> <input type="radio" id="ctipoEntrega" name="ctipoEntrega" value="P" ${'P' == entrega.tipoEntrega ? 'checked' : ''} > Pick-up
									</label>
									<label class="radio inline"> <input type="radio" id="ctipoEntrega" name="ctipoEntrega" value="D" ${'D' == entrega.tipoEntrega ? 'checked' : ''}> Delivery
									</label> 
								</div>
							</div>
						</div>
						<div class="span12">
							
							<div class="main" id="enderecoDelivery">
								<div class="main-inner">
									<div class="container">
										<div class="row">
											<div class="span12">
												<div class="widget">
													<div class="widget-header">
														<i class="icon-th-large"></i>
														<h3>Escolha o Endereço de Envio</h3>
													</div>
													<div class="widget-content">
														<div class="pricing-plans plans-3">
															<c:forEach var="endereco" items="${pedido.cliente.enderecos}">
															
																<div class="plan-container">
																	<div class="plan ${endereco.id == entrega.endereco.id ? 'green' : ''}">
																		<div class="plan-header">
																			<div class="plan-title">${endereco.endereco} ${endereco.complemento}</div>
																		</div>
																		<div class="plan-features">
																			<ul>
																				<li></li>
																				<li><strong>Bairro: </strong>${endereco.bairro}</li>
																				<li><strong>CEP: </strong>${endereco.cep}</li>
																				<li><strong>Cidade: </strong>${endereco.cidade} / ${endereco.uf}</li>
																				
																			</ul>
																		</div>
																		<div class="plan-actions">
																			<label class="radio inline"> <input type="radio" id="enderecoSelecionado" value="${endereco.id}" 
																			name="enderecoSelecionado" ${endereco.id == entrega.endereco.id ? 'checked' : ''}> Selecionar Endereço
									</label> 
																			<%-- <a href="" class="btn" id="selecionarPedido" name="${endereco.id}" >Selecionar</a> --%>
																		</div>
																	</div>
																</div>
																
															</c:forEach>
														</div>
													</div>
													
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							
					
				</div>
				<div id="confirmEnviar" class="modal hide fade">
					<div class="modal-body"><h3>Confirma enviar Agora o Pedido ?</h3>
						<br />
					</div>
					<div class="modal-footer">
						<button type="button" data-dismiss="modal"
							class="btn btn-primary" id="confirmar">Confirmar</button>
						<button type="button" data-dismiss="modal" class="btn" id="naoconfirma">Cancelar</button>
					</div>
				</div>
				
				</form>
				<div class="span12">
					<div class="widget-header">
						<i class="icon-list-alt"></i>
						<h3>Resumo do Pedido</h3>
					</div>
					<!-- /widget-header -->
					<div class="widget-content">
						<div class="widget big-stats-container">
							<table class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>Quantidade/Unidade</th>
										<th>Categoria</th>
										<th>Produto</th>
										<th>Preparo</th>
										<th>Complemento</th>
										<th>Observação</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${pedido.itens}">
										<tr>
											<td>${item.quantidade}${item.tipo}</td>
											<td>${item.categoria.nome}</td>
											<td>${item.produto.nome}</td>
											<td>${item.preparo.nome}</td>
											<td>${item.complemento.nome}</td>
											<td>${item.observacao}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="form-actions">
						
						<div class="pull-right">
							<form id="formSalvarPedido" method="post" action="${linkTo[AdminController].gravarPedido}">
								<input type="hidden" value="${pedido.id}" id="idPedido" name="pedido.id">
								<input type="hidden" value="" id="idEndereco" name="endereco.id">
								<input type="hidden" value="" id="idTipoEntrega" name="tipoEntrega">
								
								<input type="hidden" value="" id="idValor" name="pedido.valor">
								<input type="hidden" value="" id="idValorFrete" name="pedido.valorFrete">
								<input type="hidden" value="" id="idObservacao" name="pedido.observacao">
								<input type="hidden" value="" id="idData" name="quadro.data">
								<input type="hidden" value="" id="idHorario" name="quadro.horario.id">
								
								
								<button id="salvarPedido" name="salvarPedido" class="btn btn-primary" >Salvar</button>
								
							</form>
							<form id="formSaidaDireto" method="post" action="${linkTo[AdminController].enviarPedidoSaidaDireto}">
								<input type="hidden" value="${pedido.id}" id="idPedido" name="pedido.id">
								<input type="hidden" value="" id="idEndereco2" name="endereco.id">
								<input type="hidden" value="" id="idTipoEntrega2" name="tipoEntrega">
								
								<input type="hidden" value="" id="idValor2" name="pedido.valor">
								<input type="hidden" value="" id="idValorFrete2" name="pedido.valorFrete">
								<input type="hidden" value="" id="idObservacao2" name="pedido.observacao">
								<input type="hidden" value="" id="idData2" name="quadro.data">
								<input type="hidden" value="" id="idHorario2" name="quadro.horario.id">
								
								
								<button id="enviarPedido" name="EnviarPedido" class="btn" >Enviar</button>
								
								<!-- DIALOG CONFIRMACAO DE ENVIO -->
								<div id="confirmEnviar" class="modal hide fade">
									<div class="modal-body"><h3>Confirma enviar o Pedido?</h3>
										<br />
									</div>
									<div class="modal-footer">
										<button type="button" data-dismiss="modal" class="btn btn-primary" id="confirmar">Confirmar</button>
										<button type="button" data-dismiss="modal" class="btn">Cancelar</button>
									</div>
								</div>
								<!-- FIM DIALOGO -->
								
								
							</form>
							
						</div>
						
						<div class="pull-left">
							<form id="formVerPedido" method="get" action="/estrelacarnes/cadastrarPedido/${pedido.id}/KG/1/0" style="float: left; padding: 1px;">
								<button class="button btn btn-success btn-small" id="verPedido">Editar Pedido</button>
								<button class="btn btn-small" id="voltarPedido" type="button">Voltar</button>
							</form>

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
	<script src="/estrelacarnes/js/jquery.maskMoney.min.js"></script>
	<script src="/estrelacarnes/js/excanvas.min.js"></script>
	<script src="/estrelacarnes/js/chart.min.js" type="text/javascript"></script>
	<script src="/estrelacarnes/js/bootstrap.js"></script>
	<script src="/estrelacarnes/js/bootstrap-datepicker.js"></script>
	
	
	<script>
	
	$('button[name="EnviarPedido"]').on('click', function(e){
	    var $form=$(this).closest('#formSaidaDireto'); 
	    
	    e.preventDefault();
	    
	    $('#confirmEnviar').modal({ backdrop: 'static', keyboard: false })
	        .one('click', '#confirmar', function(e) {
	            $form.trigger('submit'); // submit the form
	        });
	});
	
	$(document).ready(function() {
		$('#salvarPedido').on('click', function() {
			var valor = $("#valor").val();
			var valorFrete = $("#valorFrete").val();
			var observacao = $("#observacao").val();
			var tipoEntrega = $('input[name=entrega.ctipoEntrega]:checked',	'#formEnviarPedido').val();
			var idEndereco = $('input[name=enderecoSelecionado]:checked',	'#formEnviarPedido').val();
			var data = $('.datepicker').val();
			var horario = $('#selectHorario').val();
			
			$("#idValor").val(valor);
			$("#idValorFrete").val(valorFrete);
			$("#idObservacao").val(observacao);
			$("#idTipoEntrega").val(tipoEntrega);
			$("#idEndereco").val(idEndereco);
			$("#idData").val(data);
			$("#idHorario").val(horario);
			
		});
		$('#enviarPedido').on('click', function() {
			var valor = $("#valor").val();
			var valorFrete = $("#valorFrete").val();
			var observacao = $("#observacao").val();
			var tipoEntrega = $('input[name=entrega.ctipoEntrega]:checked',	'#formEnviarPedido').val();
			var idEndereco = $('input[name=enderecoSelecionado]:checked',	'#formEnviarPedido').val();
			var data = $('.datepicker').val();
			var horario = $('#selectHorario').val();
			
			$("#idValor2").val(valor);
			$("#idValorFrete2").val(valorFrete);
			$("#idObservacao2").val(observacao);
			$("#idTipoEntrega2").val(tipoEntrega);
			$("#idEndereco2").val(idEndereco);
			$("#idData2").val(data);
			$("#idHorario2").val(horario);

			
		});
	});
	
	
	$('.datepicker').datepicker({
		format: 'dd/mm/yyyy',
		minDate: 0,
		autoclose: true,
	});
	
 	$('.datepicker').on("changeDate", function() {
		var valor = "";
		var post_url = "";
		var pedido = "";
	    valor = $('.datepicker').val();
	    pedido = $('#idPedido').val();
	    dataSemFormatacao = valor.replace("/", "").replace("/", "");
	    post_url = "/estrelacarnes/pedido/horarioDisponivel/"+pedido+"/" + dataSemFormatacao;
	    $("#divHorario").show();	

	    $.ajax({
	        url:post_url,
	        type:'GET',
	        dataType: 'json',
	        success: function( json ) {
	        	$('#selectHorario').empty();
	            $.each(json, function(i, value) {
	            	$('#selectHorario').append('<option value="">Selecione</option>');
	            	for (var i=0; i<value.length; i++) {
	            		$('#selectHorario').append('<option value="' + value[i].id + '">' + value[i].horario + '</option>');
	            	 }
	                
	            });
	        }
	    });
	    
	});
 	
 	
 	
 	$('#selectHorario').on('change', function() {
 		var idHorario = this.value; 
		var data = $('.datepicker').val();
		dataSemFormatacao = data.replace("/", "").replace("/", "");
		post_url = "/estrelacarnes/pedido/totalHorarioDisponivel/"+idHorario+"/" + dataSemFormatacao;		

		$.ajax({
	        url:post_url,
	        type:'GET',
	        dataType: 'json',
	        success: function( json ) {
	        	$('#divTotal').empty();
	            $.each(json, function(i, value) {
	            	$('#divTotal').append('AGENDADO(S) <b>' + value + '</b> PEDIDO(S) PARA ENTREGA NESTA DATA/HORÁRIO');
	            });
	        }
	    });
			  
 		});
	
	
	$('#observacao').val($('#observacao').val().toUpperCase());

	$('#observacao').keyup(function() {
	    $(this).val($(this).val().toUpperCase());
	});
	$( "#valor" ).focus();
	$(document).ready(function() {
		$("#enderecoDelivery").hide();
		$("#frete").hide();
		
		
		var tipoEntrega = $('input[name=ctipoEntrega]:checked',	'#formEnviarPedido').val();
		if (tipoEntrega == 'D'){
			$("#enderecoDelivery").show();
			$( "#valor" ).focus();
			$("#frete").show();						
		} 
		if (tipoEntrega == 'P'){
			$("#enderecoDelivery").hide();
			$( "#valor" ).focus();
		}
	});

	
	$("input[name=ctipoEntrega]").click(function() {
		var tipoEntrega = $('input[name=ctipoEntrega]:checked',	'#formEnviarPedido').val();
		if (tipoEntrega == 'D'){
			$("#enderecoDelivery").show();
			$("#enderecoPick").hide();
			$("#frete").show();
			$( "#valor" ).focus();
									
		} else {
			$("#enderecoDelivery").hide();
			$("#enderecoPick").show();
			$("#frete").hide();
			$( "#valor" ).focus();
		}
	});

	
		document.getElementById("voltarPedido").onclick = function() {
			
			event.preventDefault();
		    //history.back(1);
		    window.location = "/estrelacarnes/";
		};
		
		
	    $("#valor").maskMoney({thousands:'.', decimal:',', affixesStay: true});
	    $("#valorFrete").maskMoney({thousands:'.', decimal:',', affixesStay: true});
	    
	</script>
</body>
</html>

