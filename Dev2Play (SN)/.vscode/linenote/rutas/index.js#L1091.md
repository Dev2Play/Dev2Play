router.get('/chat_gen/:id_usuario', isLoggedIn, async (req, res) => {
    const { id_usuario } = req.params;

    const usuario2 = await dbconn.query('SELECT * FROM usuario WHERE id_usuario = ?', id_usuario)
    const foto_perfil = await dbconn.query('SELECT foto FROM usuario WHERE id_usuario = ?', req.user.id_usuario);
    res.render('../views/partials/perfil/chat', { usuario: req.user, photo: foto_perfil[0].foto, us2: usuario2[0].nombre })


});


router.get('/nuevo_mensaje/:texto', isLoggedIn, async (req, res) => {

    const { texto } = req.params;
    //console.log(texto);
    const usuario = req.user.id_usuario;

    const nombre = await dbconn.query('SELECT * FROM usuario WHERE id_usuario = ?', usuario);
    const us_2 = await dbconn.query();

    const mensaje = await dbconn.query('INSERT INTO chat (usuario_1, usuario_2, mensaje) VALUES (?, ?, ?)', [usuario, us_2, texto]);

    res.redirect('/chat/');
});
