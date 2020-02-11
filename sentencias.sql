-- HOME
  -- publicaciones destacadas

    SELECT * FROM publicacion inner join usuario on publicacion.usuario_id = usuario.id_usuario inner join premium on usuario.premium = premium.id_premium WHERE oro > 0 or plata > 0  order by fecha_publicacion DESC LIMIT 8;

   -- proyecto destacado
      SELECT * FROM d2p.proyectos WHERE validacion=1;













--PERFIL
 --publicaiones propias
   SELECT archivo, descripcion FROM publicacion WHERE usuario_id=? ORDER BY fecha_publicacion;


 --proyectos en los que participa 
    SELECT proyectos.titulo FROM proyectos inner join seguimiento_proyectos on proyectos.id_proyectos = seguimiento_proyectos.proyectos_seguidos INNER JOIN usuario ON seguimiento_proyectos.usuario_seguidor = usuario.id_usuario where usuario_seguidor=?; 

 --roles que tiene
    SELECT rol_us, usuario FROM d2p.especialidad_usuarios WHERE usuario=?;

 --ponerse roles
    INSERT INTO roles (sonido, arte, programacion, guionista) VALUES (?, ?, ?, ?);

 --nueva publicacion
    INSERT INTO publicacion (titulo, descripcion, archivo, roles_id) VALUES (?, ?, ?, ?);

 --seguidores
    SELECT COUNT(us_seguidor) FROM seguimiento_usuarios where us_seguido=?;

 --seguidos cuenta lso usuarios que sigues
   SELECT COUNT(us_seguido) FROM seguimiento_usuarios where us_seguidor=?;

 --numero publicaciones
   SELECT COUNT(id_publicacion) FROM publicacion where usuario_id=?;









-- PUBLICACIONES

  -- general 
         SELECT * FROM publicacion ORDER BY fecha_publicacion;
         

  -- filtro rol // aqui lo que hacemos es selecionar los campos que vamos a mostrar (con el valor tabla.campo) from la tabla y la unimos a la de roles con la que tienen igual y luego podemos usar los datos de la tabla de roles
     SELECT publicacion.titulo, publicacion.descripcion, publicacion.archivo, publicacion.fecha_publicacion FROM publicacion inner join roles on publicacion.roles_id = roles.id_roles where roles.sonido=1; 

     SELECT publicacion.titulo, publicacion.descripcion, publicacion.archivo, publicacion.fecha_publicacion FROM publicacion inner join roles on publicacion.roles_id = roles.id_roles where roles.arte=1; 

     SELECT publicacion.titulo, publicacion.descripcion, publicacion.archivo, publicacion.fecha_publicacion FROM publicacion inner join roles on publicacion.roles_id = roles.id_roles where roles.programacion=1; 

     SELECT publicacion.titulo, publicacion.descripcion, publicacion.archivo, publicacion.fecha_publicacion FROM publicacion inner join roles on publicacion.roles_id = roles.id_roles where roles.guionista=1; 
  
  -- filtro recientes
     SELECT titulo, descripcion, fecha_publicacion FROM publicacion ORDER BY fecha_publicacion DESC;
  
   -- mas valorados
     SELECT titulo, descripcion, likes FROM publicacion ORDER BY likes DESC;


   -- destacados 
      SELECT * FROM publicacion inner join usuario on publicacion.usuario_id = usuario.id_usuario inner join premium on usuario.premium = premium.id_premium WHERE oro > 0 or plata > 0  order by fecha_publicacion DESC LIMIT 8;
     
       -- mas valorados de destacados
       SELECT * FROM publicacion inner join usuario on publicacion.usuario_id = usuario.id_usuario inner join premium on usuario.premium = premium.id_premium WHERE oro > 0 or plata > 0  order by likes DESC LIMIT 8;






-- REPORTES esta ha que mirar como hacerla bien
   INSERT INTO reportes (publicacion_reportada, comentario) VALUES(1, 'sdjsadkjsadh'); 











-- PROYECTOS ACTIVOS
   
   -- general
      SELECT * FROM proyectos WHERE validacion=1 ORDER BY fecha_inicio DESC;

      SELECT  *, COUNT(equipos.usuario) FROM proyectos INNER JOIN equipos ON proyectos.id_proyectos = equipos.proyecto WHERE validacion = 1;
   
   
   -- ordenar 

      -- te devuelve el numero de usuarios que estan en un proyecto
         SELECT COUNT(equipos.usuario) FROM proyectos INNER JOIN equipos ON proyectos.id_proyectos = equipos.proyecto WHERE validacion=1 ORDER BY COUNT(equipos.usuario) DESC;
     
     -- novedad
       SELECT titulo, descripcion, fecha_inicio FROM proyectos ORDER BY fecha_inicio DESC;
     
     
     -- plazo lejano
        SELECT titulo, descripcion, fecha_inicio FROM proyectos ORDER BY fecha_final DESC;
     
     
     -- palzo cercano 
     	SELECT titulo, descripcion, fecha_inicio FROM proyectos ORDER BY fecha_final ASC;
     
     --categorias
     
      SELECT proyectos.titulo, proyectos.descripcion FROM proyectos inner join genero on proyectos.genero_id = genero.id_genero where genero.lucha=1; 
      SELECT proyectos.titulo, proyectos.descripcion FROM proyectos inner join genero on proyectos.genero_id = genero.id_genero where genero.aventuras=1; 
      SELECT proyectos.titulo, proyectos.descripcion FROM proyectos inner join genero on proyectos.genero_id = genero.id_genero where genero.estrategia=1; 
      SELECT proyectos.titulo, proyectos.descripcion FROM proyectos inner join genero on proyectos.genero_id = genero.id_genero where genero.simulacion=1; 
      SELECT proyectos.titulo, proyectos.descripcion FROM proyectos inner join genero on proyectos.genero_id = genero.id_genero where genero.deportes=1; 
      SELECT proyectos.titulo, proyectos.descripcion FROM proyectos inner join genero on proyectos.genero_id = genero.id_genero where genero.musica=1;   












-- FICHA DE PROYECTO ver la que has clickado

   SELECT * FROM proyectos WHERE id_proyectos = id_proyectos;

-- FORMULARIO PROYECTO
    INSERT INTO proyectos (titulo, descripcion) VALUES (?, ?); --PENDIENTE


-- TAREAS
  -- tarea entregada
     SELECT nombre, descripcion FROM tareas WHERE entregados=1;

  -- tarea negativa
      SELECT nombre, descripcion FROM tareas WHERE entregados=0;


  -- nueva tarea
     INSERT INTO tareas (nombre, descripcion, fecha_inicio, fecha_final) VALUES (?, ?, ?, ?);

--FIN TAREAS



-- TIENDA 
  -- general salen todos los juegos
    SELECT * FROM tienda order by fecha_subida DESC;

   -- generos de juego ordenados por la fecha mas reciente 
    SELECT * FROM tienda inner join genero on tienda.genero_id = genero.id_genero where genero.lucha=1 order by fecha_subida DESC;
    SELECT * FROM tienda inner join genero on tienda.genero_id = genero.id_genero where genero.aventuras=1 order by fecha_subida DESC;
    SELECT * FROM tienda inner join genero on tienda.genero_id = genero.id_genero where genero.estrategia=1 order by fecha_subida DESC;
    SELECT * FROM tienda inner join genero on tienda.genero_id = genero.id_genero where genero.simulacion=1 order by fecha_subida DESC;
    SELECT * FROM tienda inner join genero on tienda.genero_id = genero.id_genero where genero.deportes=1 order by fecha_subida DESC;
    SELECT * FROM tienda inner join genero on tienda.genero_id = genero.id_genero where genero.musica=1 order by fecha_subida DESC;

  -- precio mas bajo
     SELECT * from tienda order by precio DESC;


-- FIN TIENDA
    


-- ver proyectos en los que participas
   SELECT titulo FROM proyectos inner join equipos on proyectos.id_proyectos = equipos.proyecto INNER JOIN usuario ON usuario.id_usuario = equipos.usuario where id_usuario='id_usuario'; -- para hacer pruebas usar un numero de usuario


-- selecionar los usuarios y los roles que hay dentro de un proyecto
    SELECT proyectos.titulo, proyectos.descripcion, usuario.nombre, roles.id_roles FROM proyectos inner join equipos on proyectos.id_proyectos = equipos.proyecto INNER JOIN usuario ON usuario.id_usuario = equipos.usuario INNER JOIN  roles ON roles.id_roles = equipos.rol_eq;
