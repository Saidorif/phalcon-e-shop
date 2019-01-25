-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 25 2019 г., 06:04
-- Версия сервера: 5.6.38
-- Версия PHP: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `eshop.loc`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin_user`
--

CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL,
  `role` enum('journalist','editor','admin','user') NOT NULL DEFAULT 'journalist',
  `login` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `admin_user`
--

INSERT INTO `admin_user` (`id`, `role`, `login`, `email`, `name`, `password`, `active`, `phone`) VALUES
(1, 'admin', 'admin', 'web@eskiz.uz', 'Administrator', '$2y$10$cs9RNxLuQnUqzpve.vnOAexO3tDh8FGeA4lHL5./VMt9BK8e3CE96', 1, '998974708222'),
(2, 'user', 'saidorif', 'beeline-1988@mail.ru', 'Saidorif Qodirov', '$2y$10$47HrcAERo6F3Zqz/UZ1qKuZcNPCMNHJYGUWlMzlEYG2QS1bRH/YCW', 1, ''),
(3, 'user', 'admin@nextmall.uz', 'admin@nextmall.uz', 'Saidorif Qodirov', '$2y$10$y8V9cV0Y4k0CEQ7dQR91.uoEpNgRRUx0dvalJXeiWYcYzgs1u2M6m', 0, '998974708222'),
(4, 'user', 'aki@nextmall.uz', 'aki@nextmall.uz', 'Akmal Shayzakov', '$2y$10$vfzqr5TL29xR38L1VcnJzOUvpLT3s7eUckxLtVpJ/c0RfM1gCQKNu', 0, '998974708222'),
(5, 'user', 'java@eskiz.uz', 'java@eskiz.uz', 'Javoxir Java', '$2y$10$VsCjGGOkLmQ2ZinVirHzbepVgkklPSZlv8IxuXQz7RCp/RwCqc9/y', 0, '998974708222'),
(6, 'user', 'amin@eskiz.uz', 'amin@eskiz.uz', 'Muhammadamin', '$2y$10$.E4dSWkWX4gf0qmUuG9FmuQL0uJjlF5iyNOCKvJUnnHVSewuZotDG', 0, '998974708222'),
(7, 'user', 'sayyid2112@gmail.com', 'sayyid2112@gmail.com', 'Saidorif Qodirov', '$2y$10$a9UspAWG7gaxrFQfiDQcmua9qYX0cklGfDGbsuuhoCvXaulg8P4Qi', 1, '998974708222');

-- --------------------------------------------------------

--
-- Структура таблицы `cms_configuration`
--

CREATE TABLE `cms_configuration` (
  `key` varchar(50) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cms_configuration`
--

INSERT INTO `cms_configuration` (`key`, `value`) VALUES
('ADMIN_EMAIL', 'web@eskiz.uz'),
('DEBUG_MODE', '1'),
('DISPLAY_CHANGELOG', '1'),
('PROFILER', '0'),
('TECHNICAL_WORKS', '0'),
('WIDGETS_CACHE', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `cms_javascript`
--

CREATE TABLE `cms_javascript` (
  `id` varchar(20) NOT NULL,
  `text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cms_javascript`
--

INSERT INTO `cms_javascript` (`id`, `text`) VALUES
('body', '<!-- custom javascript code or any html -->'),
('head', '<!-- custom javascript code or any html -->');

-- --------------------------------------------------------

--
-- Структура таблицы `cms_settings`
--

CREATE TABLE `cms_settings` (
  `id` int(11) NOT NULL,
  `site_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cms_settings`
--

INSERT INTO `cms_settings` (`id`, `site_name`, `email`, `favicon`, `logo`) VALUES
(1, 'Eskiz IT Company', 'sayyid2112@gmail.com', 'favicon.png', 'logo.png');

-- --------------------------------------------------------

--
-- Структура таблицы `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `employee_translate`
--

CREATE TABLE `employee_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `faq_translate`
--

CREATE TABLE `faq_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `iso` varchar(10) NOT NULL,
  `locale` varchar(10) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `short_name` varchar(10) DEFAULT NULL,
  `url` varchar(20) DEFAULT NULL,
  `sortorder` int(11) DEFAULT NULL,
  `primary` enum('0','1') DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `language`
--

INSERT INTO `language` (`id`, `iso`, `locale`, `name`, `short_name`, `url`, `sortorder`, `primary`) VALUES
(1, 'ru', 'ru_RU', 'Русский (Ру)', 'Рус', 'ru', 2, '1'),
(2, 'en', 'en_EN', 'English (En)', 'Eng', 'en', 3, '0'),
(3, 'uz', 'uz_UZ', 'Uzbek (Uz)', 'uzb', 'uz', 1, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `root` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `depth` tinyint(2) NOT NULL DEFAULT '0',
  `left_key` int(11) DEFAULT NULL,
  `right_key` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `menu`
--

INSERT INTO `menu` (`id`, `root`, `parent_id`, `slug`, `depth`, `left_key`, `right_key`, `created_at`, `updated_at`) VALUES
(1, 'main', NULL, 'about', 1, 2, 3, '2017-07-26 11:14:40', '2017-09-15 11:27:33'),
(2, 'main', NULL, 'news', 1, 4, 5, '2017-07-26 11:14:47', '2017-09-15 11:27:33'),
(3, 'main', NULL, 'contacts', 1, 6, 7, '2017-07-26 11:14:59', '2017-09-15 11:27:33'),
(4, 'main', NULL, 'products', 1, NULL, NULL, '2018-12-07 08:53:48', '2018-12-07 08:53:48'),
(5, 'main', NULL, 'products/womens-clothing', 1, NULL, NULL, '2018-12-07 08:53:48', '2018-12-17 12:41:47'),
(6, 'main', NULL, 'products/phones-accessories', 1, NULL, NULL, '2018-12-07 08:53:59', '2018-12-17 12:42:07'),
(7, 'main', NULL, 'products/jewelry-watches', 1, NULL, NULL, '2018-12-07 08:54:07', '2018-12-07 08:59:57');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_translate`
--

CREATE TABLE `menu_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `menu_translate`
--

INSERT INTO `menu_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(1, 1, 'uz', 'title', 'Biz haqimizda'),
(2, 2, 'uz', 'title', 'Yangiliklar'),
(3, 3, 'uz', 'title', 'Biz bilan aloqa'),
(4, 1, 'uz', 'status', '1'),
(5, 2, 'uz', 'status', '1'),
(6, 3, 'uz', 'status', '1'),
(7, 4, 'ru', 'title', 'Продукция'),
(8, 4, 'ru', 'status', '1'),
(9, 5, 'ru', 'title', 'WOMEN’S CLOTHING'),
(10, 5, 'ru', 'status', '0'),
(11, 6, 'ru', 'title', 'PHONES & ACCESSORIES'),
(12, 6, 'ru', 'status', '1'),
(13, 7, 'ru', 'title', 'Jewelry & Watches '),
(14, 7, 'ru', 'status', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `products` text NOT NULL,
  `status` varchar(255) DEFAULT 'new',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `notification`
--

INSERT INTO `notification` (`id`, `products`, `status`, `created_at`) VALUES
(4, '[\"1\",\"2\",\"4\"]', 'new', '2019-01-23 12:36:50'),
(5, '[\"12\",\"13\"]', 'success', '2019-01-24 06:25:06'),
(6, '[\"2\",\"3\",\"4\",\"5\"]', 'new', '2019-01-24 06:39:29');

-- --------------------------------------------------------

--
-- Структура таблицы `notifications_translate`
--

CREATE TABLE `notifications_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `notifications_translate`
--

INSERT INTO `notifications_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(53, 4, 'ru', 'title', 'Website development'),
(54, 4, 'ru', 'message', '<p>asdsadfas dfsa asdf</p>'),
(55, 5, 'ru', 'title', 'This is awesome sale '),
(56, 5, 'ru', 'message', '<p>asdfsadf asdf asdf</p>'),
(57, 6, 'ru', 'title', 'test'),
(58, 6, 'ru', 'message', '<p>saf adfhg dfs</p>');

-- --------------------------------------------------------

--
-- Структура таблицы `page`
--

CREATE TABLE `page` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `index_page` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `page`
--

INSERT INTO `page` (`id`, `slug`, `created_at`, `updated_at`, `index_page`) VALUES
(1, 'index', '2014-08-03 15:18:47', '2017-07-26 11:02:29', '0'),
(2, 'contacts', '2014-08-03 22:25:13', '2017-07-26 11:13:26', '0'),
(3, 'about', '2017-08-28 15:04:47', '2017-08-28 15:04:47', '0'),
(4, 'viewcart', '2018-12-20 09:42:24', '2018-12-20 09:42:24', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `page_translate`
--

CREATE TABLE `page_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `page_translate`
--

INSERT INTO `page_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(1, 1, 'ru', 'title', 'Главная'),
(2, 1, 'ru', 'meta_title', 'Главная'),
(3, 1, 'ru', 'meta_description', 'meta-описание главной страницы'),
(4, 1, 'ru', 'meta_keywords', ''),
(5, 1, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<h1>Подзаголовок</h1>\r\n<p>Съешь еще этих мягких французских булок да выпей чаю.&nbsp;Съешь еще этих мягких французских булок да выпей чаю.&nbsp;Съешь еще этих мягких французских булок да выпей чаю.&nbsp;Съешь еще этих мягких французских булок да выпей чаю.&nbsp;Съешь еще этих мягких французских булок да выпей чаю.&nbsp;Съешь еще этих мягких французских булок да выпей чаю.&nbsp;</p>\r\n<h3>Под-подзаголовок</h3>\r\n<p>Список:</p>\r\n<ul>\r\n<li>Первый&nbsp;пункт</li>\r\n<li>Второй пукт<br />\r\n<ul>\r\n<li>Вложенный уровень второго пункта</li>\r\n<li>Еще один</li>\r\n</ul>\r\n</li>\r\n<li>Третий пункт</li>\r\n</ul>\r\n<p>Таблица</p>\r\n<table class=\"table\" style=\"width: 100%;\">\r\n<tbody>\r\n<tr>\r\n<th>Заглавие</th>\r\n<th>Заглавие</th>\r\n<th>Заглавие</th>\r\n</tr>\r\n<tr>\r\n<td>Текст в ячейке</td>\r\n<td>Текст в ячейке</td>\r\n<td>Текст в ячейке</td>\r\n</tr>\r\n<tr>\r\n<td>Текст в ячейке</td>\r\n<td>Текст в ячейке</td>\r\n<td>Текст в ячейке</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>Числовой список:</p>\r\n<ol>\r\n<li>Первый</li>\r\n<li>Второй</li>\r\n<li>Третий</li>\r\n</ol>\r\n</body>\r\n</html>'),
(11, 2, 'ru', 'title', 'Контакты'),
(12, 2, 'ru', 'meta_title', 'Контакты'),
(13, 2, 'ru', 'meta_description', ''),
(14, 2, 'ru', 'meta_keywords', ''),
(15, 2, 'ru', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ornare risus. Integer viverra odio ac erat mattis, et efficitur eros maximus. Ut dictum tristique nunc in tincidunt. In hac habitasse platea dictumst. Mauris eget metus vel quam commodo faucibus et vel nisi. Aenean congue turpis sed quam consequat, quis ullamcorper libero tempor. Nullam odio quam, sagittis ut nunc at, tempor convallis dui.</p>\r\n</body>\r\n</html>'),
(61, 1, 'en', 'title', 'Home'),
(62, 1, 'en', 'meta_title', 'Home'),
(63, 1, 'en', 'meta_description', ''),
(64, 1, 'en', 'meta_keywords', ''),
(65, 1, 'en', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ornare risus. Integer viverra odio ac erat mattis, et efficitur eros maximus. Ut dictum tristique nunc in tincidunt. In hac habitasse platea dictumst. Mauris eget metus vel quam commodo faucibus et vel nisi. Aenean congue turpis sed quam consequat, quis ullamcorper libero tempor. Nullam odio quam, sagittis ut nunc at, tempor convallis dui.</p>\r\n</body>\r\n</html>'),
(66, 2, 'en', 'title', 'Contacts'),
(67, 2, 'en', 'meta_title', 'Contacts'),
(68, 2, 'en', 'meta_description', ''),
(69, 2, 'en', 'meta_keywords', ''),
(70, 2, 'en', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a ornare risus. Integer viverra odio ac erat mattis, et efficitur eros maximus. Ut dictum tristique nunc in tincidunt. In hac habitasse platea dictumst. Mauris eget metus vel quam commodo faucibus et vel nisi. Aenean congue turpis sed quam consequat, quis ullamcorper libero tempor. Nullam odio quam, sagittis ut nunc at, tempor convallis dui.</p>\r\n</body>\r\n</html>'),
(71, 1, 'uz', 'title', 'Bosh sahifa'),
(72, 1, 'uz', 'meta_description', ''),
(73, 1, 'uz', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos ipsa, quae soluta qui consequuntur! Delectus, at possimus. Possimus error, ratione porro. Illum dignissimos, dolor dolorem harum totam praesentium non nihil, deserunt vero libero delectus nam dolores optio! Numquam cupiditate vel, esse blanditiis, corrupti a similique alias natus, excepturi, earum voluptate placeat iusto labore ratione quo deleniti aut quos at. Ipsum dolor illo neque sunt et doloribus quaerat nihil quos deleniti, qui officia voluptate reprehenderit mollitia beatae asperiores temporibus quidem architecto numquam labore, sapiente corrupti quam quae. Corrupti quo, est nemo facere modi in consectetur. Eos quibusdam maiores asperiores sint tempore eaque voluptate saepe alias, nisi aspernatur aliquam eveniet, assumenda! Temporibus accusamus et officiis beatae ab, earum. Quam aliquid at sint aut architecto molestias mollitia dolor esse illo pariatur suscipit, fugit officiis debitis numquam necessitatibus distinctio recusandae quas eveniet quo nostrum, perspiciatis incidunt rem. A temporibus dignissimos quis ea nobis deleniti totam, incidunt, iusto, dolorem fugit eaque sed perspiciatis adipisci sunt? Reiciendis aspernatur, tenetur minus harum earum ullam possimus sint ex at culpa animi nihil veniam magnam inventore eveniet cumque. Laborum exercitationem vel repudiandae, voluptatibus, iure doloribus, quaerat vitae eius ipsa ullam dolor excepturi possimus! Aliquid laborum pariatur velit tenetur, magnam.</p>\r\n</body>\r\n</html>'),
(74, 2, 'uz', 'title', 'Biz bilan aloqa'),
(75, 2, 'uz', 'meta_description', ''),
(76, 2, 'uz', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>&nbsp; &nbsp; Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos ipsa, quae soluta qui consequuntur! Delectus, at possimus. Possimus error, ratione porro. Illum dignissimos, dolor dolorem harum totam praesentium non nihil, deserunt vero libero delectus nam dolores optio! Numquam cupiditate vel, esse blanditiis, corrupti a similique alias natus, excepturi, earum voluptate placeat iusto labore ratione quo deleniti aut quos at.</p>\r\n</body>\r\n</html>'),
(77, 3, 'uz', 'title', 'Biz haqimizda'),
(78, 3, 'uz', 'meta_description', ''),
(79, 3, 'uz', 'text', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n\r\n</body>\r\n</html>'),
(80, 4, 'ru', 'title', 'Корзина'),
(81, 4, 'ru', 'meta_title', ''),
(82, 4, 'ru', 'meta_description', ''),
(83, 4, 'ru', 'text', ''),
(84, 4, 'ru', 'menu_check', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `partner`
--

CREATE TABLE `partner` (
  `id` int(11) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `portfolio`
--

CREATE TABLE `portfolio` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `anons` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `portfolio_category`
--

CREATE TABLE `portfolio_category` (
  `id` int(11) NOT NULL,
  `sort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `portfolio_category`
--

INSERT INTO `portfolio_category` (`id`, `sort`) VALUES
(1, 5),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `portfolio_category_translate`
--

CREATE TABLE `portfolio_category_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `portfolio_category_translate`
--

INSERT INTO `portfolio_category_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(1, 1, 'ru', 'title', 'Фотографии'),
(2, 2, 'ru', 'title', 'Дизайн'),
(3, 3, 'ru', 'title', 'Вебсайт'),
(4, 1, 'en', 'title', 'Photogallery'),
(5, 2, 'en', 'title', 'Design'),
(6, 3, 'en', 'title', 'Website'),
(7, 4, 'ru', 'title', 'ghfhgh'),
(8, 2, 'uz', 'title', 'Dizayn'),
(9, 3, 'uz', 'title', 'web sayt'),
(10, 1, 'uz', 'title', 'Fotografiya');

-- --------------------------------------------------------

--
-- Структура таблицы `portfolio_gallery`
--

CREATE TABLE `portfolio_gallery` (
  `id` int(11) NOT NULL,
  `portfolio_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `file_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `portfolio_translate`
--

CREATE TABLE `portfolio_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `special_offer` enum('1','0') DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `anons` varchar(255) DEFAULT NULL,
  `index_page` enum('1','0') NOT NULL DEFAULT '0',
  `views` int(11) DEFAULT NULL,
  `is_new` enum('1','0') DEFAULT '0',
  `is_sale` enum('1','0') DEFAULT '0',
  `sale_ends` datetime DEFAULT NULL,
  `sale_amount` float DEFAULT NULL,
  `in_stock` tinyint(4) DEFAULT '0',
  `brand_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `category_id`, `slug`, `price`, `special_offer`, `created_at`, `updated_at`, `anons`, `index_page`, `views`, `is_new`, `is_sale`, `sale_ends`, `sale_amount`, `in_stock`, `brand_id`) VALUES
(1, 2, 'mens-product', 32.55, '0', '2018-12-03 12:55:39', '2018-12-17 09:08:11', 'files/original/products/1.jpg', '0', 11, '0', '1', '0000-00-00 00:00:00', 35, 0, NULL),
(2, 2, 'mens-product-watch', 0, '0', '2018-12-03 12:57:04', '2018-12-12 16:30:12', 'files/original/products/2.jpg', '0', 2, '0', '0', NULL, NULL, 0, NULL),
(3, 2, 'mens-product-cash', 0, '0', '2018-12-03 12:57:40', '2018-12-13 15:50:39', 'files/original/products/3.jpg', '0', 1, '0', '0', NULL, NULL, 0, NULL),
(4, 2, 'mens-product-remen', 0, '1', '2018-12-03 12:58:27', '2018-12-27 09:17:21', 'files/original/products/4.jpg', '0', 4, '0', '0', NULL, NULL, 0, NULL),
(5, 2, 'mens-product-bag', 0, '1', '2018-12-03 12:59:04', '2019-01-24 17:02:21', 'files/original/products/5.jpg', '0', 1, '0', '0', NULL, NULL, 0, NULL),
(6, 2, 'mens-product-bag2', 12.25, '1', '2018-12-03 13:00:06', '2018-12-27 09:17:14', 'files/original/products/6.jpg', '0', 8, '0', '0', NULL, NULL, 0, NULL),
(7, 1, 'womens-product', 52.55, '0', '2018-12-03 13:01:44', '2018-12-13 15:03:30', 'files/original/products/7.jpg', '0', 2, '0', '1', '2019-03-30 16:55:55', 25, 0, NULL),
(8, 1, 'womens-product-bag', 23.33, '1', '2018-12-03 13:02:23', '2018-12-18 08:54:55', 'files/original/products/8.jpg', '0', 6, '0', '1', '2019-02-28 16:55:32', 15, 0, NULL),
(9, 1, 'womens-product-t-shirt', 7.99, '1', '2018-12-03 13:03:43', '2018-12-13 14:56:49', 'files/original/products/9.jpg', '0', 1, '0', '1', '2019-02-28 16:55:16', 10, 0, NULL),
(10, 1, 'womens-product-jeans', 12.99, '1', '2018-12-03 13:04:36', '2018-12-22 16:02:24', 'files/original/products/10.jpg', '0', 11, '1', '1', '2019-01-31 16:54:43', 15, 0, NULL),
(11, 6, 'watch-men-one', 36.85, '0', '2018-12-05 14:46:08', '2018-12-18 08:53:21', 'files/original/products/11.jpg', '0', 1, '0', '0', '0000-00-00 00:00:00', 0, 0, 4),
(12, 6, 'wath-2-black', 69, '0', '2018-12-05 14:46:40', '2018-12-18 08:53:07', 'files/original/products/12.jpg', '0', 19, '0', '0', '0000-00-00 00:00:00', 0, 0, 4),
(13, 6, 'watch-orange', 24, '0', '2018-12-05 14:47:36', '2018-12-24 07:54:17', 'files/original/products/13.jpg', '0', 10, '0', '1', '2018-12-12 15:47:53', 50, 1, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `products_additional`
--

CREATE TABLE `products_additional` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `language` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `products_brands_translate`
--

CREATE TABLE `products_brands_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products_brands_translate`
--

INSERT INTO `products_brands_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(1, 4, 'ru', 'title', 'Apple'),
(2, 4, 'ru', 'text', 'Apple is the biggest and best technology brand in the world...'),
(3, 5, 'ru', 'title', 'Samsung'),
(4, 5, 'ru', 'text', '');

-- --------------------------------------------------------

--
-- Структура таблицы `products_category`
--

CREATE TABLE `products_category` (
  `id` int(11) NOT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `limit` int(4) DEFAULT NULL,
  `format` enum('list','grid') DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `index_page` enum('1','0') NOT NULL DEFAULT '0',
  `parent` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products_category`
--

INSERT INTO `products_category` (`id`, `slug`, `limit`, `format`, `foto`, `index_page`, `parent`) VALUES
(1, 'womens-clothing', 10, NULL, 'files/original/category/1.jpg', '1', 0),
(2, 'mens-clothing', 10, NULL, 'files/original/category/2.jpg', '1', 0),
(3, 'phones-accessories', 10, NULL, 'files/original/category/3.jpg', '0', 0),
(4, 'computer-office', 10, NULL, NULL, '0', 0),
(5, 'consumer-electronics', 10, NULL, NULL, '0', 0),
(6, 'jewelry-watches', 10, NULL, 'files/original/category/6.jpg', '1', 0),
(7, 'bags-shoes', 10, NULL, NULL, '0', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `products_category_translate`
--

CREATE TABLE `products_category_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products_category_translate`
--

INSERT INTO `products_category_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(1, 1, 'ru', 'title', 'Women\'s Clothing'),
(2, 1, 'ru', 'meta_description', ''),
(3, 1, 'en', 'title', 'Parent category 1'),
(4, 1, 'en', 'meta_description', ''),
(5, 1, 'ru', 'text', ''),
(6, 1, 'uz', 'title', 'Parent category 1'),
(7, 1, 'uz', 'meta_description', ''),
(8, 1, 'uz', 'text', ''),
(9, 1, 'ru', 'meta_title', ''),
(10, 1, 'ru', 'menu_check', '0'),
(11, 2, 'ru', 'title', 'Men\'s clothing'),
(12, 2, 'ru', 'meta_title', ''),
(13, 2, 'ru', 'meta_description', ''),
(14, 2, 'ru', 'text', ''),
(15, 2, 'ru', 'menu_check', '0'),
(16, 3, 'ru', 'title', 'Phones & Accessories'),
(17, 3, 'ru', 'meta_title', ''),
(18, 3, 'ru', 'meta_description', ''),
(19, 3, 'ru', 'text', ''),
(20, 3, 'ru', 'menu_check', '1'),
(21, 4, 'ru', 'title', 'Computer & Office'),
(22, 4, 'ru', 'meta_title', ''),
(23, 4, 'ru', 'meta_description', ''),
(24, 4, 'ru', 'text', ''),
(25, 4, 'ru', 'menu_check', '0'),
(26, 5, 'ru', 'title', 'Consumer Electronics'),
(27, 5, 'ru', 'meta_title', ''),
(28, 5, 'ru', 'meta_description', ''),
(29, 5, 'ru', 'text', ''),
(30, 5, 'ru', 'menu_check', '0'),
(31, 6, 'ru', 'title', 'Jewelry & Watches '),
(32, 6, 'ru', 'meta_title', ''),
(33, 6, 'ru', 'meta_description', ''),
(34, 6, 'ru', 'text', ''),
(35, 6, 'ru', 'menu_check', '0'),
(36, 7, 'ru', 'title', 'Bags & Shoes'),
(37, 7, 'ru', 'meta_title', ''),
(38, 7, 'ru', 'meta_description', ''),
(39, 7, 'ru', 'text', ''),
(40, 7, 'ru', 'menu_check', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `products_photos`
--

CREATE TABLE `products_photos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `file_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products_photos`
--

INSERT INTO `products_photos` (`id`, `product_id`, `file`, `file_id`) VALUES
(1, 1, 'files/original/products_gallery/b60933038e6ad02e7be57cae5f3c7c57.jpg', 'b60933038e6ad02e7be57cae5f3c7c57'),
(2, 1, 'files/original/products_gallery/cae89471ea37073b9ccb2f14ee8028de.jpg', 'cae89471ea37073b9ccb2f14ee8028de'),
(3, 1, 'files/original/products_gallery/54a07f043da34fd9a3c1c174432bcb74.jpg', '54a07f043da34fd9a3c1c174432bcb74'),
(6, 12, 'files/original/products_gallery/487bd87a70bbd54ebed7ec972763794b.jpg', '487bd87a70bbd54ebed7ec972763794b'),
(7, 12, 'files/original/products_gallery/46352f82f8d57773c8c6ee5fa88ead6b.jpg', '46352f82f8d57773c8c6ee5fa88ead6b'),
(8, 12, 'files/original/products_gallery/579addcc5bccde1bc56c8bb3b64aedc6.jpg', '579addcc5bccde1bc56c8bb3b64aedc6'),
(9, 12, 'files/original/products_gallery/99559c707fa7681fd8949be25983f2f2.jpg', '99559c707fa7681fd8949be25983f2f2');

-- --------------------------------------------------------

--
-- Структура таблицы `products_translate`
--

CREATE TABLE `products_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products_translate`
--

INSERT INTO `products_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(1, 1, 'ru', 'title', 'Mens product'),
(2, 1, 'ru', 'meta_title', ''),
(3, 1, 'ru', 'meta_description', ''),
(4, 1, 'ru', 'text', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>'),
(5, 2, 'ru', 'title', 'Mens product'),
(6, 2, 'ru', 'meta_title', ''),
(7, 2, 'ru', 'meta_description', ''),
(8, 2, 'ru', 'text', ''),
(9, 3, 'ru', 'title', 'Mens product 3'),
(10, 3, 'ru', 'meta_title', ''),
(11, 3, 'ru', 'meta_description', ''),
(12, 3, 'ru', 'text', ''),
(13, 4, 'ru', 'title', 'Mens product 4'),
(14, 4, 'ru', 'meta_title', ''),
(15, 4, 'ru', 'meta_description', ''),
(16, 4, 'ru', 'text', ''),
(17, 5, 'ru', 'title', 'Mens product 5'),
(18, 5, 'ru', 'meta_title', ''),
(19, 5, 'ru', 'meta_description', ''),
(20, 5, 'ru', 'text', ''),
(21, 6, 'ru', 'title', 'Mens product 6'),
(22, 6, 'ru', 'meta_title', ''),
(23, 6, 'ru', 'meta_description', ''),
(24, 6, 'ru', 'text', ''),
(25, 7, 'ru', 'title', 'Womens product'),
(26, 7, 'ru', 'meta_title', ''),
(27, 7, 'ru', 'meta_description', ''),
(28, 7, 'ru', 'text', ''),
(29, 8, 'ru', 'title', 'Womens product 2'),
(30, 8, 'ru', 'meta_title', ''),
(31, 8, 'ru', 'meta_description', ''),
(32, 8, 'ru', 'text', ''),
(33, 9, 'ru', 'title', 'Womens product 3'),
(34, 9, 'ru', 'meta_title', ''),
(35, 9, 'ru', 'meta_description', ''),
(36, 9, 'ru', 'text', ''),
(37, 10, 'ru', 'title', 'Womens product 4'),
(38, 10, 'ru', 'meta_title', ''),
(39, 10, 'ru', 'meta_description', ''),
(40, 10, 'ru', 'text', ''),
(41, 11, 'ru', 'title', 'Watch Men one'),
(42, 11, 'ru', 'meta_title', ''),
(43, 11, 'ru', 'meta_description', ''),
(44, 11, 'ru', 'text', '<p>Some lorem ipsum</p>'),
(45, 12, 'ru', 'title', 'Wath 2 Black'),
(46, 12, 'ru', 'meta_title', ''),
(47, 12, 'ru', 'meta_description', ''),
(48, 12, 'ru', 'text', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>'),
(49, 13, 'ru', 'title', 'Watch Orange'),
(50, 13, 'ru', 'meta_title', ''),
(51, 13, 'ru', 'meta_description', ''),
(52, 13, 'ru', 'text', '<p>Some lorem ipsum</p>');

-- --------------------------------------------------------

--
-- Структура таблицы `product_brands`
--

CREATE TABLE `product_brands` (
  `id` int(11) NOT NULL,
  `slug` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_brands`
--

INSERT INTO `product_brands` (`id`, `slug`) VALUES
(4, 'apple'),
(5, 'samsung');

-- --------------------------------------------------------

--
-- Структура таблицы `publication`
--

CREATE TABLE `publication` (
  `id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `preview_inner` enum('1','0') DEFAULT '1',
  `preview_src` varchar(255) DEFAULT NULL,
  `index_page` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `publication_translate`
--

CREATE TABLE `publication_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `publication_type`
--

CREATE TABLE `publication_type` (
  `id` int(11) NOT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `limit` int(4) DEFAULT NULL,
  `format` enum('list','grid','services') DEFAULT NULL,
  `display_date` enum('0','1') DEFAULT '0',
  `index_page` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `publication_type`
--

INSERT INTO `publication_type` (`id`, `slug`, `limit`, `format`, `display_date`, `index_page`) VALUES
(1, 'news', 10, 'grid', '1', '0'),
(2, 'articles', 10, 'list', '0', '0'),
(3, 'services', 10, 'services', '0', '0');

-- --------------------------------------------------------

--
-- Структура таблицы `publication_type_translate`
--

CREATE TABLE `publication_type_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `publication_type_translate`
--

INSERT INTO `publication_type_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(1, 1, 'ru', 'head_title', 'Новости'),
(2, 1, 'ru', 'meta_description', ''),
(3, 1, 'ru', 'meta_keywords', ''),
(4, 1, 'ru', 'seo_text', ''),
(64, 1, 'ru', 'title', 'Новости'),
(65, 2, 'ru', 'title', 'Статьи'),
(66, 2, 'ru', 'head_title', 'Статьи'),
(67, 2, 'ru', 'meta_description', ''),
(68, 2, 'ru', 'meta_keywords', ''),
(69, 2, 'ru', 'seo_text', ''),
(70, 3, 'ru', 'title', 'Услуги'),
(71, 3, 'ru', 'head_title', 'Услуги'),
(72, 3, 'ru', 'meta_description', 'Услуги'),
(73, 3, 'ru', 'meta_keywords', ''),
(74, 3, 'ru', 'seo_text', 'Услуги'),
(75, 3, 'en', 'title', 'Services'),
(76, 3, 'en', 'head_title', 'Services'),
(77, 3, 'en', 'meta_description', 'Services'),
(78, 3, 'en', 'meta_keywords', ''),
(79, 3, 'en', 'seo_text', 'Services'),
(80, 1, 'en', 'title', 'News'),
(81, 1, 'en', 'head_title', 'News'),
(82, 1, 'en', 'meta_description', 'News'),
(83, 1, 'en', 'meta_keywords', ''),
(84, 1, 'en', 'seo_text', 'News'),
(85, 2, 'en', 'title', 'Articles'),
(86, 2, 'en', 'head_title', 'Articles'),
(87, 2, 'en', 'meta_description', 'Articles'),
(88, 2, 'en', 'meta_keywords', ''),
(89, 2, 'en', 'seo_text', 'Articles'),
(90, 1, 'uz', 'title', 'Yangiliklar'),
(91, 1, 'uz', 'meta_description', ''),
(92, 1, 'uz', 'seo_text', ''),
(93, 3, 'uz', 'title', 'Xizmatlar'),
(94, 3, 'uz', 'meta_description', ''),
(95, 3, 'uz', 'seo_text', ''),
(96, 2, 'uz', 'title', 'Maqolalar'),
(97, 2, 'uz', 'meta_description', ''),
(98, 2, 'uz', 'seo_text', '');

-- --------------------------------------------------------

--
-- Структура таблицы `report`
--

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `report`
--

INSERT INTO `report` (`id`, `foto`, `phone`, `email`) VALUES
(1, 'uploads/report/1.jpg', '289745018947238', 'adsasfasdfsdf');

-- --------------------------------------------------------

--
-- Структура таблицы `report_translate`
--

CREATE TABLE `report_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `report_translate`
--

INSERT INTO `report_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(1, 1, 'ru', 'title', 'Saidorif Qodirov '),
(2, 1, 'ru', 'job', 'Developer'),
(3, 1, 'ru', 'text', 'sdklfa;jk sadflkjasdf afsd\r\nsadfjksdf asdf');

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `reviews_translate`
--

CREATE TABLE `reviews_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `seo_manager`
--

CREATE TABLE `seo_manager` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `head_title` varchar(500) DEFAULT NULL,
  `meta_description` varchar(500) DEFAULT NULL,
  `meta_keywords` varchar(500) DEFAULT NULL,
  `seo_text` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `seo_manager`
--

INSERT INTO `seo_manager` (`id`, `url`, `head_title`, `meta_description`, `meta_keywords`, `seo_text`, `created_at`, `updated_at`) VALUES
(1, '/news', '', '', '', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n\r\n</body>\r\n</html>', '2014-09-30 10:39:23', '2016-12-24 16:14:34'),
(2, '/contacts', '', '', '', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n\r\n</body>\r\n</html>', '2015-05-21 16:33:14', '2016-12-24 16:14:16');

-- --------------------------------------------------------

--
-- Структура таблицы `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `view_title` enum('0','1') DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `slider`
--

INSERT INTO `slider` (`id`, `banner`, `view_title`) VALUES
(1, 'uploads/slider/1.jpg', '1'),
(2, 'uploads/slider/2.jpg', '1'),
(3, 'uploads/slider/3.jpg', '1');

-- --------------------------------------------------------

--
-- Структура таблицы `slider_translate`
--

CREATE TABLE `slider_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `slider_translate`
--

INSERT INTO `slider_translate` (`id`, `foreign_id`, `lang`, `key`, `value`) VALUES
(1, 1, 'ru', 'title', 'Hot Deal'),
(2, 1, 'ru', 'text', '<p>Up to 50% Discount</p>'),
(3, 2, 'ru', 'title', 'Bags sale'),
(4, 2, 'ru', 'text', '<p>Up to 50% OFF</p>'),
(5, 3, 'ru', 'title', 'New Product Collection'),
(6, 3, 'ru', 'text', '<p>Up to 50% Discount</p>');

-- --------------------------------------------------------

--
-- Структура таблицы `translate`
--

CREATE TABLE `translate` (
  `id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `phrase` varchar(500) DEFAULT NULL,
  `translation` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `translate`
--

INSERT INTO `translate` (`id`, `lang`, `phrase`, `translation`) VALUES
(1, 'ru', 'Ошибка валидации формы', 'Ошибка валидации формы'),
(2, 'ru', 'Подробнее', 'Подробнее'),
(3, 'ru', 'Назад к перечню публикаций', 'Назад к перечню публикаций'),
(4, 'ru', 'SITE NAME', 'E-SHOP online shop'),
(5, 'ru', 'Главная', 'Главная'),
(6, 'ru', 'Новости', 'Новости'),
(7, 'ru', 'Контакты', 'Контакты'),
(22, 'ru', 'Статьи', 'Статьи'),
(33, 'ru', 'Home', 'Главная'),
(34, 'ru', 'News', 'Новости'),
(35, 'ru', 'Articles', 'Статьи'),
(36, 'ru', 'Contacts', 'Контакты'),
(37, 'ru', 'Admin', 'Админка'),
(38, 'ru', 'YonaCms Admin Panel', 'Административная панель YonaCms'),
(39, 'ru', 'Back к перечню публикаций', 'Назад к перечню публикаций'),
(40, 'ru', 'Страница №', 'Страница №'),
(54, 'ru', 'Полная версия', 'Полная версия'),
(55, 'ru', 'Мобильная версия', 'Мобильная версия'),
(56, 'ru', 'Services', 'Services'),
(57, 'ru', 'Printing', 'Printing'),
(58, 'ru', 'Design', 'Design'),
(65, 'ru', 'Latest news', 'Последние новости'),
(71, 'ru', 'Entries not found', 'Записи не найдены'),
(72, 'ru', 'Back to publications list', 'Обратно к перечню публикаций'),
(73, 'en', 'SITE NAME', 'Eskiz IT Company'),
(74, 'en', 'Ошибка валидации формы', 'Error validataion form'),
(75, 'en', 'Страница №', 'Page №'),
(76, 'en', 'Подробнее', 'Read more'),
(77, 'en', 'Entries not found', 'Entries not found'),
(78, 'en', 'Back to publications list', 'Back to publications list'),
(79, 'en', 'Latest news', 'Latest news'),
(80, 'ru', 'Search    ', 'Поиск'),
(81, 'ru', 'Search results', 'Результаты поиска'),
(82, 'en', 'Search', 'Search'),
(83, 'en', 'Search results', 'Search results'),
(84, 'ru', 'Pages', 'Страницы'),
(85, 'ru', 'Publications', 'Публикации'),
(86, 'uz', 'SITE NAME', 'Eskiz IT Company'),
(87, 'uz', 'Ошибка валидации формы', ''),
(88, 'uz', 'Home', 'Bosh sahifa'),
(89, 'uz', 'Portfolio', 'Portfolio'),
(90, 'uz', 'Products', 'Mahsulotlar'),
(91, 'uz', 'Tours', 'Sayohat'),
(92, 'uz', 'Employee', 'Xodim'),
(93, 'uz', 'Страница №', ''),
(94, 'uz', 'Entries not found', 'Hech narsa topilmadi'),
(95, 'uz', 'Back to products list', ''),
(98, 'uz', 'Подробнее', 'Batafsil'),
(99, 'uz', 'Back to publications list', ''),
(100, 'uz', 'Latest news', 'Oxirgi yangiliklar'),
(101, 'uz', 'Search results', ''),
(102, 'uz', 'Pages', 'Sahifa'),
(103, 'uz', 'Publications', ''),
(104, 'uz', 'Back to tours list', ''),
(105, 'uz', 'Department', ''),
(106, 'uz', 'Send', 'Yuborish'),
(107, 'uz', 'Email has been send', ''),
(108, 'uz', 'Tour name', ''),
(109, 'uz', 'amount', ''),
(110, 'uz', 'Number of People', ''),
(111, 'uz', 'Full name', 'Ism familya'),
(112, 'uz', 'Email', 'Email'),
(113, 'uz', 'Phone', 'Telefon'),
(114, 'uz', 'set a date', ''),
(115, 'uz', 'special request', ''),
(116, 'uz', 'To book', ''),
(117, 'uz', 'Your request has been sent', ''),
(118, 'uz', 'Your email dont sent', ''),
(119, 'ru', 'Portfolio', 'Portfolio'),
(120, 'ru', 'Products', 'Products'),
(121, 'ru', 'Tours', ''),
(122, 'ru', 'Employee', 'Employee'),
(123, 'ru', 'Faq', 'Вопросы-Ответы'),
(124, 'ru', 'Partner', 'Partner'),
(125, 'ru', 'Back to products list', ''),
(126, 'ru', 'Back to tours list', ''),
(127, 'ru', 'New products', ''),
(128, 'ru', 'Special offers', ''),
(129, 'ru', 'Department', ''),
(130, 'ru', 'Send', 'Send'),
(131, 'ru', 'Email has been send', 'Email has been send'),
(132, 'ru', 'Tour name', ''),
(133, 'ru', 'amount', ''),
(134, 'ru', 'Number of People', ''),
(135, 'ru', 'Full name', ''),
(136, 'ru', 'Email', ''),
(137, 'ru', 'Phone', 'Phone'),
(138, 'ru', 'set a date', ''),
(139, 'ru', 'special request', ''),
(140, 'ru', 'To book', ''),
(141, 'ru', 'Your request has been sent', ''),
(142, 'ru', 'Your email dont sent', ''),
(143, 'en', 'Home', ''),
(144, 'en', 'Portfolio', ''),
(145, 'en', 'Products', ''),
(146, 'en', 'Tours', ''),
(147, 'en', 'Employee', ''),
(148, 'en', 'Faq', 'Вопросы-Ответы'),
(149, 'en', 'Partner', ''),
(150, 'en', 'Back to products list', ''),
(151, 'en', 'Pages', ''),
(152, 'en', 'Publications', ''),
(153, 'en', 'Back to tours list', ''),
(154, 'en', 'New products', ''),
(155, 'en', 'Special offers', ''),
(156, 'en', 'Department', ''),
(157, 'en', 'Send', ''),
(158, 'en', 'Email has been send', ''),
(159, 'en', 'Tour name', ''),
(160, 'en', 'amount', ''),
(161, 'en', 'Number of People', ''),
(162, 'en', 'Full name', ''),
(163, 'en', 'Email', ''),
(164, 'en', 'Phone', ''),
(165, 'en', 'set a date', ''),
(166, 'en', 'special request', ''),
(167, 'en', 'To book', ''),
(168, 'en', 'Your request has been sent', ''),
(169, 'en', 'Your email dont sent', ''),
(170, 'uz', 'Faq', 'Savol-Javoblar'),
(171, 'uz', 'Partner', 'Hamkor'),
(172, 'uz', 'New products', ''),
(173, 'uz', 'Special offers', ''),
(174, 'uz', 'Company name', 'Kompaniya nomi'),
(175, 'uz', 'All rights reserved', 'Barcha huquqlar himoya qilingan'),
(176, 'uz', 'Developed by', 'Sayt yaratuvchi'),
(177, 'uz', 'name', ''),
(178, 'uz', 'Attach file', ''),
(179, 'uz', 'company', ''),
(180, 'uz', 'massage', ''),
(181, 'ru', 'Company name', 'Название компании'),
(182, 'ru', 'All rights reserved', 'Все права защищены'),
(183, 'ru', 'Developed by', 'Разработано'),
(184, 'ru', 'name', 'name'),
(185, 'ru', 'Attach file', 'Attach file'),
(186, 'ru', 'company', 'company'),
(187, 'ru', 'massage', 'massage'),
(188, 'ru', 'Registration', 'Registration'),
(189, 'ru', 'Back to home', 'Back to home'),
(190, 'ru', 'Register', 'Register'),
(191, 'ru', 'Enter', 'Enter'),
(192, 'ru', 'Quick view', 'Quick view'),
(193, 'ru', 'Add to Cart', 'Add to Cart'),
(194, 'ru', 'Availability', 'Availability'),
(195, 'ru', 'Brand', 'Brand'),
(196, 'ru', 'QTY', 'QTY'),
(197, 'ru', 'Picked For You', 'Picked For You'),
(198, 'ru', 'Categories', 'Categories'),
(199, 'ru', 'Latest Products', 'Latest Products'),
(200, 'ru', 'My Account', 'My Account');

-- --------------------------------------------------------

--
-- Структура таблицы `tree_category`
--

CREATE TABLE `tree_category` (
  `id` int(11) NOT NULL,
  `root` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `depth` tinyint(2) NOT NULL DEFAULT '0',
  `left_key` int(11) DEFAULT NULL,
  `right_key` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tree_category_translate`
--

CREATE TABLE `tree_category_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `widget`
--

CREATE TABLE `widget` (
  `id` int(11) NOT NULL,
  `block` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `widget_translate`
--

CREATE TABLE `widget_translate` (
  `id` int(11) NOT NULL,
  `foreign_id` int(11) NOT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Индексы таблицы `cms_configuration`
--
ALTER TABLE `cms_configuration`
  ADD PRIMARY KEY (`key`);

--
-- Индексы таблицы `cms_javascript`
--
ALTER TABLE `cms_javascript`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cms_settings`
--
ALTER TABLE `cms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `employee_translate`
--
ALTER TABLE `employee_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Индексы таблицы `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `faq_translate`
--
ALTER TABLE `faq_translate`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `iso` (`iso`);

--
-- Индексы таблицы `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Индексы таблицы `menu_translate`
--
ALTER TABLE `menu_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`);

--
-- Индексы таблицы `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `notifications_translate`
--
ALTER TABLE `notifications_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Индексы таблицы `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Индексы таблицы `page_translate`
--
ALTER TABLE `page_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Индексы таблицы `partner`
--
ALTER TABLE `partner`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `portfolio`
--
ALTER TABLE `portfolio`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `portfolio_category`
--
ALTER TABLE `portfolio_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `portfolio_category_translate`
--
ALTER TABLE `portfolio_category_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Индексы таблицы `portfolio_gallery`
--
ALTER TABLE `portfolio_gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portfolio_id` (`portfolio_id`) USING BTREE;

--
-- Индексы таблицы `portfolio_translate`
--
ALTER TABLE `portfolio_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `products_additional`
--
ALTER TABLE `products_additional`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products_brands_translate`
--
ALTER TABLE `products_brands_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`);

--
-- Индексы таблицы `products_category`
--
ALTER TABLE `products_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products_category_translate`
--
ALTER TABLE `products_category_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Индексы таблицы `products_photos`
--
ALTER TABLE `products_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `products_translate`
--
ALTER TABLE `products_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Индексы таблицы `product_brands`
--
ALTER TABLE `product_brands`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `publication`
--
ALTER TABLE `publication`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`);

--
-- Индексы таблицы `publication_translate`
--
ALTER TABLE `publication_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Индексы таблицы `publication_type`
--
ALTER TABLE `publication_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Индексы таблицы `publication_type_translate`
--
ALTER TABLE `publication_type_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Индексы таблицы `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `report_translate`
--
ALTER TABLE `report_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Индексы таблицы `reviews_translate`
--
ALTER TABLE `reviews_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Индексы таблицы `seo_manager`
--
ALTER TABLE `seo_manager`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Индексы таблицы `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `slider_translate`
--
ALTER TABLE `slider_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Индексы таблицы `translate`
--
ALTER TABLE `translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lang` (`lang`);

--
-- Индексы таблицы `tree_category`
--
ALTER TABLE `tree_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Индексы таблицы `tree_category_translate`
--
ALTER TABLE `tree_category_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- Индексы таблицы `widget`
--
ALTER TABLE `widget`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `block` (`block`);

--
-- Индексы таблицы `widget_translate`
--
ALTER TABLE `widget_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `lang` (`lang`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `cms_settings`
--
ALTER TABLE `cms_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `employee_translate`
--
ALTER TABLE `employee_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `faq_translate`
--
ALTER TABLE `faq_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `menu_translate`
--
ALTER TABLE `menu_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `notifications_translate`
--
ALTER TABLE `notifications_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT для таблицы `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `page_translate`
--
ALTER TABLE `page_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT для таблицы `partner`
--
ALTER TABLE `partner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `portfolio_category`
--
ALTER TABLE `portfolio_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `portfolio_category_translate`
--
ALTER TABLE `portfolio_category_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `portfolio_gallery`
--
ALTER TABLE `portfolio_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `portfolio_translate`
--
ALTER TABLE `portfolio_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `products_additional`
--
ALTER TABLE `products_additional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `products_brands_translate`
--
ALTER TABLE `products_brands_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `products_category`
--
ALTER TABLE `products_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `products_category_translate`
--
ALTER TABLE `products_category_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT для таблицы `products_photos`
--
ALTER TABLE `products_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `products_translate`
--
ALTER TABLE `products_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT для таблицы `product_brands`
--
ALTER TABLE `product_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `publication`
--
ALTER TABLE `publication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `publication_translate`
--
ALTER TABLE `publication_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `publication_type`
--
ALTER TABLE `publication_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `publication_type_translate`
--
ALTER TABLE `publication_type_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT для таблицы `report`
--
ALTER TABLE `report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `report_translate`
--
ALTER TABLE `report_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `reviews_translate`
--
ALTER TABLE `reviews_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `seo_manager`
--
ALTER TABLE `seo_manager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `slider_translate`
--
ALTER TABLE `slider_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `translate`
--
ALTER TABLE `translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT для таблицы `tree_category`
--
ALTER TABLE `tree_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `tree_category_translate`
--
ALTER TABLE `tree_category_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `widget`
--
ALTER TABLE `widget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `widget_translate`
--
ALTER TABLE `widget_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `employee_translate`
--
ALTER TABLE `employee_translate`
  ADD CONSTRAINT `employee_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `menu_translate`
--
ALTER TABLE `menu_translate`
  ADD CONSTRAINT `menu_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `notifications_translate`
--
ALTER TABLE `notifications_translate`
  ADD CONSTRAINT `notifications_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notifications_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `page_translate`
--
ALTER TABLE `page_translate`
  ADD CONSTRAINT `page_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `page_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `portfolio_gallery`
--
ALTER TABLE `portfolio_gallery`
  ADD CONSTRAINT `portfolio_gallery_ibfk_1` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `portfolio_translate`
--
ALTER TABLE `portfolio_translate`
  ADD CONSTRAINT `portfolio_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `portfolio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `portfolio_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`);

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `products_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `products_brands_translate`
--
ALTER TABLE `products_brands_translate`
  ADD CONSTRAINT `products_brands_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `product_brands` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `products_category_translate`
--
ALTER TABLE `products_category_translate`
  ADD CONSTRAINT `products_category_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `products_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_category_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `products_photos`
--
ALTER TABLE `products_photos`
  ADD CONSTRAINT `products_photos_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `products_translate`
--
ALTER TABLE `products_translate`
  ADD CONSTRAINT `products_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `publication`
--
ALTER TABLE `publication`
  ADD CONSTRAINT `publication_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `publication_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `publication_translate`
--
ALTER TABLE `publication_translate`
  ADD CONSTRAINT `publication_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `publication` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `publication_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `publication_type_translate`
--
ALTER TABLE `publication_type_translate`
  ADD CONSTRAINT `publication_type_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `publication_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `publication_type_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `report_translate`
--
ALTER TABLE `report_translate`
  ADD CONSTRAINT `report_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `report` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `report_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `reviews_translate`
--
ALTER TABLE `reviews_translate`
  ADD CONSTRAINT `reviews_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `slider_translate`
--
ALTER TABLE `slider_translate`
  ADD CONSTRAINT `slider_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `slider` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `slider_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `translate`
--
ALTER TABLE `translate`
  ADD CONSTRAINT `translate_ibfk_1` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE SET NULL;

--
-- Ограничения внешнего ключа таблицы `tree_category`
--
ALTER TABLE `tree_category`
  ADD CONSTRAINT `tree_category_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `tree_category` (`id`);

--
-- Ограничения внешнего ключа таблицы `tree_category_translate`
--
ALTER TABLE `tree_category_translate`
  ADD CONSTRAINT `tree_category_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `tree_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tree_category_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `widget_translate`
--
ALTER TABLE `widget_translate`
  ADD CONSTRAINT `widget_translate_ibfk_1` FOREIGN KEY (`foreign_id`) REFERENCES `widget` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `widget_translate_ibfk_2` FOREIGN KEY (`lang`) REFERENCES `language` (`iso`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
