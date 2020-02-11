const express = require('express');
const bodyParser = require('body-parser');
const morgan = require('morgan');   
const exphbs = require('express-handlebars');
const router = express.Router();
const app = express();
var path = require('path');

const {database} = require('./keys')



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
    MIDLEWARES
*/
// Convierte una petición recibida (POST-GET...) a objeto JSON
app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());

app.use(morgan('dev'));

/*
    ARCHIVOS PUBLICOS

*/
app.use(express.static(path.join(__dirname, 'public')));




/*  
    RUTAS
*/
app.use(require('../rutas/index.js'));

/*
    INCILIZAR SERVIDOR
*/
app.listen(app.get('port'), () => {
    console.log('Servidor escuchando en el puerto' + " " + app.get('port'))
})
