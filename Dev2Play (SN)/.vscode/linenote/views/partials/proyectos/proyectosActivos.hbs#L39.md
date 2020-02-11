  <div class="row">
    {{#each proyecto}}
    <!--PRIMERA TARJETA-->

    <div class="col-5 fichas">
      <h3>{{titulo}}</h3>
      <hr class="hr_debajo_del_titulo">
      <div>
        {{descripcion}}
      </div>
      <br>
      <div class="participantes">
        {{'COUNT(equipos.usuario)'}} / Miembros
      </div>
      <br>
      <hr class="bajo_roles">
      <div class="roles"> 
        <h6>{{roles}}</h6>
      </div>
  <br>
    </div>
    <p></p>
    <p></p>
    <p></p>
    {{/each}}
  </div>