router.post('/unido/:id', isLoggedIn, async (req, res) => {
    //const proyecto = req.params;
    //const usuario = req.user;
    console.log(req.params)
    var id = JSON.stringify(req.params);
    var dpnt = id.indexOf(":");
    var ll = id.indexOf("}")

    var proyecto = Number(id.substring(dpnt + 2, ll - 1));
    //console.log(proyecto);

    const unico = await dbconn.query('SELECT usuario FROM equipos WHERE proyecto = ?', proyecto);
    const verificacion = await dbconn.query('SELECT * FROM equipos WHERE usuario = ?', req.user.id_usuario);

    const expulsados = await dbconn.query('SELECT * FROM expulsados INNER JOIN equipos ON expulsados.us_expulsado = equipos.usuario INNER JOIN usuario ON equipos.usuario = usuario.id_usuario INNER JOIN proyectos ON equipos.proyecto= proyectos.id_proyectos WHERE id_proyectos = ?', proyecto);


    if (verificacion == 0) {
        for(i = 0; i<expulsados.length; i++){
            //console.log(expulsados[i].us_expulsado);
            var salida = 0
            if(expulsados[i].us_expulsado == req.user.id_usuario){
                salida = 1
            }
        }
        if(salida > 0){
            res.redirect("/")
        } else{
            const subida = await dbconn.query('INSERT INTO equipos(usuario,proyecto) SELECT id_usuario, id_proyectos FROM usuario, proyectos where id_usuario=? and id_proyectos=?', [req.user.id_usuario, proyecto]);
            res.redirect("/gestor")
        }

    } else {
        for(i = 0; i<expulsados.length; i++){
            //console.log(expulsados[i].us_expulsado);
            var salida = 0
            if(expulsados[i].us_expulsado == req.user.id_usuario){
                salida = 1
            }
        }
        //console.log("Salida: " + salida)  
        if(salida > 0){
            res.redirect("/")
        } else{
            res.redirect('/gestor');
        }

    }
    if ((unico.length > 0)) {
        for(i = 0; i<expulsados.length; i++){
            //console.log(expulsados[i].us_expulsado);
            var salida = 0
            if(expulsados[i].us_expulsado == req.user.id_usuario){
                salida = 1
            }
        }
        //console.log("Salida: " + salida);
        if(salida > 0){
            res.redirect("/")
        }else{
            res.redirect('/gestor');
        }
        
    } else {
        for(i = 0; i<expulsados.length; i++){
            //console.log(expulsados[i].us_expulsado);
            var salida = 0
            if(expulsados[i].us_expulsado == req.user.id_usuario){
                salida = 1
            }
        }
        //console.log("Salida: " + salida);
        if(salida > 0){
            res.redirect("/")
        } else{
            const subida = await dbconn.query('INSERT INTO equipos(usuario,proyecto) SELECT id_usuario, id_proyectos FROM usuario, proyectos where id_usuario=? and id_proyectos=?', [req.user.id_usuario, proyecto]);
            res.redirect("/gestor")
        }

    }


});