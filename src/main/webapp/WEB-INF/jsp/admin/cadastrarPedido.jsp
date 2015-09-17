
<div class="span12">
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
											<label class="control-label" for="radiobtns"><strong>Quantidade</strong></label>
											
                                            <div class="controls">
                                               <div class="input-prepend input-append">
                                                  <span class="add-on"><input type="radio" id="quantidadekg" name="quantidade" value="1" ></span>
                                                  <input class="span1" id="kilograma" type="text" disabled>
                                                  <span class="add-on">KG</span>
                                                </div>
                                                <br/>                                              
                                                <div class="input-prepend input-append">
                                                  <span class="add-on"><input type="radio" id="quantidadeun" name="quantidade" value="2"></span>
                                                  <input class="span1" id="unidade" type="text" disabled>
                                                  <span class="add-on">UN</span>
                                                </div>
                                              </div>
                                              	<!-- /controls -->			
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
											<label class="control-label" for="firstname">Produto</label>
											<div class="controls">
											<select class="span4" id="firstname">
												<option>Carne 1</option>
												<option>Carne 2</option>
												<option>Carne 3</option>
												<option>Carne 4</option>
												<option>Carne 5</option>
												<option>Carne 6</option>
											</select>
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										
										<div class="control-group">											
											<label class="control-label" for="preparo">Preparo</label>
											<div class="controls">
											<select class="span4" id="preparo">
												<option>Preparo 1</option>
												<option>Preparo 2</option>
												<option>Preparo 3</option>
												<option>Preparo 4</option>
												<option>Preparo 5</option>
											</select>
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->	
										
										<div class="control-group">											
											<label class="control-label" for="complemento">Complemento</label>
											<div class="controls">
											<select class="span4" id="complemento">
												<option>Complemento 1</option>
												<option>Complemento 2</option>
												<option>Complemento 3</option>
												<option>Complemento 4</option>
												<option>Complemento 5</option>
											</select>
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->	
										
										<div class="control-group">											
											<label class="control-label" for="password2">Observação</label>
											<div class="controls">
												<textarea rows="10" cols="10" class="span4"></textarea>
												
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->	
                                        
                                        <div class="control-group">											
											<label class="control-label">Modo de Entrega</label>
                                            <div class="controls">
                                            <label class="checkbox inline">
                                              <input type="checkbox" name="entrega"> Pick-Up
                                            </label>
                                            <label class="checkbox inline">
                                              <input type="checkbox" name="entrega"> Delivery
                                            </label>
                                          </div>		<!-- /controls -->		
										</div> <!-- /control-group -->	
                                        
										 <br />
										<div class="form-actions">
											<button type="submit" class="btn btn-primary">Salvar</button> 
											<button class="btn">Cancelar</button>
										</div> <!-- /form-actions -->
									</fieldset>
								</form>
							</div>
							<!-- /widget-content -->
						</div>
					</div>
<script src="js/jquery-1.7.2.min.js"></script>					
<script>
$(function(){
    
	$('#quantidadekg').click(function(){
        $('#kilograma').prop('disabled', false);
        $('#unidade').prop('disabled', true);
	});

	$('#quantidadeun').click(function(){
		$('#kilograma').prop('disabled', true);
        $('#unidade').prop('disabled', false);
	});
	
});
</script>