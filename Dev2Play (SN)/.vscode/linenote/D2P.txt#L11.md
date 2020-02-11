const express = require('express');
const bodyParser = require('body-parser');
const morgan = require('morgan');   
const exphbs = require('express-handlebars');
const router = express.Router();
const app = express();
var path = require('path');



app.set('port', process.env.PORT || 3002)

// Convierte una petición recibida (POST-GET...) a objeto JSON
app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());

app.get('/', function(req, res){
    res.send("sd")
});

app.listen(app.get('port'), () => {
    console.log('Servidor escuchando en el puerto' + " " + app.get('port'))
})
