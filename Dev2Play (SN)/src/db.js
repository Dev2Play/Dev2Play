const mysql = require('mysql');
const { database } = require('./keys');
const { promisify } = require('util')

const dbconn = mysql.createPool(database);

dbconn.getConnection((err, connection) => {
    //Si da error:
    if (err) {
        if (err.code == ' PROTOCOL_CONNECTION_LOST') {
            console.log('Se ha cerrado la conexion con la base de datos');
        };
        if (err.code == ' ER_CON_COUNT_ERROR') {
            console.log('Demasiadas conexiones con la base de datos');
        };
        if (err.code == ' ECONNREFUSED') {
            console.log('La conexion con la base de datos ha sido rechazada');
        };
    };
    
    //Si funciona:
    //MIRAR PORQUE FUNCIONA SIN LLAVES, PERO CON ELLAS NO VA. :<
    if(connection) connection.release();
    console.log('La base de datos esta conectada');

    return;
    

});

dbconn.query = promisify(dbconn.query); //Todos los objetos de tipo query, poniendo en modo promesa todo lo que pase de query, LEER SOBRE PROGRAMACION ASINCRONA


module.exports = dbconn;