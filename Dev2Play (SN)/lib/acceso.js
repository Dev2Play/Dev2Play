module.exports = {
	isLoggedIn (req, res, next) {
		//si el usuario esta logueado hace id y si no el return 

		//la funcion isLoggedIn sera para llos usuarios logeados
		//paso 51 passport modulo documentacion
		//aithenticated
		if (req.isAuthenticated()) { //si esta logeado hace el next();
			return next();
		}
		return res.redirect('/login'); //si no hace esto
	},

	isNotLoggedIn (req, res, next) {
		//si no estamos loggeados nos manda logear y    
		//si estamos nos manda a perfil
		//! es lo mismo req.isAuthenticated() == false
		if (!req.isAuthenticated()) {
			return next();
		}
		return res.redirect('/perfil');
	}
};
