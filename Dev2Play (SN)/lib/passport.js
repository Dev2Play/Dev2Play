const passport = require('passport');

//00
const LocalStrategy = require('passport-local').Strategy;


//cargar base de datos
const dbconn = require('../src/db');

const helpers = require('./helpers'); 

passport.use('local.registro', new LocalStrategy({
	usernameField: 'nombre', 
    passwordField: 'password',
    emailField: 'email',
	passReqToCallback: true  //OJO
}, async (req, username, password, done) => {

	//objeto que representa un nuevo usuario(nuevoUsuario)  paso 44
	//si el nombre no fuese el mismo pondiarmos fullname: 'nombre',
	const { nombre } = req.body;
	let nuevoUsuario = { 
		nombre:  
		nick,
		password
	};


    //Ciframos la contraseña paso 45
    nuevoUsuario.password = await helpers.encryptPassword(password); //se pone el await para esperar a que nos den el cifrado

    // grabar en la bd usuario nombre tabla
    const result = await dbconn.query('INSERT INTO usuario SET ? ', nuevoUsuario);
    nuevoUsuario.id = result.insertId;
    return done(null, nuevoUsuario);

}));

passport.serializeUser((user, done) => {
	//console.log(user);
	done(null, user.id)
});

passport.deserializeUser(async (id, done) => {
	const rows = await dbconn.query('SELECT * FROM usuario WHERE id_usuario = ?', [id_usuario]);
	done(null, rows[0]);
});


///deberiamos encriptar la clave y que la clave vieje encriptada conexion https OJO 49
passport.use('local.login', new LocalStrategy({
	usernameField: 'nombre', 
	passwordField: 'password',
	passReqToCallback: true  
}, async (req, nombre, password, done) => {
	console.log(req.body);
	const rows = await dbconn.query('SELECT * FROM usuario WHERE nombre = ?', [nombre]);
	if (rows.length > 0) {
		const user = rows[0];
		const validPassword = await helpers.matchPassword(password, user.password)
		if (validPassword) {
			done(null, user, req.flash('exito', 'Buenas ' + usuario.nombre + ' .'));
		}else{
			done(null, false, req.flash('message', 'Clave erronea'));
		}
	} else{
		return done(null, false, req.flash('message', 'El Usuario no existe'));
	}
}));