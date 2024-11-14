create database MovieEngagement;

connect MovieEngagement;

create table Theater  (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
	name VARCHAR(50) NOT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
create table Screen  (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
	theater_id int NOT NULL,
	name VARCHAR(50),
	seats int NOT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table Movie  (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
	name VARCHAR(50),
	minutes int NOT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

create table Engagement  (
	theater_id INT NOT NULL, 
	screen_id int NOT NULL,
	movie_id INT NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	CONSTRAINT fk_theater FOREIGN KEY(theater_id) REFERENCES Theater(id),
	CONSTRAINT fk_screen FOREIGN KEY(screen_id) REFERENCES Screen(id),
	CONSTRAINT fk_movie FOREIGN KEY(movie_id) REFERENCES Movie(id)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

insert into Theater (name) VALUES ("AMC"), ("Angelica"), ("Cinemark"), ("IMAX"), ("Landmark");

insert into Screen (theater_id, name, seats) VALUES (1, "1", 120), (1, "2", 100), (1, "3", 130), (1, "4", 100);
insert into Screen (theater_id, name, seats) VALUES (2, "Main Floor", 80), (2, "Downstairs", 70), (2, "Upstairs", 80);
insert into Screen (theater_id, name, seats) VALUES (3, "1", 200), (3, "2", 200), (3, "3", 200), (3, "4", 200);
insert into Screen (theater_id, name, seats) VALUES (4, NULL, 160);
insert into Screen (theater_id, name, seats) VALUES (5, "One", 120), (5, "Two", 100), (5, "Three", 130), (5, "Four", 100);

insert into Movie (name, minutes) VALUES 
	("Girl with Dragon Tattoo", 150), 
	("Mission Impossible", 130), 
	("Muppets", 100), 
	("War Horse", 130),
	("Tinker, Tailor, Soldier, Spy", 110), 
	("We Bought a Zoo", 125), 
	("Hugo", 110), 
	("Alvin and Chipmunks", 110),
	("Avatar", 140);

insert into Engagement (theater_id, screen_id, movie_id, start_date, end_date) VALUES
	(1, 1, 1, DATE("2012-01-01"), DATE("2012-01-21")),
	(1, 2, 2, DATE("2012-01-01"), DATE("2012-01-21")),
	(1, 3, 3, DATE("2012-01-01"), DATE("2012-01-21")),
	(1, 4, 4, DATE("2012-01-01"), DATE("2012-01-21")),
	(2, 1, 5, DATE("2012-01-01"), DATE("2012-01-21")),
	(2, 2, 4, DATE("2012-01-01"), DATE("2012-01-21")),
	(2, 3, 1, DATE("2012-01-01"), DATE("2012-01-21")),
	(3, 1, 3, DATE("2012-01-01"), DATE("2012-01-21")),
	(3, 2, 6, DATE("2012-01-01"), DATE("2012-01-21")),
	(3, 3, 8, DATE("2012-01-01"), DATE("2012-01-21")),
	(3, 4, 1, DATE("2012-01-01"), DATE("2012-01-21")),
	(4, 1, 9, DATE("2012-01-01"), DATE("2012-01-21")),
	(5, 1, 5, DATE("2012-01-01"), DATE("2012-01-21")),
	(5, 2, 2, DATE("2012-01-01"), DATE("2012-01-21")),
	(5, 3, 4, DATE("2012-01-01"), DATE("2012-01-21")),
	(5, 4, 8, DATE("2012-01-01"), DATE("2012-01-21"));
	
select Theater.name AS "Theater", Screen.name AS "Screen", Screen.seats AS "Seats", 
		Movie.name AS "Movie", Movie.minutes AS "Minutes", 
		Engagement.start_date AS "Start Date", Engagement.end_date AS "End Date"
FROM Theater 
JOIN Engagement ON Theater.id = Engagement.theater_id 
JOIN Screen ON Screen.id = Engagement.screen_id 
JOIN Movie ON Movie.id = Engagement.movie_id;