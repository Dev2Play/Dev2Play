<?php
    if( !empty($_FILE['imagen']['name']) ){
        move_uploaded_file($_FILES['imagen']['tmp_name'], "images/" . $_FILE['imagen']['name']);
        echo "El archivo se ha subido";
    }
?>