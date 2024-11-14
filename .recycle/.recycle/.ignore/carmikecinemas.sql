SET @old_autocommit=@@autocommit;

CREATE DATABASE IF NOT EXISTS `carmike_cinemas`;

USE `carmike_cinemas`;

CREATE TABLE `Engagement` (
  `theater_id` int(11) NOT NULL,
  `screen_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `Engagement` (`theater_id`, `screen_id`, `movie_id`, `start_date`, `end_date`) VALUES
(1, 1, 1, '2012-01-01', '2012-01-21'),
(1, 2, 2, '2012-01-01', '2012-01-21'),
(1, 3, 3, '2012-01-01', '2012-01-21'),
(1, 4, 4, '2012-01-01', '2012-01-21'),
(2, 1, 5, '2012-01-01', '2012-01-21'),
(2, 2, 4, '2012-01-01', '2012-01-21'),
(2, 3, 1, '2012-01-01', '2012-01-21'),
(3, 1, 3, '2012-01-01', '2012-01-21'),
(3, 2, 6, '2012-01-01', '2012-01-21'),
(3, 3, 8, '2012-01-01', '2012-01-21'),
(3, 4, 1, '2012-01-01', '2012-01-21'),
(4, 1, 9, '2012-01-01', '2012-01-21'),
(5, 1, 5, '2012-01-01', '2012-01-21'),
(5, 2, 2, '2012-01-01', '2012-01-21'),
(5, 3, 4, '2012-01-01', '2012-01-21'),
(5, 4, 8, '2012-01-01', '2012-01-21');

CREATE TABLE `Movie` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `minutes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `Movie` (`id`, `name`, `minutes`) VALUES
(1, 'Girl with Dragon Tattoo', 150),
(2, 'Mission Impossible', 130),
(3, 'Muppets', 100),
(4, 'War Horse', 130),
(5, 'Tinker, Tailor, Soldier, Spy', 110),
(6, 'We Bought a Zoo', 125),
(7, 'Hugo', 110),
(8, 'Alvin and Chipmunks', 110),
(9, 'Avatar', 140);

CREATE TABLE `Screen` (
  `id` int(11) NOT NULL,
  `theater_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `seats` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `Screen` (`id`, `theater_id`, `name`, `seats`) VALUES
(1, 1, '1', 120),
(2, 1, '2', 100),
(3, 1, '3', 130),
(4, 1, '4', 100),
(5, 2, 'Main Floor', 80),
(6, 2, 'Downstairs', 70),
(7, 2, 'Upstairs', 80),
(8, 3, '1', 200),
(9, 3, '2', 200),
(10, 3, '3', 200),
(11, 3, '4', 200),
(12, 4, NULL, 160),
(13, 5, 'One', 120),
(14, 5, 'Two', 100),
(15, 5, 'Three', 130),
(16, 5, 'Four', 100);

CREATE TABLE `Theater` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `Theater` (`id`, `name`) VALUES
(1, 'AMC'),
(2, 'Angelica'),
(3, 'Cinemark'),
(4, 'IMAX'),
(5, 'Landmark');

ALTER TABLE `Engagement`
  ADD KEY `fk_theater` (`theater_id`),
  ADD KEY `fk_screen` (`screen_id`),
  ADD KEY `fk_movie` (`movie_id`);

ALTER TABLE `Movie`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `Screen`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `Theater`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `Movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `Screen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

ALTER TABLE `Theater`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `Engagement`
  ADD CONSTRAINT `fk_movie` FOREIGN KEY (`movie_id`) REFERENCES `Movie` (`id`),
  ADD CONSTRAINT `fk_screen` FOREIGN KEY (`screen_id`) REFERENCES `Screen` (`id`),
  ADD CONSTRAINT `fk_theater` FOREIGN KEY (`theater_id`) REFERENCES `Theater` (`id`);