const express = require('express');     
const router = express.Router();    
const dbconn = require('../src/db');



router.get('/',  (req, res) => {

    res.render('../views/home'); 


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

router.get('/verPublicaciones', (req, res) => {

    res.render('../views/partials/publicaciones/verPublicaciones'); 

}); 


router.post('/verPublicaciones', (req, res) => {

    res.render('../views/partials/publicaciones/verPublicaciones'); 

}); 



router.get('/proyectosActivos', (req, res) => {

    res.render('../views/partials/proyectos/proyectosActivos'); 

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