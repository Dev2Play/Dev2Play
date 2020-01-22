const express = require('express');
const morgan = require('morgan');
const exphbs = require('express-handlebars');
const path = require('path');
const flash = require('connect-flash');

/*
    Inicializaciones
*/

const app = express();
app.get('/', function(req, res) {
    res.render('../views/index.hbs');
  });

app.get('/perfil', (req, res) => {
    res.render('../views/index')

});

/*
    Configuramos el puerto
*/

app.set('port', process.env.PORT || 4000);
app.set('views', 'views') //A la variable vistas le metemmos el acceso a vistas

app.engine('.hbs', exphbs({     //.hbs porque me da la quiero, se puede llamar como se quiera
    defaultLayout: 'main',      //main.hbs seria el nombre de la plantilla
    layoutsDir: path.join(app.get('views'), 'layouts'),    //El directorio layouts esta dentro de vistas y en la subcarpeta layouts, esto es lo q significa este trozo de codigo 
    partialsDir: path.join(app.get('views'), 'partials'),  //Modulos
    extname: '.hbs',
    //Tiene q importar cosas del modulo helpers definido en handlebars.js
    helpers: require(__dirname, 'lib/handlebars.js')    //__dirname mola mas que poner, y se usa si estamos en la raiz principal ../lib, la extension js no es necesaria
}));

app.set('view engine', '.hbs');     //Inicializamos el motor de plantillas que queremos usar, con los archivos .hbs
console.log('Estas en la ruta: ' + __dirname)

/*
    Middlewares
*/

app.use(morgan('dev'));


/*
    Rutas
*/


/*
    Archivos publicos
*/

app.use(express.static(path.join(__dirname, 'public')));



/*
    Inicializacion del servidor
*/

app.listen(app.get('port'), () => {
    console.log('Servidor escuchando en el puerto' + " " + app.get('port'))
})