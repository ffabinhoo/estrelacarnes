<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Estrela Carnes</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
	rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/pages/dashboard.css" rel="stylesheet">
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
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
	<!-- /navbar -->
	<div class="subnavbar">
		<div class="subnavbar-inner">
			<div class="container">
				<ul class="mainnav">
					<li class="active"><a href="#"><i class="icon-dashboard"></i><span>Pedidos</span>
					</a></li>
					<li><a href="#"><i class="icon-list-alt"></i><span>Relatórios</span>
					</a></li>
					<li class="dropdown"><a href="javascript:;"
						class="dropdown-toggle" data-toggle="dropdown"> <i
							class="icon-long-arrow-down"></i> <span>Opções</span> <b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">Cadastrar Cliente</a></li>
							<li><a href="#">Cadastrar Usuário</a></li>
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
					<div class="span6">

						<div class="widget">
							<div class="widget-header">
								<i class="icon-bookmark"></i>
								<h3>Ícones</h3>
							</div>
							<!-- /widget-header -->
							<div class="widget-content">
								<div class="shortcuts">
									<a href="javascript:;" class="shortcut"><i
										class="shortcut-icon icon-star-empty"></i><span
										class="shortcut-label">Adicionar Pedido</span> </a>
									<a  href="javascript:;" class="shortcut" id="pedidosHoje"><i
										class="shortcut-icon icon-list-alt" ></i><span
										class="shortcut-label">Pedidos de Hoje</span> </a>	
									<a
										href="javascript:;" class="shortcut"><i
										class="shortcut-icon icon-user"></i><span
										class="shortcut-label">Localizar Usuário</span> </a>
								</div>
								<!-- /shortcuts -->
							</div>
							<!-- /widget-content -->
						</div>
						<div class="widget widget-table action-table" id="listaPedidosHoje">
							<div class="widget-header">
								<i class="icon-th-list"></i>
								<h3>Pedidos de Hoje</h3>
							</div>
							<!-- /widget-header -->
							<div class="widget-content">
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>Número do Pedido</th>
											<th>Detalhes</th>
											<th class="td-actions"></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Pedido 1</td>
											<td>Detalhe 1</td>
											<td class="td-actions"><a href="javascript:;"
												class="btn btn-small btn-success"><i
													class="btn-icon-only icon-ok"> </i></a><a href="javascript:;"
												class="btn btn-danger btn-small"><i
													class="btn-icon-only icon-remove"> </i></a></td>
										</tr>
										<tr>
											<td>Pedido 2</td>
											<td>Detalhe 2</td>
											<td class="td-actions"><a href="javascript:;"
												class="btn btn-small btn-success"><i
													class="btn-icon-only icon-ok"> </i></a><a href="javascript:;"
												class="btn btn-danger btn-small"><i
													class="btn-icon-only icon-remove"> </i></a></td>
										</tr>
										<tr>
											<td>Pedido 3</td>
											<td>Detalhe 3</td>
											<td class="td-actions"><a href="javascript:;"
												class="btn btn-small btn-success"><i
													class="btn-icon-only icon-ok"> </i></a><a href="javascript:;"
												class="btn btn-danger btn-small"><i
													class="btn-icon-only icon-remove"> </i></a></td>
										</tr>
										
									</tbody>
								</table>
							</div>
							<!-- /widget-content -->
						</div>
					</div>
					<!-- /span6 -->
					<div class="span6">
						<div class="widget widget-table action-table">
							<div class="widget-header">
								<i class="icon-th-list"></i>
								<h3>Mix de Produtos</h3>
							</div>
							<!-- /widget-header -->
							<div class="widget-content">
								<form id="edit-profile" class="form-horizontal">
									<fieldset>
										
										<div class="control-group">											
											&nbsp;
														
										</div> <!-- /control-group -->
										
										<div class="control-group">											
											<label class="control-label"><strong>Categoria</strong></label>
											
                                            
                                            <div class="controls">
                                            <label class="radio inline">
                                              <input type="radio"  name="radiobtns"> Bovino
                                            </label>
                                            
                                            <label class="radio inline">
                                              <input type="radio" name="radiobtns"> Suíno
                                            </label>
                                            <label class="radio inline">
                                              <input type="radio" name="radiobtns"> Ave
                                            </label>
                                            <label class="radio inline">
                                              <input type="radio" name="radiobtns"> Peixe
                                            </label>
                                            <label class="radio inline">
                                              <input type="radio" name="radiobtns"> Cordeiro
                                            </label>
                                            <label class="radio inline">
                                              <input type="radio" name="radiobtns"> Angus
                                            </label>
                                            <label class="radio inline">
                                              <input type="radio" name="radiobtns"> Linguiça
                                            </label>
                                            
                                          </div>	<!-- /controls -->			
										</div> <!-- /control-group -->
										<div class="control-group">											
											<label class="control-label" for="firstname">First Name</label>
											<div class="controls">
												<input type="text" class="span6" id="firstname" value="John">
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										
										
										<div class="control-group">											
											<label class="control-label" for="lastname">Last Name</label>
											<div class="controls">
												<input type="text" class="span6" id="lastname" value="Donga">
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										
										
										<div class="control-group">											
											<label class="control-label" for="email">Email Address</label>
											<div class="controls">
												<input type="text" class="span4" id="email" value="john.donga@egrappler.com">
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										
										
										<br /><br />
										
										<div class="control-group">											
											<label class="control-label" for="password1">Password</label>
											<div class="controls">
												<input type="password" class="span4" id="password1" value="thisispassword">
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										
										
										<div class="control-group">											
											<label class="control-label" for="password2">Confirm</label>
											<div class="controls">
												<input type="password" class="span4" id="password2" value="thisispassword">
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										
                                        
                                        
                                        <div class="control-group">											
											<label class="control-label">Checkboxes</label>
											
                                            
                                            <div class="controls">
                                            <label class="checkbox inline">
                                              <input type="checkbox"> Option 01
                                            </label>
                                            
                                            <label class="checkbox inline">
                                              <input type="checkbox"> Option 02
                                            </label>
                                          </div>		<!-- /controls -->		
										</div> <!-- /control-group -->
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        <div class="control-group">											
											<label class="control-label" for="radiobtns">Combined Textbox</label>
											
                                            <div class="controls">
                                               <div class="input-prepend input-append">
                                                  <span class="add-on">$</span>
                                                  <input class="span2" id="appendedPrependedInput" type="text">
                                                  <span class="add-on">.00</span>
                                                </div>
                                              </div>	<!-- /controls -->			
										</div> <!-- /control-group -->
                                        
                                        
                                        
                                        
                                        
                                        <div class="control-group">											
											<label class="control-label" for="radiobtns">Textbox with Buttons </label>
											
                                            <div class="controls">
                                               <div class="input-append">
                                                  <input class="span2 m-wrap" id="appendedInputButton" type="text">
                                                  <button class="btn" type="button">Go!</button>
                                                </div>
                                              </div>	<!-- /controls -->			
										</div> <!-- /control-group -->
                                        
                                        
                                        
                                        
                                        
                                        <div class="control-group">											
											<label class="control-label" for="radiobtns">Dropdown in a button group</label>
											
                                            <div class="controls">
                                              <div class="btn-group">
                                              <a class="btn btn-primary" href="#"><i class="icon-user icon-white"></i> User</a>
                                              <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><span class="caret"></span></a>
                                              <ul class="dropdown-menu">
                                                <li><a href="#"><i class="icon-pencil"></i> Edit</a></li>
                                                <li><a href="#"><i class="icon-trash"></i> Delete</a></li>
                                                <li><a href="#"><i class="icon-ban-circle"></i> Ban</a></li>
                                                <li class="divider"></li>
                                                <li><a href="#"><i class="i"></i> Make admin</a></li>
                                              </ul>
                                            </div>
                                              </div>	<!-- /controls -->			
										</div> <!-- /control-group -->
                                        
                                        
                                        
                                        
                                        
                                        <div class="control-group">											
											<label class="control-label" for="radiobtns">Button sizes</label>
											
                                            <div class="controls">
                                              <a class="btn btn-large" href="#"><i class="icon-star"></i> Star</a>
                                                <a class="btn btn-small" href="#"><i class="icon-star"></i> Star</a>
                                                <a class="btn btn-mini" href="#"><i class="icon-star"></i> Star</a>
                                              </div>	<!-- /controls -->			
										</div> <!-- /control-group -->
                                        
										
											
										 <br />
										
											
										<div class="form-actions">
											<button type="submit" class="btn btn-primary">Save</button> 
											<button class="btn">Cancel</button>
										</div> <!-- /form-actions -->
									</fieldset>
								</form>
							</div>
							<!-- /widget-content -->
						</div>
					</div>
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

	<!-- Le javascript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<script src="js/jquery-1.7.2.min.js"></script>
	<script src="js/excanvas.min.js"></script>
	<script src="js/chart.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.js"></script>
	<script language="javascript" type="text/javascript"
		src="js/full-calendar/fullcalendar.min.js"></script>

	<script src="js/base.js"></script>
<script>
$(function(){
    $("#listaPedidosHoje").hide();
		$( "#pedidosHoje" ).click(function() {
		  	$( "#listaPedidosHoje" ).toggle( "slow" );
		});
});
</script>

</body>
</html>
