module.exports = {
	isLoggedIn (req, res, next) {
		
		if (req.isAuthenticated()) { 
			return next();
		}
		return res.redirect('/login'); 
	},

	isNotLoggedIn (req, res, next) {
		//si no estamos loggeados nos manda logear y  si estamos nos manda a perfil
		
		if (!req.isAuthenticated()) {
			return next();
		}
		return res.redirect('/perfil');
	}
};
