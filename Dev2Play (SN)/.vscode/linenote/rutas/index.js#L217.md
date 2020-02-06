router.get('/views/partials/proyectos/proyectosActivos', async (req, res) => {
    
    if(req.user){
        const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario)
    const proyectos = await dbconn.query('SELECT  * FROM proyectos');
    //console.log(proyectos)


    res.render('../views/partials/proyectos/proyectosActivos', { proyecto: proyectos, usuario: req.user, photo: foto_perfil[0].foto });
    } else{

    const proyectos = await dbconn.query('SELECT  * FROM proyectos');
    //console.log(proyectos)


    res.render('../views/partials/proyectos/proyectosActivos', { proyecto: proyectos, usuario: req.user });
    }


});