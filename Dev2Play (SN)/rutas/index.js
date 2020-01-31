const express = require('express');     
const router = express.Router();    
const dbconn = require('../src/db');
const { isLoggedIn, isNotLoggedIn } = require('../lib/acceso'); //añadido
const fileUpload = require('express-fileupload');

//{usuario: req.user} esta puesto en los get para que funcione la barra de navegacion con el login
const app = express();
app.use(fileUpload());
router.get('/', async (req, res) => {
    
    
    const sacar_id = await dbconn.query('SELECT *, COUNT(*) FROM proyectos');
    //console.log(sacar_id);

    const id_json = JSON.stringify(sacar_id);
    //console.log("id_json: " + id_json);

    //TODO: BUSCAR FORMA MAS SENCILLA PARA HACER ESTO
    const id_fin = id_json.substring(183, 184);  //vemos el valor
    //console.log("id fin: " + id_fin);


    var id_random = Math.round(Math.random() * (id_fin - 1) + 1);
    if (id_random < 1){
        id_random = 1;
    }
    //console.log("random: " + id_random);

    //PROYECTO DESTACADO
    const proyecto_destacado = await dbconn.query('SELECT *, COUNT(equipos.usuario) FROM proyectos INNER JOIN equipos ON proyectos.id_proyectos = equipos.proyecto WHERE validacion=1 and id_proyectos=?', [id_random]);
    //console.log(proyecto_destacado)

    //PUBLICACIONES DESTACADAS 
    const publicaciones_destacadas = await dbconn.query('SELECT * FROM publicacion inner join usuario on publicacion.usuario_id = usuario.id_usuario inner join premium on usuario.premium = premium.id_premium WHERE oro > 0 or plata > 0  order by likes DESC LIMIT 8');




    res.render('../views/home', {proyecto: proyecto_destacado, publicacion: publicaciones_destacadas, usuario: req.user}); 
}); 


router.post('/', (req, res) => {

    res.render('../views/home'); 

}); 

router.get('/tienda', async (req, res) => {

    //LA TIENDA POR DEFECTO
    const juegos_tienda = await dbconn.query('SELECT * FROM tienda INNER JOIN juegos ON tienda.juego_id = juegos.id_juegos INNER JOIN genero ON juegos.genero = genero.id_genero WHERE lucha=1 or aventuras=1 or estrategia=1 or simulacion=1 or deportes=1 or musica=1 or accion=1 or supervivencia=1 ORDER BY fecha_subida DESC');


    //POR GENEROS
    const genero_lucha =  await dbconn.query('SELECT * FROM tienda INNER JOIN juegos ON tienda.juego_id = juegos.id_juegos INNER JOIN genero ON juegos.genero = genero.id_genero WHERE lucha=1 ORDER BY fecha_subida DESC');
    
    const genero_aventuras =  await dbconn.query('SELECT * FROM tienda INNER JOIN juegos ON tienda.juego_id = juegos.id_juegos INNER JOIN genero ON juegos.genero = genero.id_genero WHERE aventuras=1 ORDER BY fecha_subida DESC');

    const genero_estrategia =  await dbconn.query('SELECT * FROM tienda INNER JOIN juegos ON tienda.juego_id = juegos.id_juegos INNER JOIN genero ON juegos.genero = genero.id_genero WHERE estrategia=1 ORDER BY fecha_subida DESC');

    const genero_simulacion =  await dbconn.query('SELECT * FROM tienda INNER JOIN juegos ON tienda.juego_id = juegos.id_juegos INNER JOIN genero ON juegos.genero = genero.id_genero WHERE simulacion=1 ORDER BY fecha_subida DESC');

    const genero_deportes =  await dbconn.query('SELECT * FROM tienda INNER JOIN juegos ON tienda.juego_id = juegos.id_juegos INNER JOIN genero ON juegos.genero = genero.id_genero WHERE deportes=1 ORDER BY fecha_subida DESC');

    const genero_rpg =  await dbconn.query('SELECT * FROM tienda INNER JOIN juegos ON tienda.juego_id = juegos.id_juegos INNER JOIN genero ON juegos.genero = genero.id_genero WHERE rpg=1 ORDER BY fecha_subida DESC');

    const genero_musica =  await dbconn.query('SELECT * FROM tienda INNER JOIN juegos ON tienda.juego_id = juegos.id_juegos INNER JOIN genero ON juegos.genero = genero.id_genero WHERE musica=1 ORDER BY fecha_subida DESC');

    const genero_accion =  await dbconn.query('SELECT * FROM tienda INNER JOIN juegos ON tienda.juego_id = juegos.id_juegos INNER JOIN genero ON juegos.genero = genero.id_genero WHERE accion=1 ORDER BY fecha_subida DESC');

    const genero_supervivencia =  await dbconn.query('SELECT * FROM tienda INNER JOIN juegos ON tienda.juego_id = juegos.id_juegos INNER JOIN genero ON juegos.genero = genero.id_genero WHERE supervivencia=1 ORDER BY fecha_subida DESC');

    //ORDENADO POR PRECIO MAS BAJO
   const precio_tienda = await dbconn.query('SELECT * FROM tienda INNER JOIN juegos ON tienda.juego_id = juegos.id_juegos INNER JOIN genero ON juegos.genero = genero.id_genero WHERE lucha=1 or aventuras=1 or estrategia=1 or simulacion=1 or deportes=1 or musica=1 or accion=1 or supervivencia=1 ORDER BY precio DESC'); 




    res.render('../views/partials/tienda/tienda', {tienda: juegos_tienda, genero_lucha, genero_aventuras, genero_estrategia, genero_simulacion, genero_deportes, genero_rpg, genero_musica, genero_accion, genero_supervivencia, usuario: req.user}); 

}); 

router.post('/tienda', (req, res) => {
    

    res.render('../views/partials/tienda/tienda'); 

}); 



router.get('/fichaJuego/', async (req, res) => {
    
    //const { id } = req.params;
    //console.log(id);
    const ficha = await  dbconn.query('SELECT * FROM juegos INNER JOIN tienda ON   juegos.id_juegos = tienda.juego_id INNER JOIN genero ON juegos.genero = genero.id_genero WHERE id_juegos=2');//cambio
    //console.log(ficha);
    //console.log(req)
    if (ficha.length == 0) {
        res.send(' el registro no existe.');
    } else { 
        res.render('../views/partials/juegos/fichaJuego' , {usuario: req.user, juegos: ficha}); 
    }
}); 

router.post('/fichaJuego', (req, res) => {

    res.render('../views/partials/juegos/fichaJuego'); 

});

router.get('/formularioJuego', isLoggedIn, (req, res) => {

    res.render('../views/partials/juegos/formularioJuego', {usuario: req.user}); 

});

router.post('/formularioJuego', (req, res) => {

    res.render('../views/partials/juegos/formularioJuego'); 

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

    res.render('../views/partials/publicaciones/verPublicaciones', {publicacion: publicaciones, publicacion_rec: publicaciones_Recientes, publicacion_sonido: publicaciones_sonido, publicacion_arte: publicaciones_arte, publicacion_programacion: publicaciones_programacion, publicacion_guionista: publicaciones_guionista, usuario: req.user}); 

}); 


router.post('/verPublicaciones', (req, res) => {

    res.render('../views/partials/publicaciones/verPublicaciones'); 
}); 



router.get('/proyectosActivos', async (req, res) => {

    const proyectos = await dbconn.query('SELECT  *, COUNT(equipos.usuario) FROM proyectos INNER JOIN equipos ON proyectos.id_proyectos = equipos.proyecto WHERE validacion = 1');
    //console.log(proyectos)


    res.render('../views/partials/proyectos/proyectosActivos', {proyecto: proyectos, usuario: req.user}); 

}); 


router.get('/fichaProyecto', (req, res) => {

    res.render('../views/partials/proyectos/fichaProyecto', {usuario: req.user}); 

}); 


router.post('/fichaProyecto', (req, res) => {

    res.render('../views/partials/proyectos/fichaProyecto'); 

}); 


router.get('/formularioProyecto', isLoggedIn, (req, res) => {

    res.render('../views/partials/proyectos/formularioProyecto' , {usuario: req.user}); 

}); 


router.post('/formularioProyecto', (req, res) => {

    res.render('../views/partials/proyectos/formularioProyecto' ); 

}); 

router.get('/perfil', isLoggedIn, async (req, res) => {
    //console.log(req.user);

    const nombre = await dbconn.query('SELECT * FROM usuario WHERE id_usuario = ?', req.user.id_usuario);
    const public = await dbconn.query('SELECT * FROM usuario inner join publicacion on usuario.id_usuario = publicacion.usuario_id   WHERE id_usuario = ?', req.user.id_usuario);
    res.render('../views/partials/perfil/perfil', {usuario: req.user, usuario: nombre, usuario: public}); 

}); 
app.post('/upload',(req,res) => {
    let EDFile = req.files.file
    EDFile.mv('src/public/images/${EDFile.name}',err => {
        if(err) return res.status(500).send({ message : err })

        return res.status(200).send({ message : 'Subida Satisfactoria' })
    });
});

router.post('/perfil', (req, res) => {

    res.render('../views/partials/perfil/perfil'); 

}); 

router.get('/editarPerfil',  isLoggedIn, async (req, res) => {

    res.render('../views/partials/perfil/editarPerfil', {usuario: req.user}); 

}); 


router.post('/editarPerfil', (req, res) => {

    res.render('../views/partials/perfil/editarPerfil'); 

}); 









module.exports = router;