-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: d2p
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `calificacion_demos`
--

DROP TABLE IF EXISTS `calificacion_demos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calificacion_demos` (
  `id_calificacion_demos` int(11) NOT NULL AUTO_INCREMENT,
  `demos` int(11) NOT NULL,
  `musica` varchar(60) NOT NULL,
  `jugabilidad` varchar(60) NOT NULL,
  `graficos` varchar(60) NOT NULL,
  `historia` varchar(60) NOT NULL,
  `general` varchar(60) NOT NULL,
  `comentario` mediumtext,
  PRIMARY KEY (`id_calificacion_demos`),
  KEY `fk_demos_idx` (`demos`),
  CONSTRAINT `fk_demos` FOREIGN KEY (`demos`) REFERENCES `demos` (`id_demos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificacion_demos`
--

LOCK TABLES `calificacion_demos` WRITE;
/*!40000 ALTER TABLE `calificacion_demos` DISABLE KEYS */;
/*!40000 ALTER TABLE `calificacion_demos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `id_chat` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_1` int(11) NOT NULL,
  `usuario_2` int(11) NOT NULL,
  `mensaje` varchar(450) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_chat`),
  KEY `fk_usuario_2_idx` (`usuario_2`),
  KEY `fk_usuario_1_idx` (`usuario_1`),
  CONSTRAINT `fk_usuario_1` FOREIGN KEY (`usuario_1`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `fk_usuario_2` FOREIGN KEY (`usuario_2`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_equipo`
--

DROP TABLE IF EXISTS `chat_equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_equipo` (
  `id_chat_equipo` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto` int(11) NOT NULL,
  `usuarios` int(11) NOT NULL,
  `mensaje` varchar(450) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_chat_equipo`),
  KEY `fk_usuario_idx` (`usuarios`),
  KEY `fk_proyecto_idx` (`proyecto`),
  CONSTRAINT `fk_proyecto_chat` FOREIGN KEY (`proyecto`) REFERENCES `proyectos` (`id_proyectos`),
  CONSTRAINT `fk_usuario_chat` FOREIGN KEY (`usuarios`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_equipo`
--

LOCK TABLES `chat_equipo` WRITE;
/*!40000 ALTER TABLE `chat_equipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demos`
--

DROP TABLE IF EXISTS `demos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demos` (
  `id_demos` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `link` varchar(255) NOT NULL,
  `fecha_subida` date NOT NULL,
  PRIMARY KEY (`id_demos`),
  KEY `fk_proyecto_idx` (`proyecto`),
  CONSTRAINT `fk_proyecto_demo` FOREIGN KEY (`proyecto`) REFERENCES `proyectos` (`id_proyectos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demos`
--

LOCK TABLES `demos` WRITE;
/*!40000 ALTER TABLE `demos` DISABLE KEYS */;
/*!40000 ALTER TABLE `demos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipos` (
  `id_equipos` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `calificacion` tinyint(2) DEFAULT NULL,
  `rol_eq` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_equipos`),
  KEY `fk_usuario_idx` (`usuario`),
  KEY `fk_proyecto` (`proyecto`),
  KEY `fk_rol_eq_idx` (`rol_eq`),
  CONSTRAINT `fk_proyecto` FOREIGN KEY (`proyecto`) REFERENCES `proyectos` (`id_proyectos`),
  CONSTRAINT `fk_rol_eq` FOREIGN KEY (`rol_eq`) REFERENCES `roles` (`id_roles`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (1,1,2,10,8),(2,1,3,10,5);
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad_usuarios`
--

DROP TABLE IF EXISTS `especialidad_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidad_usuarios` (
  `id_rol_usuarios` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) NOT NULL,
  `rol_us` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_rol_usuarios`),
  KEY `fk_usuario_idx` (`usuario`),
  KEY `fk_rol_us_idx` (`rol_us`),
  CONSTRAINT `fk_rol_us` FOREIGN KEY (`rol_us`) REFERENCES `roles` (`id_roles`),
  CONSTRAINT `fk_usuar_id` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad_usuarios`
--

LOCK TABLES `especialidad_usuarios` WRITE;
/*!40000 ALTER TABLE `especialidad_usuarios` DISABLE KEYS */;
INSERT INTO `especialidad_usuarios` VALUES (1,2,4),(2,4,6),(3,3,5),(4,5,7),(5,8,1),(6,7,9),(7,9,2),(8,1,3),(9,6,8);
/*!40000 ALTER TABLE `especialidad_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `id_genero` int(11) NOT NULL,
  `lucha` tinyint(1) DEFAULT NULL,
  `aventuras` tinyint(1) DEFAULT NULL,
  `estrategia` tinyint(1) DEFAULT NULL,
  `simulacion` tinyint(1) DEFAULT NULL,
  `deportes` tinyint(1) DEFAULT NULL,
  `musica` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,1,0,0,0,0,0),(2,0,1,0,0,0,0);
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niveles`
--

DROP TABLE IF EXISTS `niveles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `niveles` (
  `idniveles` int(11) NOT NULL,
  `lider` varchar(45) DEFAULT NULL,
  `administrador` varchar(45) DEFAULT NULL,
  `superadministrador` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idniveles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveles`
--

LOCK TABLES `niveles` WRITE;
/*!40000 ALTER TABLE `niveles` DISABLE KEYS */;
/*!40000 ALTER TABLE `niveles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `premium`
--

DROP TABLE IF EXISTS `premium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `premium` (
  `id_premium` int(11) NOT NULL AUTO_INCREMENT,
  `plata` tinyint(1) DEFAULT NULL,
  `oro` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_premium`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premium`
--

LOCK TABLES `premium` WRITE;
/*!40000 ALTER TABLE `premium` DISABLE KEYS */;
INSERT INTO `premium` VALUES (1,1,NULL),(2,NULL,1),(3,NULL,NULL);
/*!40000 ALTER TABLE `premium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyectos` (
  `id_proyectos` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `descripcion` mediumtext NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_final` date NOT NULL,
  `validacion` tinyint(1) DEFAULT NULL,
  `lider` int(11) NOT NULL,
  `genero_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_proyectos`),
  KEY `fk_lider_idx` (`lider`),
  KEY `fk_genero_proy_idx` (`genero_id`),
  CONSTRAINT `fk_genero_proy` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id_genero`),
  CONSTRAINT `fk_lider` FOREIGN KEY (`lider`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos`
--

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;
INSERT INTO `proyectos` VALUES (1,'d','d','2019-01-01','2019-01-02',1,1,1),(2,'s','d','2019-01-02','2019-01-03',NULL,2,2),(3,'c','d','2019-01-03','2019-01-04',NULL,3,NULL);
/*!40000 ALTER TABLE `proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicacion`
--

DROP TABLE IF EXISTS `publicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicacion` (
  `id_publicacion` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `descripcion` mediumtext,
  `archivo` varchar(255) NOT NULL,
  `enlace` varchar(255) DEFAULT NULL,
  `likes` tinyint(20) DEFAULT NULL,
  `roles_id` int(11) NOT NULL,
  `fecha_publicacion` date NOT NULL,
  PRIMARY KEY (`id_publicacion`),
  KEY `fk_usuario_id_idx` (`usuario_id`),
  KEY `fk_rol_id_idx` (`roles_id`),
  CONSTRAINT `fk_rol_id` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id_roles`),
  CONSTRAINT `fk_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicacion`
--

LOCK TABLES `publicacion` WRITE;
/*!40000 ALTER TABLE `publicacion` DISABLE KEYS */;
INSERT INTO `publicacion` VALUES (1,5,'guitarra','gggggg','ggggg','eeee',2,6,'2017-01-05'),(2,7,'humo','hhhhhh','hhhh',NULL,6,4,'2014-01-05'),(3,4,'iluminacion','iiiiiii','i',NULL,8,3,'2017-06-05'),(4,1,'jarra','jjjjjj','j',NULL,99,7,'2017-01-15'),(5,2,'kiwi','kkkkkk','k',NULL,7,9,'2016-09-05'),(6,9,'liberar','lllllllll','l',NULL,5,2,'2017-01-08'),(7,3,'minimo','mmmm','m',NULL,7,5,'2018-11-05'),(8,6,'noche','n','nnn',NULL,NULL,8,'2019-01-05'),(9,8,'tabique','tttttt','t',NULL,NULL,1,'2020-01-05');
/*!40000 ALTER TABLE `publicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportes`
--

DROP TABLE IF EXISTS `reportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportes` (
  `id_reportes` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_que_reporta` int(11) DEFAULT NULL,
  `usuario_reportado` int(11) DEFAULT NULL,
  `publicacion_reportada` int(11) NOT NULL,
  `not_safe_words` varchar(45) DEFAULT NULL,
  `plagio` varchar(45) DEFAULT NULL,
  `ofensivo` varchar(45) DEFAULT NULL,
  `comentario` mediumtext NOT NULL,
  `validacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_reportes`),
  KEY `fk_usuario_reporta_idx` (`usuario_que_reporta`),
  KEY `fk_usuario_reportado_idx` (`usuario_reportado`),
  KEY `fk_publicacion_reportada_idx` (`publicacion_reportada`),
  CONSTRAINT `fk_publicacion_reportada` FOREIGN KEY (`publicacion_reportada`) REFERENCES `publicacion` (`id_publicacion`),
  CONSTRAINT `fk_usuario_reporta` FOREIGN KEY (`usuario_que_reporta`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `fk_usuario_reportado` FOREIGN KEY (`usuario_reportado`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportes`
--

LOCK TABLES `reportes` WRITE;
/*!40000 ALTER TABLE `reportes` DISABLE KEYS */;
INSERT INTO `reportes` VALUES (1,NULL,NULL,1,NULL,NULL,NULL,'sdjsadkjsadh',NULL);
/*!40000 ALTER TABLE `reportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_roles` int(11) NOT NULL,
  `sonido` tinyint(1) DEFAULT '0',
  `arte` tinyint(1) DEFAULT '0',
  `programacion` tinyint(1) DEFAULT '0',
  `guionista` tinyint(1) DEFAULT '0',
  `otros` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id_roles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,0,1,1,0,NULL),(2,1,0,1,1,NULL),(3,1,0,1,1,NULL),(4,0,0,1,1,NULL),(5,0,0,1,0,NULL),(6,0,1,0,1,NULL),(7,1,0,0,0,NULL),(8,1,0,0,1,NULL),(9,1,1,1,0,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguimiento_proyectos`
--

DROP TABLE IF EXISTS `seguimiento_proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguimiento_proyectos` (
  `id_seguimiento_proyectos` int(11) NOT NULL AUTO_INCREMENT,
  `proyectos_seguidos` int(11) NOT NULL,
  `usuario_seguidor` int(11) NOT NULL,
  PRIMARY KEY (`id_seguimiento_proyectos`),
  KEY `fk_proyecto_seguido_idx` (`proyectos_seguidos`),
  KEY `fk_usuario_seguidor_idx` (`usuario_seguidor`),
  CONSTRAINT `fk_proyecto_seguido` FOREIGN KEY (`proyectos_seguidos`) REFERENCES `proyectos` (`id_proyectos`),
  CONSTRAINT `fk_usuario_seguidor` FOREIGN KEY (`usuario_seguidor`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguimiento_proyectos`
--

LOCK TABLES `seguimiento_proyectos` WRITE;
/*!40000 ALTER TABLE `seguimiento_proyectos` DISABLE KEYS */;
INSERT INTO `seguimiento_proyectos` VALUES (1,1,4),(2,2,5),(3,3,6);
/*!40000 ALTER TABLE `seguimiento_proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguimiento_usuarios`
--

DROP TABLE IF EXISTS `seguimiento_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguimiento_usuarios` (
  `id_seguimiento_usuarios` int(11) NOT NULL AUTO_INCREMENT,
  `us_seguido` int(11) NOT NULL,
  `us_seguidor` int(11) NOT NULL,
  PRIMARY KEY (`id_seguimiento_usuarios`),
  KEY `fk_us_seguido_idx` (`us_seguido`),
  KEY `fk_us_seguidor_idx` (`us_seguidor`),
  CONSTRAINT `fk_us_seguido` FOREIGN KEY (`us_seguido`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `fk_us_seguidor` FOREIGN KEY (`us_seguidor`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguimiento_usuarios`
--

LOCK TABLES `seguimiento_usuarios` WRITE;
/*!40000 ALTER TABLE `seguimiento_usuarios` DISABLE KEYS */;
INSERT INTO `seguimiento_usuarios` VALUES (1,2,3),(2,3,4),(3,3,5),(4,3,6);
/*!40000 ALTER TABLE `seguimiento_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tareas`
--

DROP TABLE IF EXISTS `tareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tareas` (
  `id_tareas` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` mediumtext NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_final` date NOT NULL,
  `fecha_cumplimiento` date NOT NULL,
  `entregados` tinyint(1) DEFAULT NULL,
  `enlace` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tareas`),
  KEY `fk_usuario_idx` (`usuario`),
  KEY `fk_proyecto_idx` (`proyecto`),
  CONSTRAINT `fk_pycto` FOREIGN KEY (`proyecto`) REFERENCES `proyectos` (`id_proyectos`),
  CONSTRAINT `fk_us_tar` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tareas`
--

LOCK TABLES `tareas` WRITE;
/*!40000 ALTER TABLE `tareas` DISABLE KEYS */;
INSERT INTO `tareas` VALUES (1,1,4,'codigo','entregar el codigo','2019-01-01','2019-01-02','2019-01-03',1,NULL),(2,2,5,'render','renderizar texturas','2019-01-03','2019-01-05','2019-01-04',1,NULL),(3,3,6,'bug','arreglar los bug','2019-01-05','2019-02-01','2019-01-19',0,NULL);
/*!40000 ALTER TABLE `tareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tienda`
--

DROP TABLE IF EXISTS `tienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tienda` (
  `idTienda` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_vendedor` int(11) NOT NULL,
  `usuario_comprador` int(11) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `likes` varchar(45) DEFAULT NULL,
  `fecha_subida` date DEFAULT NULL,
  `genero_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTienda`),
  KEY `fk_usuario_vendedor_idx` (`usuario_vendedor`),
  KEY `fk_usuario_comprador_idx` (`usuario_comprador`),
  KEY `fk_genero_tienda_idx` (`genero_id`),
  CONSTRAINT `fk_genero_tienda` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id_genero`),
  CONSTRAINT `fk_usuario_comprador` FOREIGN KEY (`usuario_comprador`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `fk_usuario_vendedor` FOREIGN KEY (`usuario_vendedor`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienda`
--

LOCK TABLES `tienda` WRITE;
/*!40000 ALTER TABLE `tienda` DISABLE KEYS */;
INSERT INTO `tienda` VALUES (1,2,5,NULL,10,NULL,'2017-01-01',1),(2,3,6,NULL,11,NULL,'2017-05-01',2),(3,4,7,NULL,12,NULL,'2019-08-01',1);
/*!40000 ALTER TABLE `tienda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `nick` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `correo` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pais` varchar(30) DEFAULT NULL,
  `cuidad` varchar(30) DEFAULT NULL,
  `fecha_de_alta` date NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `nivel` int(11) DEFAULT NULL,
  `premium` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_nivel_idx` (`nivel`),
  KEY `fk_premium_idx` (`premium`),
  CONSTRAINT `fk_nivel` FOREIGN KEY (`nivel`) REFERENCES `niveles` (`idniveles`),
  CONSTRAINT `fk_premium` FOREIGN KEY (`premium`) REFERENCES `premium` (`id_premium`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Omar','Wall','12','omar@gmail.com','España','Palencia','2019-01-01',NULL,NULL,2),(2,'Hector','Dic','21','hec@gmail.com','España','León','2019-02-02',NULL,NULL,1),(3,'Sergio','Verde','23','verde@gmail.com','España','León','2019-01-02',NULL,NULL,3),(4,'Jesus','yisus','33','crist@gmail.com','Francia','Paris','2018-02-28',NULL,NULL,NULL),(5,'Unai','Escandaleras','09','unai@gmail.com','España','Bilbao','2018-09-03',NULL,NULL,NULL),(6,'Keannu','Boss','98','keannu@gmail.com','Canada','Canada','2016-07-17',NULL,NULL,NULL),(7,'Kevin','Durant','88','nba@gmail.com','EEUU','Chicago','2017-04-17',NULL,NULL,NULL),(8,'Paco','Copa ','ere','paco12@gmail.com','Alemania','Berlin','2019-05-19',NULL,NULL,NULL),(9,'John','Boom','nb','johny@gmail.com','EEUU','Nueva York','2017-09-30',NULL,NULL,NULL),(10,'Astrid','defcn2','0909','astrid@gmail.com','Japon','Tokio','2016-01-30',NULL,NULL,NULL),(11,'Alejandro','Magno','888','alex@gmail.com','China','Hong Kong','2017-08-28',NULL,NULL,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-23 21:50:39
