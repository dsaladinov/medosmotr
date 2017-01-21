-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 21 2017 г., 23:41
-- Версия сервера: 5.6.31
-- Версия PHP: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `salaidinovdb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_assignment`
--

CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`, `updated_at`) VALUES
('Администратор', 1, 1483049393, 1483049393),
('Невропатолог', 11, 1484981457, NULL),
('Офтальмолог', 14, 1485027812, NULL),
('Педиатр', 2, 1484991261, NULL),
('Педиатр', 10, 1484933689, NULL),
('Травмотолог-ортопед', 13, 1485026140, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item`
--

CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('rbacManage', 2, 'Управление RBAC структурой', NULL, 's:0:"";', 1483049393, 1485028048),
('userCreate', 2, 'Добавление пользователей', NULL, 's:7:"s:0:"";";', 1483049393, 1485028064),
('userDelete', 2, 'Удаление пользователей', NULL, 's:0:"";', 1483049393, 1485028076),
('userManage', 2, 'Просмотр списка пользователей', NULL, 's:0:"";', 1483049393, 1485028112),
('userPermissions', 2, 'Управление правами пользователей', NULL, 's:0:"";', 1483049393, 1485028131),
('userUpdate', 2, 'Редактирование пользователей', NULL, 's:0:"";', 1483049393, 1485028148),
('userUpdateNoElderRank', 2, 'Редактирование пользователей с равным или более низкого ранга', NULL, 's:7:"s:0:"";";', 1483049393, 1485028666),
('userView', 2, 'Просмотр информации о пользователе', NULL, 's:0:"";', 1483049393, 1485028192),
('Администратор', 1, 'Администратор', NULL, 's:0:"";', 1483049393, 1484668829),
('Невропатолог', 1, 'Невропатолог', NULL, 's:0:"";', 1484668694, 1484668694),
('Офтальмолог', 1, 'Офтальмолог', NULL, 's:0:"";', 1484668721, 1484668721),
('Педиатр', 1, 'Педиатр', NULL, 's:38:"s:30:"s:22:"s:14:"s:7:"s:0:"";";";";";";', 1483049393, 1484995512),
('Травмотолог-ортопед', 1, 'Травмотолог-ортопед', NULL, 's:7:"s:0:"";";', 1484668753, 1484669128);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item_child`
--

CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('Администратор', 'rbacManage'),
('Администратор', 'userCreate'),
('Администратор', 'userDelete'),
('Педиатр', 'userManage'),
('Администратор', 'userPermissions'),
('userUpdateNoElderRank', 'userUpdate'),
('Администратор', 'userUpdate'),
('Педиатр', 'userUpdate'),
('Педиатр', 'userUpdateNoElderRank'),
('Педиатр', 'userView'),
('Администратор', 'Педиатр'),
('Невропатолог', 'Педиатр'),
('Офтальмолог', 'Педиатр'),
('Травмотолог-ортопед', 'Педиатр');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_rule`
--

CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_rule`
--

INSERT INTO `auth_rule` (`name`, `data`, `created_at`, `updated_at`) VALUES
('noElderRank', 'O:34:"budyaga\\users\\rbac\\NoElderRankRule":3:{s:4:"name";s:11:"noElderRank";s:9:"createdAt";N;s:9:"updatedAt";i:1431880756;}', 1483049393, 1483049393);

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1483049385),
('m130524_201442_init', 1483049393),
('m150926_063829_create_table_comment', 1483106501),
('m161230_134048_create_table_article', 1483105428);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_type` int(11) NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` smallint(6) NOT NULL DEFAULT '1',
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `complaints` text COLLATE utf8_unicode_ci NOT NULL,
  `s_history` text COLLATE utf8_unicode_ci NOT NULL,
  `diagnosis` text COLLATE utf8_unicode_ci NOT NULL,
  `diag_nevrop` text COLLATE utf8_unicode_ci NOT NULL,
  `diag_ovtal` text COLLATE utf8_unicode_ci NOT NULL,
  `diag_travmat` text COLLATE utf8_unicode_ci NOT NULL,
  `med_report` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `user_type`, `auth_key`, `password_hash`, `email`, `photo`, `sex`, `status`, `created_at`, `updated_at`, `complaints`, `s_history`, `diagnosis`, `diag_nevrop`, `diag_ovtal`, `diag_travmat`, `med_report`) VALUES
(1, 'Администратор', 1, 'xEhdz9SF3CrGAguSIzR3mD3w6K8ROpBV', '$2y$13$WFrudv2aZU.M2272jT.Oqe7kXCm7PIQ7c3uU6QFnJzy39t05M8G3i', 'dsalaidinov@gmail.com', 'http://mydoctor.kg/uploads/user/photo/5883be3a1287f.jpg', 1, 2, 1483049392, 1485028932, '', '', '', '', '', '', ''),
(2, 'Педиатр', 2, 'I3jh2-xwRaJfxU8Kry-WcqGtf5nQEjh_', '$2y$13$z8AZ5DB2MJJFBb7gr.RuM.7M.ikBQGp/ixxR7POc/uLPg4i4Cu1Zi', 'allik274@gmail.com', 'http://mydoctor.kg/uploads/user/photo/58823fcc9498d.jpg', 2, 2, 1484931026, 1485029784, '', '', '', '', '', '', ''),
(3, 'Alik', 6, '', '$2y$13$YUwNWmapbnT7YL3D59nOUuKj0.Qz6CqDr/pEiwU.aR201capj.7BO', 'allik@gmail.com', '', 1, 2, 1483050720, 1484677637, '', '', '', '', '', '', ''),
(10, 'pediatr', 2, '5S-LqURuwojYPCDr322WnFPsS90A2EtD', '$2y$13$/rkzYFG6HKvdPbkCphbJCukIaFE9NbqPRg2vffsnS7E7YRva8hm9K', 'sabyrbekzumabekov2@gmail.com', 'http://mydoctor.kg/uploads/user/photo/5882499a8903e.jpg', 1, 2, 1484933539, 1484933553, '', '', '', '', '', '', ''),
(11, 'Невропатолог', 3, 'PKiz0oSQjc5Nsnf4II9gxogA-Jy9IX6E', '$2y$13$U0BcvK4STxYI7Oj2ydN.l..B8vQc3nrppSIpEGK.iLxnuY0M83Okm', 'nnazarbaev99@gmail.com', 'http://mydoctor.kg/uploads/user/photo/5882fe5708cda.jpg', 1, 2, 1484979812, 1485026936, '', '', '', '', '', '', ''),
(12, 'amanchik97', 6, 'KYofbZpWAtAMNCxXUb7VzGye3q0C1UGd', '$2y$13$wLENlCBJQkjB91xsFvP1eOb2X9bL.tLh2lvoE.4xW8Q57GZMqH0f.', 'amanbekmambetkalyev@gmail.com', '', 1, 2, 1484984603, 1485031113, 'При заболеваниях печени могут быть боли или ощущение тяжести в правом подреберье. Боли постоянные в течение дня, ноющие, усиливаются при физической нагрузке, тряской езде, употреблении в пищу жиров, острых и жареных блюд, успокаиваются в покое. Боли обычно сопровождаются потерей аппетита, отрыжкой горечью, изжогой, тошнотой, рвотой.', 'Вечером каждый день болел живот', 'Язва желудка второй степени', 'Здоров', 'Здоров', 'Здоров', 'Нужно лечь в больницу'),
(13, 'Травмотолог', 5, 'RfVirYV2ybzJtO7RL-IwsxkSIBEKMJN4', '$2y$13$XxKxRO6oWWyTtn5/qlU0nevs65Cb0vGFbxhuSTcBJL8YV3vJve0ym', 'gulnuramambetka@gmail.com', 'http://mydoctor.kg/uploads/user/photo/5883b26bdb014.jpg', 2, 2, 1485025912, 1485025979, '', '', '', '', '', '', ''),
(14, 'Офтальмолог', 4, 'MAusHmpI17JrU2xAmrqNFq8scUgmOjL2', '$2y$13$fm31CnG3KkSSJAAc0Ywfp.yAEWi7KXiwsIxyrr5luQl62dbOS9zgu', 'nandreevna71@gmail.com', 'http://mydoctor.kg/uploads/user/photo/5883b9207ffc6.jpg', 2, 2, 1485027626, 1485027668, '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `user_email_confirm_token`
--

CREATE TABLE IF NOT EXISTS `user_email_confirm_token` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `old_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_email_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_email_confirm` smallint(6) DEFAULT '0',
  `new_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `new_email_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `new_email_confirm` smallint(6) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user_oauth_key`
--

CREATE TABLE IF NOT EXISTS `user_oauth_key` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `provider_user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user_password_reset_token`
--

CREATE TABLE IF NOT EXISTS `user_password_reset_token` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user_password_reset_token`
--

INSERT INTO `user_password_reset_token` (`id`, `user_id`, `token`) VALUES
(1, 2, 'p0Kboq8Q-tAec_A4HD-CeFdClQOw3KHG_1485010308'),
(2, 12, 'JvT-1thI5PsUkMtkwGdzyH65QwyfsMi6_1485029876');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `auth_assignment_user_id_fk` (`user_id`);

--
-- Индексы таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `auth_item_rule_name_fk` (`rule_name`),
  ADD KEY `auth_item_type_index` (`type`);

--
-- Индексы таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `auth_item_child_child_fk` (`child`);

--
-- Индексы таблицы `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);


--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_email_confirm_token`
--
ALTER TABLE `user_email_confirm_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_email_confirm_token_user_id_fk` (`user_id`);

--
-- Индексы таблицы `user_oauth_key`
--
ALTER TABLE `user_oauth_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_oauth_key_user_id_fk` (`user_id`);

--
-- Индексы таблицы `user_password_reset_token`
--
ALTER TABLE `user_password_reset_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_password_reset_token_user_id_fk` (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT для таблицы `user_email_confirm_token`
--
ALTER TABLE `user_email_confirm_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `user_oauth_key`
--
ALTER TABLE `user_oauth_key`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `user_password_reset_token`
--
ALTER TABLE `user_password_reset_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_item_name_fk` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_assignment_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_rule_name_fk` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_child_fk` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_parent_fk` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_email_confirm_token`
--
ALTER TABLE `user_email_confirm_token`
  ADD CONSTRAINT `user_email_confirm_token_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_oauth_key`
--
ALTER TABLE `user_oauth_key`
  ADD CONSTRAINT `user_oauth_key_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_password_reset_token`
--
ALTER TABLE `user_password_reset_token`
  ADD CONSTRAINT `user_password_reset_token_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
