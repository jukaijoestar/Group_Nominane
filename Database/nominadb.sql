-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-10-2023 a las 04:49:11
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nominadb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aporte_social`
--

CREATE TABLE `aporte_social` (
  `ID` int(11) NOT NULL,
  `Aporte_Salud` int(11) NOT NULL,
  `Aporte_Pension` int(11) NOT NULL,
  `Total_Social` int(11) NOT NULL,
  `ID_empleado` int(11) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apropiaciones`
--

CREATE TABLE `apropiaciones` (
  `ID` int(11) NOT NULL,
  `Cesantia` decimal(10,0) NOT NULL,
  `Interes_C` decimal(10,0) NOT NULL,
  `Prima` decimal(10,0) NOT NULL,
  `Vacaciones` decimal(10,0) NOT NULL,
  `Aporte_PF` int(11) NOT NULL,
  `Cajas_Compensacion` decimal(10,0) NOT NULL,
  `ICBF` int(11) NOT NULL,
  `SENA` int(11) NOT NULL,
  `ARL` decimal(10,0) NOT NULL,
  `Total_Apropiado` decimal(10,0) NOT NULL,
  `ID_Empleado` int(11) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Departamento_ID` int(11) NOT NULL,
  `Salario_Base` int(11) NOT NULL,
  `Riesgo_LV` int(11) NOT NULL,
  `estado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`ID`, `Nombre`, `Departamento_ID`, `Salario_Base`, `Riesgo_LV`, `estado`) VALUES
(2, 'Senior', 1, 1500000, 0, 'Inactivo'),
(4, 'sa', 2, 123, 0, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deduccion`
--

CREATE TABLE `deduccion` (
  `ID` int(11) NOT NULL,
  `empleado_ID` int(11) NOT NULL,
  `Salud` decimal(11,0) NOT NULL,
  `Pension` decimal(11,0) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `estado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`ID`, `Nombre`, `estado`) VALUES
(1, 'Back_End', 'Activo'),
(2, 'Marketing', 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `ID` int(11) NOT NULL,
  `Nro_documento` int(11) NOT NULL,
  `Nombres` varchar(50) NOT NULL,
  `Apellido_Paterno` varchar(50) NOT NULL,
  `Apellido_Materno` varchar(50) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Barrio` varchar(50) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Estado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  `Email` varchar(100) NOT NULL,
  `Departamento` int(11) NOT NULL,
  `Cargo_ID` int(11) NOT NULL,
  `Sueldo` int(11) NOT NULL,
  `Edad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`ID`, `Nro_documento`, `Nombres`, `Apellido_Paterno`, `Apellido_Materno`, `Fecha_Nacimiento`, `Direccion`, `Barrio`, `Telefono`, `Estado`, `Email`, `Departamento`, `Cargo_ID`, `Sueldo`, `Edad`) VALUES
(1, 1139425046, 'Esteban', 'Giraldo', 'Ariza', '2006-02-10', 'Calle 16 # 24-16', 'La luz', '3195964478', 'Activo', 'Esteban.giraldo.ariza777@gmail.com', 1, 2, 1500000, 17);

--
-- Disparadores `empleados`
--
DELIMITER $$
CREATE TRIGGER `UpdateAge` BEFORE INSERT ON `empleados` FOR EACH ROW BEGIN
    SET NEW.Edad = TIMESTAMPDIFF(YEAR, NEW.Fecha_Nacimiento, CURDATE());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gran_total`
--

CREATE TABLE `gran_total` (
  `ID` int(11) NOT NULL,
  `ID_empleado` int(11) NOT NULL,
  `Total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `ID` int(11) NOT NULL,
  `HorDiurna` int(11) NOT NULL,
  `HorExtDiurna` int(11) NOT NULL,
  `HorNocturna` int(11) NOT NULL,
  `HorExtNocturna` int(11) NOT NULL,
  `HorDominical` int(11) NOT NULL,
  `HorExtDominical` int(11) NOT NULL,
  `HorExtDomNoct` int(11) NOT NULL,
  `empleado_ID` int(11) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sueldo`
--

CREATE TABLE `sueldo` (
  `ID` int(11) NOT NULL,
  `empleado_ID` int(11) NOT NULL,
  `Total_Dev` decimal(11,0) NOT NULL,
  `Total_Ded` decimal(11,0) NOT NULL,
  `Salario_Neto` decimal(11,0) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Contraseña` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID`, `Nombre`, `Contraseña`, `correo`) VALUES
(1, 'Juan', '123Azdssd', 'Juan@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aporte_social`
--
ALTER TABLE `aporte_social`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_aporte_social_empleado` (`ID_empleado`);

--
-- Indices de la tabla `apropiaciones`
--
ALTER TABLE `apropiaciones`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_apropiaciones_empleado` (`ID_Empleado`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Departamento_Cargo` (`Departamento_ID`);

--
-- Indices de la tabla `deduccion`
--
ALTER TABLE `deduccion`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `empleado_ID` (`empleado_ID`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Documento` (`Nro_documento`),
  ADD KEY `FK_Cargo_Empleados` (`Cargo_ID`);

--
-- Indices de la tabla `gran_total`
--
ALTER TABLE `gran_total`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_gran_total_empleado` (`ID_empleado`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `empleado_ID` (`empleado_ID`);

--
-- Indices de la tabla `sueldo`
--
ALTER TABLE `sueldo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `empleado_ID` (`empleado_ID`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Correo_electronico` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aporte_social`
--
ALTER TABLE `aporte_social`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `apropiaciones`
--
ALTER TABLE `apropiaciones`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `deduccion`
--
ALTER TABLE `deduccion`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `gran_total`
--
ALTER TABLE `gran_total`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sueldo`
--
ALTER TABLE `sueldo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aporte_social`
--
ALTER TABLE `aporte_social`
  ADD CONSTRAINT `fk_aporte_social_empleado` FOREIGN KEY (`ID_empleado`) REFERENCES `empleados` (`ID`);

--
-- Filtros para la tabla `apropiaciones`
--
ALTER TABLE `apropiaciones`
  ADD CONSTRAINT `fk_apropiaciones_empleado` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleados` (`ID`);

--
-- Filtros para la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD CONSTRAINT `FK_Departamento_Cargo` FOREIGN KEY (`Departamento_ID`) REFERENCES `departamento` (`ID`);

--
-- Filtros para la tabla `deduccion`
--
ALTER TABLE `deduccion`
  ADD CONSTRAINT `deduccion_ibfk_1` FOREIGN KEY (`empleado_ID`) REFERENCES `empleados` (`ID`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `FK_Cargo_Empleados` FOREIGN KEY (`Cargo_ID`) REFERENCES `cargos` (`ID`);

--
-- Filtros para la tabla `gran_total`
--
ALTER TABLE `gran_total`
  ADD CONSTRAINT `fk_gran_total_empleado` FOREIGN KEY (`ID_empleado`) REFERENCES `empleados` (`ID`);

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`empleado_ID`) REFERENCES `empleados` (`ID`);

--
-- Filtros para la tabla `sueldo`
--
ALTER TABLE `sueldo`
  ADD CONSTRAINT `sueldo_ibfk_1` FOREIGN KEY (`empleado_ID`) REFERENCES `empleados` (`ID`);
COMMIT;

cursor.execute("""
    SELECT * FROM cargos WHERE Departamento_ID = %s AND estado = 'Inactivo'
""", (departamento_id,))
--En esta consulta, estamos filtrando los cargos con estado = 'Inactivo' 
--lo que significa que solo se seleccionarán los cargos inactivos.

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
