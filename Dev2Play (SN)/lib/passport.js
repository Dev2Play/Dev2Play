const passport = require('passport');

//00
const LocalStrategy = require('passport-local').Strategy;


//cargar base de datos
const dbconn = require('../src/db');

const helpers = require('./helpers'); 

passport.use('local.registro', new LocalStrategy({
	usernameField: 'correo', 
    passwordField: 'password',
	passReqToCallback: true  //OJO
}, async (req, correo, password, done) => {

	
	const { nombre } = req.body;
	let nuevoUsuario = { 
		nombre,
		correo,
		password,
		premium: "0"
	};


    //Ciframos la contraseña paso 45
    nuevoUsuario.password = await helpers.encryptPassword(password); 

    // grabar en la bd usuario nombre tabla
    const result = await dbconn.query('INSERT INTO usuario SET ? ', nuevoUsuario);
    nuevoUsuario.id_usuario = result.insertId;
    return done(null, nuevoUsuario);

}));




///deberiamos encriptar la clave y que la clave vieje encriptada 
passport.use('local.login', new LocalStrategy({
	usernameField: 'nombre', 
	passwordField: 'password',
	passReqToCallback: true  
}, async (req, nombre, password, done) => {
	//console.log(req.body);
	const rows = await dbconn.query('SELECT * FROM usuario WHERE nombre = ?', [nombre]);
	if (rows.length > 0) {
		const usuario = rows[0];
		const validPassword = await helpers.matchPassword(password, usuario.password)
		if (validPassword) {
			done(null, usuario, req.flash('exito', 'Buenas ' + usuario.nombre + ' .'));
		}else{
			done(null, false, req.flash('message', 'Clave erronea'));
		}
	} else{
		return done(null, false, req.flash('message', 'El Usuario no existe'));
	}
}));

passport.serializeUser((usuario, done) => {
	done(null, usuario.id_usuario); // si se cambia a usuario.id funciona el registro y si no el login
});

passport.deserializeUser(async (id_usuario, done) => {
	//console.log(id_usuario);
	const rows = await dbconn.query('SELECT * FROM usuario WHERE id_usuario = ?', [id_usuario]);
	done(null, rows[0]);
});