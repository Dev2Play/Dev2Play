const express = require('express');
const router = express.Router()
const passport = require('passport'); 

const { isLoggedIn, isNotLoggedIn } = require('../lib/acceso'); 

const dbconn = require('../src/db');


router.get('/registro', isNotLoggedIn, (req, res) => { 
	res.render('../views/layouts/registro');	
});	


router.post('/registro',  passport.authenticate('local.registro', { 
	successRedirect: '/perfil',
	failureRedirect: '/registro',
	failureFlash: true

}));   


router.get('/login', isNotLoggedIn, (req, res) => {
	
	res.render('../views/layouts/login');
	
	
});


router.post('/login', (req, res, next) => {
 passport.authenticate('local.login', { 
	successRedirect: '/perfil',
	failureRedirect: '/login',
	failureFlash: true
  })(req, res, next);
});

router.get('/salir', (req, res) => {
	req.logOut();  
	res.redirect('/')
});

router.get('/recuperar', (req, res) => {

	res.render('../views/layouts/recuperar')
});



module.exports = router;