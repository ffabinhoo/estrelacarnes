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

	<!-- /navbar -->

	<!-- /subnavbar -->
	<div class="main">
		<div class="main-inner">
			<div class="container">
				
				<div class="row">
					
					<!-- /row -->
					<c:if test="${listaCliente.size() > 0}">
						<div class="widget widget-table action-table" id="listaClientes">
							<div class="widget-header">
								<i class="icon-th-list"></i>
								<h3>Clientes</h3>
							</div>
							<!-- /widget-header -->
							<div class="widget-content">
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>Nome do Cliente</th>
											<th>Telefone Residencial</th>
											<th>Telefone Celular</th>
											<th>Endereço</th>
											
											
										</tr>
									</thead>
									<tbody>
										<c:forEach var="cliente" items="${listaCliente}">
											<tr>
											
												<td><a href="${linkTo[ClienteController].mostrarCliente}${cliente.id}">${cliente.nome}</a></td>
												<td>${cliente.telefone}</td>
												<td>${cliente.celular}</td>
												<td>
													<ul>
														<c:forEach var="endereco" items="${cliente.enderecos}">
														<li>
															${endereco.endereco} - ${endereco.complemento} - ${endereco.bairro} 
														</li>
														</c:forEach>
													</ul>
												</td>
												
											</tr>
										
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- /widget-content -->
						</div>
					</c:if>
				</div>
				<!-- /container -->
			</div>
			<!-- /main-inner -->
		</div>
		<!-- /main -->
		
		</div>

		<script src="/estrelacarnes/js/jquery-1.7.2.min.js"></script>
		<script src="/estrelacarnes/js/excanvas.min.js"></script>
		<script src="/estrelacarnes/js/chart.min.js" type="text/javascript"></script>
		<script src="/estrelacarnes/js/bootstrap.js"></script>
		<script>
		$(function() {
			$("#nome").focus();
		});
			
			document.getElementById("voltarCliente").onclick = function() {
				var url = '/estrelacarnes';
				window.location.href = url;
			};
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
