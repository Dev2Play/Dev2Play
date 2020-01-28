const express = require('express');     
const router = express.Router();    
const dbconn = require('../src/db');



router.get('/', async (req, res) => {
    
    const sacar_id = await dbconn.query('SELECT *, COUNT(*) FROM proyectos');
    //console.log(sacar_id);

    const id_json = JSON.stringify(sacar_id);
    //console.log("id_json: " + id_json);

    //TODO: BUSCAR FORMA MAS SENCILLA PARA HACER ESTO
    const id_fin = id_json.substring(183, 184);  //vemos el valor
    //console.log("id fin: " + id_fin);


    var id_random = Math.round(Math.random() * (id_fin - 1) + 1);
    //console.log("random: " + id_random);

    //TODO: ERRORRRRRRRRR
    const proyecto_destacado = await dbconn.query('SELECT *, COUNT(equipos.usuario) FROM proyectos WHERE id_proyectos = ?', [id_random]);
    console.log(proyecto_destacado)

    res.render('../views/home', {proyecto: proyecto_destacado}); 
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

//TODO: revisar errores de llamadas a la base de datos
router.get('/verPublicaciones', async (req, res) => {

    const publicaciones = await dbconn.query('SELECT * FROM publicacion');
    //console.log(publicaciones);

    const publicaciones_valoradas = await dbconn.query(' SELECT * FROM publicacion ORDER BY likes DESC');

    const publicaciones_destacadas = await dbconn.query('SELECT * FROM publicacion inner join usuario on publicacion.usuario_id = usuario.id_usuario inner join premium on usuario.premium = premium.id_premium WHERE oro > 0 or plata > 0  order by likes DESC LIMIT 8');

    const publicaciones_Recientes = await dbconn.query('SELECT * FROM publicacion ORDER BY fecha_publicacion DESC');
    //console.log(publicaciones_Recientes);

    //TODO: ROLES

    const publicaciones_sonido = await dbconn.query('SELECT * FROM publicacion inner join roles on publicacion.roles_id = roles.id_roles where roles.sonido=1');
    //console.log(publicaciones_sonido);

    const publicaciones_arte = await dbconn.query('SELECT * FROM publicacion inner join roles on publicacion.roles_id = roles.id_roles where roles.arte=1');
    //console.log(publicaciones_arte);

    const publicaciones_programacion = await dbconn.query('SELECT * FROM publicacion inner join roles on publicacion.roles_id = roles.id_roles where roles.programacion=1');
    //console.log(publicaciones_programacion);

    const publicaciones_guionista = await dbconn.query('SELECT* FROM publicacion inner join roles on publicacion.roles_id = roles.id_roles where roles.guionista=1');
    //console.log(publicaciones_guionista)

    res.render('../views/partials/publicaciones/verPublicaciones', {publicacion: publicaciones, publicacion_rec: publicaciones_Recientes, publicacion_sonido: publicaciones_sonido, publicacion_arte: publicaciones_arte, publicacion_programacion: publicaciones_programacion, publicacion_guionista: publicaciones_guionista}); 

}); 


router.post('/verPublicaciones', (req, res) => {

    res.render('../views/partials/publicaciones/verPublicaciones'); 
}); 



router.get('/proyectosActivos', async (req, res) => {

    const proyectos = await dbconn.query('SELECT  *, COUNT(equipos.usuario) FROM proyectos INNER JOIN equipos ON proyectos.id_proyectos = equipos.proyecto WHERE validacion = 1');
    console.log(proyectos)


    res.render('../views/partials/proyectos/proyectosActivos', {proyecto: proyectos}); 

}); 


router.post('/fichaProyecto', (req, res) => {

    res.render('../views/partials/proyectos/fichaProyecto'); 

}); 

router.get('/fichaProyecto', (req, res) => {

    res.render('../views/partials/proyectos/fichaProyecto'); 

}); 


router.post('/fichaProyecto', (req, res) => {

    res.render('../views/partials/proyectos/fichaProyecto'); 

}); 


router.get('/formularioProyecto', (req, res) => {

    res.render('../views/partials/proyectos/formularioProyecto'); 

}); 


router.post('/formularioProyecto', (req, res) => {

    res.render('../views/partials/proyectos/formularioProyecto'); 

}); 

router.get('/perfil', (req, res) => {

    res.render('../views/partials/perfil/perfil'); 

}); 


router.post('/perfil', (req, res) => {

    res.render('../views/partials/perfil/perfil'); 

}); 

router.get('/editarPerfil', (req, res) => {

    res.render('../views/partials/perfil/editarPerfil'); 

}); 


router.post('/editarPerfil', (req, res) => {

    res.render('../views/partials/perfil/editarPerfil'); 

}); 









module.exports = router;