-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 28-05-2013 a las 15:43:30
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `plazquez`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE IF NOT EXISTS `asignatura` (
  `idasignatura` int(11) NOT NULL AUTO_INCREMENT,
  `profesor` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` text COLLATE latin1_spanish_ci,
  `curso` int(11) NOT NULL,
  PRIMARY KEY (`idasignatura`),
  KEY `FK_ASIGNATURA_CURSO_idx` (`curso`),
  KEY `FK_ASIGNATURA_PROFESOR_idx` (`profesor`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=31 ;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`idasignatura`, `profesor`, `nombre`, `descripcion`, `curso`) VALUES
(1, 2, 'Matemáticas', 'Sumas y restas', 1),
(2, 2, 'Física', 'MRU y MRUA', 1),
(3, 2, 'Tecnología', 'Taller', 1),
(4, 2, 'Informática', 'Html y css', 1),
(5, 5, 'Lengua y literatura', 'Castellana', 1),
(6, 5, 'Historia y geografía', 'Geografía de Europa. La Unión Europea', 1),
(7, 5, 'Filosofía', 'Estudio de filosofos', 1),
(8, 9, 'Inglés', NULL, 1),
(9, 2, 'Física', 'MRU y MRUA', 2),
(10, 2, 'Tecnología', 'Taller', 2),
(11, 2, 'Informática', 'Html y css', 2),
(12, 5, 'Lengua y literatura', 'Castellana', 2),
(13, 5, 'Historia y geografía', 'Geografía de Europa. La Unión Europea', 2),
(14, 5, 'Filosofía', 'Estudio de filosofos', 2),
(15, 9, 'Inglés', NULL, 2),
(16, 3, 'Matemáticas', 'Sumas y restas', 3),
(17, 3, 'Física', 'MRU y MRUA', 3),
(18, 3, 'Tecnología', 'Taller', 3),
(19, 3, 'Informática', 'Html y css', 3),
(20, 6, 'Lengua y literatura', 'Castellana', 3),
(21, 6, 'Historia y geografía', 'Geografía de Europa. La Unión Europea', 3),
(22, 6, 'Filosofía', 'Estudio de filosofos', 3),
(23, 9, 'Inglés', NULL, 3),
(24, 3, 'Física', 'MRU y MRUA', 4),
(25, 3, 'Tecnología', 'Taller', 4),
(26, 3, 'Informática', 'Html y css', 4),
(27, 8, 'Lengua y literatura', 'Castellana', 4),
(28, 8, 'Historia y geografía', 'Geografía de Europa. La Unión Europea', 4),
(29, 8, 'Filosofía', 'Estudio de filosofos', 4),
(30, 9, 'Inglés', NULL, 4);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `asignaturas_profesores_cursos`
--
CREATE TABLE IF NOT EXISTS `asignaturas_profesores_cursos` (
`Nombre` varchar(45)
,`Profesor` varchar(30)
,`Apellidos` varchar(60)
,`Descripcion` text
,`Curso` varchar(45)
);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE IF NOT EXISTS `curso` (
  `idcurso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idcurso`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`idcurso`, `nombre`) VALUES
(1, '1º ESO'),
(2, '2º ESO '),
(3, '3º ESO'),
(4, '4º ESO'),
(-1, 'Profesorado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

CREATE TABLE IF NOT EXISTS `matricula` (
  `asignatura` int(11) NOT NULL,
  `alumno` int(11) NOT NULL,
  PRIMARY KEY (`asignatura`,`alumno`),
  KEY `FK_MATRICULA_ASIGNATURA_idx` (`asignatura`),
  KEY `FK_MATRICULA_ALUMNO_idx` (`alumno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `matricula`
--

INSERT INTO `matricula` (`asignatura`, `alumno`) VALUES
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(2, 24),
(2, 25),
(2, 26),
(2, 27),
(3, 24),
(3, 25),
(3, 26),
(3, 27),
(4, 24),
(4, 25),
(4, 26),
(4, 27),
(5, 24),
(5, 25),
(5, 26),
(5, 27),
(6, 24),
(6, 25),
(6, 26),
(6, 27),
(7, 24),
(7, 25),
(7, 26),
(7, 27),
(8, 24),
(8, 25),
(8, 26),
(8, 27);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota`
--

CREATE TABLE IF NOT EXISTS `nota` (
  `prueba` int(11) NOT NULL,
  `alumno` int(11) NOT NULL,
  `nota` decimal(3,2) DEFAULT '0.00',
  PRIMARY KEY (`prueba`,`alumno`),
  KEY `FK_NOTA_PRUEBA_idx` (`prueba`),
  KEY `FK_NOTA_ALUMNO_idx` (`alumno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `nota`
--

INSERT INTO `nota` (`prueba`, `alumno`, `nota`) VALUES
(46, 26, '6.15'),
(47, 26, '8.77');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE IF NOT EXISTS `perfil` (
  `idperfil` int(11) NOT NULL DEFAULT '3',
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idperfil`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`idperfil`, `descripcion`) VALUES
(1, 'Administrador'),
(3, 'Alumno'),
(2, 'Profesor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE IF NOT EXISTS `pregunta` (
  `idpregunta` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` text COLLATE latin1_spanish_ci NOT NULL,
  `prueba` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpregunta`),
  KEY `FK_PREGUNTA_ASIGNATURA_idx` (`prueba`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=54 ;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`idpregunta`, `titulo`, `prueba`) VALUES
(48, 'Pregunta uno del examen de filosofía', 46),
(49, 'Pregunta dos del examen de filosofía', 46),
(50, 'Pregunta tres del examen de filosofía', 46),
(51, 'Pregunta cuatro del examen de filosofía, esta es más larga. Pregunta cuatro del examen de filosofía, esta es más larga. Pregunta cuatro del examen de filosofía, esta es más larga. Pregunta cuatro del examen de filosofía, esta es más larga. Pregunta cuatro del examen de filosofía, esta es más larga. ', 46),
(52, 'Pregunta cinco del examen de filosofía, esta es más larga. ', 46),
(53, 'Pregunta seis del examen de filosofía. ', 46);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prueba`
--

CREATE TABLE IF NOT EXISTS `prueba` (
  `idprueba` int(11) NOT NULL AUTO_INCREMENT,
  `asignatura` int(11) NOT NULL,
  `nombre` varchar(60) COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` text COLLATE latin1_spanish_ci,
  `temas` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `puntuaMax` decimal(4,2) NOT NULL,
  `activa` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`idprueba`),
  KEY `FK_PRUEBA_ASIGNATURA_idx` (`asignatura`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=49 ;

--
-- Volcado de datos para la tabla `prueba`
--

INSERT INTO `prueba` (`idprueba`, `asignatura`, `nombre`, `descripcion`, `temas`, `fecha`, `puntuaMax`, `activa`) VALUES
(46, 7, 'Introducción', '', '0, 1, 2', '2013-06-03 10:30:00', '7.50', b'0'),
(47, 7, 'Filosofos A y B', NULL, '3, 4', '2013-06-24 10:30:00', '10.00', b'1'),
(48, 7, 'Filosofo C', NULL, '5, 6', '2013-07-12 10:30:00', '8.50', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE IF NOT EXISTS `respuesta` (
  `alumno` int(11) NOT NULL,
  `pregunta` int(11) NOT NULL,
  `prueba` int(11) NOT NULL,
  `respuesta` text COLLATE latin1_spanish_ci,
  PRIMARY KEY (`alumno`,`pregunta`,`prueba`),
  KEY `FK_RESPUESTA_ALUMNO_idx` (`alumno`),
  KEY `FK_RESPUESTA_PREGUNTA_idx` (`pregunta`),
  KEY `FK_RESPUESTA_PRUEBA_idx` (`prueba`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `respuesta`
--

INSERT INTO `respuesta` (`alumno`, `pregunta`, `prueba`, `respuesta`) VALUES
(26, 48, 46, 'Respuesta cambiada a la pregunta uno del examen'),
(26, 49, 46, 'Respuesta a la pregunta dos del examen'),
(26, 51, 46, 'La 50 no contestada, esta es 51 y respondida'),
(26, 52, 46, 'Respuesta 52'),
(26, 53, 46, 'Respuesta 53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `apellidos` varchar(60) COLLATE latin1_spanish_ci NOT NULL,
  `usuario` varchar(18) COLLATE latin1_spanish_ci NOT NULL,
  `password` varchar(18) COLLATE latin1_spanish_ci NOT NULL,
  `perfil` int(11) DEFAULT NULL,
  `email` varchar(80) COLLATE latin1_spanish_ci DEFAULT NULL,
  `curso` int(11) DEFAULT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `FK_USUARIO_PERFIL_idx` (`perfil`),
  KEY `FK_USUARIO_CURSO_idx` (`curso`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=29 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `apellidos`, `usuario`, `password`, `perfil`, `email`, `curso`) VALUES
(1, 'Administrador', '', 'admin', 'admin', 1, '', -1),
(2, 'Luis', 'Serrano Torres', 'lsertor', 'lsertor', 2, 'lsertor@gmail.com', -1),
(3, 'Javier', 'Muñoz Ramos', 'jmunram', 'jmunram', 2, 'jmunram@gmail.com', -1),
(4, 'Eduardo', 'Ortega Delgado', 'eordel', 'eordel', 2, 'eordel@gmail.com', -1),
(5, 'Laura', 'Gil Morales', 'lgilmor', 'lgilmor', 2, 'lgilmor@gmail.com', -1),
(6, 'Julia', 'Suarez Blanco', 'jsuabla', 'jsuabla', 2, 'jsuabla@gmail.com', -1),
(7, 'Rocío', 'Castro Iglesias', 'rcasigl', 'rcasigl', 2, 'rcasigl@gmail.com', -1),
(8, 'Hugo', 'Rubio Vega', 'hrubveg', 'hrubveg', 2, 'hrubveg@gmail.com', -1),
(9, 'Rachel Elizabeth ', 'Murray', 'rmurray', 'rmurray', 2, 'rmurray@gmailc.om', -1),
(24, 'Alejandro', 'García Flores', 'agarflo', 'agarflo', 3, 'agarflo@gmail.com', 1),
(25, 'Gabriela', 'Almirez Pérez', 'galmper', 'galmper', 3, 'galmper@gmail.com', 1),
(26, 'Monica Adriana', 'López Montoro', 'mlopmon', 'mlopmon', 3, 'mlopmon@gmail.com', 1),
(27, 'Maria Teresa', 'Hernandez Miró', 'mhermir', 'mhermir', 3, 'mhermir@gmail.com', 1),
(28, 'prueba', 'aa', 'aa', 'aa', 3, NULL, 2);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `usuarios_perfiles`
--
CREATE TABLE IF NOT EXISTS `usuarios_perfiles` (
`Nombre` varchar(30)
,`Apellidos` varchar(60)
,`Perfil` varchar(45)
);
-- --------------------------------------------------------

--
-- Estructura para la vista `asignaturas_profesores_cursos`
--
DROP TABLE IF EXISTS `asignaturas_profesores_cursos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`Admin`@`localhost` SQL SECURITY DEFINER VIEW `asignaturas_profesores_cursos` AS select `a`.`nombre` AS `Nombre`,`p`.`nombre` AS `Profesor`,`p`.`apellidos` AS `Apellidos`,`a`.`descripcion` AS `Descripcion`,`c`.`nombre` AS `Curso` from ((`asignatura` `a` join `usuario` `p` on(((`a`.`profesor` = `p`.`idusuario`) and (`p`.`perfil` = 2)))) join `curso` `c` on((`a`.`curso` = `c`.`idcurso`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `usuarios_perfiles`
--
DROP TABLE IF EXISTS `usuarios_perfiles`;

CREATE ALGORITHM=UNDEFINED DEFINER=`Admin`@`localhost` SQL SECURITY DEFINER VIEW `usuarios_perfiles` AS select `u`.`nombre` AS `Nombre`,`u`.`apellidos` AS `Apellidos`,`p`.`descripcion` AS `Perfil` from (`usuario` `u` join `perfil` `p` on((`u`.`perfil` = `p`.`idperfil`)));

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD CONSTRAINT `FK_ASIGNATURA_CURSO` FOREIGN KEY (`curso`) REFERENCES `curso` (`idcurso`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ASIGNATURA_PROFESOR` FOREIGN KEY (`profesor`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `FK_MATRICULA_ALUMNO` FOREIGN KEY (`alumno`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_MATRICULA_ASIGNATURA` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`idasignatura`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `FK_NOTA_ALUMNO` FOREIGN KEY (`alumno`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_NOTA_PRUEBA` FOREIGN KEY (`prueba`) REFERENCES `prueba` (`idprueba`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `FK_PREGUNTA_PRUEBA` FOREIGN KEY (`prueba`) REFERENCES `prueba` (`idprueba`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `prueba`
--
ALTER TABLE `prueba`
  ADD CONSTRAINT `FK_PRUEBA_ASIGNATURA` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`idasignatura`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD CONSTRAINT `FK_RESPUESTA_ALUMNO` FOREIGN KEY (`alumno`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_RESPUESTA_PREGUNTA` FOREIGN KEY (`pregunta`) REFERENCES `pregunta` (`idpregunta`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_RESPUESTA_PRUEBA` FOREIGN KEY (`prueba`) REFERENCES `prueba` (`idprueba`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_USUARIO_CURSO` FOREIGN KEY (`curso`) REFERENCES `curso` (`idcurso`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_USUARIO_PERFIL` FOREIGN KEY (`perfil`) REFERENCES `perfil` (`idperfil`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
