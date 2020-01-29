
const express = require('express');
const router = express.Router();
const passport = require('passport'); 

const { isNotLoggedIn } = require('../lib/acceso'); 


router.get('/registro', isNotLoggedIn, (req, res) => { 
	res.render('../views/layouts/registro');	
});	


router.post('/registro', isNotLoggedIn,  passport.authenticate('local.registro', { 
	successRedirect: '/perfil',
	failureRedirect: '/registro',
	failureFlash: true

}));   


router.get('/login', isNotLoggedIn, (req, res) => {
	
	res.render('../views/layouts/login') 
	
});


router.post('/login', isNotLoggedIn, (req, res, next) => {
 passport.authenticate('local.login', { 
	successRedirect: '/perfil',
	failureRedirect: '/login',
	failureFlash: true
  })(req, res, next);
});



module.exports = router;

