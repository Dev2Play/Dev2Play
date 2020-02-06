<div class="container-fluid">
 <form action="/upload" method="POST" encType="multipart/form-data" class="my-5">
  <div class="container-fluid">
    <div class="row">
      <div class="col-5 mx-5">
        <h3 class="h3" style="text-align: left;" >Nombre</h3>
        <input class="input_juego" name="titulo" type="text" required>
        <br>
        <br>
        <h3 class="h3" style="text-align: left;">Descripcion</h3>
        <textarea id="juegoDesc" name="descripcion" cols="70" rows="5" required></textarea>

      </div>

      <div class="col-6" align="center">
        <img src="https://mdbootstrap.com/img/Photos/Avatars/avatar-2.jpg" class="rounded-circle z-depth-0 foto_juego"
          alt="avatar image" width="250px">
        <br>
        <div class="container-fluid">
          <br><br><br>
          <div class="row">
            <div class="col-4"></div>
            <div class="col-3">
              <input type="file" class="custom-file-input" name="imagen" id="inputGroupFile01">
              <label class="custom-file-label" for="inputGroupFile01" style="width: 300px; text-align: left">Seleccionar
                archivo </label>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <br><br><br>
  <hr style="width: 1200px;">


  <!--GENEROS Y VENTA-->
  <div class="container-fluid">
    <div class="row" align="center">
      <div class="col-3 my-5 mx-5 form-group" align="left">
        Genero<br><br>
        <select name="genero" class="mt-2" required>
                                <!--ver el tpo de categoria seleccionada-->
                                <option name="genero" value="1">Lucha</option>
                                <option name="genero" value="2">Aventuras</option>
                                <option name="genero" value="3">Estrategia</option>
                                <option name="genero" value="4">Simulacion</option>
                                <option name="genero" value="5">Deportes</option>
                                <option name="genero" value="6">RPG</option>
                                <option name="genero" value="7">Música</option>
                                <option name="genero" value="8">Accion</option>
                                <option name="genero" value="9">Supervivencia</option>
                            </select>
      </div>
      <div class="col-3 my-5 mx-5">
        <br><br>

      </div>
      <div class="col-3 my-5" align="left">
        Precio de venta <br><br>
        <input class="input_juego" name="precio" type="text" placeholder="          1€       " required>
      </div>
    </div>
  </div>
  <br>
  <hr style="width: 1200px;">

  <!--REQUISITOS-->
  <div class="container-flui">

    <div class="row">
      <div class="col-3"></div>
      <div class="col-4">
        <h3 class="h3">Requisitos</h3><br>
      </div>
      <div class="col-4"></div>
    </div>

    <div class="row">
      <div class="col-4"> </div>
      <div class="col-2">&bull; Sistema Operativo</div>
      <div class="col-1"><input class="input_juego" type="text" name="sistema_operativo"></div>
    </div>
    <br>
    <div class="row">
      <div class="col-4"> </div>
      <div class="col-2">&bull; Memoria</div>
      <div class="col-1"><input class="input_juego" type="text" name="memoria"></div>
    </div>

    <br>
    <div class="row">
      <div class="col-4"> </div>
      <div class="col-2">&bull; Graficos</div>
      <div class="col-1"><input class="input_juego" type="text" name="graficos"></div>
    </div>

    <br>
    <div class="row">
      <div class="col-4"> </div>
      <div class="col-2">&bull; Procesador</div>
      <div class="col-1"><input class="input_juego" type="text" name="procesador"></div>
    </div>

    <br>
    <div class="row">
      <div class="col-4"> </div>
      <div class="col-2">&bull; Almacenamiento</div>
      <div class="col-1"><input class="input_juego" type="text" name="almacenamiento"></div>
    </div>

  </div>





  <!--PUBLICAR-->

  <div class="container-fluid">
    <br><br><br>
    <div class="row">
      <div class="col-4"></div>
      <div class="col-4"></div>
      <!--div class="col-2">
        <input type="file" class="custom-file-input" id="inputGroupFile01">
        <label class="custom-file-label" for="inputGroupFile01">Seleccionar archivo</label>
      </iv-->
              <input type="file" name="imagen" />
        <input type='submit' value='Upload!' />
      <div class="col-2">
        <button style="height: 40px;" id="subir">Subir</button>
      </div>
    </div>

  </div>
 </form>