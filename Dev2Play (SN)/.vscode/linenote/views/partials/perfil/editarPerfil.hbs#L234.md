	<div class="col scroll">
	
				<div class="col scroll" >
			<div class="row" >
				{{#each archivo}}
				<div class="col-sm-6 clickeame">
					<div class="card publis_per" >
						<img class="card-img-top" id="publi_per" src={{enlace}} alt="Card image cap">
						<p style="display:none;">{{enlace}}º </p>
						<div class="card-body">
							<p class="card-text" id="descri_per_pub">{{descripcion}}</p>
						</div>

					</div>
					<br>
				</div>
				{{/each}}
			</div>
		</div>

	</div>