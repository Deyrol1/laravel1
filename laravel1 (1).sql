-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-10-2022 a las 04:50:28
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `laravel1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activations`
--

CREATE TABLE `activations` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_activations`
--

CREATE TABLE `admin_activations` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `admin_password_resets`
--

INSERT INTO `admin_password_resets` (`email`, `token`, `created_at`) VALUES
('deivyvalenciaa@gmail.com', '$2y$10$8WYcdbe16i5FkWAn.AHs..vtaUm3TiuCe6FMXduIY6aPtmRTfxR.u', '2022-10-29 07:21:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT 0,
  `forbidden` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `admin_users`
--

INSERT INTO `admin_users` (`id`, `first_name`, `last_name`, `email`, `password`, `remember_token`, `activated`, `forbidden`, `language`, `deleted_at`, `created_at`, `updated_at`, `last_login_at`) VALUES
(1, 'Deivy', 'Valencia', 'deivyvalenciaa@gmail.com', '$2y$10$iUhYYaL5YZVTcpgjD7Fyveof0ndimTK9b.HaxLxu/LNKmYe5VIHBG', '39YpiYEHxAJlM6odQgD106iNaGZ1b9sp4Og92m9dVDwqTrjVrXQP6FOerKst', 1, 0, 'es', NULL, '2022-08-08 01:13:19', '2022-10-29 07:41:49', '2022-10-29 07:41:49'),
(2, 'juan', 'andres', 'juan@gmail.com', '123', '1212', 0, 0, 'en', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriahabitacion`
--

CREATE TABLE `categoriahabitacion` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `categoria` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categoriahabitacion`
--

INSERT INTO `categoriahabitacion` (`id`, `categoria`, `valor`, `created_at`, `updated_at`) VALUES
(1, 'Simple', 20000, '2022-08-08 01:24:17', '2022-08-12 06:26:30'),
(2, 'Doble', 20000, '2022-08-08 01:24:22', '2022-08-08 01:24:22'),
(3, 'Familiar', 40000, '2022-08-08 01:24:28', '2022-08-08 01:24:28'),
(4, 'Suite', 100000, '2022-08-08 01:24:37', '2022-08-08 01:24:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadohabitacion`
--

CREATE TABLE `estadohabitacion` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `estado` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `estadohabitacion`
--

INSERT INTO `estadohabitacion` (`id`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Disponible', '2022-08-08 01:23:52', '2022-08-08 01:23:52'),
(2, 'Limpieza', '2022-08-08 01:23:56', '2022-08-08 01:23:56'),
(3, 'Mantenimiento', '2022-08-08 01:24:01', '2022-08-08 01:24:01'),
(4, 'Ocupado', '2022-08-08 01:24:06', '2022-08-08 01:24:06'),
(5, 'Sucio', '2022-08-08 01:24:10', '2022-08-08 01:24:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

CREATE TABLE `habitacion` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `numero` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `costo` int(11) NOT NULL,
  `estado` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `habitacion`
--

INSERT INTO `habitacion` (`id`, `numero`, `tipo`, `costo`, `estado`, `created_at`, `updated_at`) VALUES
(3, '1212', 'Doble', 20000, 'Ocupado', '2022-08-08 03:33:49', '2022-08-12 06:28:38'),
(4, '3823962983692689', 'Doble', 20000, 'Disponible', '2022-08-08 03:34:35', '2022-08-12 06:28:21'),
(5, '1291698', 'Doble', 20000, 'Ocupado', '2022-08-08 03:53:03', '2022-08-08 03:53:03'),
(6, '542542', 'Familiar', 40000, 'Ocupado', '2022-08-08 04:04:22', '2022-08-08 04:04:22'),
(7, '1218726816', 'Familiar', 40000, 'Mantenimiento', '2022-08-10 02:43:18', '2022-08-10 02:43:18'),
(8, '1287518275', 'Suite', 100000, 'Limpieza', '2022-08-10 02:45:30', '2022-08-10 02:45:30'),
(9, '29816926198', 'Doble', 20000, 'Limpieza', '2022-08-12 06:28:07', '2022-08-12 06:28:07'),
(10, '281825', 'Simple', 20000, 'Disponible', '2022-10-29 07:43:10', '2022-10-29 07:43:10');

--
-- Disparadores `habitacion`
--
DELIMITER $$
CREATE TRIGGER `actua` BEFORE UPDATE ON `habitacion` FOR EACH ROW BEGIN
set @tipo= new.tipo;
set @resultado=(select valor from categoriahabitacion where categoria=@tipo);
set new.costo=@resultado;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertar` BEFORE INSERT ON `habitacion` FOR EACH ROW BEGIN
set @tipo= new.tipo;
set @resultado=(select valor from categoriahabitacion where categoria=@tipo);
set new.costo=@resultado;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_08_24_000000_create_activations_table', 1),
(4, '2017_08_24_000000_create_admin_activations_table', 1),
(5, '2017_08_24_000000_create_admin_password_resets_table', 1),
(6, '2017_08_24_000000_create_admin_users_table', 1),
(7, '2018_07_18_000000_create_wysiwyg_media_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2020_10_21_000000_add_last_login_at_timestamp_to_admin_users_table', 1),
(11, '2022_08_07_201316_create_media_table', 1),
(12, '2022_08_07_201316_create_permission_tables', 1),
(13, '2022_08_07_201320_fill_default_admin_user_and_permissions', 1),
(14, '2022_08_07_201315_create_translations_table', 2),
(15, '2022_08_07_174811_create_categoriahabitacion_table', 3),
(16, '2022_08_07_175407_create_estadohabitacion_table', 3),
(17, '2022_08_07_175444_create_habitacion_table', 3),
(18, '2022_08_07_201936_fill_permissions_for_habitacion', 4),
(19, '2022_08_07_201952_fill_permissions_for_estadohabitacion', 5),
(20, '2022_08_07_202006_fill_permissions_for_categoriahabitacion', 6),
(21, '2022_08_07_232646_create_reservas_table', 7),
(22, '2022_08_07_233019_fill_permissions_for_reserva', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'Brackets\\AdminAuth\\Models\\AdminUser', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', '2022-08-08 01:13:19', '2022-08-08 01:13:19'),
(2, 'admin.translation.index', 'admin', '2022-08-08 01:13:19', '2022-08-08 01:13:19'),
(3, 'admin.translation.edit', 'admin', '2022-08-08 01:13:19', '2022-08-08 01:13:19'),
(4, 'admin.translation.rescan', 'admin', '2022-08-08 01:13:19', '2022-08-08 01:13:19'),
(5, 'admin.admin-user.index', 'admin', '2022-08-08 01:13:19', '2022-08-08 01:13:19'),
(6, 'admin.admin-user.create', 'admin', '2022-08-08 01:13:19', '2022-08-08 01:13:19'),
(7, 'admin.admin-user.edit', 'admin', '2022-08-08 01:13:19', '2022-08-08 01:13:19'),
(8, 'admin.admin-user.delete', 'admin', '2022-08-08 01:13:19', '2022-08-08 01:13:19'),
(9, 'admin.upload', 'admin', '2022-08-08 01:13:19', '2022-08-08 01:13:19'),
(10, 'admin.admin-user.impersonal-login', 'admin', '2022-08-08 01:13:19', '2022-08-08 01:13:19'),
(11, 'admin.habitacion', 'admin', '2022-08-08 01:19:39', '2022-08-08 01:19:39'),
(12, 'admin.habitacion.index', 'admin', '2022-08-08 01:19:39', '2022-08-08 01:19:39'),
(13, 'admin.habitacion.create', 'admin', '2022-08-08 01:19:39', '2022-08-08 01:19:39'),
(14, 'admin.habitacion.show', 'admin', '2022-08-08 01:19:39', '2022-08-08 01:19:39'),
(15, 'admin.habitacion.edit', 'admin', '2022-08-08 01:19:39', '2022-08-08 01:19:39'),
(16, 'admin.habitacion.delete', 'admin', '2022-08-08 01:19:39', '2022-08-08 01:19:39'),
(17, 'admin.habitacion.bulk-delete', 'admin', '2022-08-08 01:19:39', '2022-08-08 01:19:39'),
(18, 'admin.estadohabitacion', 'admin', '2022-08-08 01:19:53', '2022-08-08 01:19:53'),
(19, 'admin.estadohabitacion.index', 'admin', '2022-08-08 01:19:53', '2022-08-08 01:19:53'),
(20, 'admin.estadohabitacion.create', 'admin', '2022-08-08 01:19:53', '2022-08-08 01:19:53'),
(21, 'admin.estadohabitacion.show', 'admin', '2022-08-08 01:19:53', '2022-08-08 01:19:53'),
(22, 'admin.estadohabitacion.edit', 'admin', '2022-08-08 01:19:53', '2022-08-08 01:19:53'),
(23, 'admin.estadohabitacion.delete', 'admin', '2022-08-08 01:19:53', '2022-08-08 01:19:53'),
(24, 'admin.estadohabitacion.bulk-delete', 'admin', '2022-08-08 01:19:53', '2022-08-08 01:19:53'),
(25, 'admin.categoriahabitacion', 'admin', '2022-08-08 01:20:07', '2022-08-08 01:20:07'),
(26, 'admin.categoriahabitacion.index', 'admin', '2022-08-08 01:20:07', '2022-08-08 01:20:07'),
(27, 'admin.categoriahabitacion.create', 'admin', '2022-08-08 01:20:07', '2022-08-08 01:20:07'),
(28, 'admin.categoriahabitacion.show', 'admin', '2022-08-08 01:20:07', '2022-08-08 01:20:07'),
(29, 'admin.categoriahabitacion.edit', 'admin', '2022-08-08 01:20:07', '2022-08-08 01:20:07'),
(30, 'admin.categoriahabitacion.delete', 'admin', '2022-08-08 01:20:07', '2022-08-08 01:20:07'),
(31, 'admin.categoriahabitacion.bulk-delete', 'admin', '2022-08-08 01:20:07', '2022-08-08 01:20:07'),
(32, 'admin.reserva', 'admin', '2022-08-08 04:30:24', '2022-08-08 04:30:24'),
(33, 'admin.reserva.index', 'admin', '2022-08-08 04:30:24', '2022-08-08 04:30:24'),
(34, 'admin.reserva.create', 'admin', '2022-08-08 04:30:24', '2022-08-08 04:30:24'),
(35, 'admin.reserva.show', 'admin', '2022-08-08 04:30:24', '2022-08-08 04:30:24'),
(36, 'admin.reserva.edit', 'admin', '2022-08-08 04:30:24', '2022-08-08 04:30:24'),
(37, 'admin.reserva.delete', 'admin', '2022-08-08 04:30:24', '2022-08-08 04:30:24'),
(38, 'admin.reserva.bulk-delete', 'admin', '2022-08-08 04:30:24', '2022-08-08 04:30:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `nombre_cliente` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_habitacion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_habitacion` int(11) NOT NULL,
  `dias` int(11) NOT NULL,
  `valor_total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Disparadores `reservas`
--
DELIMITER $$
CREATE TRIGGER `actu` BEFORE UPDATE ON `reservas` FOR EACH ROW BEGIN
set @tipo= new.tipo_habitacion;
set @valor= (select valor from categoriahabitacion where categoria=@tipo);
set @num_hab=(select numero from habitacion where tipo=@tipo and estado="Disponible");
set new.num_habitacion=@num_hab;
set new.valor_total=@valor*new.dias;
UPDATE habitacion SET `estado` = 'Ocupado' WHERE `habitacion`.`numero` = @num_hab;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `crear` BEFORE INSERT ON `reservas` FOR EACH ROW BEGIN
set @tipo= new.tipo_habitacion;
set @valor= (select valor from categoriahabitacion where categoria=@tipo);
set @num_hab=(select numero from habitacion where tipo=@tipo and estado="Disponible");
set new.num_habitacion=@num_hab;
set new.valor_total=@valor*new.dias;
UPDATE habitacion SET `estado` = 'Ocupado' WHERE `habitacion`.`numero` = @num_hab;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin', '2022-08-08 01:13:19', '2022-08-08 01:13:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '*',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`text`)),
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `translations`
--

INSERT INTO `translations` (`id`, `namespace`, `group`, `key`, `text`, `metadata`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'brackets/admin-ui', 'admin', 'operation.succeeded', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(2, 'brackets/admin-ui', 'admin', 'operation.failed', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(3, 'brackets/admin-ui', 'admin', 'operation.not_allowed', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(4, '*', 'admin', 'admin-user.columns.first_name', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(5, '*', 'admin', 'admin-user.columns.last_name', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(6, '*', 'admin', 'admin-user.columns.email', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(7, '*', 'admin', 'admin-user.columns.password', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(8, '*', 'admin', 'admin-user.columns.password_repeat', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(9, '*', 'admin', 'admin-user.columns.activated', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(10, '*', 'admin', 'admin-user.columns.forbidden', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(11, '*', 'admin', 'admin-user.columns.language', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(12, 'brackets/admin-ui', 'admin', 'forms.select_an_option', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(13, '*', 'admin', 'admin-user.columns.roles', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(14, 'brackets/admin-ui', 'admin', 'forms.select_options', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(15, '*', 'admin', 'admin-user.actions.create', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(16, 'brackets/admin-ui', 'admin', 'btn.save', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(17, '*', 'admin', 'admin-user.actions.edit', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(18, '*', 'admin', 'admin-user.actions.index', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(19, 'brackets/admin-ui', 'admin', 'placeholder.search', '{\"es\":\"Buscar\"}', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(20, 'brackets/admin-ui', 'admin', 'btn.search', '{\"es\":\"Buscar\"}', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(21, '*', 'admin', 'admin-user.columns.id', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(22, '*', 'admin', 'admin-user.columns.last_login_at', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(23, 'brackets/admin-ui', 'admin', 'btn.edit', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(24, 'brackets/admin-ui', 'admin', 'btn.delete', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(25, 'brackets/admin-ui', 'admin', 'pagination.overview', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(26, 'brackets/admin-ui', 'admin', 'index.no_items', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(27, 'brackets/admin-ui', 'admin', 'index.try_changing_items', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(28, 'brackets/admin-ui', 'admin', 'btn.new', '{\"es\":\"Nuevo\\/a\"}', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(29, 'brackets/admin-ui', 'admin', 'profile_dropdown.account', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(30, 'brackets/admin-auth', 'admin', 'profile_dropdown.profile', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(31, 'brackets/admin-auth', 'admin', 'profile_dropdown.password', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(32, 'brackets/admin-auth', 'admin', 'profile_dropdown.logout', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(33, 'brackets/admin-ui', 'admin', 'sidebar.content', '{\"es\":\"Tablas\"}', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(34, 'brackets/admin-ui', 'admin', 'sidebar.settings', '{\"es\":\"Configuraciones\"}', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(35, '*', 'admin', 'admin-user.actions.edit_password', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(36, '*', 'admin', 'admin-user.actions.edit_profile', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(37, 'brackets/admin-auth', 'admin', 'activation_form.title', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(38, 'brackets/admin-auth', 'admin', 'activation_form.note', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(39, 'brackets/admin-auth', 'admin', 'auth_global.email', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(40, 'brackets/admin-auth', 'admin', 'activation_form.button', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(41, 'brackets/admin-auth', 'admin', 'login.title', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(42, 'brackets/admin-auth', 'admin', 'login.sign_in_text', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(43, 'brackets/admin-auth', 'admin', 'auth_global.password', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(44, 'brackets/admin-auth', 'admin', 'login.button', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(45, 'brackets/admin-auth', 'admin', 'login.forgot_password', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(46, 'brackets/admin-auth', 'admin', 'forgot_password.title', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(47, 'brackets/admin-auth', 'admin', 'forgot_password.note', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(48, 'brackets/admin-auth', 'admin', 'forgot_password.button', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(49, 'brackets/admin-auth', 'admin', 'password_reset.title', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(50, 'brackets/admin-auth', 'admin', 'password_reset.note', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(51, 'brackets/admin-auth', 'admin', 'auth_global.password_confirm', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(52, 'brackets/admin-auth', 'admin', 'password_reset.button', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(53, 'brackets/admin-auth', 'activations', 'email.line', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(54, 'brackets/admin-auth', 'activations', 'email.action', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(55, 'brackets/admin-auth', 'activations', 'email.notRequested', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(56, 'brackets/admin-auth', 'admin', 'activations.activated', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(57, 'brackets/admin-auth', 'admin', 'activations.invalid_request', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(58, 'brackets/admin-auth', 'admin', 'activations.disabled', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(59, 'brackets/admin-auth', 'admin', 'activations.sent', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(60, 'brackets/admin-auth', 'admin', 'passwords.sent', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(61, 'brackets/admin-auth', 'admin', 'passwords.reset', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(62, 'brackets/admin-auth', 'admin', 'passwords.invalid_token', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(63, 'brackets/admin-auth', 'admin', 'passwords.invalid_user', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(64, 'brackets/admin-auth', 'admin', 'passwords.invalid_password', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(65, 'brackets/admin-auth', 'resets', 'email.line', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(66, 'brackets/admin-auth', 'resets', 'email.action', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(67, 'brackets/admin-auth', 'resets', 'email.notRequested', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(68, '*', 'auth', 'failed', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(69, '*', 'auth', 'throttle', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:00', NULL),
(70, '*', '*', 'Manage access', '{\"es\":\"Cuentas\"}', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:01', NULL),
(71, '*', '*', 'Translations', '{\"es\":\"Traducciones\"}', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:01', NULL),
(72, '*', '*', 'Configuration', '[]', NULL, '2022-08-08 01:13:43', '2022-10-29 07:39:01', NULL),
(73, '*', 'admin', 'categoriahabitacion.columns.categoria', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(74, '*', 'admin', 'categoriahabitacion.columns.valor', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(75, '*', 'admin', 'categoriahabitacion.actions.create', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(76, '*', 'admin', 'categoriahabitacion.actions.edit', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(77, '*', 'admin', 'categoriahabitacion.actions.index', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(78, '*', 'admin', 'categoriahabitacion.columns.id', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(79, 'brackets/admin-ui', 'admin', 'listing.selected_items', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(80, 'brackets/admin-ui', 'admin', 'listing.check_all_items', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(81, 'brackets/admin-ui', 'admin', 'listing.uncheck_all_items', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(82, '*', 'admin', 'estadohabitacion.columns.estado', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(83, '*', 'admin', 'estadohabitacion.actions.create', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(84, '*', 'admin', 'estadohabitacion.actions.edit', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(85, '*', 'admin', 'estadohabitacion.actions.index', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(86, '*', 'admin', 'estadohabitacion.columns.id', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(87, '*', 'admin', 'habitacion.columns.numero', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(88, '*', 'admin', 'habitacion.columns.tipo', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(89, '*', 'admin', 'habitacion.columns.costo', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(90, '*', 'admin', 'habitacion.columns.estado', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(91, '*', 'admin', 'habitacion.actions.create', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(92, '*', 'admin', 'habitacion.actions.edit', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(93, '*', 'admin', 'habitacion.actions.index', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(94, '*', 'admin', 'habitacion.columns.id', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(95, '*', 'admin', 'habitacion.title', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(96, '*', 'admin', 'estadohabitacion.title', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(97, '*', 'admin', 'categoriahabitacion.title', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(98, 'brackets/admin-translations', 'admin', 'title', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(99, 'brackets/admin-translations', 'admin', 'index.all_groups', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(100, 'brackets/admin-translations', 'admin', 'index.edit', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(101, 'brackets/admin-translations', 'admin', 'index.default_text', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(102, 'brackets/admin-translations', 'admin', 'index.translation', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(103, 'brackets/admin-translations', 'admin', 'index.translation_for_language', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(104, 'brackets/admin-translations', 'admin', 'import.title', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(105, 'brackets/admin-translations', 'admin', 'import.notice', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(106, 'brackets/admin-translations', 'admin', 'import.upload_file', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(107, 'brackets/admin-translations', 'admin', 'import.choose_file', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(108, 'brackets/admin-translations', 'admin', 'import.language_to_import', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(109, 'brackets/admin-translations', 'admin', 'fields.select_language', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(110, 'brackets/admin-translations', 'admin', 'import.do_not_override', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(111, 'brackets/admin-translations', 'admin', 'import.conflict_notice_we_have_found', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(112, 'brackets/admin-translations', 'admin', 'import.conflict_notice_translations_to_be_imported', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(113, 'brackets/admin-translations', 'admin', 'import.conflict_notice_differ', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(114, 'brackets/admin-translations', 'admin', 'fields.group', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(115, 'brackets/admin-translations', 'admin', 'fields.default', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(116, 'brackets/admin-translations', 'admin', 'fields.current_value', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(117, 'brackets/admin-translations', 'admin', 'fields.imported_value', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(118, 'brackets/admin-translations', 'admin', 'import.sucesfully_notice', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(119, 'brackets/admin-translations', 'admin', 'import.sucesfully_notice_update', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(120, 'brackets/admin-translations', 'admin', 'index.export', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(121, 'brackets/admin-translations', 'admin', 'export.notice', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(122, 'brackets/admin-translations', 'admin', 'export.language_to_export', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(123, 'brackets/admin-translations', 'admin', 'btn.export', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(124, 'brackets/admin-translations', 'admin', 'index.title', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(125, 'brackets/admin-translations', 'admin', 'btn.import', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(126, 'brackets/admin-translations', 'admin', 'btn.re_scan', '[]', NULL, '2022-10-29 07:39:00', '2022-10-29 07:39:00', NULL),
(127, 'brackets/admin-translations', 'admin', 'fields.created_at', '[]', NULL, '2022-10-29 07:39:01', '2022-10-29 07:39:01', NULL),
(128, 'brackets/admin-translations', 'admin', 'index.no_items', '[]', NULL, '2022-10-29 07:39:01', '2022-10-29 07:39:01', NULL),
(129, 'brackets/admin-translations', 'admin', 'index.try_changing_items', '[]', NULL, '2022-10-29 07:39:01', '2022-10-29 07:39:01', NULL),
(130, 'brackets/admin-ui', 'admin', 'media_uploader.max_number_of_files', '[]', NULL, '2022-10-29 07:39:01', '2022-10-29 07:39:01', NULL),
(131, 'brackets/admin-ui', 'admin', 'media_uploader.max_size_pre_file', '[]', NULL, '2022-10-29 07:39:01', '2022-10-29 07:39:01', NULL),
(132, 'brackets/admin-ui', 'admin', 'media_uploader.private_title', '[]', NULL, '2022-10-29 07:39:01', '2022-10-29 07:39:01', NULL),
(133, 'brackets/admin-ui', 'admin', 'page_title_suffix', '[]', NULL, '2022-10-29 07:39:01', '2022-10-29 07:39:01', NULL),
(134, 'brackets/admin-ui', 'admin', 'footer.powered_by', '[]', NULL, '2022-10-29 07:39:01', '2022-10-29 07:39:01', NULL),
(135, '*', '*', 'Close', '[]', NULL, '2022-10-29 07:39:01', '2022-10-29 07:39:01', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wysiwyg_media`
--

CREATE TABLE `wysiwyg_media` (
  `id` int(10) UNSIGNED NOT NULL,
  `file_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wysiwygable_id` int(10) UNSIGNED DEFAULT NULL,
  `wysiwygable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `activations`
--
ALTER TABLE `activations`
  ADD KEY `activations_email_index` (`email`);

--
-- Indices de la tabla `admin_activations`
--
ALTER TABLE `admin_activations`
  ADD KEY `admin_activations_email_index` (`email`);

--
-- Indices de la tabla `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD KEY `admin_password_resets_email_index` (`email`);

--
-- Indices de la tabla `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_email_deleted_at_unique` (`email`,`deleted_at`);

--
-- Indices de la tabla `categoriahabitacion`
--
ALTER TABLE `categoriahabitacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estadohabitacion`
--
ALTER TABLE `estadohabitacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_namespace_index` (`namespace`),
  ADD KEY `translations_group_index` (`group`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `wysiwyg_media`
--
ALTER TABLE `wysiwyg_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wysiwyg_media_wysiwygable_id_index` (`wysiwygable_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categoriahabitacion`
--
ALTER TABLE `categoriahabitacion`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `estadohabitacion`
--
ALTER TABLE `estadohabitacion`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wysiwyg_media`
--
ALTER TABLE `wysiwyg_media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
