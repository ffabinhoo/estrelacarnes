<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="pt">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="/estrelacarnes/css/bootstrap.min.css" rel="stylesheet">
<link href="/estrelacarnes/css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
<link href="/estrelacarnes/css/font-awesome.css" rel="stylesheet">
<link href="/estrelacarnes/css/style.css" rel="stylesheet">
<link href="/estrelacarnes/css/pages/dashboard.css" rel="stylesheet">
<link href="/estrelacarnes/css/pages/bootstrap-datepicker.css" rel="stylesheet">

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body>
	
	<!-- /navbar -->
	<div class="subnavbar">
		<div class="subnavbar-inner">
			
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
						<div class="widget widget-table action-table" id="divConsultarPedido">
							<form action="${linkTo[AdminController].consultarPedido}" method="post" id="formConsulta">
								
								
								
								<div class="control-group">	
								<label class="control-label" for="status">Data do Pedido</label>	
									<div class="form-group form-group-sm">
										<div id="inicio">
											<input type="text" name="inicio" id="datepicker" value=""></input>
										</div>
									</div>
									<input class="datepicker" data-date-format="dd/mm/yyyy">
									
								</div>	 
								
								<br />
									
							</form>
						</div>
					</div>
					<!-- /row -->
					
				</div>
				<!-- /container -->
			</div>
			<!-- /main-inner -->
		</div>
		<!-- /main -->
		
		</div>

		<script src="/estrelacarnes/js/jquery-1.7.2.min.js"></script>
		<script src="/estrelacarnes/js/bootstrap-datepicker.js"></script>
		<script src="/estrelacarnes/js/excanvas.min.js"></script>
		<script src="/estrelacarnes/js/chart.min.js" type="text/javascript"></script>
		<script src="/estrelacarnes/js/bootstrap.js"></script>
		<script>
		
		$('.datepicker').datepicker({
		    format: 'dd/mm/yyyy',
		    startDate: '-3d',
		    autoclose: true
		});
			
			
		</script>
</body>
</html>
