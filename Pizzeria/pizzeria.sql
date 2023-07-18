-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-07-2023 a las 11:16:02
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mi_empresa`
--
CREATE DATABASE IF NOT EXISTS `mi_empresa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mi_empresa`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(6) NOT NULL,
  `nif` varchar(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `direccion` text NOT NULL,
  `telf` varchar(15) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nif`, `nombre`, `apellidos`, `direccion`, `telf`, `fecha`) VALUES
(1, '11111111a', 'Pepe', 'Gonzalez', 'Av. Meridiana, 3 3-2', '63663632', '2023-01-31 23:00:00'),
(2, '22222222b', 'Marta', 'López', 'Valencia, 35 6-4', '63289874', '2023-01-31 23:00:00'),
(4, '33333333c', 'Ramón', 'Rodriguez', 'C/ Escorial, 98 2-1', '69853214', '2023-02-01 15:55:17');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `nif` (`nif`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Base de datos: `optica`
--
CREATE DATABASE IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `optica`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adreca`
--

CREATE TABLE `adreca` (
  `id` int(10) UNSIGNED NOT NULL,
  `carrer` varchar(100) NOT NULL,
  `numero` int(11) NOT NULL,
  `pis` int(11) NOT NULL,
  `porta` int(11) NOT NULL,
  `ciutat` varchar(40) NOT NULL,
  `codiPostal` int(11) NOT NULL,
  `pais` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL,
  `adrecaId` int(10) UNSIGNED NOT NULL,
  `telefon` varchar(9) NOT NULL,
  `email` varchar(60) NOT NULL,
  `dataRegistre` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id` int(10) UNSIGNED NOT NULL,
  `dataC` date NOT NULL,
  `preuTotal` double NOT NULL,
  `poveidorId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleat`
--

CREATE TABLE `empleat` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcaprovridor`
--

CREATE TABLE `marcaprovridor` (
  `proveidorid` int(10) UNSIGNED NOT NULL,
  `marcaId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveidor`
--

CREATE TABLE `proveidor` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL,
  `adrecaId` int(10) UNSIGNED NOT NULL,
  `telefon` varchar(9) NOT NULL,
  `fax` varchar(9) NOT NULL,
  `nif` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recomanat`
--

CREATE TABLE `recomanat` (
  `id` int(10) UNSIGNED NOT NULL,
  `clientId` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres`
--

CREATE TABLE `ulleres` (
  `id` int(10) UNSIGNED NOT NULL,
  `graduacioVidres` int(11) NOT NULL,
  `tipusMuntura` varchar(40) NOT NULL,
  `colorMuntura` varchar(40) NOT NULL,
  `ColorVidre` varchar(40) NOT NULL,
  `preu` double NOT NULL,
  `marcaId` int(10) UNSIGNED NOT NULL,
  `compraId` int(10) UNSIGNED NOT NULL,
  `ventaId` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id` int(10) UNSIGNED NOT NULL,
  `dataV` date NOT NULL,
  `clientId` int(10) UNSIGNED NOT NULL,
  `empleatId` int(10) UNSIGNED NOT NULL,
  `preuTotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adreca`
--
ALTER TABLE `adreca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`);

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`),
  ADD KEY `adrecaId` (`adrecaId`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`),
  ADD KEY `poveidorId` (`poveidorId`);

--
-- Indices de la tabla `empleat`
--
ALTER TABLE `empleat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`);

--
-- Indices de la tabla `marcaprovridor`
--
ALTER TABLE `marcaprovridor`
  ADD PRIMARY KEY (`marcaId`,`proveidorid`),
  ADD KEY `ind` (`marcaId`),
  ADD KEY `proveidorid` (`proveidorid`);

--
-- Indices de la tabla `proveidor`
--
ALTER TABLE `proveidor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nif` (`nif`),
  ADD KEY `ind` (`id`),
  ADD KEY `adrecaId` (`adrecaId`);

--
-- Indices de la tabla `recomanat`
--
ALTER TABLE `recomanat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`nom`),
  ADD KEY `clientId` (`clientId`);

--
-- Indices de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`),
  ADD KEY `compraId` (`compraId`),
  ADD KEY `marcaId` (`marcaId`),
  ADD KEY `ventaId` (`ventaId`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`),
  ADD KEY `clientId` (`clientId`),
  ADD KEY `empleatId` (`empleatId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `adreca`
--
ALTER TABLE `adreca`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleat`
--
ALTER TABLE `empleat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveidor`
--
ALTER TABLE `proveidor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recomanat`
--
ALTER TABLE `recomanat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`adrecaId`) REFERENCES `adreca` (`id`);

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`poveidorId`) REFERENCES `proveidor` (`id`);

--
-- Filtros para la tabla `marcaprovridor`
--
ALTER TABLE `marcaprovridor`
  ADD CONSTRAINT `marcaprovridor_ibfk_1` FOREIGN KEY (`marcaId`) REFERENCES `marca` (`id`),
  ADD CONSTRAINT `marcaprovridor_ibfk_2` FOREIGN KEY (`proveidorid`) REFERENCES `proveidor` (`id`);

--
-- Filtros para la tabla `proveidor`
--
ALTER TABLE `proveidor`
  ADD CONSTRAINT `proveidor_ibfk_1` FOREIGN KEY (`adrecaId`) REFERENCES `adreca` (`id`);

--
-- Filtros para la tabla `recomanat`
--
ALTER TABLE `recomanat`
  ADD CONSTRAINT `recomanat_ibfk_1` FOREIGN KEY (`clientId`) REFERENCES `client` (`id`);

--
-- Filtros para la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `ulleres_ibfk_1` FOREIGN KEY (`compraId`) REFERENCES `compra` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ulleres_ibfk_2` FOREIGN KEY (`marcaId`) REFERENCES `marca` (`id`),
  ADD CONSTRAINT `ulleres_ibfk_3` FOREIGN KEY (`ventaId`) REFERENCES `venta` (`id`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`clientId`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`empleatId`) REFERENCES `empleat` (`id`);
--
-- Base de datos: `opticadb`
--
CREATE DATABASE IF NOT EXISTS `opticadb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `opticadb`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adreca`
--

CREATE TABLE `adreca` (
  `id` int(10) UNSIGNED NOT NULL,
  `carrer` varchar(100) NOT NULL,
  `numero` int(11) NOT NULL,
  `pis` int(11) NOT NULL,
  `porta` int(11) NOT NULL,
  `ciutat` varchar(40) NOT NULL,
  `codiPostal` int(11) NOT NULL,
  `pais` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleat`
--

CREATE TABLE `empleat` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adreca`
--
ALTER TABLE `adreca`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleat`
--
ALTER TABLE `empleat`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `adreca`
--
ALTER TABLE `adreca`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleat`
--
ALTER TABLE `empleat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Volcado de datos para la tabla `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"relation_lines\":\"true\",\"snap_to_grid\":\"off\",\"angular_direct\":\"direct\",\"full_screen\":\"off\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Volcado de datos para la tabla `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'server', 'pizzeria', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"mi_empresa\",\"optica\",\"opticadb\",\"phpmyadmin\",\"pizzeria\",\"test\",\"tienda\",\"tienda_ciber\",\"universidad\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Estructura de la tabla @TABLE@\",\"latex_structure_continued_caption\":\"Estructura de la tabla @TABLE@ (continúa)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Contenido de la tabla @TABLE@\",\"latex_data_continued_caption\":\"Contenido de la tabla @TABLE@ (continúa)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__pdf_pages`
--

INSERT INTO `pma__pdf_pages` (`db_name`, `page_nr`, `page_descr`) VALUES
('tienda_ciber', 1, 'mapa'),
('tienda', 2, 'pageTienda'),
('universidad', 3, 'pageUniversidad'),
('optica', 4, 'pageOptica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"optica\",\"table\":\"proveidor\"},{\"db\":\"optica\",\"table\":\"ulleres\"},{\"db\":\"optica\",\"table\":\"venta\"},{\"db\":\"universidad\",\"table\":\"persona\"},{\"db\":\"tienda\",\"table\":\"producto\"},{\"db\":\"tienda\",\"table\":\"fabricante\"},{\"db\":\"tienda_ciber\",\"table\":\"categorias\"},{\"db\":\"tienda_ciber\",\"table\":\"productos\"},{\"db\":\"mi_empresa\",\"table\":\"usuarios\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

--
-- Volcado de datos para la tabla `pma__table_coords`
--

INSERT INTO `pma__table_coords` (`db_name`, `table_name`, `pdf_page_number`, `x`, `y`) VALUES
('optica', 'adreca', 4, 64, 326),
('optica', 'client', 4, 232, 646),
('optica', 'compra', 4, 536, 14),
('optica', 'empleat', 4, 574, 749),
('optica', 'marca', 4, 599, 359),
('optica', 'marcaprovridor', 4, 276, 326),
('optica', 'proveidor', 4, 287, 98),
('optica', 'recomanat', 4, 250, 462),
('optica', 'ulleres', 4, 841, 194),
('optica', 'venta', 4, 578, 522),
('tienda', 'fabricante', 2, 733, 288),
('tienda', 'producto', 2, 377, 200),
('tienda_ciber', 'categorias', 1, 164, 546),
('tienda_ciber', 'productos', 1, 669, 480),
('universidad', 'alumno_se_matricula_asignatura', 3, 400, 196),
('universidad', 'asignatura', 3, 463, 480),
('universidad', 'curso_escolar', 3, 109, 252),
('universidad', 'departamento', 3, 142, 73),
('universidad', 'grado', 3, 956, 714),
('universidad', 'persona', 3, 911, 245),
('universidad', 'profesor', 3, 526, 44);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Volcado de datos para la tabla `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'universidad', 'persona', '{\"sorted_col\":\"`persona`.`tipo` ASC\"}', '2023-07-17 10:47:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2023-07-18 06:53:15', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"es\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `pizzeria`
--
CREATE DATABASE IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pizzeria`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `beguda`
--

CREATE TABLE `beguda` (
  `id` int(10) UNSIGNED NOT NULL,
  `categoria` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `botiga`
--

CREATE TABLE `botiga` (
  `id` int(10) UNSIGNED NOT NULL,
  `adreca` varchar(150) NOT NULL,
  `codiPostal` int(11) NOT NULL,
  `localitatId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL,
  `cognoms` varchar(100) NOT NULL,
  `adreca` varchar(151) NOT NULL,
  `codiPostal` int(11) NOT NULL,
  `telefon` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comanda`
--

CREATE TABLE `comanda` (
  `id` int(10) UNSIGNED NOT NULL,
  `dataHora` datetime NOT NULL,
  `clientId` int(10) UNSIGNED NOT NULL,
  `botigaId` int(10) UNSIGNED NOT NULL,
  `preuTotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuiner`
--

CREATE TABLE `cuiner` (
  `id` int(10) UNSIGNED NOT NULL,
  `funcio` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleat`
--

CREATE TABLE `empleat` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL,
  `cognoms` varchar(80) NOT NULL,
  `nif` varchar(9) NOT NULL,
  `telefon` varchar(9) NOT NULL,
  `botigaId` int(10) UNSIGNED NOT NULL,
  `tipo` enum('cuiner','repartidor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hamburguesa`
--

CREATE TABLE `hamburguesa` (
  `id` int(10) UNSIGNED NOT NULL,
  `categoria` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `liniacomanda`
--

CREATE TABLE `liniacomanda` (
  `id` int(10) UNSIGNED NOT NULL,
  `comandaId` int(10) UNSIGNED NOT NULL,
  `producteId` int(10) UNSIGNED NOT NULL,
  `quantitat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lliurament`
--

CREATE TABLE `lliurament` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL,
  `comandaId` int(10) UNSIGNED NOT NULL,
  `repartidorId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localitat`
--

CREATE TABLE `localitat` (
  `id` int(10) UNSIGNED NOT NULL,
  `provinciaId` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pizza`
--

CREATE TABLE `pizza` (
  `id` int(10) UNSIGNED NOT NULL,
  `categoria` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producte`
--

CREATE TABLE `producte` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL,
  `descripcio` varchar(250) NOT NULL,
  `imatge` varchar(120) NOT NULL,
  `preu` double NOT NULL,
  `tipo` enum('hamburguesa','pizza','beguda') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repartidor`
--

CREATE TABLE `repartidor` (
  `id` int(10) UNSIGNED NOT NULL,
  `funcio` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `beguda`
--
ALTER TABLE `beguda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`);

--
-- Indices de la tabla `botiga`
--
ALTER TABLE `botiga`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`),
  ADD KEY `localitatId` (`localitatId`);

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`);

--
-- Indices de la tabla `comanda`
--
ALTER TABLE `comanda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`),
  ADD KEY `clientId` (`clientId`),
  ADD KEY `botigaId` (`botigaId`);

--
-- Indices de la tabla `cuiner`
--
ALTER TABLE `cuiner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`);

--
-- Indices de la tabla `empleat`
--
ALTER TABLE `empleat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`),
  ADD KEY `botigaId` (`botigaId`);

--
-- Indices de la tabla `hamburguesa`
--
ALTER TABLE `hamburguesa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`);

--
-- Indices de la tabla `liniacomanda`
--
ALTER TABLE `liniacomanda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`),
  ADD KEY `comandaId` (`comandaId`),
  ADD KEY `producteId` (`producteId`);

--
-- Indices de la tabla `lliurament`
--
ALTER TABLE `lliurament`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`),
  ADD KEY `comandaId` (`comandaId`),
  ADD KEY `repartidorId` (`repartidorId`);

--
-- Indices de la tabla `localitat`
--
ALTER TABLE `localitat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`),
  ADD KEY `provinciaId` (`provinciaId`);

--
-- Indices de la tabla `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`);

--
-- Indices de la tabla `producte`
--
ALTER TABLE `producte`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`);

--
-- Indices de la tabla `repartidor`
--
ALTER TABLE `repartidor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `botiga`
--
ALTER TABLE `botiga`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comanda`
--
ALTER TABLE `comanda`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuiner`
--
ALTER TABLE `cuiner`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleat`
--
ALTER TABLE `empleat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `liniacomanda`
--
ALTER TABLE `liniacomanda`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lliurament`
--
ALTER TABLE `lliurament`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `localitat`
--
ALTER TABLE `localitat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producte`
--
ALTER TABLE `producte`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `repartidor`
--
ALTER TABLE `repartidor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `beguda`
--
ALTER TABLE `beguda`
  ADD CONSTRAINT `beguda_ibfk_1` FOREIGN KEY (`id`) REFERENCES `producte` (`id`);

--
-- Filtros para la tabla `botiga`
--
ALTER TABLE `botiga`
  ADD CONSTRAINT `botiga_ibfk_1` FOREIGN KEY (`localitatId`) REFERENCES `localitat` (`id`);

--
-- Filtros para la tabla `comanda`
--
ALTER TABLE `comanda`
  ADD CONSTRAINT `comanda_ibfk_1` FOREIGN KEY (`clientId`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `comanda_ibfk_2` FOREIGN KEY (`botigaId`) REFERENCES `botiga` (`id`);

--
-- Filtros para la tabla `cuiner`
--
ALTER TABLE `cuiner`
  ADD CONSTRAINT `cuiner_ibfk_1` FOREIGN KEY (`id`) REFERENCES `empleat` (`id`);

--
-- Filtros para la tabla `empleat`
--
ALTER TABLE `empleat`
  ADD CONSTRAINT `empleat_ibfk_1` FOREIGN KEY (`botigaId`) REFERENCES `botiga` (`id`);

--
-- Filtros para la tabla `hamburguesa`
--
ALTER TABLE `hamburguesa`
  ADD CONSTRAINT `hamburguesa_ibfk_1` FOREIGN KEY (`id`) REFERENCES `producte` (`id`);

--
-- Filtros para la tabla `liniacomanda`
--
ALTER TABLE `liniacomanda`
  ADD CONSTRAINT `liniacomanda_ibfk_1` FOREIGN KEY (`comandaId`) REFERENCES `comanda` (`id`),
  ADD CONSTRAINT `liniacomanda_ibfk_2` FOREIGN KEY (`producteId`) REFERENCES `producte` (`id`);

--
-- Filtros para la tabla `lliurament`
--
ALTER TABLE `lliurament`
  ADD CONSTRAINT `lliurament_ibfk_1` FOREIGN KEY (`comandaId`) REFERENCES `comanda` (`id`),
  ADD CONSTRAINT `lliurament_ibfk_2` FOREIGN KEY (`repartidorId`) REFERENCES `repartidor` (`id`);

--
-- Filtros para la tabla `localitat`
--
ALTER TABLE `localitat`
  ADD CONSTRAINT `localitat_ibfk_1` FOREIGN KEY (`provinciaId`) REFERENCES `provincia` (`id`);

--
-- Filtros para la tabla `pizza`
--
ALTER TABLE `pizza`
  ADD CONSTRAINT `pizza_ibfk_1` FOREIGN KEY (`id`) REFERENCES `producte` (`id`);

--
-- Filtros para la tabla `repartidor`
--
ALTER TABLE `repartidor`
  ADD CONSTRAINT `repartidor_ibfk_1` FOREIGN KEY (`id`) REFERENCES `empleat` (`id`);
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Base de datos: `tienda`
--
CREATE DATABASE IF NOT EXISTS `tienda` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tienda`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fabricante`
--

CREATE TABLE `fabricante` (
  `codigo` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `fabricante`
--

INSERT INTO `fabricante` (`codigo`, `nombre`) VALUES
(1, 'Asus'),
(2, 'Lenovo'),
(3, 'Hewlett-Packard'),
(4, 'Samsung'),
(5, 'Seagate'),
(6, 'Crucial'),
(7, 'Gigabyte'),
(8, 'Huawei'),
(9, 'Xiaomi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codigo` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` double NOT NULL,
  `codigo_fabricante` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codigo`, `nombre`, `precio`, `codigo_fabricante`) VALUES
(1, 'Disco duro SATA3 1TB', 86.99, 5),
(2, 'Memoria RAM DDR4 8GB', 120, 6),
(3, 'Disco SSD 1 TB', 150.99, 4),
(4, 'GeForce GTX 1050Ti', 185, 7),
(5, 'GeForce GTX 1080 Xtreme', 755, 6),
(6, 'Monitor 24 LED Full HD', 202, 1),
(7, 'Monitor 27 LED Full HD', 245.99, 1),
(8, 'Portátil Yoga 520', 559, 2),
(9, 'Portátil Ideapd 320', 444, 2),
(10, 'Impresora HP Deskjet 3720', 59.99, 3),
(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `fabricante`
--
ALTER TABLE `fabricante`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigo_fabricante` (`codigo_fabricante`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `fabricante`
--
ALTER TABLE `fabricante`
  MODIFY `codigo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `codigo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`codigo_fabricante`) REFERENCES `fabricante` (`codigo`);
--
-- Base de datos: `tienda_ciber`
--
CREATE DATABASE IF NOT EXISTS `tienda_ciber` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tienda_ciber`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(12) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`, `descripcion`) VALUES
(1, 'Rock', ''),
(2, 'Jazz', ''),
(3, 'Heavy', ''),
(4, 'Blues', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(12) NOT NULL,
  `categoria_id` int(12) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(8,2) NOT NULL,
  `url_foto` text NOT NULL,
  `n_opiniones` smallint(5) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `categoria_id`, `nombre`, `descripcion`, `precio`, `url_foto`, `n_opiniones`, `fecha`) VALUES
(1, 4, 'B.B. King – His Definitive Greatest Hits', 'Riley B. King ​ o Riley Ben King ​ ​ (Itta Bena, Misisipi, 16 de septiembre de 1925–Las Vegas, 14 de mayo de 2015 ​), más conocido como B.B. King, fue un músico, cantante y compositor estadounidense', '15.00', 'bb_king.jpg', 0, '2023-02-02 14:48:59'),
(2, 3, 'Iron Maiden - The Number Of The Beast', 'Edición especial triple vinilo negro que conmemora el 40 aniversario de The Number Of The Beast, el tercer álbum de estudio de IRON MAIDEN. Este fue el primer álbum en presentar a Bruce Dickinson a la voz, y el disco que catapultó a la banda al estrellato internacional.', '25.00', 'iron maiden.jpg', 0, '2023-02-01 18:34:29'),
(3, 2, 'Miles Davis - Kind of Blue', 'Kind of Blue —en español: Una especie de tristeza o algún tipo de tristeza— es un álbum de estudio del músico estadounidense de jazz Miles Davis editado en agosto de 1959.', '18.00', 'miles davis.jpg', 0, '2023-02-01 17:52:55'),
(4, 1, 'Bruce Springsteen - Born To Run', 'Born to Run —en español: Nacido para correr— es el tercer álbum de estudio del músico estadounidense Bruce Springsteen, publicado por la compañía discográfica Columbia Records en agosto de 1975.', '17.00', 'springsteen.jpg', 0, '2023-02-01 17:53:04'),
(5, 3, 'Guns\'n Roses - Appetite for Destruction', 'Appetite for Destruction —en español: Apetito destructivo — es el álbum debut de la banda estadounidense de hard rock Guns N\' Roses, fue publicado por la compañía discográfica Geffen Records el 21 de julio de 1987', '21.00', 'guns.jpg', 0, '2023-02-01 18:34:35');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id_categoria`);
--
-- Base de datos: `universidad`
--
CREATE DATABASE IF NOT EXISTS `universidad` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `universidad`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno_se_matricula_asignatura`
--

CREATE TABLE `alumno_se_matricula_asignatura` (
  `id_alumno` int(10) UNSIGNED NOT NULL,
  `id_asignatura` int(10) UNSIGNED NOT NULL,
  `id_curso_escolar` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumno_se_matricula_asignatura`
--

INSERT INTO `alumno_se_matricula_asignatura` (`id_alumno`, `id_asignatura`, `id_curso_escolar`) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(2, 1, 1),
(2, 2, 1),
(2, 3, 1),
(4, 1, 1),
(4, 2, 1),
(4, 3, 1),
(19, 1, 5),
(19, 2, 5),
(19, 3, 5),
(19, 4, 5),
(19, 5, 5),
(19, 6, 5),
(19, 7, 5),
(19, 8, 5),
(19, 9, 5),
(19, 10, 5),
(23, 1, 5),
(23, 2, 5),
(23, 3, 5),
(23, 4, 5),
(23, 5, 5),
(23, 6, 5),
(23, 7, 5),
(23, 8, 5),
(23, 9, 5),
(23, 10, 5),
(24, 1, 5),
(24, 2, 5),
(24, 3, 5),
(24, 4, 5),
(24, 5, 5),
(24, 6, 5),
(24, 7, 5),
(24, 8, 5),
(24, 9, 5),
(24, 10, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `creditos` float UNSIGNED NOT NULL,
  `tipo` enum('básica','obligatoria','optativa') NOT NULL,
  `curso` tinyint(3) UNSIGNED NOT NULL,
  `cuatrimestre` tinyint(3) UNSIGNED NOT NULL,
  `id_profesor` int(10) UNSIGNED DEFAULT NULL,
  `id_grado` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`id`, `nombre`, `creditos`, `tipo`, `curso`, `cuatrimestre`, `id_profesor`, `id_grado`) VALUES
(1, 'Álgegra lineal y matemática discreta', 6, 'básica', 1, 1, 3, 4),
(2, 'Cálculo', 6, 'básica', 1, 1, 14, 4),
(3, 'Física para informática', 6, 'básica', 1, 1, 3, 4),
(4, 'Introducción a la programación', 6, 'básica', 1, 1, 14, 4),
(5, 'Organización y gestión de empresas', 6, 'básica', 1, 1, 3, 4),
(6, 'Estadística', 6, 'básica', 1, 2, 14, 4),
(7, 'Estructura y tecnología de computadores', 6, 'básica', 1, 2, 3, 4),
(8, 'Fundamentos de electrónica', 6, 'básica', 1, 2, 14, 4),
(9, 'Lógica y algorítmica', 6, 'básica', 1, 2, 3, 4),
(10, 'Metodología de la programación', 6, 'básica', 1, 2, 14, 4),
(11, 'Arquitectura de Computadores', 6, 'básica', 2, 1, 3, 4),
(12, 'Estructura de Datos y Algoritmos I', 6, 'obligatoria', 2, 1, 3, 4),
(13, 'Ingeniería del Software', 6, 'obligatoria', 2, 1, 14, 4),
(14, 'Sistemas Inteligentes', 6, 'obligatoria', 2, 1, 3, 4),
(15, 'Sistemas Operativos', 6, 'obligatoria', 2, 1, 14, 4),
(16, 'Bases de Datos', 6, 'básica', 2, 2, 14, 4),
(17, 'Estructura de Datos y Algoritmos II', 6, 'obligatoria', 2, 2, 14, 4),
(18, 'Fundamentos de Redes de Computadores', 6, 'obligatoria', 2, 2, 3, 4),
(19, 'Planificación y Gestión de Proyectos Informáticos', 6, 'obligatoria', 2, 2, 3, 4),
(20, 'Programación de Servicios Software', 6, 'obligatoria', 2, 2, 14, 4),
(21, 'Desarrollo de interfaces de usuario', 6, 'obligatoria', 3, 1, 14, 4),
(22, 'Ingeniería de Requisitos', 6, 'optativa', 3, 1, NULL, 4),
(23, 'Integración de las Tecnologías de la Información en las Organizaciones', 6, 'optativa', 3, 1, NULL, 4),
(24, 'Modelado y Diseño del Software 1', 6, 'optativa', 3, 1, NULL, 4),
(25, 'Multiprocesadores', 6, 'optativa', 3, 1, NULL, 4),
(26, 'Seguridad y cumplimiento normativo', 6, 'optativa', 3, 1, NULL, 4),
(27, 'Sistema de Información para las Organizaciones', 6, 'optativa', 3, 1, NULL, 4),
(28, 'Tecnologías web', 6, 'optativa', 3, 1, NULL, 4),
(29, 'Teoría de códigos y criptografía', 6, 'optativa', 3, 1, NULL, 4),
(30, 'Administración de bases de datos', 6, 'optativa', 3, 2, NULL, 4),
(31, 'Herramientas y Métodos de Ingeniería del Software', 6, 'optativa', 3, 2, NULL, 4),
(32, 'Informática industrial y robótica', 6, 'optativa', 3, 2, NULL, 4),
(33, 'Ingeniería de Sistemas de Información', 6, 'optativa', 3, 2, NULL, 4),
(34, 'Modelado y Diseño del Software 2', 6, 'optativa', 3, 2, NULL, 4),
(35, 'Negocio Electrónico', 6, 'optativa', 3, 2, NULL, 4),
(36, 'Periféricos e interfaces', 6, 'optativa', 3, 2, NULL, 4),
(37, 'Sistemas de tiempo real', 6, 'optativa', 3, 2, NULL, 4),
(38, 'Tecnologías de acceso a red', 6, 'optativa', 3, 2, NULL, 4),
(39, 'Tratamiento digital de imágenes', 6, 'optativa', 3, 2, NULL, 4),
(40, 'Administración de redes y sistemas operativos', 6, 'optativa', 4, 1, NULL, 4),
(41, 'Almacenes de Datos', 6, 'optativa', 4, 1, NULL, 4),
(42, 'Fiabilidad y Gestión de Riesgos', 6, 'optativa', 4, 1, NULL, 4),
(43, 'Líneas de Productos Software', 6, 'optativa', 4, 1, NULL, 4),
(44, 'Procesos de Ingeniería del Software 1', 6, 'optativa', 4, 1, NULL, 4),
(45, 'Tecnologías multimedia', 6, 'optativa', 4, 1, NULL, 4),
(46, 'Análisis y planificación de las TI', 6, 'optativa', 4, 2, NULL, 4),
(47, 'Desarrollo Rápido de Aplicaciones', 6, 'optativa', 4, 2, NULL, 4),
(48, 'Gestión de la Calidad y de la Innovación Tecnológica', 6, 'optativa', 4, 2, NULL, 4),
(49, 'Inteligencia del Negocio', 6, 'optativa', 4, 2, NULL, 4),
(50, 'Procesos de Ingeniería del Software 2', 6, 'optativa', 4, 2, NULL, 4),
(51, 'Seguridad Informática', 6, 'optativa', 4, 2, NULL, 4),
(52, 'Biologia celular', 6, 'básica', 1, 1, NULL, 7),
(53, 'Física', 6, 'básica', 1, 1, NULL, 7),
(54, 'Matemáticas I', 6, 'básica', 1, 1, NULL, 7),
(55, 'Química general', 6, 'básica', 1, 1, NULL, 7),
(56, 'Química orgánica', 6, 'básica', 1, 1, NULL, 7),
(57, 'Biología vegetal y animal', 6, 'básica', 1, 2, NULL, 7),
(58, 'Bioquímica', 6, 'básica', 1, 2, NULL, 7),
(59, 'Genética', 6, 'básica', 1, 2, NULL, 7),
(60, 'Matemáticas II', 6, 'básica', 1, 2, NULL, 7),
(61, 'Microbiología', 6, 'básica', 1, 2, NULL, 7),
(62, 'Botánica agrícola', 6, 'obligatoria', 2, 1, NULL, 7),
(63, 'Fisiología vegetal', 6, 'obligatoria', 2, 1, NULL, 7),
(64, 'Genética molecular', 6, 'obligatoria', 2, 1, NULL, 7),
(65, 'Ingeniería bioquímica', 6, 'obligatoria', 2, 1, NULL, 7),
(66, 'Termodinámica y cinética química aplicada', 6, 'obligatoria', 2, 1, NULL, 7),
(67, 'Biorreactores', 6, 'obligatoria', 2, 2, NULL, 7),
(68, 'Biotecnología microbiana', 6, 'obligatoria', 2, 2, NULL, 7),
(69, 'Ingeniería genética', 6, 'obligatoria', 2, 2, NULL, 7),
(70, 'Inmunología', 6, 'obligatoria', 2, 2, NULL, 7),
(71, 'Virología', 6, 'obligatoria', 2, 2, NULL, 7),
(72, 'Bases moleculares del desarrollo vegetal', 4.5, 'obligatoria', 3, 1, NULL, 7),
(73, 'Fisiología animal', 4.5, 'obligatoria', 3, 1, NULL, 7),
(74, 'Metabolismo y biosíntesis de biomoléculas', 6, 'obligatoria', 3, 1, NULL, 7),
(75, 'Operaciones de separación', 6, 'obligatoria', 3, 1, NULL, 7),
(76, 'Patología molecular de plantas', 4.5, 'obligatoria', 3, 1, NULL, 7),
(77, 'Técnicas instrumentales básicas', 4.5, 'obligatoria', 3, 1, NULL, 7),
(78, 'Bioinformática', 4.5, 'obligatoria', 3, 2, NULL, 7),
(79, 'Biotecnología de los productos hortofrutículas', 4.5, 'obligatoria', 3, 2, NULL, 7),
(80, 'Biotecnología vegetal', 6, 'obligatoria', 3, 2, NULL, 7),
(81, 'Genómica y proteómica', 4.5, 'obligatoria', 3, 2, NULL, 7),
(82, 'Procesos biotecnológicos', 6, 'obligatoria', 3, 2, NULL, 7),
(83, 'Técnicas instrumentales avanzadas', 4.5, 'obligatoria', 3, 2, NULL, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_escolar`
--

CREATE TABLE `curso_escolar` (
  `id` int(10) UNSIGNED NOT NULL,
  `anyo_inicio` year(4) NOT NULL,
  `anyo_fin` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `curso_escolar`
--

INSERT INTO `curso_escolar` (`id`, `anyo_inicio`, `anyo_fin`) VALUES
(1, 2014, 2015),
(2, 2015, 2016),
(3, 2016, 2017),
(4, 2017, 2018),
(5, 2018, 2019);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id`, `nombre`) VALUES
(1, 'Informática'),
(2, 'Matemáticas'),
(3, 'Economía y Empresa'),
(4, 'Educación'),
(5, 'Agronomía'),
(6, 'Química y Física'),
(7, 'Filología'),
(8, 'Derecho'),
(9, 'Biología y Geología');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

CREATE TABLE `grado` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `grado`
--

INSERT INTO `grado` (`id`, `nombre`) VALUES
(1, 'Grado en Ingeniería Agrícola (Plan 2015)'),
(2, 'Grado en Ingeniería Eléctrica (Plan 2014)'),
(3, 'Grado en Ingeniería Electrónica Industrial (Plan 2010)'),
(4, 'Grado en Ingeniería Informática (Plan 2015)'),
(5, 'Grado en Ingeniería Mecánica (Plan 2010)'),
(6, 'Grado en Ingeniería Química Industrial (Plan 2010)'),
(7, 'Grado en Biotecnología (Plan 2015)'),
(8, 'Grado en Ciencias Ambientales (Plan 2009)'),
(9, 'Grado en Matemáticas (Plan 2010)'),
(10, 'Grado en Química (Plan 2009)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int(10) UNSIGNED NOT NULL,
  `nif` varchar(9) DEFAULT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido1` varchar(50) NOT NULL,
  `apellido2` varchar(50) DEFAULT NULL,
  `ciudad` varchar(25) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` enum('H','M') NOT NULL,
  `tipo` enum('profesor','alumno') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `nif`, `nombre`, `apellido1`, `apellido2`, `ciudad`, `direccion`, `telefono`, `fecha_nacimiento`, `sexo`, `tipo`) VALUES
(1, '26902806M', 'Salvador', 'Sánchez', 'Pérez', 'Almería', 'C/ Real del barrio alto', '950254837', '1991-03-28', 'H', 'alumno'),
(2, '89542419S', 'Juan', 'Saez', 'Vega', 'Almería', 'C/ Mercurio', '618253876', '1992-08-08', 'H', 'alumno'),
(3, '11105554G', 'Zoe', 'Ramirez', 'Gea', 'Almería', 'C/ Marte', '618223876', '1979-08-19', 'M', 'profesor'),
(4, '17105885A', 'Pedro', 'Heller', 'Pagac', 'Almería', 'C/ Estrella fugaz', NULL, '2000-10-05', 'H', 'alumno'),
(5, '38223286T', 'David', 'Schmidt', 'Fisher', 'Almería', 'C/ Venus', '678516294', '1978-01-19', 'H', 'profesor'),
(6, '04233869Y', 'José', 'Koss', 'Bayer', 'Almería', 'C/ Júpiter', '628349590', '1998-01-28', 'H', 'alumno'),
(7, '97258166K', 'Ismael', 'Strosin', 'Turcotte', 'Almería', 'C/ Neptuno', NULL, '1999-05-24', 'H', 'alumno'),
(8, '79503962T', 'Cristina', 'Lemke', 'Rutherford', 'Almería', 'C/ Saturno', '669162534', '1977-08-21', 'M', 'profesor'),
(9, '82842571K', 'Ramón', 'Herzog', 'Tremblay', 'Almería', 'C/ Urano', '626351429', '1996-11-21', 'H', 'alumno'),
(10, '61142000L', 'Esther', 'Spencer', 'Lakin', 'Almería', 'C/ Plutón', NULL, '1977-05-19', 'M', 'profesor'),
(11, '46900725E', 'Daniel', 'Herman', 'Pacocha', 'Almería', 'C/ Andarax', '679837625', '1997-04-26', 'H', 'alumno'),
(12, '85366986W', 'Carmen', 'Streich', 'Hirthe', 'Almería', 'C/ Almanzora', NULL, '1971-04-29', 'M', 'profesor'),
(13, '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'Almería', 'C/ Guadalquivir', '950896725', '1980-02-01', 'H', 'profesor'),
(14, '82937751G', 'Manolo', 'Hamill', 'Kozey', 'Almería', 'C/ Duero', '950263514', '1977-01-02', 'H', 'profesor'),
(15, '80502866Z', 'Alejandro', 'Kohler', 'Schoen', 'Almería', 'C/ Tajo', '668726354', '1980-03-14', 'H', 'profesor'),
(16, '10485008K', 'Antonio', 'Fahey', 'Considine', 'Almería', 'C/ Sierra de los Filabres', NULL, '1982-03-18', 'H', 'profesor'),
(17, '85869555K', 'Guillermo', 'Ruecker', 'Upton', 'Almería', 'C/ Sierra de Gádor', NULL, '1973-05-05', 'H', 'profesor'),
(18, '04326833G', 'Micaela', 'Monahan', 'Murray', 'Almería', 'C/ Veleta', '662765413', '1976-02-25', 'H', 'profesor'),
(19, '11578526G', 'Inma', 'Lakin', 'Yundt', 'Almería', 'C/ Picos de Europa', '678652431', '1998-09-01', 'M', 'alumno'),
(20, '79221403L', 'Francesca', 'Schowalter', 'Muller', 'Almería', 'C/ Quinto pino', NULL, '1980-10-31', 'H', 'profesor'),
(21, '79089577Y', 'Juan', 'Gutiérrez', 'López', 'Almería', 'C/ Los pinos', '678652431', '1998-01-01', 'H', 'alumno'),
(22, '41491230N', 'Antonio', 'Domínguez', 'Guerrero', 'Almería', 'C/ Cabo de Gata', '626652498', '1999-02-11', 'H', 'alumno'),
(23, '64753215G', 'Irene', 'Hernández', 'Martínez', 'Almería', 'C/ Zapillo', '628452384', '1996-03-12', 'M', 'alumno'),
(24, '85135690V', 'Sonia', 'Gea', 'Ruiz', 'Almería', 'C/ Mercurio', '678812017', '1995-04-13', 'M', 'alumno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `id_profesor` int(10) UNSIGNED NOT NULL,
  `id_departamento` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`id_profesor`, `id_departamento`) VALUES
(3, 1),
(14, 1),
(5, 2),
(15, 2),
(8, 3),
(16, 3),
(10, 4),
(12, 4),
(17, 4),
(18, 5),
(13, 6),
(20, 6);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno_se_matricula_asignatura`
--
ALTER TABLE `alumno_se_matricula_asignatura`
  ADD PRIMARY KEY (`id_alumno`,`id_asignatura`,`id_curso_escolar`),
  ADD KEY `id_asignatura` (`id_asignatura`),
  ADD KEY `id_curso_escolar` (`id_curso_escolar`);

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_profesor` (`id_profesor`),
  ADD KEY `id_grado` (`id_grado`);

--
-- Indices de la tabla `curso_escolar`
--
ALTER TABLE `curso_escolar`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `grado`
--
ALTER TABLE `grado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nif` (`nif`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id_profesor`),
  ADD KEY `id_departamento` (`id_departamento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT de la tabla `curso_escolar`
--
ALTER TABLE `curso_escolar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `grado`
--
ALTER TABLE `grado`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno_se_matricula_asignatura`
--
ALTER TABLE `alumno_se_matricula_asignatura`
  ADD CONSTRAINT `alumno_se_matricula_asignatura_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `persona` (`id`),
  ADD CONSTRAINT `alumno_se_matricula_asignatura_ibfk_2` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id`),
  ADD CONSTRAINT `alumno_se_matricula_asignatura_ibfk_3` FOREIGN KEY (`id_curso_escolar`) REFERENCES `curso_escolar` (`id`);

--
-- Filtros para la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD CONSTRAINT `asignatura_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_profesor`),
  ADD CONSTRAINT `asignatura_ibfk_2` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id`);

--
-- Filtros para la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD CONSTRAINT `profesor_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `persona` (`id`),
  ADD CONSTRAINT `profesor_ibfk_2` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
