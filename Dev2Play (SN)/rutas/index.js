const express = require('express');
const router = express.Router();
const dbconn = require('../src/db');

//TODO: revisar los post


router.get('/', async (req, res) => {

    const sacar_id = await dbconn.query('SELECT * FROM proyectos');
    const long_id = sacar_id.length;
    //console.log(sacar_id);


    var id_random = Math.round(Math.random() * (long_id - 1) + 1);
    if (id_random < 1) {
        id_random = 1;
    }

    //console.log("random: " + id_random);

    //TODO: ERRORRRRRRRRR => , COUNT(equipos.usuario)
    const proyecto_destacado = await dbconn.query('SELECT *, COUNT(equipos.usuario) FROM proyectos INNER JOIN equipos ON proyectos.id_proyectos = equipos.proyecto WHERE id_proyectos = ?', [id_random]);

    //console.log(proyecto_destacado)

    res.render('../views/home', { proyecto: proyecto_destacado });
});


router.post('/', (req, res) => {

    res.render('../views/home');

});

router.get('/tienda', (req, res) => {

    res.render('../views/partials/tienda/tienda');

});

router.post('/tienda', (req, res) => {

    res.render('../views/partials/tienda/tienda');

});

//TODO: PUBLICACIONES
router.get('/verPublicaciones', async (req, res) => {

    const publicaciones = await dbconn.query('SELECT *, usuario.nombre FROM publicacion INNER JOIN usuario ON publicacion.usuario_id = usuario.id_usuario ORDER BY fecha_publicacion DESC');
    //console.log(publicaciones);

    //console.log(publicaciones)

    res.render('../views/partials/publicaciones/verPublicaciones', { publicacion: publicaciones });

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
        res.render('../views/partials/publicaciones/verPublicaciones', { publicacion: publicaciones });
    }

    if (filtro == 2) {
        const publicaciones = await dbconn.query('SELECT *, usuario.nombre FROM publicacion INNER JOIN usuario ON publicacion.usuario_id = usuario.id_usuario ORDER BY likes DESC');
        res.render('../views/partials/publicaciones/verPublicaciones', { publicacion: publicaciones });
    }

    if (filtro == 3) {
        const publicaciones = await dbconn.query('SELECT *, usuario.nombre FROM publicacion INNER JOIN usuario ON publicacion.usuario_id = usuario.id_usuario inner join premium on usuario.premium = premium.id_premium WHERE oro > 0 or plata > 0  order by fecha_publicacion DESC LIMIT 8');

        res.render('../views/partials/publicaciones/verPublicaciones', { publicacion: publicaciones });
    }


});

//TODO: PUBLIACIONES LIKE
router.get('/verPublicaciones/:id', async (req, res) => {

    const { id } = req.params;
    //console.log("id del like: " + id)

    const like = await dbconn.query('UPDATE publicacion SET likes = likes + 1 WHERE id_publicacion = ?', id);

    const publicaciones = await dbconn.query('SELECT *, usuario.nombre FROM publicacion INNER JOIN usuario ON publicacion.usuario_id = usuario.id_usuario ORDER BY fecha_publicacion DESC');
    //console.log(publicaciones);

    res.redirect("/verPublicaciones/")

});


//TODO: REPORTE
router.get('/reporte/:id', async (req, res) => {
    const { id } = req.params;
    //console.log(id)
    const publicaciones = await dbconn.query('SELECT *, usuario.nombre FROM publicacion INNER JOIN usuario ON publicacion.usuario_id = usuario.id_usuario WHERE id_publicacion = ?', [id]);

    const usu_rep = await dbconn.query('SELECT usuario.nombre FROM usuario INNER JOIN publicacion ON usuario.id_usuario = publicacion.usuario_id WHERE id_publicacion=? ', id);


    var salida_pnt = JSON.stringify(usu_rep).indexOf(":");
    var salida_ll = JSON.stringify(usu_rep).indexOf("}");

    const usu_json = JSON.stringify(usu_rep).substring(salida_pnt + 2, salida_ll - 1);


    //TODO: falta el usuario
    const reporte = await dbconn.query("INSERT INTO reportes (publicacion_reportada, reportado) VALUES (?, ?)", [id, usu_json])

    res.render('../views/partials/publicaciones/reporte', { publicacion: publicaciones });
});



router.post('/reporte/:id', async (req, res) => {

    res.render('../views/partials/publicaciones/reporte')
});

//TODO: CREACION DE PROYECTO
router.post('/publicado/:titulo', async (req, res) => {
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


    res.render('../views/partials/proyectos/proyectosActivos', { proyecto: proyectos });
    

});


//TODO: , COUNT(equipos.usuario) ... INNER JOIN equipos ON proyectos.id_proyectos = equipos.proyecto WHERE validacion = 1
router.get('/proyectosActivos', async (req, res) => {

    const proyectos = await dbconn.query('SELECT *, COUNT(equipos.usuario) FROM proyectos INNER JOIN equipos ON proyectos.id_proyectos = equipos.proyecto WHERE validacion = 1 ');
    //console.log(proyectos)


    res.render('../views/partials/proyectos/proyectosActivos', { proyecto: proyectos });

});

//TODO: PROYECTOS ACTIVOS
router.post('/proyectosActivos/nombre/:datos', async (req, res) => {

    const { datos } = req.params;
    //console.log("buscar: " + datos);



    const proyectos = await dbconn.query('SELECT * FROM proyectos WHERE titulo = (?)', datos);

    res.render('../views/partials/proyectos/proyectosActivos', { proyecto: proyectos });


});

router.get('/proyectosActivos/nombre/:datos', async (req, res) => {

    const { datos } = req.params;
    console.log("buscar: " + datos);



    const proyectos = await dbconn.query('SELECT * FROM proyectos WHERE titulo = (?)', datos);

    res.render('../views/partials/proyectos/proyectosActivos', { proyecto: proyectos });


});

//TODO: FILTADO DE PROYECTOS
router.get('/proyectosActivos/filtro/:filtro', async (req, res) => {

    const { filtro } = req.params;
    if (filtro == 1) {
        const proyectos = await dbconn.query('SELECT * FROM proyectos ORDER BY fecha_inicio DESC');
        res.render('../views/partials/proyectos/proyectosActivos', { proyecto: proyectos });
    }

    if (filtro == 2) {
        const proyectos = await dbconn.query('SELECT * FROM proyectos ORDER BY fecha_inicio ASC');
        res.render('../views/partials/proyectos/proyectosActivos', { proyecto: proyectos });
    }


});




router.get('/fichaProyecto', (req, res) => {

    res.render('../views/partials/proyectos/fichaProyecto');

});





router.get('/formularioProyecto', (req, res) => {

    res.render('../views/partials/proyectos/formularioProyecto');

});



router.get('/perfil', (req, res) => {

    res.render('../views/partials/perfil/perfil');

});




router.get('/editarPerfil', (req, res) => {

    res.render('../views/partials/perfil/editarPerfil');

});





module.exports = router;