<!-- Modal Reporte -->
<div class="modal" id="nuevoReporte">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title titulo">Reporte</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form action="" class="mx-2">
          <select name="causas" class="mt-2">
            <!--Causa del reporte de la publicación-->
            <option value="ofensivo">Ofensivo</option>
            <option value="plagio">Plagio</option>
            <option value="otrasCausas">otros</option>
          </select>
          <br><br>
        </form>
        <textarea style="width:100%" placeholder="Dinos el motivo de tu reporte" rows="15"
          name="descripcion"></textarea>
        <input type="file" name="imagen" id="seleccionar_motivo_reporte" class="my-2 mt-4">


      </div>





      <!-- Modal footer -->
    
      <div class="modal-footer">
          <form action="./reporte" method="POST"></form>
        <button type="submit" class="btn btn-primary"><a id="enlace_rep">Enviar</a></button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
       </form>
      </div>
   

    </div>
  </div>
</div>