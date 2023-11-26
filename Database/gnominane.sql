-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-11-2023 a las 00:01:40
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
-- Base de datos: `gnominane`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aporte_pf`
--

CREATE TABLE `aporte_pf` (
  `ID` int(11) NOT NULL,
  `SENA` int(11) NOT NULL,
  `ICBF` int(11) NOT NULL,
  `CCF` int(11) NOT NULL,
  `Total_PF` int(11) NOT NULL,
  `empleado_ID` int(11) NOT NULL,
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
  `Riesgo_LV` varchar(3) NOT NULL,
  `estado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deduccion`
--

CREATE TABLE `deduccion` (
  `ID` int(11) NOT NULL,
  `empleado_ID` int(11) NOT NULL,
  `Comisiones` int(11) NOT NULL,
  `Salud` int(11) NOT NULL,
  `Pension` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Otros` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Fecha_Creacion` date NOT NULL DEFAULT current_timestamp(),
  `estado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `det_d_sc`
--

CREATE TABLE `det_d_sc` (
  `ID` int(11) NOT NULL,
  `Aporte_Salud` int(11) NOT NULL,
  `Aporte_Pension` int(11) NOT NULL,
  `Total_Social` int(11) NOT NULL,
  `empleado_ID` int(11) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `Fecha_Ingreso` date NOT NULL DEFAULT current_timestamp(),
  `Direccion` varchar(100) NOT NULL,
  `Barrio` varchar(50) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Tipo_Sangre` varchar(3) NOT NULL,
  `Estado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  `Email` varchar(100) NOT NULL,
  `Departamento` int(11) NOT NULL,
  `Cargo_ID` int(11) NOT NULL,
  `Sueldo` int(11) NOT NULL,
  `Edad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `Total_AP` int(11) NOT NULL,
  `TOTAL_G` int(11) NOT NULL,
  `empleado_ID` int(11) NOT NULL,
  `Fecha` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `ID` int(11) NOT NULL,
  `HorExtDiurna` int(11) NOT NULL DEFAULT 0,
  `HorExtNocturna` int(11) NOT NULL DEFAULT 0,
  `HorExtDominical` int(11) NOT NULL DEFAULT 0,
  `HorExtDomNoct` int(11) NOT NULL DEFAULT 0,
  `empleado_ID` int(11) NOT NULL DEFAULT 0,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `riesgo_profesional`
--

CREATE TABLE `riesgo_profesional` (
  `ID` int(11) NOT NULL,
  `Total_RP` int(11) NOT NULL,
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
  `Fecha` date NOT NULL,
  `Fecha_inicio` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacaciones`
--

CREATE TABLE `vacaciones` (
  `ID` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `empleado_ID` int(11) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aporte_pf`
--
ALTER TABLE `aporte_pf`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_aporte_pf_empleado` (`empleado_ID`);

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
  ADD KEY `deduccion_ibfk_1` (`empleado_ID`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `det_d_sc`
--
ALTER TABLE `det_d_sc`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_det_d_sc_empleado` (`empleado_ID`);

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
  ADD KEY `FK_gran_total_empleado` (`empleado_ID`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `horario_ibfk_1` (`empleado_ID`);

--
-- Indices de la tabla `riesgo_profesional`
--
ALTER TABLE `riesgo_profesional`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_riesgo_profesional_empleado` (`empleado_ID`);

--
-- Indices de la tabla `sueldo`
--
ALTER TABLE `sueldo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_sueldo_empleado` (`empleado_ID`);

--
-- Indices de la tabla `vacaciones`
--
ALTER TABLE `vacaciones`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_vacaciones_empleado` (`empleado_ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aporte_pf`
--

ALTER TABLE `departamento`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `cargos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `empleados`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `aporte_pf`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `apropiaciones`
--
ALTER TABLE `apropiaciones`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `deduccion`
--
ALTER TABLE `deduccion`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `det_d_sc`
--
ALTER TABLE `det_d_sc`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT de la tabla `riesgo_profesional`
--
ALTER TABLE `riesgo_profesional`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sueldo`
--
ALTER TABLE `sueldo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vacaciones`
--
ALTER TABLE `vacaciones`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aporte_pf`
--
ALTER TABLE `aporte_pf`
  ADD CONSTRAINT `FK_aporte_pf_empleado` FOREIGN KEY (`empleado_ID`) REFERENCES `empleados` (`ID`);

--
-- Filtros para la tabla `deduccion`
--
ALTER TABLE `deduccion`
  ADD CONSTRAINT `deduccion_ibfk_1` FOREIGN KEY (`empleado_ID`) REFERENCES `empleados` (`ID`);

--
-- Filtros para la tabla `det_d_sc`
--
ALTER TABLE `det_d_sc`
  ADD CONSTRAINT `FK_det_d_sc_empleado` FOREIGN KEY (`empleado_ID`) REFERENCES `empleados` (`ID`);

--
-- Filtros para la tabla `gran_total`
--
ALTER TABLE `gran_total`
  ADD CONSTRAINT `FK_gran_total_empleado` FOREIGN KEY (`empleado_ID`) REFERENCES `empleados` (`ID`);

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`empleado_ID`) REFERENCES `empleados` (`ID`);

--
-- Filtros para la tabla `riesgo_profesional`
--
ALTER TABLE `riesgo_profesional`
  ADD CONSTRAINT `FK_riesgo_profesional_empleado` FOREIGN KEY (`empleado_ID`) REFERENCES `empleados` (`ID`);

--
-- Filtros para la tabla `sueldo`
--
ALTER TABLE `sueldo`
  ADD CONSTRAINT `FK_sueldo_empleado` FOREIGN KEY (`empleado_ID`) REFERENCES `empleados` (`ID`);

--
-- Filtros para la tabla `vacaciones`
--
ALTER TABLE `vacaciones`
  ADD CONSTRAINT `FK_vacaciones_empleado` FOREIGN KEY (`empleado_ID`) REFERENCES `empleados` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
