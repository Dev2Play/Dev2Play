const express = require('express');
const router = express.Router();
const dbconn = require('../src/db');
const fileUpload = require ('express-fileupload');
const app = express();

const { isLoggedIn, isNotLoggedIn } = require('../lib/acceso'); 


router.get('/', async (req, res) => {

        //TODO: , COUNT(equipos.usuario) ... INNER JOIN equipos ON proyectos.id_proyectos = equipos.proyecto WHERE validacion = 1
        var proyecto_destacado = await dbconn.query('SELECT * FROM proyectos');
        //console.log(proyecto_destacado[0])
        //console.log(proyecto_destacado)

        if(proyecto_destacado.length > 1){
            var id_random = Math.round(Math.random() * (proyecto_destacado.length - 1) + 1);
            //console.log(id_random)
            var proyecto_destacado = await dbconn.query('SELECT * FROM proyectos WHERE id_proyectos = ?', id_random);

            const publicaciones_destacadas = await dbconn.query('SELECT * FROM publicacion inner join usuario on publicacion.usuario_id = usuario.id_usuario inner join premium on usuario.premium = premium.id_premium WHERE oro > 0 or plata > 0  order by likes DESC LIMIT 8');

            res.render('../views/home', {proyecto: proyecto_destacado, publicacion: publicaciones_destacadas, usuario: req.user}); 
        }
});


router.post('/', (req, res) => {

    res.render('../views/home', {usuario: req.user});

});



//TODO: PUBLICACIONES
router.get('/verPublicaciones', async (req, res) => {

    const publicaciones = await dbconn.query('SELECT *, usuario.nombre FROM publicacion INNER JOIN usuario ON publicacion.usuario_id = usuario.id_usuario ORDER BY fecha_publicacion DESC');
    //console.log(publicaciones);

    //console.log(publicaciones)

    res.render('../views/partials/publicaciones/verPublicaciones', { publicacion: publicaciones, usuario: req.user });

});


router.post('/verPublicaciones', async (req, res) => {

    const publicaciones = await dbconn.query('SELECT *, usuario.nombre FROM publicacion INNER JOIN usuario ON publicacion.usuario_id = usuario.id_usuario');
    //console.log(publicaciones);

    const id_publicacion = req.query.id_publicacion
    console.log(id_publicacion);

    //console.log(publicaciones)

    res.render('../views/partials/publicaciones/verPublicaciones', { publicacion: publicaciones });
});



//TODO: PUBLICACIONES POR FILTRO
router.get('/verPublicaciones/filtro/:filtro', async (req, res) => {
    const { filtro } = req.params;
    //console.log("filtro: " + filtro)
    if (filtro == 1) {
        const publicaciones = await dbconn.query('SELECT *, usuario.nombre FROM publicacion INNER JOIN usuario ON publicacion.usuario_id = usuario.id_usuario ORDER BY fecha_publicacion DESC');
        res.render('../views/partials/publicaciones/verPublicaciones', { publicacion: publicaciones, usuario: req.user });
    }

    if (filtro == 2) {
        const publicaciones = await dbconn.query('SELECT *, usuario.nombre FROM publicacion INNER JOIN usuario ON publicacion.usuario_id = usuario.id_usuario ORDER BY likes DESC');
        res.render('../views/partials/publicaciones/verPublicaciones', { publicacion: publicaciones, usuario: req.user });
    }

    if (filtro == 3) {
        const publicaciones = await dbconn.query('SELECT * FROM publicacion inner join usuario on publicacion.usuario_id = usuario.id_usuario inner join premium on usuario.premium = premium.id_premium WHERE oro > 0 or plata > 0  order by likes DESC LIMIT 8');

        res.render('../views/partials/publicaciones/verPublicaciones', { publicacion: publicaciones, usuario:  req.user });
    }


});

//TODO: PUBLIACIONES LIKE
router.get('/verPublicaciones/:id', isLoggedIn,  async (req, res) => {

    const { id } = req.params;
    //console.log("id del like: " + id)

    const like = await dbconn.query('UPDATE publicacion SET likes = likes + 1 WHERE id_publicacion = ?', id);

    const publicaciones = await dbconn.query('SELECT *, usuario.nombre FROM publicacion INNER JOIN usuario ON publicacion.usuario_id = usuario.id_usuario ORDER BY fecha_publicacion DESC');
    //console.log(publicaciones);

    res.redirect("/verPublicaciones/")

});


//TODO: REPORTE
router.get('/reporte/:id', isLoggedIn, async (req, res) => {
    const { id } = req.params;
    //console.log(id)
    const publicaciones = await dbconn.query('SELECT *, usuario.nombre FROM publicacion INNER JOIN usuario ON publicacion.usuario_id = usuario.id_usuario WHERE id_publicacion = ?', [id]);

    const usu_rep = await dbconn.query('SELECT usuario.nombre FROM usuario INNER JOIN publicacion ON usuario.id_usuario = publicacion.usuario_id WHERE id_publicacion=? ', id);


    var salida_pnt = JSON.stringify(usu_rep).indexOf(":");
    var salida_ll = JSON.stringify(usu_rep).indexOf("}");

    const usu_json = JSON.stringify(usu_rep).substring(salida_pnt + 2, salida_ll - 1);


    //TODO: falta el usuario
    const reporte = await dbconn.query("INSERT INTO reportes (publicacion_reportada, reportado) VALUES (?, ?)", [id, usu_json])

    res.render('../views/partials/publicaciones/reporte', { publicacion: publicaciones, usuario: req.user });
});



router.post('/reporte/:id', async (req, res) => {

    res.render('../views/partials/publicaciones/reporte', {usuario: req.user})
});

//TODO: CREACION DE PROYECTO
router.post('/publicado/:titulo', isLoggedIn, async (req, res) => {
    const { titulo } = req.params
    const { descripcion, necesita } = req.body;
    //console.log("Necesita: " + necesita)
    //TODO: PROCESAR FECHA
    var d = new Date();
    var fecha_inicio = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate(); //+1 porque diciembre es el 0
    var fecha_final = d.getFullYear() + "-" + (d.getMonth() + 3) + "-" + d.getDate();
    //console.log("FECHA: " + String(fecha_inicio) + "FINAL: " + String(fecha_final));

    const insertar = await dbconn.query('INSERT INTO proyectos (titulo, descripcion, fecha_inicio, fecha_final, roles) VALUES (?, ?, ?, ?, ?)', [titulo, descripcion, fecha_inicio, fecha_final, necesita]);

    //const proyectos = await dbconn.query('SELECT  * FROM proyectos');

    res.redirect('/proyectosActivos');
});


router.get('/views/partials/proyectos/proyectosActivos', async (req, res) => {

    const proyectos = await dbconn.query('SELECT  * FROM proyectos');
    //console.log(proyectos)


    res.render('../views/partials/proyectos/proyectosActivos', { proyecto: proyectos, usuario: req.user });
    

});


//TODO: , COUNT(equipos.usuario) ... INNER JOIN equipos ON proyectos.id_proyectos = equipos.proyecto WHERE validacion = 1
router.get('/proyectosActivos', async (req, res) => {

    const proyectos = await dbconn.query('SELECT * FROM proyectos ORDER BY fecha_inicio DESC');
    //console.log(proyectos)


    res.render('../views/partials/proyectos/proyectosActivos', { proyecto: proyectos, usuario: req.user });

});

//TODO: PROYECTOS ACTIVOS
router.post('/proyectosActivos/nombre/:datos', async (req, res) => {

    const { datos } = req.params;
    //console.log("buscar: " + datos);



    const proyectos = await dbconn.query('SELECT * FROM proyectos WHERE titulo = (?)', datos);

    res.render('../views/partials/proyectos/proyectosActivos', { proyecto: proyectos, usuario: req.user });


});

//TODO: PARA PODER DARLE A BUSCAR PROYECTO Y QUE SI EL CAMPO ESTA VACIO QUE NO PASE NADA MALO
router.post('/proyectosActivos', (req, res) => {
    
    res.redirect('/proyectosActivos')
})

router.get('/proyectosActivos/nombre/:datos', async (req, res) => {

    const { datos } = req.params;
    console.log("buscar: " + datos);



    const proyectos = await dbconn.query('SELECT * FROM proyectos WHERE titulo = (?)', datos);

    res.render('../views/partials/proyectos/proyectosActivos', { proyecto: proyectos, usuario: req.user });


});

//TODO: FILTADO DE PROYECTOS
router.get('/proyectosActivos/filtro/:filtro', async (req, res) => {

    const { filtro } = req.params;
    if (filtro == 1) {
        const proyectos = await dbconn.query('SELECT * FROM proyectos ORDER BY fecha_inicio DESC');
        res.render('../views/partials/proyectos/proyectosActivos', { proyecto: proyectos, usuario: req.user });
    }

    if (filtro == 2) {
        const proyectos = await dbconn.query('SELECT * FROM proyectos ORDER BY fecha_inicio ASC');
        res.render('../views/partials/proyectos/proyectosActivos', { proyecto: proyectos, usuario: req.user });
    }


});


router.get('/fichaProyecto', (req, res) => {

    res.render('../views/partials/proyectos/fichaProyecto', {usuario: req.user});

});





router.get('/formularioProyecto', (req, res) => {

    res.render('../views/partials/proyectos/formularioProyecto', {usuario: req.user});

});




router.get('/perfil', isLoggedIn, async (req, res) => {
    //console.log(req.user)
    const nombre = await dbconn.query('SELECT * FROM usuario WHERE id_usuario = ?', req.user.id_usuario);
    //const roles = await dbconn.query('SELECT * FROM especialidad_usuarios inner join roles on especialidad_usuarios.rol_us = roles.id_roles inner join usuario on especialidad_usuarios.usuario = usuario.id_usuario WHERE id_roles = ?', req.user.id_usuario);
    const foto = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario);
    const public = await dbconn.query('SELECT * FROM usuario inner join publicacion on usuario.id_usuario = publicacion.usuario_id   WHERE id_usuario = ?', req.user.id_usuario);

    const rol = await dbconn.query('SELECT * FROM roles inner join especialidad_usuarios on roles.id_roles = especialidad_usuarios.rol_us inner join usuario on especialidad_usuarios.usuario = usuario.id_usuario WHERE id_usuario = ?' , [req.user.id_usuario]);
    if (rol.length == 0 && equipo.length == 0){
        res.render('../views/partials/perfil/perfil' , {roles: rol[0].nombre_rol, equipos: equipo[0].titulo})
    }
    const equipo = await dbconn.query('SELECT * FROM proyectos inner join equipos on proyectos.id_proyectos = equipos.proyecto INNER JOIN usuario ON equipos.usuario = usuario.id_usuario WHERE id_usuario = ?',[req.user.id_usuario] );
    console.log((rol))

    res.render('../views/partials/perfil/perfil', {usuario: req.user, photo: foto[0].foto});
    
});




router.get('/editarPerfil', isLoggedIn, async(req, res) => {
    //console.log(req.user.sobremi)
    const editdescrip = await dbconn.query('UPDATE usuario SET sobremi = ? WHERE id_usuario = ?',[req.user.sobremi , req.user.id_usuario]);
    //console.log(editdescrip)
    const editfoto = await dbconn.query('UPDATE usuario SET foto = ? WHERE id_usuario = ?',[req.user.foto ,req.user.id_usuario]);
    const desc = await dbconn.query('SELECT sobremi FROM usuario WHERE id_usuario = ?', req.user.id_usuario);
    const foto = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario);
    
    
    res.render('../views/partials/perfil/editarPerfil', {usuario: req.user , descrip: desc[0].sobremi , photo: foto[0].foto });
    console.log(foto)
   
});

router.get('/tienda', async (req, res) => {
   //LA TIENDA POR DEFECTO
   const juegos_tienda = await dbconn.query('SELECT * FROM juegos INNER JOIN genero ON juegos.genero = genero.id_genero WHERE id_genero < 10 ORDER BY fecha_subida DESC;');

   res.render('../views/partials/tienda/tienda', { juegos: juegos_tienda, usuario: req.user}); 

}); 

router.post('/tienda', isLoggedIn, async (req, res) => {

    const { titulo, descripcion, genero,  precio, imagen,  sistema_operativo, memoria, graficos, procesador, almacenamiento } = req.body;

    var d = new Date();
    var fecha_inicio = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate();
 
    const nuevo_juego = {
        titulo,
        descripcion,
        genero,
        precio,
        imagen,
        sistema_operativo,
        memoria, graficos,
        procesador, 
        almacenamiento,
        fecha_subida: fecha_inicio
    };
    const jueg= await dbconn.query('INSERT INTO juegos set ?', [nuevo_juego]); //como hacer que le genero entre
    const juegos_tienda = await dbconn.query('SELECT * FROM juegos INNER JOIN genero ON juegos.genero = genero.id_genero WHERE id_genero < 10 ORDER BY fecha_subida DESC;');
    
    res.redirect('tienda'); 

}); 


router.get('/tienda/:filtro', async (req, res) => {

    const { filtro } = req.params;
    if(filtro == 1){
        const juegos = await dbconn.query('SELECT * FROM juegos ORDER BY precio DESC');
        res.render('../views/partials/tienda/tienda', {juegos: juegos, usuario: req.user})
    }
    if(filtro == 2){
        const juegos = await dbconn.query('SELECT * FROM juegos ORDER BY precio ASC');
        res.render('../views/partials/tienda/tienda', {juegos: juegos, usuario: req.user})
    }
});


router.get('/fichaJuego/:id', async (req, res) => {
   
   const { id } = req.params;
   console.log(id);
   const ficha = await  dbconn.query('SELECT * FROM juegos INNER JOIN genero ON juegos.genero = genero.id_genero WHERE id_juegos=?', id);//cambio
   //console.log(ficha);
   //console.log(req)
   res.render('../views/partials/juegos/fichaJuego' , {usuario: req.user, juegos: ficha}); 
}); 

router.post('/fichaJuego', (req, res) => {

   res.render('../views/partials/juegos/fichaJuego'); 

});

router.get('/formularioJuego/', isLoggedIn, async (req, res) => {

  

   

   res.render('../views/partials/juegos/formularioJuego', {usuario: req.user}); 

});



router.get('/404', (req, res) => {

    res.render('../views/partials/Errores/404', {usuario: req.user});
});


router.post('/sobremi/:de', async (req, res) => {
    const { de } = req.params;
    const editdescrip = await dbconn.query('UPDATE usuario SET sobremi = ? WHERE id_usuario = ?',[de , req.user.id_usuario]);
    console.log(de);

    res.redirect('/perfil')


});

router.post('/foto', async (req, res) => {
    let file = req.files.file;
    //console.log(file)
    file.mv(`src/public/imagenesperfil/${file.name}`, async err =>{
        if (err) return res.status(500).send({ message: err })
        const nombre_pub = 'imagenesperfil/' + file.name

        const editfoto = await dbconn.query('UPDATE usuario SET foto = ? WHERE id_usuario = ?',[nombre_pub,req.user.id_usuario]);

        res.redirect('/perfil');

    });


});




module.exports = router;