-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificacion_demos`
--

LOCK TABLES `calificacion_demos` WRITE;
/*!40000 ALTER TABLE `calificacion_demos` DISABLE KEYS */;
INSERT INTO `calificacion_demos` VALUES (1,3,'5','6','7','3','5','se puede mejorar'),(2,2,'7','7','8','7','8','gran juego');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (1,1,3,'fffffffffff','2020-01-03'),(2,3,2,'jajajja','2020-01-09'),(3,1,2,'excelente','2020-01-10');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_equipo`
--

LOCK TABLES `chat_equipo` WRITE;
/*!40000 ALTER TABLE `chat_equipo` DISABLE KEYS */;
INSERT INTO `chat_equipo` VALUES (1,2,2,'dsds','2020-01-01'),(2,1,3,'ww','2020-01-01');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demos`
--

LOCK TABLES `demos` WRITE;
/*!40000 ALTER TABLE `demos` DISABLE KEYS */;
INSERT INTO `demos` VALUES (1,3,'snake','s','2020-01-04'),(2,1,'batalla','s','2020-01-02'),(3,2,'hor','s','2020-01-03');
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
  `fecha_inicio` date NOT NULL,
  `fecha_final` date NOT NULL,
  `cumplimiento` varchar(45) DEFAULT NULL,
  `calificacion` varchar(45) DEFAULT NULL,
  `especialidad` int(11) NOT NULL,
  PRIMARY KEY (`id_equipos`),
  KEY `fk_usuario_idx` (`usuario`),
  KEY `fk_especialidad_idx` (`especialidad`),
  KEY `fk_proyecto` (`proyecto`),
  CONSTRAINT `fk_especialidad` FOREIGN KEY (`especialidad`) REFERENCES `especialidad` (`id_especialidad`),
  CONSTRAINT `fk_proyecto` FOREIGN KEY (`proyecto`) REFERENCES `proyectos` (`id_proyectos`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (1,2,1,'2020-01-01','2020-03-01','si','8',2),(2,3,2,'2020-01-05','2020-02-01','no','8',1),(3,2,3,'2020-01-04','2020-02-03','si','8',3);
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad`
--

DROP TABLE IF EXISTS `especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidad` (
  `id_especialidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `roles` int(11) NOT NULL,
  PRIMARY KEY (`id_especialidad`),
  KEY `fk_roles_idx` (`roles`),
  CONSTRAINT `fk_roles` FOREIGN KEY (`roles`) REFERENCES `roles` (`id_roles`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad`
--

LOCK TABLES `especialidad` WRITE;
/*!40000 ALTER TABLE `especialidad` DISABLE KEYS */;
INSERT INTO `especialidad` VALUES (1,'Programador',3),(2,'Dibujante',4),(3,'Multitarea',1),(4,'guionista',2);
/*!40000 ALTER TABLE `especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad_usuarios`
--

DROP TABLE IF EXISTS `especialidad_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidad_usuarios` (
  `id_especialidad_usuarios` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) NOT NULL,
  `especialidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_especialidad_usuarios`),
  KEY `fk_especialidad_idx` (`especialidad`),
  KEY `fk_usuario_idx` (`usuario`),
  CONSTRAINT `fk_esp` FOREIGN KEY (`especialidad`) REFERENCES `especialidad` (`id_especialidad`),
  CONSTRAINT `fk_usuar_id` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad_usuarios`
--

LOCK TABLES `especialidad_usuarios` WRITE;
/*!40000 ALTER TABLE `especialidad_usuarios` DISABLE KEYS */;
INSERT INTO `especialidad_usuarios` VALUES (1,3,2),(2,1,1),(3,2,3);
/*!40000 ALTER TABLE `especialidad_usuarios` ENABLE KEYS */;
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
  `imagen` mediumblob,
  `fecha_inicio` date NOT NULL,
  `fecha_final` date NOT NULL,
  `likes` tinyint(4) DEFAULT NULL,
  `link_final` varchar(255) DEFAULT NULL,
  `exito` varchar(45) DEFAULT NULL,
  `lider` int(11) NOT NULL,
  `promocion` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id_proyectos`),
  KEY `fk_lider_idx` (`lider`),
  CONSTRAINT `fk_lider` FOREIGN KEY (`lider`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos`
--

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;
INSERT INTO `proyectos` VALUES (1,'bugi','juego de hormigas con toques de fantasia',NULL,'2019-11-12','2020-11-06',100,NULL,'si',3,'gracias a dev 2 play'),(2,'snake','como el de nokia',NULL,'2019-12-12','2020-01-01',34,NULL,'si',2,'lo hemos bordado'),(3,'tierra media','juego rpg con toques de fantasia',NULL,'2019-11-11','2020-11-11',100,NULL,'si',1,'gracias');
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
  `archivo` mediumblob,
  `enlace` varchar(255) DEFAULT NULL,
  `especialidad_id` int(11) NOT NULL,
  `fecha_publicacion` date NOT NULL,
  PRIMARY KEY (`id_publicacion`),
  KEY `fk_usuario_id_idx` (`usuario_id`),
  KEY `fk_especialidad_id_idx` (`especialidad_id`),
  CONSTRAINT `fk_especialidad_id` FOREIGN KEY (`especialidad_id`) REFERENCES `especialidad` (`id_especialidad`),
  CONSTRAINT `fk_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicacion`
--

LOCK TABLES `publicacion` WRITE;
/*!40000 ALTER TABLE `publicacion` DISABLE KEYS */;
INSERT INTO `publicacion` VALUES (1,2,'nuevo','soy nuevo y enseño mi trabajo',NULL,'https://www.vistoenlasredes.com/',1,'2020-01-01'),(2,3,'hola','',NULL,'https://www.vistoenlasredes.com/',4,'2020-01-02');
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
  `usuario_que_reporta` int(11) NOT NULL,
  `usuario_reportado` int(11) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportes`
--

LOCK TABLES `reportes` WRITE;
/*!40000 ALTER TABLE `reportes` DISABLE KEYS */;
INSERT INTO `reportes` VALUES (1,2,3,1,NULL,NULL,NULL,'la publicacion no es suya',NULL),(2,3,1,2,NULL,NULL,NULL,'la publicacion es ofensiva',NULL);
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
  `sonido` varchar(45) DEFAULT NULL,
  `artista` varchar(45) DEFAULT NULL,
  `programador` varchar(45) DEFAULT NULL,
  `guionista` varchar(45) DEFAULT NULL,
  `otros` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_roles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'tecnico','dibujante',NULL,NULL,NULL),(2,NULL,NULL,'programador en C',NULL,NULL),(3,'musico',NULL,NULL,'accion',NULL),(4,NULL,NULL,NULL,NULL,'organizador de competencias');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguimiento_proyectos`
--

LOCK TABLES `seguimiento_proyectos` WRITE;
/*!40000 ALTER TABLE `seguimiento_proyectos` DISABLE KEYS */;
INSERT INTO `seguimiento_proyectos` VALUES (1,1,3),(2,1,1),(3,2,1),(4,3,2),(5,2,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguimiento_usuarios`
--

LOCK TABLES `seguimiento_usuarios` WRITE;
/*!40000 ALTER TABLE `seguimiento_usuarios` DISABLE KEYS */;
INSERT INTO `seguimiento_usuarios` VALUES (1,2,3),(2,3,1),(3,1,2);
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
  `entregados` varchar(45) DEFAULT NULL,
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
INSERT INTO `tareas` VALUES (1,3,2,'Hitos','realizar los hitos','2019-12-11','2020-01-01','2019-12-31','1','https://www.vrutal.com/humor'),(2,2,3,'depurar','hayq ue depuerar los errores','2019-12-12','2020-01-01','2020-02-02',NULL,'https://www.humorenserie.com/'),(3,1,1,'sonido','necesito todo lo de sonido','2020-01-01','2020-02-01','2020-03-01','3','https://www.vistoenlasredes.com/');
/*!40000 ALTER TABLE `tareas` ENABLE KEYS */;
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
  `foto` mediumblob,
  `nivel` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Omar','om','pas1','omar@gmail.com','España','Palencia','2019-11-11',NULL,NULL),(2,'Hector','hec','pas2','hector@gmail.com','España','León','2019-11-11',NULL,NULL),(3,'Sergio','verd','pas3','sergio@gmail.com','España','León','2019-11-11',NULL,NULL);
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

-- Dump completed on 2020-01-08 18:30:15
