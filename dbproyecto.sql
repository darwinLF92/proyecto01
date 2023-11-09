-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-11-2023 a las 18:07:37
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbproyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add componente producto', 7, 'add_componenteproducto'),
(26, 'Can change componente producto', 7, 'change_componenteproducto'),
(27, 'Can delete componente producto', 7, 'delete_componenteproducto'),
(28, 'Can view componente producto', 7, 'view_componenteproducto'),
(29, 'Can add producto', 8, 'add_producto'),
(30, 'Can change producto', 8, 'change_producto'),
(31, 'Can delete producto', 8, 'delete_producto'),
(32, 'Can view producto', 8, 'view_producto'),
(33, 'Can add transaccion', 9, 'add_transaccion'),
(34, 'Can change transaccion', 9, 'change_transaccion'),
(35, 'Can delete transaccion', 9, 'delete_transaccion'),
(36, 'Can view transaccion', 9, 'view_transaccion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$r1dxelvsLuWYLkXCOSdPbF$8+w5l+giC7NHoAjBbpIfcocCV94h2pilV73ro3qg9TY=', '2023-11-08 19:23:55.000000', 1, 'Darwin', '', '', '', 1, 1, '2023-11-07 00:20:36.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'Producto', 'componenteproducto'),
(8, 'Producto', 'producto'),
(9, 'Producto', 'transaccion'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'Producto', '0001_initial', '2023-11-07 00:19:12.000000'),
(2, 'Producto', '0002_producto_activo', '2023-11-07 00:19:12.000000'),
(3, 'Producto', '0003_rename_codigo_producto_codigo_and_more', '2023-11-07 00:19:12.000000'),
(4, 'Producto', '0004_producto_tiene_descuento', '2023-11-07 00:19:12.000000'),
(5, 'Producto', '0005_transaccion', '2023-11-07 00:19:12.000000'),
(6, 'contenttypes', '0001_initial', '2023-11-07 00:19:12.000000'),
(7, 'auth', '0001_initial', '2023-11-07 00:19:13.000000'),
(8, 'admin', '0001_initial', '2023-11-07 00:19:13.000000'),
(9, 'admin', '0002_logentry_remove_auto_add', '2023-11-07 00:19:13.000000'),
(10, 'admin', '0003_logentry_add_action_flag_choices', '2023-11-07 00:19:13.000000'),
(11, 'contenttypes', '0002_remove_content_type_name', '2023-11-07 00:19:14.000000'),
(12, 'auth', '0002_alter_permission_name_max_length', '2023-11-07 00:19:14.000000'),
(13, 'auth', '0003_alter_user_email_max_length', '2023-11-07 00:19:14.000000'),
(14, 'auth', '0004_alter_user_username_opts', '2023-11-07 00:19:14.000000'),
(15, 'auth', '0005_alter_user_last_login_null', '2023-11-07 00:19:14.000000'),
(16, 'auth', '0006_require_contenttypes_0002', '2023-11-07 00:19:14.000000'),
(17, 'auth', '0007_alter_validators_add_error_messages', '2023-11-07 00:19:14.000000'),
(18, 'auth', '0008_alter_user_username_max_length', '2023-11-07 00:19:14.000000'),
(19, 'auth', '0009_alter_user_last_name_max_length', '2023-11-07 00:19:14.000000'),
(20, 'auth', '0010_alter_group_name_max_length', '2023-11-07 00:19:14.000000'),
(21, 'auth', '0011_update_proxy_permissions', '2023-11-07 00:19:14.000000'),
(22, 'auth', '0012_alter_user_first_name_max_length', '2023-11-07 00:19:14.000000'),
(23, 'sessions', '0001_initial', '2023-11-07 00:19:14.000000'),
(24, 'Producto', '0006_alter_componenteproducto_producto_componente_and_more', '2023-11-08 02:35:57.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('dtop3ac7knsqs4j8sicgtasyqa1i94gw', '.eJxVjEsKwzAMRO_idTG2RRK5y-57BiNZVpO2xJDPKvTuTSCLFmY1781sJtG69Gmdy5QGMVfjzeW3Y8qvMh5AnjQ-qs11XKaB7aHYk872XqW8b6f7d9DT3O9rYAmC2rYlRIYYKXTZNwhAvnEB9giw73KhDrGAsKrToJERAV1Q8_kC1n03pg:1r0XKa:f1zq19m1upbN9FvRRfaBjTFOc00amZeoDIoI8RkdeCc', '2023-11-22 01:26:08.000000'),
('hvobmjpur0vtfkljy9vcggnzb2r1u9zu', '.eJxVjEsKwzAMRO_idTG2RRK5y-57BiNZVpO2xJDPKvTuTSCLFmY1781sJtG69Gmdy5QGMVfjzeW3Y8qvMh5AnjQ-qs11XKaB7aHYk872XqW8b6f7d9DT3O9rYAmC2rYlRIYYKXTZNwhAvnEB9giw73KhDrGAsKrToJERAV1Q8_kC1n03pg:1r0o9b:oZ5XcCaOO3FQKHSeFzHgpt30N60jqq_W32adkt4Gi8E', '2023-11-22 19:23:55.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_componenteproducto`
--

CREATE TABLE `producto_componenteproducto` (
  `id` bigint(20) NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL,
  `producto_componente_id` bigint(20) NOT NULL,
  `producto_principal_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto_componenteproducto`
--

INSERT INTO `producto_componenteproducto` (`id`, `cantidad`, `producto_componente_id`, `producto_principal_id`) VALUES
(1, 2, 2, 1),
(2, 2, 2, 3),
(3, 2, 3, 2),
(4, 3, 2, 4),
(5, 2, 3, 4),
(6, 4, 1, 4),
(7, 2, 1, 7),
(8, 3, 1, 8),
(9, 3, 9, 11),
(14, 2, 9, 13),
(15, 3, 10, 13),
(18, 4, 10, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_producto`
--

CREATE TABLE `producto_producto` (
  `id` bigint(20) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` longtext,
  `precio_compra` decimal(10,2) NOT NULL,
  `precio_venta` decimal(10,2) NOT NULL,
  `stock` int(10) UNSIGNED NOT NULL,
  `para_fabricacion` tinyint(1) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `tiene_descuento` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto_producto`
--

INSERT INTO `producto_producto` (`id`, `codigo`, `nombre`, `descripcion`, `precio_compra`, `precio_venta`, `stock`, `para_fabricacion`, `activo`, `tiene_descuento`) VALUES
(9, '6363', 'PRODUCTO 1', '', '4.80', '6.00', 300, 0, 1, 1),
(10, '6364411', 'PRODUCTO 2', '', '6.50', '8.50', 300, 0, 1, 1),
(11, '741', 'NUCLEO', '', '40.40', '250.00', 0, 1, 1, 1),
(12, '963', 'PRODUCTO 3', '', '6.50', '9.50', 250, 0, 1, 1),
(13, '963554', 'PRUEBA', '', '94.50', '250.00', 0, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_transaccion`
--

CREATE TABLE `producto_transaccion` (
  `id` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_registro` datetime(6) NOT NULL,
  `producto_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto_transaccion`
--

INSERT INTO `producto_transaccion` (`id`, `cantidad`, `fecha_registro`, `producto_id`) VALUES
(1, 1, '2023-11-07 02:35:09.000000', 2),
(2, 25, '2023-11-07 04:22:11.000000', 4),
(3, 10, '2023-11-08 17:40:41.000000', 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `producto_componenteproducto`
--
ALTER TABLE `producto_componenteproducto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Producto_componentep_producto_componente__a9705919_fk_Producto_` (`producto_componente_id`),
  ADD KEY `Producto_componentep_producto_principal_i_1da14157_fk_Producto_` (`producto_principal_id`);

--
-- Indices de la tabla `producto_producto`
--
ALTER TABLE `producto_producto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `CODIGO` (`codigo`);

--
-- Indices de la tabla `producto_transaccion`
--
ALTER TABLE `producto_transaccion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Producto_transaccion_producto_id_36cd0fec_fk_Producto_` (`producto_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `producto_componenteproducto`
--
ALTER TABLE `producto_componenteproducto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `producto_producto`
--
ALTER TABLE `producto_producto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `producto_transaccion`
--
ALTER TABLE `producto_transaccion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `producto_componenteproducto`
--
ALTER TABLE `producto_componenteproducto`
  ADD CONSTRAINT `Producto_componentep_producto_componente__a9705919_fk_Producto_` FOREIGN KEY (`producto_componente_id`) REFERENCES `producto_producto` (`id`),
  ADD CONSTRAINT `Producto_componentep_producto_principal_i_1da14157_fk_Producto_` FOREIGN KEY (`producto_principal_id`) REFERENCES `producto_producto` (`id`);

--
-- Filtros para la tabla `producto_transaccion`
--
ALTER TABLE `producto_transaccion`
  ADD CONSTRAINT `Producto_transaccion_producto_id_36cd0fec_fk_Producto_` FOREIGN KEY (`producto_id`) REFERENCES `producto_producto` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
