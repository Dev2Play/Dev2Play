const express = require('express');
const bodyParser = require('body-parser');
const morgan = require('morgan');   
const exphbs = require('express-handlebars');
var path = require('path');
const {database} = require('./keys');
const session = require('express-session'); 
const MySQLStore = require('express-mysql-session')(session); 
const passport = require('passport');
const flash = require('connect-flash');
const fileUpload = require('express-fileupload')
const app = express();
var formidable = require('formidable')
require('../lib/passport'); 
app.use(fileUpload());
const favicon = require('serve-favicon');

app.set('port', process.env.PORT || 3002)

/*
    CONFIGURACIONES
*/
app.set('views', 'views'); //A la variable views le asignamos el valor del directorio donde esta la aplicacion, y tiene la ruta hacia la carpeta views

app.engine('.hbs', exphbs({     //.hbs porque me da la quiero, se puede llamar como se quiera
    defaultLayout: 'main',      //main.hbs seria el nombre de la plantilla
    layoutsDir: path.join(app.get('views'), 'layouts'),    //El directorio layouts esta dentro de views y en la subcarpeta layouts, esto es lo q significa este trozo de codigo 
    partialsDir: path.join(app.get('views'), 'partials'),  //Modulos
    extname: '.hbs',
    //Tiene q importar cosas del modulo helpers definido en handlebars.js
    helpers: require(__dirname, 'lib/handlebars.js')    //__dirname mola mas que poner, y se usa si estamos en la raiz principal ../lib, la extension js no es necesaria
}));
app.set('view engine', '.hbs'); 


/*
    MIDLEWARES Y SESION
*/
// Convierte una petición recibida (POST-GET...) a objeto JSON

app.use(session({
	secret: '1234',
	resave: false, // para que no se renueve si pones true es que se quedan los dados de sesion
	saveUninitialized: false, //para que no se guarde sin inicializar
	//mira modulo express msql
	store: new MySQLStore(database) //para guardarla en la BBDD
}));

app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());

app.use(morgan('dev'));

app.use(flash());
app.use(passport.initialize());  
app.use(passport.session());

app.use(morgan('dev'));
app.use(favicon(__dirname + '/public/images/favicon.ico'));


/*
        VARIABLES GLOBALES
*/

app.use((req,res,next) => {

    next();
});

/*
    ARCHIVOS PUBLICOS

*/
app.use(express.static(path.join(__dirname, 'public')));




/*  
    RUTAS
*/
app.use(require('../rutas/index.js'));
app.use(require('../rutas/usuarios'));

//TODO: ERROR 404
app.use(function(req, res, next){
    res.status(404);
  
    // Respuesta html
    if (req.accepts('html')) {
      res.redirect('/404');
      return;
    }
  
    // Respuesta json
    if (req.accepts('json')) {
      res.send({ error: 'Not found' });
      return;
    }
  
    // Texto plano
    res.type('txt').send('Not found');
  });



/*
    INCILIZAR SERVIDOR
*/
app.listen(app.get('port'), () => {
    console.log('Servidor escuchando en el puerto' + " " + app.get('port'))
})
