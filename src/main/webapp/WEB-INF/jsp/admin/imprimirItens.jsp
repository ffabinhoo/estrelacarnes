<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="iso-8859-1">
<title>Estrela Carnes</title>
<!-- <meta name="viewport"
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
<link href="/estrelacarnes/css/pages/plans.css" rel="stylesheet">
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	margin-top: 0;
	margin-bottom: 0;
	font-size: 12px;
	font-family: Arial, 'Helvetica Neue', Helvetica, sans-serif;
}
li{
  margin: 0px 0;
}
br{
  margin: 0px 0;
}
p{
  margin: 0px 0;
}
#nome{
font-size: 17px
font-family: Arial, 'Helvetica Neue', Helvetica, sans-serif;

}

</style>
</head>
<body  >
	<!--  onload="window.print(); return false;" -->
	
			
	<br>
	<div align="center" id="nome">
		<strong>${pedido.cliente.nome}</strong>
		<br>(${pedido.cliente.celular})
	</div>
	
	<div align="left">
		<c:forEach var="item" items="${pedido.itens}">
	
			<p>${item.quantidade}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.tipo}&nbsp;&nbsp;${item.produto.nome}&nbsp;&nbsp;${item.preparo.nome}&nbsp;&nbsp; ${item.complemento.nome}
				<c:if test="${item.observacao ne null}">
					<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.observacao} 
				</c:if>
			</p>	
	
		</c:forEach>
	</div>
	
	
	
	<div align="left">
	<c:if test="${pedido.observacao ne ''}">
		<br>
		<strong>OBS.:</strong>${pedido.observacao}
	</c:if>	
	</div>	

	<br>
	<br>
	

</body>
</html>
