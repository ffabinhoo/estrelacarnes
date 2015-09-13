<!DOCTYPE html>
<html lang="en">
  
<head>
    <meta charset="utf-8">
    <title>Login - Estrela Carnes</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes"> 
    
<link href="/estrelacarnes/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/estrelacarnes/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />

<link href="/estrelacarnes/css/font-awesome.css" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
    
<link href="/estrelacarnes/css/style.css" rel="stylesheet" type="text/css">
<link href="/estrelacarnes/css/pages/signin.css" rel="stylesheet" type="text/css">

</head>

<body>
	
	<div class="navbar navbar-fixed-top">
	
	<div class="navbar-inner">
		
		<div class="container">
			
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</a>
			
			<a class="brand" href="index.html">
				Estrela Carnes				
			</a>		
			
			<div class="nav-collapse">
				<ul class="nav pull-right">
					
					<li class="">						
						
						
					</li>
					
					<li class="">						
						
						
					</li>
				</ul>
				
			</div><!--/.nav-collapse -->	
	
		</div> <!-- /container -->
		
	</div> <!-- /navbar-inner -->
	
</div> <!-- /navbar -->



<div class="account-container">
	
	<div class="content clearfix">
		
		<form action="${linkTo[IndexController].login}" method="post">
		
			<h1>Login</h1>		
			
			<div class="login-fields">
				
				<p>Digite o Usuário e a Senha</p>
				
				<div class="field">
					<label for="username">Usuário</label>
					<input type="text" id="login" name="login" value="" placeholder="Login" class="login username-field" />
				</div> <!-- /field -->
				
				<div class="field">
					<label for="password">Senha:</label>
					<input type="password" id="password" name="password" value="" placeholder="Senha" class="login password-field"/>
				</div> <!-- /password -->
				
			</div> <!-- /login-fields -->
			
			<div class="login-actions">
				
				
									
				<button class="button btn btn-success btn-large">Entrar</button>
				
			</div> <!-- .actions -->
			
			
			
		</form>
		
	</div> <!-- /content -->
	
</div> <!-- /account-container -->





<script src="/estrelacarnes/js/jquery-1.7.2.min.js"></script>
<script src="/estrelacarnes/js/bootstrap.js"></script>

<script src="/estrelacarnes/js/signin.js"></script>

</body>

</html>
