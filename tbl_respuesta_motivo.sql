-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: andrescisd.mysql.pythonanywhere-services.com    Database: andrescisd$bd_ricardo
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_respuesta_motivo`
--

DROP TABLE IF EXISTS `tbl_respuesta_motivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_respuesta_motivo` (
  `id_motivo` int NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `motivo` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rechazomotivo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rechazosubmotivo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_motivo`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_respuesta_motivo`
--

LOCK TABLES `tbl_respuesta_motivo` WRITE;
/*!40000 ALTER TABLE `tbl_respuesta_motivo` DISABLE KEYS */;
INSERT INTO `tbl_respuesta_motivo` VALUES (1,NULL,'No se puede vender - Datos Inválidos','NO_VENDIBLE','DI'),(2,NULL,'No se puede vender - No localizo despues de Info','NO_VENDIBLE','INF'),(3,NULL,'No se puede vender - Intentos Superados','NO_VENDIBLE','IS'),(4,NULL,'No se puede vender - No Contactado','NO_VENDIBLE','NC'),(5,NULL,'No se puede vender - No habla Español','NO_VENDIBLE','NHAB'),(6,NULL,'No se puede vender - No preparamos curso','NO_VENDIBLE','NP'),(7,NULL,'No se puede vender - No cumple requisitos','NO_VENDIBLE','NR'),(8,NULL,'No se puede vender - Era para otra persona','NO_VENDIBLE','POP'),(9,NULL,'No se puede vender - Solicitud por error','NO_VENDIBLE','SE'),(10,NULL,'No se puede vender - No tiene tarjeta y quiere financiar','NO_VENDIBLE','TAR'),(11,NULL,'No se puede vender - Pensaba que era trabajo','NO_VENDIBLE','TR'),(12,NULL,'No encaja - Busca un curso más corto','NO_ENCAJA','COR'),(13,NULL,'No encaja - Contenidos o titulación','NO_ENCAJA','COT'),(14,NULL,'No encaja - Motivos economicos','NO_ENCAJA','ECO'),(15,NULL,'No encaja - Para mas adelante','NO_ENCAJA','FUT'),(16,NULL,'No encaja - No gusta el modelo','NO_ENCAJA','GUS'),(17,NULL,'No encaja - Ladrón de tiempo','NO_ENCAJA','LAD'),(18,NULL,'No encaja - Matriculado en otro centro','NO_ENCAJA','MAT'),(19,NULL,'No encaja - Ha cambiado de idea / No interesado','NO_ENCAJA','NINT'),(20,NULL,'No encaja - Quiere presencial','NO_ENCAJA','PRE'),(21,NULL,'No encaja - Sin motivo','NO_ENCAJA','SIN_MOTIVO'),(22,NULL,'No encaja - No tengo tiempo','NO_ENCAJA','SIN_TIEMPO'),(23,NULL,'Otros Motivos - Baja asesor','OTROS','ASE'),(24,NULL,'Otros Motivos - Eliminado desde bolsa','OTROS','BOLSA'),(25,NULL,'Otros Motivos - Otras causas','OTROS','OTR'),(26,NULL,'No Gusta - Busca un curso mas corto','NO_GUSTA','CC'),(27,NULL,'No Gusta - Ha encontrado trabajo','NO_GUSTA','ENC'),(28,NULL,'No Gusta - Falta de tiempo','NO_GUSTA','FT'),(29,NULL,'No Gusta - No contesta despues de haber sido informado','NO_GUSTA','NCD'),(30,NULL,'No Gusta - No gusta modelo','NO_GUSTA','NGM'),(31,NULL,'No Gusta - Ha cambiado de idea/ No esta interesado','NO_GUSTA','NI'),(32,NULL,'No Gusta - Nulo Telefónico','NO_GUSTA','NT'),(33,NULL,'No Interesa - Ladrones de Tiempo','NO_INTERESA','LADRONES_TIEMPO'),(34,NULL,'No Interesa - No cumple requisitos','NO_INTERESA','NR'),(35,NULL,'No Interesa - Era para otra persona','NO_INTERESA','POP'),(36,NULL,'No Interesa - Otros motivos','NO_INTERESA','OTROS_MOTIVOS'),(37,NULL,'No Interesa - Solicitud por error','NO_INTERESA','SE'),(38,NULL,'Erroneos - Duplicados','ERRONEO','DUP'),(39,NULL,'Erroneos - Pensaba que era gratis','ERRONEO','GRA'),(40,NULL,'Erroneos - Persona Mayor','ERRONEO','MAY'),(41,NULL,'Erroneos - Numero Erroneo','ERRONEO','NER'),(42,NULL,'Erroneos - Numero No Existe','ERRONEO','NEX'),(43,NULL,'Erroneos - No ha pedido info','ERRONEO','NINF'),(44,NULL,'Erroneos - Solicitud por Error','ERRONEO','SE'),(45,NULL,'Erroneos - Busca Terapia','ERRONEO','TER'),(46,NULL,'Erroneos - Pensaba que era trabajo','ERRONEO','TR'),(47,NULL,'Interesado imposible contratar - Financiacion KO','INT_NCONT','FKO'),(48,NULL,'Interesado imposible contratar - No acceso a Financiacion','INT_NCONT','NAF'),(49,NULL,'Interesado imposible contratar - Tarjeta No valida','INT_NCONT','TNV');
/*!40000 ALTER TABLE `tbl_respuesta_motivo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-04 13:05:46
