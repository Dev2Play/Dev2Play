router.post('/upload', isLoggedIn, async function(req, res) {

    const { titulo, descripcion, genero,  precio, sistema_operativo, memoria, graficos, procesador, almacenamiento } = req.body;
    const { imagen } = req.files;
    console.log(req.files)
    imagen.mv('public/images')

    var d = new Date();
    var fecha_inicio = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate();
 
    const nuevo_juego = {
        titulo,
        descripcion,
        genero,
        precio,
        imagen,
        sistema_operativo,
        memoria, graficos,
        procesador, 
        almacenamiento,
        fecha_subida: fecha_inicio
    };
    const jueg= await dbconn.query('INSERT INTO juegos set ?', [nuevo_juego]); //como hacer que le genero entre
    const juegos_tienda = await dbconn.query('SELECT * FROM juegos INNER JOIN genero ON juegos.genero = genero.id_genero WHERE id_genero < 10 ORDER BY fecha_subida DESC;');
    
    res.redirect('tienda'); 
  });