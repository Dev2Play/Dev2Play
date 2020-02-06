    <!--Tabla Proyectos-->
    <div class="container mt-5">
    <table class="table col-md-8" id="tablaproyectos">
      <h3>Proyectos:</h3>
  <thead>
    <tr>
      <th scope="col">Usuario</th>
      <th scope="col">Fecha</th>
      <th scope="col">Nombre de Proyecto</th>
      <th scope="col">@</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Mark Marksen</td>
      <td>26/06/2020</td>
      <td>Dragon Slayer</td>
      <td><i class="fas fa-eye" data-toggle="modal" data-target="#modalproyectos"></i></td>
    </tr>
    <tr>
      <td>Mark Marksen</td>
      <td>26/06/2020</td>
      <td>Dragon Slayer</td>
      <td><i class="fas fa-eye" data-toggle="modal" data-target="#modalproyectos"></i></td>
    </tr>
    <tr>
      <td>Mark Marksen</td>
      <td>26/06/2020</td>
      <td>Dragon Slayer</td>
      <td><i class="fas fa-eye" data-toggle="modal" data-target="#modalproyectos"></i></td>
    </tr>
    
  </tbody>
</table>
</div>
<!--Tabla Reportes-->
<div class="container mt-5">
  <table class="table col-md-8" id="tablareportes">
    <h3>Reportes:</h3>
<thead>
  <tr>
    <th scope="col">Usuario</th>
    <th scope="col">Publicación</th>
    <th scope="col">Tipo de Reporte</th>
    <th scope="col">@</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>Mark Marksen</td>
    <td>Ilustracion 1</td>
    <td>Apropiación de Contenido</td>
    <td><i class="fas fa-eye" data-toggle="modal" data-target="#modalreportes"></i></td>
  </tr>
  <tr>
    <td>Mark Marksen</td>
    <td>Ilustracion 1</td>
    <td>Apropiación de Contenido</td>
    <td><i class="fas fa-eye" data-toggle="modal" data-target="#modalreportes"></i></td>
  </tr>
  <tr>
    <td>Mark Marksen</td>
    <td>Ilustracion 1</td>
    <td>Apropiación de Contenido</td>
    <td><i class="fas fa-eye" data-toggle="modal" data-target="#modalreportes"></i></td>
  </tr>
  
</tbody>
</table>
</div>
<!--Tabla Administrar Usuarios-->
<div class="container mt-5">
  <table class="table col-md-8" id="tablausuarios">
    <h3>Administrar Usuarios:</h3>
<thead>
  <tr>
    <th scope="col">Usuario</th>
    <th scope="col">Fecha Registro</th>
    <th scope="col">@</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>Mark Marksen</td>
    <td>14/02/2020</td>
    <td><i class="fas fa-eye" data-toggle="modal" data-target="#modalusuario"></i></td>
  </tr>
  <tr>
    <td>Mark Marksen</td>
    <td>14/02/2020</td>
    <td><i class="fas fa-eye" data-toggle="modal" data-target="#modalusuario"></i></td>
  </tr>
  <tr>
    <td>Mark Marksen</td>
    <td>14/02/2020</td>
    <td><i class="fas fa-eye" data-toggle="modal" data-target="#modalusuario"></i></td>
  </tr>
  
</tbody>
</table>
</div>
<!--Modal Revisar Proyectos-->
<div class="modal fade" id="modalproyectos" tabindex="-1" role="dialog" aria-labelledby="modalproyectos" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalproyectos">Dragon Slayer</h5>
      </div>
      <div class="modal-body ">
        <h6>By Mark Marksen</h6>
        <img src="/images/proyect1.jpeg" width="465" class="mx-auto"><br><br>
        <b>Resumen:</b>
        <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Aliquam asperiores dolore tenetur rerum ducimus quam voluptates qui sunt, maiores dicta eaque pariatur accusamus fugit! Porro iste omnis eius at quis?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">No dá la talla</button>
        <button type="button" class="btn btn-primary">Aprobar</button>
      </div>
    </div>
  </div>
</div>
<!--Modal Reportes-->
<div class="modal fade" id="modalreportes" tabindex="-1" role="dialog" aria-labelledby="modalreportes"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalreportes">Reporte: "Ilustración 1"</h5>
      </div>
      <div class="modal-body ">
        <h6>Report made by Mark Marksen</h6>
        <b>Explicación:</b>
        <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Aliquam asperiores dolore tenetur rerum ducimus
          quam voluptates qui sunt, maiores dicta eaque pariatur accusamus fugit! Porro iste omnis eius at quis?</p>
        <img src="/images/proyect1.jpeg" width="465" class="mx-auto"><br><br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Reporte Falso</button>
        <button type="button" class="btn btn-danger">Eliminar Publicación</button>
      </div>
    </div>
  </div>
</div>
<!--Modal Usuario-->
<div class="modal fade" id="modalusuario" tabindex="-1" role="dialog" aria-labelledby="modalusuario" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalusuario">Mark Marksen</h5>
      </div>
      <div class="modal-body">
        <div class="row">
          <img src="images/userimage.png" alt="profile picture" width="150" height="150" class="mx-auto">
        </div>
        <br>
        <h6 class="text-center">10/01/2020</h6>
        <b>Descripción:</b>
        <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Aliquam asperiores dolore tenetur rerum ducimus
          quam voluptates qui sunt, maiores dicta eaque pariatur accusamus fugit! Porro iste omnis eius at quis?</p>
          <b>Roles:</b>
          <div class="row">         
          <ul>
            <li>Programador</li>
            <li>Ilustrador</li>
            <li>Animador</li>
          </ul>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Reporte Falso</button>
        <button type="button" class="btn btn-danger">Eliminar Publicación</button>
      </div>
    </div>
  </div>
</div>
    <!--Modal Añadir Rol-->
    <div class="modal fade" id="modalrol" tabindex="-1" role="dialog" aria-labelledby="modalrol"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Añadir Rol</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
        <div class="md-form mb-5">
          <input type="text" placeholder="Nuevo Rol" class="form-control validate" >
        </div>
        <div class="md-form mb-5">
          <div>
            <ul>
              <li>Programador</li>
              <li>Ilustrador</li>
              <li>Animador</li>
              <li>Productor Musical</li>
            </ul>
          </div>
        </div>

      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-primary">Añadir</button>
      </div>
    </div>
  </div>
</div>

    <!--Modal Añadir Categoria-->
    <div class="modal fade" id="modalcategoria" tabindex="-1" role="dialog" aria-labelledby="modalcategoria"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header text-center">
          <h4 class="modal-title w-100 font-weight-bold">Añadir Categoria</h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body mx-3">
          <div class="md-form mb-5">
            <input type="text" placeholder="Nuevo Rol" class="form-control validate" >
          </div>
          <div class="md-form mb-5">
            <div>
              <ul>
                <li>Supervivencia</li>
                <li>Acción</li>
                <li>RPG</li>
                <li>Deporte</li>
                <li>Aventuras</li>
                <li>Lucha</li>
                <li>Música</li>
              </ul>
            </div>
          </div>
  
        <div class="modal-footer d-flex justify-content-center">
          <button class="btn btn-primary">Añadir</button>
        </div>
      </div>
    </div>
  </div>