-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Июн 17 2023 г., 23:14
-- Версия сервера: 8.0.33-0ubuntu0.22.04.2
-- Версия PHP: 8.1.2-1ubuntu2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `dp`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categori`
--

CREATE TABLE `categori` (
  `id` int NOT NULL,
  `categoria` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `categori`
--

INSERT INTO `categori` (`id`, `categoria`) VALUES
(1, 'Процессоры'),
(2, 'Материнские платы'),
(3, 'Видеокарты'),
(4, 'Оперативная память'),
(5, 'Блоки питания'),
(6, 'Корпуса'),
(7, 'Охлаждение компьютера'),
(8, 'Твердотельные накопители'),
(9, 'Жесткие диски'),
(10, 'Оптические приводы'),
(11, 'Звуковые карты'),
(12, 'Карты видеозахвата'),
(13, 'Внешние оптические приводы'),
(14, 'Платы расширения'),
(15, 'Адаптеры для накопителей'),
(16, 'Многофункциональные панели'),
(17, 'Аксессуары для материнских плат'),
(18, 'Сетевые карты'),
(19, 'Системы подсветки'),
(20, 'Контроллеры подсветки'),
(21, 'Кабели, разветвители и удлинители'),
(22, 'Держатели для видеокарт'),
(23, 'Кабель-менеджмент'),
(24, 'Аксессуары для вентиляторов'),
(25, 'Салазки для накопителей'),
(26, 'Аксессуары для корпуса'),
(27, 'Антипылевые фильтры и решетки'),
(28, 'Серверные процессоры'),
(29, 'Серверные накопители'),
(30, 'Серверная память'),
(31, 'Серверные БП'),
(32, 'Серверные корпуса'),
(33, 'Корзины для накопителей'),
(34, 'Серверные платы расширения'),
(35, 'Серверные контроллеры'),
(36, 'Серверные кабели и переходники'),
(37, 'Охлаждение для серверных процессоров'),
(38, 'Серверные направляющие'),
(39, 'Аксессуары для серверных корпусов'),
(40, 'Серверные ОС');

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_categori` int NOT NULL,
  `price` int NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `available_in_stock` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'в наличии',
  `delivery` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'доставки нет',
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `characteristic` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `id_provider` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `product_name`, `id_categori`, `price`, `img`, `available_in_stock`, `delivery`, `description`, `characteristic`, `id_provider`) VALUES
(1, 'Процессор AMD A6-9500E OEM', 1, 2899, '1.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 1),
(2, 'Процессор Intel Celeron G4900 OEM', 2, 2599, '2.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(3, 'Процессор AMD Athlon 200GE OEM', 1, 1999, '3.jpg', 'наличии', 'доставки нет', 'описание', 'характеристика', 2),
(4, 'Материнская плата AFOX IH61-MA2-V3', 2, 5199, '4.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(5, 'Материнская плата Biostar A68N-2100K', 2, 4799, '5.jpg', 'в  наличии', 'доставки нет', 'описание', 'характеристика', 1),
(6, 'Материнская плата ASRock H310CM-HDV', 2, 4499, '6.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(7, 'Видеокарта Palit GeForce GTX 1650 GamingPro', 3, 2000, '7.jpg', 'в наличии', 'доставка есть', 'описание', 'характеристика', 1),
(8, 'Видеокарта MSI GeForce GTX 1050 Ti 4GT', 3, 2000, '8.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(9, 'Видеокарта KFA2 GeForce RTX 3050 X White', 3, 2000, '9.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(10, 'Оперативная память ADATA XPG SPECTRIX D41 RGB', 1, 7499, '10.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(11, 'Оперативная память ADATA XPG SPECTRIX D50 RGB', 1, 2450, '11.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 1),
(12, 'Оперативная память ADATA XPG SPECTRIX D50 RGB', 1, 2100, '12.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(13, 'Блок питания ExeGate AAA350', 1, 899, '13.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 1),
(14, 'Блок питания ExeGate XP350', 1, 1199, '14.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(15, 'Блок питания ExeGate XP400', 1, 1399, '15.jpg', 'нет в наличии', 'доставка есть', 'описание', 'характеристика', 2),
(16, 'Корпус DEXP DC-201M черный', 1, 2799, '16.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(17, 'Корпус DEXP DC-101B черный', 1, 2499, '17.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 1),
(18, 'Корпус ExeGate MI-208', 1, 2599, '18.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(19, 'Видеокарта GIGABYTE GeForce GT 1030', 1, 7399, '19.jpg', 'нет наличии', 'доставки нет', 'описание', 'характеристика', 2),
(20, 'Видеокарта MSI GeForce GT 730', 1, 7799, '20.jpg', 'в наличии', 'доставка есть', 'описание', 'характеристика', 2),
(21, 'Видеокарта GIGABYTE GeForce GT 1030 OC', 1, 7999, '21.jpg', 'в наличии', 'доставка есть', 'описание', 'характеристика', 1),
(22, '120 ГБ 2.5\" SATA накопитель Pioneer APS-SL3N', 1, 1099, '22.jpg', 'в наличии', 'доставка есть', 'описание', 'характеристика', 2),
(23, '120 ГБ 2.5\" SATA накопитель QUMO Novation 3D', 1, 1150, '23.jpg', 'в наличии', 'доставка есть', 'описание', 'характеристика', 2),
(24, '120 ГБ 2.5\" SATA накопитель GIGABYTE', 1, 1199, '24.jpg', 'нет в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(25, '1 ТБ Жесткий диск Seagate BarraCuda', 1, 3099, '25.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(26, '1 ТБ Жесткий диск WD Blue', 1, 3199, '26.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(27, '1 ТБ Жесткий диск Toshiba P300', 1, 3599, '27.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(28, 'Привод DVD-RW LG GH24NSD5', 1, 2499, '28.jpg', 'в наличии', 'доставка есть', 'описание', 'характеристика', 1),
(29, 'Внутренняя звуковая карта Creative Sound BlasterX AE-5 Plus', 1, 599, '29.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(30, 'Устройство видеозахвата Espada EUsbRca63 USB 2.0 Type-A, , 720 х 576, RCA', 1, 799, '30.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(31, 'Привод внеш. DVD-RW DEXP BlackBurn', 1, 2050, '31.jpg', 'в наличии', 'доставка есть', 'описание', 'характеристика', 2),
(32, 'Плата расширения OPEN-DEV M2-PCI-E-RISER', 1, 160, '32.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(33, 'Внешний адаптер для накопителя Ugreen CM321', 1, 650, '33.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(34, 'Многофункциональная панель ORIENT C090 черный', 1, 899, '34.jpg', 'в наличии', 'доставка есть', 'описание', 'характеристика', 2),
(35, 'Синхронизатор блоков питания Espada esp-dpss02', 1, 250, '35.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(36, 'Сетевая карта DEXP ZH-FEPCI1', 1, 250, '36.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(37, 'Система подсветки для корпуса DEEPCOOL RGB 100 Plus', 1, 350, '37.jpg', 'в наличии', 'доставка есть', 'описание', 'характеристика', 1),
(38, 'Контроллер подсветки CoolerMaster Wired RGB Controller C10L', 1, 599, '38.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(39, 'Набор кабелей для блока питания ZET GAMING Power Set', 1, 899, '39.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(40, 'Держатель для видеокарты вертикальный Cooler Master Universal Graphics Card Holder 2 черный', 1, 1555, '40.jpg', 'в наличии', 'доставка есть', 'описание', 'характеристика', 2),
(41, 'Термоусадочная трубка Phobya heatshrink 6мм 1 шт', 1, 150, '41.jpg', 'нет в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(42, 'Оплетка для провода Phobya Flex Sleeve 10мм', 1, 140, '42.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(43, 'Салазки Espada H525FS', 1, 2000, '43.jpg', 'в наличии', 'доставка есть', 'описание', 'характеристика', 2),
(44, 'Антипылевой фильтр Akasa GRM80-AL01-BK черный Совместимый размер вентилятора - 80 x 80 мм', 1, 250, '44.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(45, 'Антивибрационная прокладка DEEPCOOL BUFFER P92', 1, 80, '45.jpg', 'в наличии', 'доставка есть', 'описание', 'характеристика', 1),
(46, 'Серверный процессор Intel E5-2603 v2 OEM', 1, 950, '46.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(47, '240 ГБ Серверный SSD накопитель Samsung PM893', 1, 6290, '47.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(48, 'Серверная оперативная память Kingston ValueRAM', 1, 1150, '48.jpg', 'в наличии', 'доставка есть', 'описание', 'характеристика', 2),
(49, 'Серверный БП Seasonic SFB 300W', 1, 1599, '49.jpg', 'нет наличии', 'доставки нет', 'описание', 'характеристика', 1),
(50, 'Серверный корпус ExeGate 1U250-01', 1, 2299, '50.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(51, 'Корзина для накопителей ExeGate EX264648RUS', 1, 899, '51.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(52, 'Плата расширения Supermicro BKT-BBU-BRACKET-05', 1, 3799, '52.jpg', 'нет в наличии', 'доставки нет', 'описание', 'характеристика', 1),
(53, 'Интерфейсный кабель Broadcom L5-00190-00', 1, 870, '53.jpg', 'в наличии', 'доставка есть', 'описание', 'характеристика', 2),
(54, 'Кулер для процессора Supermicro SNK-P0050AP4 4U', 1, 6399, '54.jpg', 'в наличии', 'доставки нет', 'описание', 'характеристика', 2),
(55, 'Комплект направляющих Exegate RK-20', 1, 1550, '55.jpg', 'в наличии', 'доставка есть', 'описание', 'характеристика', 2),
(56, 'Ручка для сервера Chenbro 384-MIX000138BA0', 1, 699, '56.jpg', 'нет в наличии', 'доставки нет', 'описание', 'характеристика', 1),
(57, 'Серверная лицензия Microsoft Windows RDS CAL 2019 MLP', 1, 12599, '57.jpg', 'в наличии', 'доставка есть', 'описание', 'характеристика', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `provider`
--

CREATE TABLE `provider` (
  `id` int NOT NULL,
  `name_provider` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `provider`
--

INSERT INTO `provider` (`id`, `name_provider`, `address`) VALUES
(1, 'АО \"ХОНЕВЕЛЛ\"', 'Г.Москва МУНИЦИПАЛЬНЫЙ ОКРУГ ДОРОГОМИЛОВО НАБ ТАРАСА ШЕВЧЕНКО 23А ЭТАЖ 11, ПОМЕЩ./КОМ I/1Д,'),
(2, 'ООО \"О-СИ-ЭС-ЦЕНТР\"', 'ГОРОД МОСКВА КМ КИЕВСКОЕ ШОССЕ 22-Й (П МОСКОВСКИЙ) ДОМОВЛАДЕН 6 СТР. 1 КОМ. 7');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `user` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `admin` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `user`, `password`, `email`, `admin`) VALUES
(1, 'polina', '1234', 'polina@mail.ru', 'admin'),
(2, 'user1', '1234', 'email1@mail.ru', 'user'),
(3, 'user2', '1234', 'email2@mail.ru', 'user'),
(4, 'user3', '1234', 'email3@mail.ru', 'admin'),
(5, 'user4', '1234', 'email4@mail.ru', 'user'),
(6, 'user5', '1234', 'email5@mail.ru', 'user'),
(7, 'user6', '1234', 'email6@mail.ru', 'user'),
(8, 'user7', '1234', 'email7@mail.ru', 'user'),
(9, 'user8', '1234', 'email8@mail.ru', 'user'),
(10, 'user9', '1234', 'email9@mail.ru', 'user'),
(11, 'user10', '1234', 'email10@mail.ru', 'user'),
(12, 'user11', '1234', 'email11@mail.ru', 'admin'),
(13, 'user12', '1234', 'email12@mail.ru', 'user'),
(14, 'user13', '1234', 'email13@mail.ru', 'user'),
(15, 'user14', '1234', 'email14@mail.ru', 'user'),
(16, 'user15', '1234', 'email15@mail.ru', 'user'),
(17, 'user16', '1234', 'email16@mail.ru', 'user'),
(18, 'user17', '1234', 'email17@mail.ru', 'user'),
(19, 'user18', '1234', 'email18@mail.ru', 'user'),
(20, 'user19', '1234', 'email19@mail.ru', 'user'),
(21, 'user20', '1234', 'email20@mail.ru', 'user'),
(22, 'user21', '1234', 'email21@mail.ru', 'user'),
(23, 'user22', '1234', 'email22@mail.ru', 'admin'),
(24, 'user23', '1234', 'email23@mail.ru', 'user'),
(25, 'user24', '1234', 'email24@mail.ru', 'user'),
(26, 'user25', '1234', 'email25@mail.ru', 'user'),
(27, 'user26', '1234', 'email26@mail.ru', 'user'),
(28, 'user27', '1234', 'email27@mail.ru', 'user'),
(29, 'user28', '1234', 'email28@mail.ru', 'user'),
(30, 'user29', '1234', 'email29@mail.ru', 'user'),
(31, 'user30', '1234', 'email30@mail.ru', 'user'),
(32, 'user31', '1234', 'email31@mail.ru', 'user'),
(33, 'user32', '1234', 'email32@mail.ru', 'user'),
(34, 'user33', '1234', 'email33@mail.ru', 'user'),
(35, 'user34', '1234', 'email34@mail.ru', 'user'),
(36, 'user35', '1234', 'email35@mail.ru', 'user'),
(37, 'user36', '1234', 'email36@mail.ru', 'user'),
(38, 'user37', '1234', 'email37@mail.ru', 'user'),
(39, 'user38', '1234', 'email38@mail.ru', 'user'),
(40, 'user39', '1234', 'email39@mail.ru', 'user'),
(41, 'user40', '1234', 'email40@mail.ru', 'user'),
(42, 'user41', '1234', 'email41@mail.ru', 'user'),
(43, 'user42', '1234', 'email42@mail.ru', 'user'),
(44, 'user43', '1234', 'email43@mail.ru', 'user'),
(45, 'user44', '1234', 'email44@mail.ru', 'user'),
(46, 'user45', '1234', 'email45@mail.ru', 'user'),
(47, 'user46', '1234', 'email46@mail.ru', 'user'),
(48, 'user47', '1234', 'email47@mail.ru', 'user'),
(49, 'user48', '1234', 'email48@mail.ru', 'user'),
(50, 'user49', '1234', 'email49@mail.ru', 'user'),
(51, 'user50', '1234', 'email50@mail.ru', 'user'),
(52, 'user51', '1234', 'email51@mail.ru', 'user'),
(53, 'user52', '1234', 'email52@mail.ru', 'user'),
(54, 'user53', '1234', 'email53@mail.ru', 'user'),
(55, 'user54', '1234', 'email54@mail.ru', 'user'),
(56, 'user55', '1234', 'email55@mail.ru', 'user'),
(57, 'user56', '1234', 'email56@mail.ru', 'user'),
(58, 'user57', '1234', 'email57@mail.ru', 'user'),
(59, 'user58', '1234', 'email58@mail.ru', 'user'),
(60, 'user59', '1234', 'email59@mail.ru', 'user'),
(61, 'user60', '1234', 'email60@mail.ru', 'user'),
(62, 'user61', '1234', 'email61@mail.ru', 'user'),
(63, 'user62', '1234', 'email62@mail.ru', 'user'),
(64, 'user63', '1234', 'email63@mail.ru', 'user'),
(65, 'user64', '1234', 'email64@mail.ru', 'user'),
(66, 'user65', '1234', 'email65@mail.ru', 'user'),
(67, 'user66', '1234', 'email66@mail.ru', 'user'),
(68, 'user67', '1234', 'email67@mail.ru', 'user'),
(69, 'user68', '1234', 'email68@mail.ru', 'user'),
(70, 'user69', '1234', 'email69@mail.ru', 'user'),
(71, 'user70', '1234', 'email70@mail.ru', 'user'),
(72, 'user71', '1234', 'email71@mail.ru', 'user'),
(73, 'user72', '1234', 'email72@mail.ru', 'user'),
(74, 'user73', '1234', 'email73@mail.ru', 'user'),
(75, 'user74', '1234', 'email74@mail.ru', 'user'),
(76, 'user75', '1234', 'email75@mail.ru', 'user'),
(77, 'user76', '1234', 'email76@mail.ru', 'user'),
(78, 'user77', '1234', 'email77@mail.ru', 'user'),
(79, 'user78', '1234', 'email78@mail.ru', 'user'),
(80, 'user79', '1234', 'email79@mail.ru', 'user'),
(81, 'user80', '1234', 'email80@mail.ru', 'user'),
(82, 'user81', '1234', 'email81@mail.ru', 'user'),
(83, 'user82', '1234', 'email82@mail.ru', 'user'),
(84, 'user83', '1234', 'email83@mail.ru', 'user'),
(85, 'user84', '1234', 'email84@mail.ru', 'user'),
(86, 'user85', '1234', 'email85@mail.ru', 'user'),
(87, 'user86', '1234', 'email86@mail.ru', 'user'),
(88, 'user87', '1234', 'email87@mail.ru', 'user'),
(89, 'user88', '1234', 'email88@mail.ru', 'user'),
(90, 'user89', '1234', 'email89@mail.ru', 'user'),
(91, 'user90', '1234', 'email90@mail.ru', 'user'),
(92, 'user91', '1234', 'email91@mail.ru', 'user'),
(93, 'user92', '1234', 'email92@mail.ru', 'user'),
(94, 'user93', '1234', 'email93@mail.ru', 'user'),
(95, 'user94', '1234', 'email94@mail.ru', 'user'),
(96, 'user95', '1234', 'email95@mail.ru', 'user'),
(97, 'user96', '1234', 'email96@mail.ru', 'user'),
(98, 'user97', '1234', 'email97@mail.ru', 'user'),
(99, 'user98', '1234', 'email98@mail.ru', 'user'),
(100, 'user99', '1234', 'email99@mail.ru', 'user'),
(101, 'user100', '1234', 'email100@mail.ru', 'user');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categori`
--
ALTER TABLE `categori`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categori` (`id_categori`,`id_provider`),
  ADD KEY `id_provider` (`id_provider`);

--
-- Индексы таблицы `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user` (`user`,`email`),
  ADD UNIQUE KEY `user_2` (`user`,`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categori`
--
ALTER TABLE `categori`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT для таблицы `provider`
--
ALTER TABLE `provider`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_provider`) REFERENCES `provider` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`id_categori`) REFERENCES `categori` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
