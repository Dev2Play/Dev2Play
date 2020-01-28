//00
const express = require('express');
const router = express.Router()
const passport = require('passport'); 


const dbconn = require('../src/db');

const { isNotLoggedIn } = require('../lib/acceso'); //00 us log


router.get('/registro', isNotLoggedIn, (req, res) => { //00
	res.render('../vistas/layouts/registro');	
});	


/*//ruta para gestionar los datos de registro devueltos por el formulario ERA POR TENER 2 PUTOS POST MAS ATENTO
router.post('/registro', (req, res) => {
	//console.log(req.body);
	res.send('Registrado');	
});*/


router.post('/registro', isNotLoggedIn,  passport.authenticate('local.registro', { //00
	successRedirect: '/perfil',
	failureRedirect: '/registro',
	failureFlash: true

}));   //paso 45


router.get('/login', isNotLoggedIn, (req, res) => {
	
	res.render('../vistas/layouts/login') 
	
});


router.post('/login', isNotLoggedIn, (req, res, next) => {
 passport.authenticate('local.login', { 
	successRedirect: '/perfil',
	failureRedirect: '/login',
	failureFlash: true
  })(req, res, next);
});



module.exports = router;

