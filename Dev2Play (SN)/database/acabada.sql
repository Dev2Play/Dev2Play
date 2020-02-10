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
  KEY `fk_roleq_idx` (`rol_eq`),
  CONSTRAINT `fk_proyecto` FOREIGN KEY (`proyecto`) REFERENCES `proyectos` (`id_proyectos`),
  CONSTRAINT `fk_roleq` FOREIGN KEY (`rol_eq`) REFERENCES `roles` (`id_roles`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (1,1,2,10,2),(2,1,3,10,5),(3,1,13,10,2),(4,1,13,NULL,NULL),(5,1,13,NULL,NULL),(23,12,12,NULL,NULL),(24,11,12,NULL,NULL),(25,37,14,NULL,NULL),(26,11,14,NULL,NULL),(27,12,57,NULL,NULL),(28,38,58,NULL,NULL),(29,39,58,NULL,NULL),(30,1,59,NULL,NULL);
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
  `id_rol_usuarios` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) NOT NULL,
  `rol_us` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_rol_usuarios`),
  KEY `fk_usuario_idx` (`usuario`),
  KEY `fk_rolesp_idx` (`rol_us`),
  CONSTRAINT `fk_rolesp` FOREIGN KEY (`rol_us`) REFERENCES `roles` (`id_roles`),
  CONSTRAINT `fk_usuar_id` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad_usuarios`
--

LOCK TABLES `especialidad_usuarios` WRITE;
/*!40000 ALTER TABLE `especialidad_usuarios` DISABLE KEYS */;
INSERT INTO `especialidad_usuarios` VALUES (1,2,4),(2,4,6),(3,3,5),(4,5,6),(5,8,1),(6,7,6),(7,9,2),(8,1,3),(9,6,6),(10,12,4),(11,13,2),(12,13,4),(13,12,2),(14,12,6),(15,13,1),(21,55,3),(22,13,5),(23,12,3),(24,12,4),(25,12,5),(26,12,6),(27,12,2),(28,12,1);
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
-- Table structure for table `gestor`
--

DROP TABLE IF EXISTS `gestor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gestor` (
  `id_gestor` int(11) NOT NULL AUTO_INCREMENT,
  `proy_gest` int(11) NOT NULL,
  `archivos` varchar(255) NOT NULL,
  PRIMARY KEY (`id_gestor`),
  KEY `fk_pro_gest_idx` (`proy_gest`),
  CONSTRAINT `fk_pro_gest` FOREIGN KEY (`proy_gest`) REFERENCES `proyectos` (`id_proyectos`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestor`
--

LOCK TABLES `gestor` WRITE;
/*!40000 ALTER TABLE `gestor` DISABLE KEYS */;
INSERT INTO `gestor` VALUES (1,1,'gestor/gokuaa.jpg'),(2,1,'gestor/hyper.png'),(3,1,'gestor/Alan Turing Biography.docx'),(4,1,'gestor/python.txt'),(5,1,'gestor/white.py'),(6,1,'gestor/goku2.jpg'),(7,1,'gestor/chiinf.jpg'),(8,1,'gestor/maquina.jpg'),(9,1,'gestor/hyper.png');
/*!40000 ALTER TABLE `gestor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juegos`
--

DROP TABLE IF EXISTS `juegos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juegos` (
  `id_juegos` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) DEFAULT NULL,
  `descripcion` mediumtext,
  `genero` int(11) DEFAULT NULL,
  `precio` decimal(6,2) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `sistema_operativo` varchar(150) DEFAULT NULL,
  `memoria` varchar(45) DEFAULT NULL,
  `graficos` varchar(45) DEFAULT NULL,
  `procesador` varchar(45) DEFAULT NULL,
  `almacenamiento` varchar(45) DEFAULT NULL,
  `fecha_subida` date DEFAULT NULL,
  PRIMARY KEY (`id_juegos`),
  KEY `fk_genero_jueg_idx` (`genero`),
  CONSTRAINT `fk_genero_jueg` FOREIGN KEY (`genero`) REFERENCES `genero` (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juegos`
--

LOCK TABLES `juegos` WRITE;
/*!40000 ALTER TABLE `juegos` DISABLE KEYS */;
INSERT INTO `juegos` VALUES (1,'The Secret Of Monkey Island','Pues un clasicazo que te cagas',2,12.99,'images/portada.jpg','	Windows 10, 64 bits','	8g','	GeForce GTX 750 Ti or Radeon HD 7950','	Intel Core i5-2400 or AMD Phenom II X6 1100T',' 	36 GB de espacio disponible',NULL),(2,'Street Figther ALPHA','haduooken y tal',1,20.99,'images/portada2.jpg','Windows 10, 64 bits','8g','GeForce GTX 750 Ti or Radeon HD 7950','	Intel Core i5-2400 or AMD Phenom II X6 1100T','	36 GB de espacio disponible',NULL),(15,'xcxvbnbvcxvbnbvbcvxbvbcbvbnvcb','bvcbvcbvcbcvbvcbcvb',1,21.00,'juegos/hyper.png','','','','','','2020-02-06'),(16,'adsad','sdsa',1,2.00,'juegos/goku.jpg','','','','','','2020-02-06'),(17,'Dragon ball Kakarot original','version original',1,3.00,'https://as.com/meristation/imagenes/2019/09/12/game_cover/104851791568285651.jpg','','','','','','2020-02-06'),(27,'sadsad','asdsd',NULL,2.00,'juegos/windows L.png','','','','','','2020-02-07');
/*!40000 ALTER TABLE `juegos` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premium`
--

LOCK TABLES `premium` WRITE;
/*!40000 ALTER TABLE `premium` DISABLE KEYS */;
INSERT INTO `premium` VALUES (1,1,NULL),(2,NULL,1),(3,NULL,1);
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
  `lider` int(11) DEFAULT NULL,
  `genero_id` int(11) DEFAULT NULL,
  `roles` varchar(200) DEFAULT NULL,
  `validacion` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_proyectos`),
  KEY `fk_lider_idx` (`lider`),
  KEY `fk_genero_proy_idx` (`genero_id`),
  CONSTRAINT `fk_genero_proy` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id_genero`),
  CONSTRAINT `fk_lider` FOREIGN KEY (`lider`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos`
--

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;
INSERT INTO `proyectos` VALUES (1,'Dev2Play','Aplicacion desarrollada para fomentar la creacion de videojuegos de genero independiente','2019-01-01','2019-01-02',1,1,'Necesitamos programadores y diseñadores para poder crear nuestra aplicacion y tenerla completa al 100% en el menor tiempo posible',1),(2,'s','d','2019-01-02','2019-01-03',2,2,NULL,1),(3,'c','d','2019-01-03','2019-01-04',3,NULL,NULL,1),(4,'1','asdsadas','2020-02-05','2020-04-05',NULL,NULL,'asdsadas',1),(11,'yandrak','asdasdsad','2020-02-10','2020-04-10',NULL,NULL,'adasdsa',1),(12,'sergio llegas tarde','no tengo','2020-02-10','2020-04-10',12,NULL,'a omar en la base de datos',1),(35,'asd','asd','2020-02-10','2020-04-10',14,NULL,'asd',1),(36,'asd','asd','2020-02-10','2020-04-10',14,NULL,'asd',1),(37,'asdas','asd','2020-02-10','2020-04-10',14,NULL,'asd',1),(38,'3','3','2020-02-10','2020-04-10',58,NULL,'3',1),(39,'asd','asd','2020-02-10','2020-04-10',58,NULL,'asd',1);
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
  `titulo` varchar(150) DEFAULT NULL,
  `descripcion` mediumtext,
  `archivo` varchar(255) DEFAULT NULL,
  `enlace` varchar(255) DEFAULT NULL,
  `likes` tinyint(20) DEFAULT '0',
  `roles_id` int(11) DEFAULT NULL,
  `fecha_publicacion` date NOT NULL,
  PRIMARY KEY (`id_publicacion`),
  KEY `fk_usuario_id_idx` (`usuario_id`),
  KEY `fk_rolpub_idx` (`roles_id`),
  CONSTRAINT `fk_rolpub` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id_roles`),
  CONSTRAINT `fk_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicacion`
--

LOCK TABLES `publicacion` WRITE;
/*!40000 ALTER TABLE `publicacion` DISABLE KEYS */;
INSERT INTO `publicacion` VALUES (1,5,'guitarra','gggggg','ggggg','https://as.com/meristation/imagenes/2019/01/31/noticias/1548966634_757466_1548966672_noticia_normal.jpg',2,6,'2017-01-05'),(2,7,'humo','hhhhhh','hhhh','https://capitalgaming.mx/wp-content/uploads/2019/03/jojosss-2100x1200.jpeg',6,4,'2014-01-05'),(3,4,'iluminacion','iiiiiii','i','https://ramenparados.com/wp-content/uploads/2017/03/5925381-1000x600.jpg',8,3,'2017-06-05'),(4,1,'jarra','jjjjjj','j','https://www.lavanguardia.com/r/GODO/LV/p7/WebSite/2020/01/27/Recortada/img_mbrugat_20191004-142541_imagenes_lv_terceros_1569563295_099038_1569563353_noticia_normal_4_7_797996992-kf9E-U473165516582fPF-992x558@LaVanguardia-Web.jpg',101,6,'2017-01-15'),(5,2,'kiwi','kkkkkk','k','https://media.metrolatam.com/2019/10/03/mariokarttour800-e1d9469db342332768b0ad8a59ff4869-600x400.jpg',8,6,'2016-09-05'),(6,9,'liberar','lllllllll','l','https://cdn.atomix.vg/wp-content/uploads/2015/11/Pok%C3%A9mon-fan-art1.jpg',5,2,'2017-01-08'),(7,3,'minimo','mmmm','m','https://as01.epimg.net/meristation/imagenes/2019/05/28/header_image/648264261559028567.jpg',7,5,'2018-11-05'),(8,6,'noche','n','nnn','https://ksr-ugc.imgix.net/assets/021/312/307/82c0da3412697ca98116991c13cc1256_original.gif?w=680&fit=max&v=1526971998&auto=format&gif-q=50&q=92&s=50c23f07028b05b7aafa6e2ee66d6af1',2,6,'2019-01-05'),(9,8,'tabique','tttttt','t','https://media.gtanet.com/gallery/gta-5-screenshots/fullsize/808-1280.jpg',1,1,'2020-01-05'),(10,13,'JEJE','Tralari','images/gif.gif','https://i.pinimg.com/originals/ae/2b/d5/ae2bd59c88e75d2663db6ab96f9bb501.jpg',6,6,'2020-01-05'),(11,12,'vfdf','sdfdsfdsf','sdfdsf','images/gif.gif',4,3,'2020-01-05'),(18,13,NULL,'primera subida busadsad sa dsad asd asd asd asd asd sad as das dasd asd sd sdsad asd sad asd asd asd ena',NULL,'publicaciones/both.png',1,NULL,'2020-02-05'),(19,13,NULL,'goku',NULL,'publicaciones/goku2.jpg',0,NULL,'2020-02-05'),(20,13,NULL,'asdsad',NULL,'publicaciones/nypia.jpg',0,NULL,'2020-02-05'),(21,13,NULL,'asdsad',NULL,'publicaciones/huerto.png',0,NULL,'2020-02-05'),(22,13,NULL,'hola mundo',NULL,'publicaciones/invader.jpg',0,NULL,'2020-02-06'),(23,12,NULL,'dsad',NULL,'publicaciones/goku.jpg',0,NULL,'2020-02-06'),(24,12,NULL,'sdfdsfdsf',NULL,'publicaciones/chiinf.jpg',0,NULL,'2020-02-06'),(25,13,NULL,'sda',NULL,'publicaciones/bolas.jpg',0,NULL,'2020-02-06'),(27,13,NULL,'sdf',NULL,'publicaciones/homer.jpg',1,NULL,'2020-02-07'),(28,13,NULL,'f',NULL,'publicaciones/homer.jpg',2,NULL,'2020-02-07'),(29,13,NULL,'foto del pokimon',NULL,'publicaciones/giratina.jpg',1,NULL,'2020-02-07'),(30,13,NULL,'asdas',NULL,'publicaciones/hyper.png',1,NULL,'2020-02-07'),(31,55,NULL,'asdsad',NULL,'publicaciones/hyper.png',2,NULL,'2020-02-07'),(32,55,NULL,'asdad',NULL,'publicaciones/huerto.png',0,NULL,'2020-02-07'),(33,12,NULL,'fg',NULL,'publicaciones/ok.jpg',0,NULL,'2020-02-07'),(34,13,NULL,'sdf',NULL,'publicaciones/chiinf.jpg',0,NULL,'2020-02-07');
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
  `comentario` mediumtext,
  `validacion` varchar(45) DEFAULT NULL,
  `reportado` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_reportes`),
  KEY `fk_usuario_reporta_idx` (`usuario_que_reporta`),
  KEY `fk_usuario_reportado_idx` (`usuario_reportado`),
  KEY `fk_publicacion_reportada_idx` (`publicacion_reportada`),
  CONSTRAINT `fk_publicacion_reportada` FOREIGN KEY (`publicacion_reportada`) REFERENCES `publicacion` (`id_publicacion`),
  CONSTRAINT `fk_usuario_reporta` FOREIGN KEY (`usuario_que_reporta`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `fk_usuario_reportado` FOREIGN KEY (`usuario_reportado`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportes`
--

LOCK TABLES `reportes` WRITE;
/*!40000 ALTER TABLE `reportes` DISABLE KEYS */;
INSERT INTO `reportes` VALUES (1,NULL,NULL,1,NULL,NULL,NULL,'sdjsadkjsadh',NULL,NULL),(2,NULL,NULL,9,NULL,NULL,NULL,NULL,NULL,'Paco'),(3,NULL,NULL,8,NULL,NULL,NULL,NULL,NULL,'Keannu'),(4,NULL,NULL,11,NULL,NULL,NULL,NULL,NULL,'8'),(5,NULL,NULL,8,NULL,NULL,NULL,NULL,NULL,'Keannu'),(6,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'Unai'),(7,NULL,NULL,20,NULL,NULL,NULL,NULL,NULL,'hola'),(8,NULL,NULL,20,NULL,NULL,NULL,NULL,NULL,'hola'),(9,NULL,NULL,20,NULL,NULL,NULL,NULL,NULL,'hola'),(10,NULL,NULL,20,NULL,NULL,NULL,NULL,NULL,'hola'),(11,NULL,NULL,20,NULL,NULL,NULL,NULL,NULL,'hola'),(12,NULL,NULL,20,NULL,NULL,NULL,NULL,NULL,'hola'),(13,NULL,NULL,20,NULL,NULL,NULL,NULL,NULL,'hola'),(14,NULL,NULL,20,NULL,NULL,NULL,NULL,NULL,'hola'),(15,NULL,NULL,20,NULL,NULL,NULL,NULL,NULL,'hola'),(16,NULL,NULL,23,NULL,NULL,NULL,NULL,NULL,'8'),(17,NULL,NULL,22,NULL,NULL,NULL,NULL,NULL,'hola'),(18,NULL,NULL,23,NULL,NULL,NULL,NULL,NULL,'8'),(19,NULL,NULL,23,NULL,NULL,NULL,NULL,NULL,'8'),(20,NULL,NULL,18,NULL,NULL,NULL,NULL,NULL,'hola'),(21,NULL,NULL,23,NULL,NULL,NULL,NULL,NULL,'8'),(22,NULL,NULL,22,NULL,NULL,NULL,NULL,NULL,'hola'),(23,NULL,NULL,22,NULL,NULL,NULL,NULL,NULL,'hola'),(24,NULL,NULL,24,NULL,NULL,NULL,NULL,NULL,'8'),(25,NULL,NULL,24,NULL,NULL,NULL,NULL,NULL,'8'),(26,NULL,NULL,24,NULL,NULL,NULL,NULL,NULL,'8'),(27,NULL,NULL,24,NULL,NULL,NULL,NULL,NULL,'8'),(28,NULL,NULL,22,NULL,NULL,NULL,NULL,NULL,'hola'),(29,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,'Omar'),(30,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,'Omar'),(31,NULL,NULL,24,NULL,NULL,NULL,NULL,NULL,'8'),(32,NULL,NULL,27,NULL,NULL,NULL,NULL,NULL,'hola'),(33,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'Unai'),(34,NULL,NULL,22,NULL,NULL,NULL,NULL,NULL,'hola'),(35,NULL,NULL,10,NULL,NULL,NULL,NULL,NULL,'hola');
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
  `nombre_rol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_roles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Programador'),(2,'Ilustrador'),(3,'Sonido'),(4,'Animador'),(5,'Guion'),(6,'Modelador'),(7,'Tester'),(8,'Nada');
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
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('rVYjD7h0V1BVcE93jJ1RMuoSrjM9_sir',1581421359,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"exito\":[\"Buenas hola .\",\"Buenas hola .\",\"Buenas 8 .\",\"Buenas hola .\",\"Buenas 1 .\",\"Buenas 2 .\",\"Buenas hola .\",\"Buenas 1 .\",\"Buenas hola .\",\"Buenas z .\",\"Buenas hola .\"]},\"passport\":{\"user\":13}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
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
  `nick` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `correo` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `pais` varchar(30) DEFAULT NULL,
  `cuidad` varchar(30) DEFAULT NULL,
  `fecha_de_alta` date DEFAULT NULL,
  `foto` varchar(255) DEFAULT 'imagenes_perfil/us.png',
  `nivel` int(11) DEFAULT NULL,
  `premium` int(11) DEFAULT '0',
  `sobremi` varchar(222) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_nivel_idx` (`nivel`),
  KEY `fk_premium_idx` (`premium`),
  CONSTRAINT `fk_nivel` FOREIGN KEY (`nivel`) REFERENCES `niveles` (`idniveles`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Omar','Wall','12','omar@gmail.com','España','Palencia','2019-01-01',NULL,NULL,0,NULL),(2,'Hector','Dic','21','hec@gmail.com','España','León','2019-02-02',NULL,NULL,0,NULL),(3,'Sergio','Verde','23','verde@gmail.com','España','León','2019-01-02',NULL,NULL,0,NULL),(4,'Jesus','yisus','33','crist@gmail.com','Francia','Paris','2018-02-28',NULL,NULL,1,NULL),(5,'Unai','Escandaleras','09','unai@gmail.com','España','Bilbao','2018-09-03',NULL,NULL,0,NULL),(6,'Keannu','Boss','98','keannu@gmail.com','Canada','Canada','2016-07-17',NULL,NULL,NULL,NULL),(7,'Kevin','Durant','88','nba@gmail.com','EEUU','Chicago','2017-04-17',NULL,NULL,1,NULL),(8,'Paco','Copa ','ere','paco12@gmail.com','Alemania','Berlin','2019-05-19',NULL,NULL,0,NULL),(9,'John','Boom','nb','johny@gmail.com','EEUU','Nueva York','2017-09-30',NULL,NULL,NULL,NULL),(10,'Astrid','defcn2','0909','astrid@gmail.com','Japon','Tokio','2016-01-30',NULL,NULL,0,NULL),(11,'Alejandro','Magno','888','alex@gmail.com','China','Hong Kong','2017-08-28',NULL,NULL,NULL,NULL),(12,'8','8','$2a$10$xDs8NdDpKdouRC6FqE6zgejE7UxG8pPHMbxKOCGFm5BUZQ5r4YPU2',NULL,NULL,NULL,NULL,'imagenes_perfil/hyper.png',NULL,NULL,' buenas tardesdfdsf'),(13,'hola','adios','$2a$10$A2d2VD.TRGO7woR0bjFPTuXTbCCsWRuf7YAW2MVkQqX36Is.CA1pu',NULL,NULL,NULL,NULL,'imagenes_perfil/start.jpg',NULL,1,' Hola soasdasdadasd'),(14,'1',NULL,'$2a$10$RmlaeQP4lezazh.zkfQdvOnmqTDcxzA/6lRC1dycHTvXaybwofMcC','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,'asdasd',NULL,'$2a$10$Ju2D8UeslIGS0p5twEpuzOUWdWMNvCXjIDUY2MN2qNczJOb2FMQry','holaasdasd',NULL,NULL,NULL,'imagenes_perfil/both.png',NULL,0,' Hola'),(56,'sada',NULL,'$2a$10$kgxZINfMjuHigP5xCAu2cOKc/iWlV9QXbN4WzA1GpuykwcBWuuRki','hola',NULL,NULL,NULL,NULL,NULL,0,NULL),(57,'2',NULL,'$2a$10$SVRd41kL8qYyNd9Cdlu0H.ytj3HppkehFT1Yk5549CVt6uRgl/leG','2',NULL,NULL,NULL,NULL,NULL,0,NULL),(58,'3',NULL,'$2a$10$nE8Z0p7CL.liPptdRdALm.kNT1x6jv3AyRjFyXZWykk0LzBFHW7ES','3',NULL,NULL,NULL,NULL,NULL,0,NULL),(59,'DEV',NULL,'$2a$10$ODm7TqoCvYQ2ybC2eVCq6u3sp.ZCFWDS1O1x5lN3CUa7nXkf9JIr6','DEV',NULL,NULL,NULL,NULL,NULL,0,NULL),(60,'z',NULL,'$2a$10$KEMMSCbbf24tRTjVrBJjzOBaQWp/EiAtlOLPrwEKP/N7Xmt66biAu','z',NULL,NULL,NULL,'imagenes_perfil/us.png',NULL,0,NULL);
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

-- Dump completed on 2020-02-10 12:45:52
