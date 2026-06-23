CREATE DATABASE  IF NOT EXISTS `biblioteca` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `biblioteca`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: biblioteca
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autores` (
  `id_autor` int NOT NULL AUTO_INCREMENT,
  `nome_autor` varchar(100) NOT NULL,
  `nacionalidade` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES (1,'Clarice Lispector','Brasileira'),(2,'J.K. Rowling','Britânica'),(3,'George Orwell','Britânico'),(4,'Isaac Asimov','Americana'),(5,'Machado de Assis','Brasileira'),(6,'Agatha Christie','Britânica'),(7,'J.R.R. Tolkien','Britânico'),(8,'Stephen King','Americana'),(9,'Carlos Drummond de Andrade','Brasileira'),(10,'Philip K. Dick','Americana');
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editoras`
--

DROP TABLE IF EXISTS `editoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editoras` (
  `id_editora` int NOT NULL AUTO_INCREMENT,
  `nome_editora` varchar(100) NOT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_editora`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editoras`
--

LOCK TABLES `editoras` WRITE;
/*!40000 ALTER TABLE `editoras` DISABLE KEYS */;
INSERT INTO `editoras` VALUES (1,'Companhia das Letras','São Paulo'),(2,'Rocco','Rio de Janeiro'),(3,'Editora 34','São Paulo'),(4,'Arqueiro','São Paulo'),(5,'Martins Fontes','São Paulo'),(6,'Aleph','São Paulo'),(7,'HarperCollins','Nova York'),(8,'Record','Rio de Janeiro'),(9,'Intrínseca','Rio de Janeiro'),(10,'Sextante','Rio de Janeiro');
/*!40000 ALTER TABLE `editoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprestimos`
--

DROP TABLE IF EXISTS `emprestimos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emprestimos` (
  `id_emprestimo` int NOT NULL AUTO_INCREMENT,
  `fk_id_livro` int DEFAULT NULL,
  `fk_id_usuario` int DEFAULT NULL,
  `data_emprestimo` date NOT NULL,
  `data_devolucao_prevista` date NOT NULL,
  `data_devolucao_real` date DEFAULT NULL,
  PRIMARY KEY (`id_emprestimo`),
  KEY `fk_id_livro` (`fk_id_livro`),
  KEY `fk_id_usuario` (`fk_id_usuario`),
  CONSTRAINT `emprestimos_ibfk_1` FOREIGN KEY (`fk_id_livro`) REFERENCES `livros` (`id_livro`),
  CONSTRAINT `emprestimos_ibfk_2` FOREIGN KEY (`fk_id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimos`
--

LOCK TABLES `emprestimos` WRITE;
/*!40000 ALTER TABLE `emprestimos` DISABLE KEYS */;
INSERT INTO `emprestimos` VALUES (1,1,1,'2023-01-10','2023-01-24','2023-01-22'),(2,3,2,'2023-02-15','2023-03-01','2023-03-02'),(3,4,3,'2023-03-20','2023-04-03','2023-04-01'),(4,8,4,'2023-04-05','2023-04-19',NULL),(5,10,5,'2023-05-12','2023-05-26','2023-05-25'),(6,2,6,'2023-06-18','2023-07-02',NULL),(7,5,7,'2023-07-22','2023-08-05','2023-08-04'),(8,7,8,'2023-08-30','2023-09-13',NULL),(9,9,9,'2023-09-05','2023-09-19','2023-09-18'),(10,6,10,'2023-10-10','2023-10-24',NULL);
/*!40000 ALTER TABLE `emprestimos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livros`
--

DROP TABLE IF EXISTS `livros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livros` (
  `id_livro` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `fk_id_autor` int DEFAULT NULL,
  `fk_id_editora` int DEFAULT NULL,
  `ano_publicacao` int DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_livro`),
  KEY `fk_id_autor` (`fk_id_autor`),
  KEY `fk_id_editora` (`fk_id_editora`),
  CONSTRAINT `livros_ibfk_1` FOREIGN KEY (`fk_id_autor`) REFERENCES `autores` (`id_autor`),
  CONSTRAINT `livros_ibfk_2` FOREIGN KEY (`fk_id_editora`) REFERENCES `editoras` (`id_editora`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livros`
--

LOCK TABLES `livros` WRITE;
/*!40000 ALTER TABLE `livros` DISABLE KEYS */;
INSERT INTO `livros` VALUES (1,'A Hora da Estrela',1,1,1977,'9788535908078','Literatura Brasileira'),(2,'Harry Potter e a Pedra Filosofal',2,2,1997,'9788532511010','Fantasia'),(3,'1984',3,3,1949,'9788573261039','Ficção Científica'),(4,'Eu, Robô',4,4,1950,'9788580416362','Ficção Científica'),(5,'Dom Casmurro',5,1,1899,'9788535911245','Literatura Brasileira'),(6,'Assassinato no Expresso do Oriente',6,5,1934,'9788578270698','Mistério'),(7,'O Senhor dos Anéis',7,6,1954,'9788595084752','Fantasia'),(8,'O Iluminado',8,7,1977,'9788581052450','Terror'),(9,'Sentimento do Mundo',9,8,1940,'9788501061927','Poesia'),(10,'O Homem do Castelo Alto',10,9,1962,'9788551000769','Ficção Científica');
/*!40000 ALTER TABLE `livros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nome_usuario` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Maria Silva','maria@email.com','(11) 9999-8888','Rua A, 100 - São Paulo'),(2,'João Santos','joao@email.com','(21) 98877-6655','Av. B, 200 - Rio de Janeiro'),(3,'Ana Oliveira','ana@email.com','(31) 97766-5544','Rua C, 300 - Belo Horizonte'),(4,'Pedro Costa','pedro@email.com','(11) 96655-4433','Av. D, 400 - São Paulo'),(5,'Carla Mendes','carla@email.com','(21) 95544-3322','Rua E, 500 - Rio de Janeiro'),(6,'Lucas Pereira','lucas@email.com','(11) 94433-2211','Av. F, 600 - São Paulo'),(7,'Juliana Alves','juliana@email.com','(31) 93322-1100','Rua G, 700 - Belo Horizonte'),(8,'Marcos Rocha','marcos@email.com','(11) 92211-0099','Av. H, 800 - São Paulo'),(9,'Fernanda Lima','fernanda@email.com','(21) 91100-9988','Rua I, 900 - Rio de Janeiro'),(10,'Ricardo Souza','ricardo@email.com','(11) 90099-8877','Av. J, 1000 - São Paulo');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-09  9:29:27

SELECT l.titulo, a.nome_autor
FROM livros AS l
INNER JOIN autores AS a
ON l.fk_id_autor = a.id_autor;

SELECT l.titulo, u.nome_usuario
FROM emprestimos AS e
INNER JOIN livros AS l
ON e.fk_id_livro = l.id_livro
INNER JOIN usuarios AS u
ON e.fk_id_usuario = u.id_usuario;

SELECT l.titulo, ed.nome_editora
FROM livros AS l
INNER JOIN editoras AS ed
ON l.fk_id_editora = ed.id_editora
WHERE ed.cidade = 'São Paulo';

SELECT l.titulo, u.nome_usuario
FROM emprestimos AS e
INNER JOIN livros AS l
ON e.fk_id_livro = l.id_livro
INNER JOIN usuarios AS u
ON e.fk_id_usuario = u.id_usuario
WHERE l.categoria = 'Ficção Científica';

SELECT a.nome_autor, l.titulo
FROM emprestimos AS e
INNER JOIN livros AS l
ON e.fk_id_livro = l.id_livro
INNER JOIN autores AS a
ON l.fk_id_autor = a.id_autor
WHERE a.nacionalidade = 'Brasileira';
