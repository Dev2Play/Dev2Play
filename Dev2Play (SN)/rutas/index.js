const express = require('express');
const router = express.Router();
const dbconn = require('../src/db');
const app = express();
const fileUpload = require('express-fileupload')
app.use(fileUpload());
const { isLoggedIn, isNotLoggedIn } = require('../lib/acceso');


router.get('/', async (req, res) => {
    if (req.user) {
        const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario);
        //TODO: , COUNT(equipos.usuario) ... INNER JOIN equipos ON proyectos.id_proyectos = equipos.proyecto WHERE validacion = 1
        var proyecto_destacado = await dbconn.query('SELECT * FROM proyectos');


        if (proyecto_destacado.length > 1) {
            var id_random = Math.round(Math.random() * (proyecto_destacado.length - 1) + 1);
            //console.log(id_random)
            var proyecto_destacado = await dbconn.query('SELECT *, COUNT(equipos.usuario) FROM proyectos INNER JOIN equipos ON proyectos.id_proyectos = equipos.proyecto WHERE id_proyectos = ? and validacion = 1', 1);

            const publicaciones_destacadas = await dbconn.query('SELECT * FROM publicacion inner join usuario on publicacion.usuario_id = usuario.id_usuario inner join premium on usuario.premium = premium.id_premium WHERE oro > 0 or plata > 0  order by likes DESC LIMIT 8');

            res.render('../views/home', { proyecto: proyecto_destacado, publicacion: publicaciones_destacadas, usuario: req.user, photo: foto_perfil[0].foto });
        }
    }
    else {
        //TODO: , COUNT(equipos.usuario) ... INNER JOIN equipos ON proyectos.id_proyectos = equipos.proyecto WHERE validacion = 1
        var proyecto_destacado = await dbconn.query('SELECT * FROM proyectos');


        if (proyecto_destacado.length > 1) {
            var id_random = Math.round(Math.random() * (proyecto_destacado.length - 1) + 1);
            //console.log(id_random)
            var proyecto_destacado = await dbconn.query('SELECT *, COUNT(equipos.usuario) FROM proyectos INNER JOIN equipos ON proyectos.id_proyectos = equipos.proyecto WHERE id_proyectos = ? and validacion = 1', 1);

            const publicaciones_destacadas = await dbconn.query('SELECT * FROM publicacion inner join usuario on publicacion.usuario_id = usuario.id_usuario inner join premium on usuario.premium = premium.id_premium WHERE oro > 0 or plata > 0  order by likes DESC LIMIT 8');

            res.render('../views/home', { proyecto: proyecto_destacado, publicacion: publicaciones_destacadas, usuario: req.user });
        }
    }

});


router.post('/', async (req, res) => {
    const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario)
    res.render('../views/home', { usuario: req.user, photo: foto_perfil[0].foto });

});



//TODO: PUBLICACIONES
router.get('/verPublicaciones', async (req, res) => {
    if (req.user) {
        const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario)
        const publicaciones = await dbconn.query('SELECT *, usuario.nombre FROM publicacion INNER JOIN usuario ON publicacion.usuario_id = usuario.id_usuario ORDER BY fecha_publicacion DESC');
        //console.log(publicaciones);

        //console.log(publicaciones)

        res.render('../views/partials/publicaciones/verPublicaciones', { publicacion: publicaciones, usuario: req.user, photo: foto_perfil[0].foto });
    } else {

        const publicaciones = await dbconn.query('SELECT *, usuario.nombre FROM publicacion INNER JOIN usuario ON publicacion.usuario_id = usuario.id_usuario ORDER BY fecha_publicacion DESC');
        //console.log(publicaciones);

        //console.log(publicaciones)

        res.render('../views/partials/publicaciones/verPublicaciones', { publicacion: publicaciones, usuario: req.user });
    }

});


router.post('/verPublicaciones', async (req, res) => {
    if (req.user) {
        const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario)
        const publicaciones = await dbconn.query('SELECT *, usuario.nombre FROM publicacion INNER JOIN usuario ON publicacion.usuario_id = usuario.id_usuario');
        //console.log(publicaciones);

        const id_publicacion = req.query.id_publicacion
        console.log(id_publicacion);

        //console.log(publicaciones)

        res.render('../views/partials/publicaciones/verPublicaciones', { publicacion: publicaciones, photo: foto_perfil[0].foto });
    } else {

        const publicaciones = await dbconn.query('SELECT *, usuario.nombre FROM publicacion INNER JOIN usuario ON publicacion.usuario_id = usuario.id_usuario');
        //console.log(publicaciones);

        const id_publicacion = req.query.id_publicacion
        console.log(id_publicacion);

        //console.log(publicaciones)

        res.render('../views/partials/publicaciones/verPublicaciones', { publicacion: publicaciones });
    }
});



//TODO: PUBLICACIONES POR FILTRO
router.get('/verPublicaciones/filtro/:filtro', async (req, res) => {

    if (req.user) {
        const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario)
        const { filtro } = req.params;
        //console.log("filtro: " + filtro)
        if (filtro == 1) {
            const publicaciones = await dbconn.query('SELECT *, usuario.nombre FROM publicacion INNER JOIN usuario ON publicacion.usuario_id = usuario.id_usuario ORDER BY fecha_publicacion DESC');
            res.render('../views/partials/publicaciones/verPublicaciones', { publicacion: publicaciones, usuario: req.user, photo: foto_perfil[0].foto });

        }

        if (filtro == 2) {
            const publicaciones = await dbconn.query('SELECT *, usuario.nombre FROM publicacion INNER JOIN usuario ON publicacion.usuario_id = usuario.id_usuario ORDER BY likes DESC');
            res.render('../views/partials/publicaciones/verPublicaciones', { publicacion: publicaciones, usuario: req.user, photo: foto_perfil[0].foto });
        }

        if (filtro == 3) {
            const publicaciones = await dbconn.query('SELECT * FROM publicacion inner join usuario on publicacion.usuario_id = usuario.id_usuario inner join premium on usuario.premium = premium.id_premium WHERE oro > 0 or plata > 0  order by likes DESC LIMIT 8');

            res.render('../views/partials/publicaciones/verPublicaciones', { publicacion: publicaciones, usuario: req.user, photo: foto_perfil[0].foto });
        }
    } else {

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

            res.render('../views/partials/publicaciones/verPublicaciones', { publicacion: publicaciones, usuario: req.user });
        }
    }


});

//TODO: PUBLIACIONES LIKE
router.get('/verPublicaciones/:id', isLoggedIn, async (req, res) => {

    const { id } = req.params;
    //console.log("id del like: " + id)

    const like = await dbconn.query('UPDATE publicacion SET likes = likes + 1 WHERE id_publicacion = ?', id);

    const publicaciones = await dbconn.query('SELECT *, usuario.nombre FROM publicacion INNER JOIN usuario ON publicacion.usuario_id = usuario.id_usuario ORDER BY fecha_publicacion DESC');
    //console.log(publicaciones);

    res.redirect("/verPublicaciones/")

});


//TODO: REPORTE
router.get('/reporte/:id', isLoggedIn, async (req, res) => {
    const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario)
    const { id } = req.params;
    //console.log(id)
    const publicaciones = await dbconn.query('SELECT *, usuario.nombre FROM publicacion INNER JOIN usuario ON publicacion.usuario_id = usuario.id_usuario WHERE id_publicacion = ?', [id]);

    const usu_rep = await dbconn.query('SELECT usuario.nombre FROM usuario INNER JOIN publicacion ON usuario.id_usuario = publicacion.usuario_id WHERE id_publicacion=? ', id);


    var salida_pnt = JSON.stringify(usu_rep).indexOf(":");
    var salida_ll = JSON.stringify(usu_rep).indexOf("}");

    const usu_json = JSON.stringify(usu_rep).substring(salida_pnt + 2, salida_ll - 1);


    //TODO: falta el usuario
    const reporte = await dbconn.query("INSERT INTO reportes (publicacion_reportada, reportado) VALUES (?, ?)", [id, usu_json])

    res.render('../views/partials/publicaciones/reporte', { publicacion: publicaciones, usuario: req.user, photo: foto_perfil[0].foto });
});



router.post('/reporte/:id', isLoggedIn, async (req, res) => {
    const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario)
    res.render('../views/partials/publicaciones/reporte', { usuario: req.user, photo: foto_perfil[0].foto })
});

//TODO: CREACION DE PROYECTO
router.post('/publicado/:titulo', isLoggedIn, async (req, res) => {
    const { titulo } = req.params
    //console.log(titulo)
    const { descripcion, necesita } = req.body;
    //console.log("Necesita: " + necesita)
    //TODO: PROCESAR FECHA
    var d = new Date();
    var fecha_inicio = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate(); //+1 porque diciembre es el 0
    var fecha_final = d.getFullYear() + "-" + (d.getMonth() + 3) + "-" + d.getDate();
    //console.log("FECHA: " + String(fecha_inicio) + "FINAL: " + String(fecha_final));

    const insertar = await dbconn.query('INSERT INTO proyectos (titulo, descripcion, fecha_inicio, fecha_final, roles, lider) VALUES (?, ?, ?, ?, ?, ?)', [titulo, descripcion, fecha_inicio, fecha_final, necesita, req.user.id_usuario]);

    //console.log(insertar.insertId)

    const subida = await dbconn.query('INSERT INTO equipos(usuario,proyecto) SELECT id_usuario, id_proyectos FROM usuario, proyectos where id_usuario=? and id_proyectos=?', [req.user.id_usuario, insertar.insertId]);

    res.redirect('/gestor');
});


//TODO: ROUTER RARO DE PROYECTOS ACTIVOS


//TODO: , COUNT(equipos.usuario) ... INNER JOIN equipos ON proyectos.id_proyectos = equipos.proyecto WHERE validacion = 1
router.get('/proyectosActivos', async (req, res) => {

    if (req.user) {
        const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario)
        const proyectos = await dbconn.query('SELECT * FROM proyectos ORDER BY fecha_inicio DESC');
        //console.log(proyectos)


        res.render('../views/partials/proyectos/proyectosActivos', { proyecto: proyectos, usuario: req.user, photo: foto_perfil[0].foto });
    } else {

        const proyectos = await dbconn.query('SELECT * FROM proyectos ORDER BY fecha_inicio DESC');
        //console.log(proyectos)


        res.render('../views/partials/proyectos/proyectosActivos', { proyecto: proyectos, usuario: req.user });
    }

});

//TODO: PROYECTOS ACTIVOS
router.post('/proyectosActivos/nombre/:datos', async (req, res) => {

    if (req.user) {
        const { datos } = req.params;
        //console.log("buscar: " + datos);

        const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario)

        const proyectos = await dbconn.query('SELECT * FROM proyectos WHERE titulo = (?)', datos);

        res.render('../views/partials/proyectos/proyectosActivos', { proyecto: proyectos, usuario: req.user, photo: foto_perfil[0].foto });
    } else {
        const { datos } = req.params;
        //console.log("buscar: " + datos);



        const proyectos = await dbconn.query('SELECT * FROM proyectos WHERE titulo = (?)', datos);

        res.render('../views/partials/proyectos/proyectosActivos', { proyecto: proyectos, usuario: req.user });
    }


});

//TODO: PARA PODER DARLE A BUSCAR PROYECTO Y QUE SI EL CAMPO ESTA VACIO QUE NO PASE NADA MALO
router.post('/proyectosActivos', (req, res) => {

    res.redirect('/proyectosActivos')
})

router.get('/proyectosActivos/nombre/:datos', async (req, res) => {

    if (req.user) {
        const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario)
        console.log("foto: " + foto_perfil)
        const { datos } = req.params;
        //console.log("buscar: " + datos);
        const proyectos = await dbconn.query('SELECT * FROM proyectos WHERE titulo = (?)', datos);
        res.render('../views/partials/proyectos/proyectosActivos', { proyecto: proyectos, usuario: req.user, photo: foto_perfil[0].foto });
    } else {

        console.log("foto: " + foto_perfil)
        const { datos } = req.params;
        //console.log("buscar: " + datos);
        const proyectos = await dbconn.query('SELECT * FROM proyectos WHERE titulo = (?)', datos);
        res.render('../views/partials/proyectos/proyectosActivos', { proyecto: proyectos, usuario: req.user });
    }


});

//TODO: FILTADO DE PROYECTOS
router.get('/proyectosActivos/filtro/:filtro', async (req, res) => {

    if (req.user) {
        const { filtro } = req.params;
        if (filtro == 1) {
            const proyectos = await dbconn.query('SELECT * FROM proyectos ORDER BY fecha_inicio DESC');
            const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario);
            res.render('../views/partials/proyectos/proyectosActivos', { proyecto: proyectos, usuario: req.user, photo: foto_perfil[0].foto });
        }

        if (filtro == 2) {
            const proyectos = await dbconn.query('SELECT * FROM proyectos ORDER BY fecha_inicio ASC');
            const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario);
            res.render('../views/partials/proyectos/proyectosActivos', { proyecto: proyectos, usuario: req.user, photo: foto_perfil[0].foto });
        }

    } else {
        const { filtro } = req.params;
        if (filtro == 1) {
            const proyectos = await dbconn.query('SELECT * FROM proyectos ORDER BY fecha_inicio DESC');

            res.render('../views/partials/proyectos/proyectosActivos', { proyecto: proyectos, usuario: req.user });
        }

        if (filtro == 2) {
            const proyectos = await dbconn.query('SELECT * FROM proyectos ORDER BY fecha_inicio ASC');

            res.render('../views/partials/proyectos/proyectosActivos', { proyecto: proyectos, usuario: req.user });
        }

    }

});

router.get('/formularioProyecto', isLoggedIn, async (req, res) => {
    const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario)
    res.render('../views/partials/proyectos/formularioProyecto', { usuario: req.user, photo: foto_perfil[0].foto });

});


//TODO: PERFIL
router.get('/perfil', isLoggedIn, async (req, res) => {
    //console.log(req.user)
    const nombre = await dbconn.query('SELECT * FROM usuario WHERE id_usuario = ?', [req.user.id_usuario]);
    const roles = await dbconn.query('SELECT * FROM especialidad_usuarios inner join roles on especialidad_usuarios.rol_us = roles.id_roles inner join usuario on especialidad_usuarios.usuario = usuario.id_usuario WHERE id_roles = ?', req.user.id_usuario);
    const usu_prop = await dbconn.query('SELECT nombre FROM usuario WHERE id_usuario = ?', req.user.id_usuario)
    //console.log(usu_prop)
    const public = await dbconn.query('SELECT * FROM publicacion WHERE usuario_id = ? ORDER BY fecha_publicacion DESC', [req.user.id_usuario]);
    //console.log(public);

    const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario);
    const foto_perfil_personas = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario)

    const rol = await dbconn.query('SELECT nombre_rol FROM roles inner join especialidad_usuarios on roles.id_roles = especialidad_usuarios.rol_us inner join usuario on especialidad_usuarios.usuario = usuario.id_usuario WHERE id_usuario = ?', [req.user.id_usuario]);
    console.log(rol)
    const equipo = await dbconn.query('SELECT * FROM proyectos inner join equipos on proyectos.id_proyectos = equipos.proyecto INNER JOIN usuario ON equipos.usuario = usuario.id_usuario WHERE id_usuario = ?', [req.user.id_usuario]);
    //console.log((equipo))

    //TODO: ERROR AL PROCESAR EL ARRAY
    if (equipo.length == 0) {
        res.render('../views/partials/perfil/perfil', { usuario: req.user, archivo: public, roles: rol, photo: foto_perfil[0].foto, usuario_propio: req.user , photo_us: foto_perfil_personas[0].foto });
    }

    if (rol.length == 0) {
        res.render('../views/partials/perfil/perfil', { usuario: req.user, archivo: public, equipos: equipo[0].titulo, photo: foto_perfil[0].foto, usuario_propio: req.user , photo_us: foto_perfil_personas[0].foto });
    }

    else {
        res.render('../views/partials/perfil/perfil', { usuario: req.user, roles: rol, equipos: equipo[0].titulo, archivo: public, photo: foto_perfil[0].foto, usuario_propio: req.user , photo_us: foto_perfil_personas[0].foto });
    }

});




router.get('/editarPerfil', isLoggedIn, async (req, res) => {
    //console.log(req.user.sobremi)
    const editdescrip = await dbconn.query('UPDATE usuario SET sobremi = ? WHERE id_usuario = ?', [req.user.sobremi, req.user.id_usuario]);
    //console.log(editdescrip)
    const editfoto = await dbconn.query('UPDATE usuario SET foto = ? WHERE id_usuario = ?', [req.user.foto, req.user.id_usuario]);
    const desc = await dbconn.query('SELECT sobremi FROM usuario WHERE id_usuario = ?', req.user.id_usuario);
    const foto = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario);
    const foto_perfil_personas = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario)
    const equipo = await dbconn.query('SELECT * FROM proyectos inner join equipos on proyectos.id_proyectos = equipos.proyecto INNER JOIN usuario ON equipos.usuario = usuario.id_usuario WHERE id_usuario = ?', [req.user.id_usuario]);
    const public = await dbconn.query('SELECT * FROM publicacion WHERE usuario_id = ? ORDER BY fecha_publicacion DESC', [req.user.id_usuario]);

    if (equipo.length == 0) {
        res.render('../views/partials/perfil/editarPerfil', { usuario: req.user, descrip: desc[0].sobremi, photo: foto[0].foto, archivo: public , photo_us: foto_perfil_personas[0].foto });
        console.log(foto)
    } else {
        res.render('../views/partials/perfil/editarPerfil', { usuario: req.user, descrip: desc[0].sobremi, photo: foto[0].foto, equipos: equipo[0].titulo, archivo: public , photo_us: foto_perfil_personas[0].foto });
        console.log(foto)
    }

});


//TODO: AÑADIR CATEGORIA
router.post('/roles_update', async (req, res) => {
    console.log('roles', req.body)
    if (typeof (req.body.sonido) == 'string') await dbconn.query("INSERT INTO especialidad_usuarios (usuario,rol_us) values (?, '3')", [req.user.id_usuario]);
    //console.log(typeof(req.body.sonido))
    if (typeof (req.body.animador) == 'string') await dbconn.query("INSERT INTO especialidad_usuarios (usuario,rol_us) values (?, '4')", [req.user.id_usuario]);
    if (typeof (req.body.guion) == 'string') await dbconn.query("INSERT INTO especialidad_usuarios (usuario,rol_us) values (?, '5')", [req.user.id_usuario]);
    if (typeof (req.body.modelador) == 'string') await dbconn.query("INSERT INTO especialidad_usuarios (usuario,rol_us) values (?, '6')", [req.user.id_usuario]);
    if (typeof (req.body.ilustrador) == 'string') await dbconn.query("INSERT INTO especialidad_usuarios (usuario,rol_us) values (?, '2')", [req.user.id_usuario]);
    if (typeof (req.body.programador) == 'string') await dbconn.query("INSERT INTO especialidad_usuarios (usuario,rol_us) values (?, '1')", [req.user.id_usuario]);

    res.redirect('/perfil')
});


router.get('/tienda', async (req, res) => {

    if (req.user) {
        const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario)
        const juegos_tienda = await dbconn.query('SELECT * FROM juegos ORDER BY fecha_subida DESC;');

        res.render('../views/partials/tienda/tienda', { juegos: juegos_tienda, usuario: req.user, photo: foto_perfil[0].foto });
    } else {

        const juegos_tienda = await dbconn.query('SELECT * FROM juegos ORDER BY fecha_subida DESC;');

        res.render('../views/partials/tienda/tienda', { juegos: juegos_tienda, usuario: req.user });
    }

});


router.get('/tienda/:filtro', async (req, res) => {

    if (req.user) {
        const { filtro } = req.params;
        if (filtro == 1) {
            const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario)
            const juegos = await dbconn.query('SELECT * FROM juegos ORDER BY precio DESC');
            res.render('../views/partials/tienda/tienda', { juegos: juegos, usuario: req.user, photo: foto_perfil[0].foto })
        }
        if (filtro == 2) {
            const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario)
            const juegos = await dbconn.query('SELECT * FROM juegos ORDER BY precio ASC');
            res.render('../views/partials/tienda/tienda', { juegos: juegos, usuario: req.user, photo: foto_perfil[0].foto })
        }
    } else {
        const { filtro } = req.params;
        if (filtro == 1) {

            const juegos = await dbconn.query('SELECT * FROM juegos ORDER BY precio DESC');
            res.render('../views/partials/tienda/tienda', { juegos: juegos, usuario: req.user })
        }
        if (filtro == 2) {

            const juegos = await dbconn.query('SELECT * FROM juegos ORDER BY precio ASC');
            res.render('../views/partials/tienda/tienda', { juegos: juegos, usuario: req.user })
        }
    }

});


router.get('/fichaJuego/:id', async (req, res) => {

    if (req.user) {
        const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario)
        const { id } = req.params;
        console.log(id);
        const ficha = await dbconn.query('SELECT * FROM juegos WHERE id_juegos=?', id);//cambio
        //console.log(ficha);
        //console.log(req)
        res.render('../views/partials/juegos/fichaJuego', { usuario: req.user, juegos: ficha, photo: foto_perfil[0].foto });
    } else {

        const { id } = req.params;
        console.log(id);
        const ficha = await dbconn.query('SELECT * FROM juegos WHERE id_juegos=?', id);//cambio
        //console.log(ficha);
        //console.log(req)
        res.render('../views/partials/juegos/fichaJuego', { usuario: req.user, juegos: ficha });
    }

});


router.post('/fichaJuego', async (req, res) => {

    if (req.user) {
        const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario)
        res.render('../views/partials/juegos/fichaJuego', { photo: foto_perfil[0].foto });
    } else {

        res.render('../views/partials/juegos/fichaJuego');
    }

});

router.get('/formularioJuego/', isLoggedIn, async (req, res) => {
    const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario)
    res.render('../views/partials/juegos/formularioJuego', { usuario: req.user, photo: foto_perfil[0].foto });

});


router.get('/404', async (req, res) => {

    if (req.user) {
        const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario)
        res.render('../views/partials/Errores/404', { usuario: req.user, photo: foto_perfil[0].foto });
    } else {

        res.render('../views/partials/Errores/404', { usuario: req.user });

    }

});


//TODO: ADMINISTRACION
router.get('/administracion', isLoggedIn, async (req, res) => {

    if (req.user.id_usuario == 13) {
        const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario)
        res.render('../views/partials/Administracion/administracion', { usuario: req.user, photo: foto_perfil[0].foto })
    } else {
        res.redirect('/404')
    }
});


router.post('/administracion/:val', isLoggedIn, async (req, res) => {

    const { val } = req.params

    if (val == 1) { //TODO: PROYECTOS
        const proyectos = await dbconn.query('SELECT * FROM proyectos');
        const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario)
        res.render('../views/partials/Administracion/administracion', { proyecto: proyectos, usuario: req.user, photo: foto_perfil[0].foto })
    }

    if (val == 2) { //TODO: REPORTES
        const reportes = await dbconn.query('SELECT * FROM reportes');
        const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario);
        const foto = await dbconn.query('SELECT enlace FROM publicacion')
        //console.log(foto);
        res.render('../views/partials/Administracion/administracion', { reporte: reportes, usuario: req.user, photo: foto_perfil[0].foto, enlace: foto })
    }
    if (val == 5) { //TODO: USUARIOS
        const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario)
        const users = await dbconn.query('SELECT * FROM usuario')
        res.render('../views/partials/Administracion/administracion', { personas: users, usuario: req.user, photo: foto_perfil[0].foto })
    }

});

//TODO: NUEVA CATEGORIA
router.post('/nueva_cat', isLoggedIn, async (req, res) => {
    const { cat } = req.body;

    const prueba = await dbconn.query('SELECT * FROM roles');
    //console.log(prueba.length)
    const id = prueba.length + 1;
    const nueva_cat = await dbconn.query('INSERT INTO roles(id_roles, nombre_rol) VALUE(?, ?)', [id, cat])
    res.redirect('/administracion')

});

router.post('/unido/:id', isLoggedIn, async (req, res) => {
    //const proyecto = req.params;
    //const usuario = req.user;
    console.log(req.params)
    var id = JSON.stringify(req.params);
    var dpnt = id.indexOf(":");
    var ll = id.indexOf("}")

    var proyecto = Number(id.substring(dpnt + 2, ll - 1));
    console.log(proyecto);
    const subida = await dbconn.query('INSERT INTO equipos(usuario,proyecto) SELECT id_usuario, id_proyectos FROM usuario, proyectos where id_usuario=? and id_proyectos=?', [req.user.id_usuario, proyecto]);

    //const subida = await dbconn.query('UPDATE COUNT(equipos.usuario) SET equipos.usuario = equipos.usuario + 1')

    //res.send("unido " + subida);
    res.redirect('/gestor');
});



router.get('/prueba', isLoggedIn, async (req, res) => {

    res.render('../views/partials/Administracion/pruebas')
})


//TODO: PUBLICACIONES PERFIL
router.post('/upload', isLoggedIn, (req, res) => {
    let EDFile = req.files.file
    EDFile.mv(`src/public/publicaciones/${EDFile.name}`, err => {
        if (err) return res.status(500).send({ message: err });

        return res.status(200).send({ message: 'File upload' });
    });
});

//TODO: PUBLICACIONES JUEGO FOTO
router.post('/uploadJuego', isLoggedIn, (req, res) => {
    let EDFile = req.files.file
    EDFile.mv(`src/public/juegos/${EDFile.name}`, err => {
        if (err) return res.status(500).send({ message: err });

        return res.status(200).redirect('/tienda')
    });
});


router.post('/perfil', isLoggedIn, async (req, res) => {

    let file = req.files.file;
    //console.log(file);
    const { desc } = req.body;
    //console.log(desc)

    file.mv(`src/public/publicaciones/${file.name}`, async err => {
        if (err) return res.status(500).send({ message: err })

        const nombre = await dbconn.query('SELECT * FROM usuario WHERE id_usuario = ?', [req.user.id_usuario]);
        const roles = await dbconn.query('SELECT * FROM especialidad_usuarios inner join roles on especialidad_usuarios.rol_us = roles.id_roles inner join usuario on especialidad_usuarios.usuario = usuario.id_usuario WHERE id_roles = ?', req.user.id_usuario);



        const rol = await dbconn.query('SELECT * FROM roles inner join especialidad_usuarios on roles.id_roles = especialidad_usuarios.rol_us inner join usuario on especialidad_usuarios.usuario = usuario.id_usuario WHERE id_usuario = ?', [req.user.id_usuario]);

        //console.log(rol)
        const equipo = await dbconn.query('SELECT * FROM proyectos inner join equipos on proyectos.id_proyectos = equipos.proyecto INNER JOIN usuario ON equipos.usuario = usuario.id_usuario WHERE id_usuario = ?', [req.user.id_usuario]);

        const nombre_publ = "publicaciones/" + file.name;
        console.log(nombre_publ)
        var d = new Date();
        var fecha_inicio = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate();

        const publicacion_nueva = await dbconn.query('INSERT INTO publicacion (usuario_id, descripcion, enlace, fecha_publicacion) VALUES (?, ?, ?, ?)', [req.user.id_usuario, desc, nombre_publ, fecha_inicio]);


        return res.redirect('/perfil');

        //res.send("pruebas")

    })

});


router.post('/sobremi/:de', isLoggedIn, async (req, res) => {
    const { de } = req.params;
    const editdescrip = await dbconn.query('UPDATE usuario SET sobremi = ? WHERE id_usuario = ?', [de, req.user.id_usuario]);
    console.log(de);

    res.redirect('/perfil')


});


router.post('/foto', isLoggedIn, async (req, res) => {
    let file = req.files.file;
    //console.log(file)
    file.mv(`src/public/imagenes_perfil/${file.name}`, async err => {
        if (err) return res.status(500).send({ message: err })

        const nombre_pub = 'imagenes_perfil/' + file.name

        const editfoto = await dbconn.query('UPDATE usuario SET foto = ? WHERE id_usuario = ?', [nombre_pub, req.user.id_usuario]);

        res.redirect('/perfil');

    });


});


//TODO: TIENDA
router.post('/tienda', isLoggedIn, async (req, res) => {

    let file = req.files.file;
    file.mv(`src/public/juegos/${file.name}`, async err => {
        if (err) return res.status(500).send({ message: err })

        const { titulo, descripcion, precio, sistema_operativo, memoria, graficos, procesador, almacenamiento } = req.body;
        const nombre_publ = "juegos/" + file.name;
        var d = new Date();
        var fecha_inicio = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate();

        const nuevo_juego = {
            titulo,
            descripcion,
            precio,
            imagen: nombre_publ,
            sistema_operativo,
            memoria, graficos,
            procesador,
            almacenamiento,
            fecha_subida: fecha_inicio
        };



        const jueg = await dbconn.query('INSERT INTO juegos set ?', [nuevo_juego]); //como hacer que le genero entre

        res.redirect('tienda');

    });


});

//TODO: GESTOR
router.get('/gestor', isLoggedIn, async (req, res) => {

    const equipo = await dbconn.query('SELECT * FROM proyectos inner join equipos on proyectos.id_proyectos = equipos.proyecto INNER JOIN usuario ON equipos.usuario = usuario.id_usuario WHERE id_usuario = ?', [req.user.id_usuario]);
    //console.log(equipo[0].tareas);

    if (equipo.length > 0) {
        const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario);


        //console.log(equipo[0]);
        //TODO: AÑADIR FECHA DE SUBIDA
        const sacar = await dbconn.query('SELECT * FROM gestor WHERE proy_gest = ? ORDER BY id_gestor DESC', equipo[0].id_proyectos);

        const lider = await dbconn.query('SELECT * FROM usuario INNER JOIN equipos ON usuario.id_usuario = equipos.usuario INNER JOIN proyectos ON proyectos.lider = usuario.id_usuario WHERE id_proyectos = ?', equipo[0].id_proyectos)
        //console.log((lider[0].id_usuario));
        const miembros = await dbconn.query('SELECT nombre FROM usuario INNER JOIN equipos ON usuario.id_usuario = equipos.usuario INNER JOIN proyectos ON equipos.proyecto = proyectos.id_proyectos WHERE equipos.proyecto = ?', equipo[0].id_proyectos)
        //console.log(miembros)
        const nombre = await dbconn.query('SELECT nombre FROM usuario WHERE id_usuario = ?', miembros);
        //console.log(miembros);

        if (equipo.length < 1) {
            res.redirect("/formularioProyecto")
        } else {

            if (lider[0].id_usuario == req.user.id_usuario) {
                res.render('../views/partials/proyectos/gestor', { usuario: req.user, photo: foto_perfil[0].foto, equipos: equipo[0].titulo, archivos: sacar, vista_de_lider: miembros, tareas: equipo[0].tareas, adios: equipo[0].proyecto });
            } else {
                res.render('../views/partials/proyectos/gestor', { usuario: req.user, photo: foto_perfil[0].foto, equipos: equipo[0].titulo, archivos: sacar, miembros: miembros, tareas: equipo[0].tareas});
            }
        }
    } else {
        res.redirect("/formularioProyecto")
    }

});

//Para subir un archivo
router.post('/gestor', isLoggedIn, async (req, res) => {

    var file = req.files
    if (file) {
        let file = req.files.file
        file.mv(`src/public/gestor/${file.name}`, async err => {
            if (err) return res.status(500).send({ message: err });
            const equipo = await dbconn.query('SELECT * FROM proyectos inner join equipos on proyectos.id_proyectos = equipos.proyecto INNER JOIN usuario ON equipos.usuario = usuario.id_usuario WHERE id_usuario = ?', [req.user.id_usuario]);
            console.log(equipo[0])
            const nombre_arch = "gestor/" + file.name;
            //console.log(nombre_arch)
            const aniadir = await dbconn.query('INSERT INTO gestor (proy_gest, archivos) VALUES (?, ?)', [equipo[0].id_proyectos, nombre_arch])

            return res.status(200).redirect('/gestor')
        });
    } else {
        res.redirect('/gestor')
    }

});

router.get('/borrar/:id', isLoggedIn, async (req, res) => {
    const { id } = req.params
    //res.send("llega " + id)
    await dbconn.query('DELETE FROM usuario WHERE id_usuario = ?', id);
    //req.flash('success', 'Enlace borrado de la BD.');
    res.redirect('/administracion');

});

//TODO: REPORTES
router.get('/borrar_pu/:id', isLoggedIn, async (req, res) => {
    const { id } = req.params;
    //res.send("llega " + id);
    const elim_rep = await dbconn.query('DELETE FROM reportes WHERE publicacion_reportada = ?', id);
    const elim_publ = await dbconn.query('DELETE FROM publicacion WHERE id_publicacion = ?', id);
    //req.flash('success', 'Enlace borrado de la BD.');
    res.redirect('/administracion');

});

router.get('/verPubRep/:id', isLoggedIn, async (req, res) => {
    const { id } = req.params
    const publicaciones = await dbconn.query('SELECT * FROM publicacion WHERE id_publicacion = ?', id);
    const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario)
    res.render('../views/partials/Administracion/administracion', { usuario: req.user, publicacion: publicaciones, photo: foto_perfil[0].foto })

});

router.get('/expulsar/:nombre', isLoggedIn, async (req, res) => {
    const { nombre } = req.params;
    const saco_id = await dbconn.query('SELECT * FROM usuario WHERE nombre = ?', nombre)
    //console.log("expulsar a: " + saco_id[0].id_usuario)
    const expulsar = await dbconn.query('DELETE FROM equipos WHERE usuario = ?', saco_id[0].id_usuario);
    res.redirect('/gestor')
});



router.get('/otro_perfil/:nombre', async (req, res) => {
    const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario);
    const { nombre } = req.params;
    const sacar_id = await dbconn.query('SELECT * FROM usuario WHERE nombre = ?', nombre); //TODO: USUARIO
    //console.log(sacar_id)

    //TODO: DATOS DEL PERFIL
    const foto_perfil_personas = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', sacar_id[0].id_usuario)
    const nombre_perfil = await dbconn.query('SELECT * FROM usuario WHERE id_usuario = ?', sacar_id[0].id_usuario)
    //console.log(nombre_perfil)
    const roles = await dbconn.query('SELECT * FROM especialidad_usuarios inner join roles on especialidad_usuarios.rol_us = roles.id_roles inner join usuario on especialidad_usuarios.usuario = usuario.id_usuario WHERE id_roles = ?', sacar_id[0].id_usuario);
    //console.log(roles)
    const public = await dbconn.query('SELECT * FROM publicacion WHERE usuario_id = ? ORDER BY fecha_publicacion DESC', [sacar_id[0].id_usuario]);
    //console.log(public)
    const rol = await dbconn.query('SELECT nombre_rol FROM roles inner join especialidad_usuarios on roles.id_roles = especialidad_usuarios.rol_us inner join usuario on especialidad_usuarios.usuario = usuario.id_usuario WHERE id_usuario = ?', [sacar_id[0].id_usuario]);
    //console.log(rol)
    const equipo = await dbconn.query('SELECT * FROM proyectos inner join equipos on proyectos.id_proyectos = equipos.proyecto INNER JOIN usuario ON equipos.usuario = usuario.id_usuario WHERE id_usuario = ?', [sacar_id[0].id_usuario]);
    //console.log(equipo);

    res.render('../views/partials/perfil/perfil', {usuario: sacar_id[0], roles: rol, equipos: equipo[0].titulo, archivo: public, photo: foto_perfil[0].foto, photo_us: foto_perfil_personas[0].foto})
});

router.get('/nueva_tarea/:tarea', isLoggedIn, async (req, res) => {
    const { tarea } = req.params;
    const proyecto = await dbconn.query('SELECT * FROM proyectos inner join equipos on proyectos.id_proyectos = equipos.proyecto INNER JOIN usuario ON equipos.usuario = usuario.id_usuario WHERE id_usuario = ?', req.user.id_usuario);
    //console.log(proyecto[0].id_proyectos);

    const nueva = await dbconn.query('UPDATE equipos SET tareas = ? WHERE proyecto = ?', [tarea, proyecto[0].id_proyectos]);

    res.redirect('/gestor')
});

router.get('/adios_proyecto/:id', isLoggedIn, async(req, res) => {
    const { id } = req.params;
    //res.send(id);
    const adios = await dbconn.query('DELETE FROM equipos WHERE proyecto = ?', id);
    const adios_gestor = await dbconn.query('DELETE FROM gestor WHERE proy_gest = ?', id)
    const adios_proyecto = await dbconn.query('DELETE FROM proyectos WHERE id_proyectos = ?', id)
    res.redirect('/')
});

module.exports = router;
