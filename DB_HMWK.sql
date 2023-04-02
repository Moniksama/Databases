CREATE DATABASE FootballChampionship;

CREATE TABLE Stadiums(
	stadium_number serial PRIMARY KEY,
	stadium_name VARCHAR(100) NOT NULL,
	stadium_capacity INT NOT NULL,
	stadium_city VARCHAR(150) NOT NULL	
);

CREATE TABLE Coaches(
	coach_number serial PRIMARY KEY,
	coach_name VARCHAR(100) NOT NULL,
	coach_age INT NOT NULL,
	stadium_city VARCHAR(150) NOT NULL	
);

DROP TABLE IF EXISTS Referees;
CREATE TABLE Referees(
	referee_number serial PRIMARY KEY,
	referee_name VARCHAR(250) NOT NULL,
	referee_age INT NOT NULL,
	main_referee CHAR(1) NOT NULL	
);

DROP TABLE IF EXISTS Teams;
CREATE TABLE Teams(
	team_number serial PRIMARY KEY,
	team_name VARCHAR(250) NOT NULL,
	city VARCHAR(250) NOT NULL,
	number_of_people_in_the_team INT NOT NULL,
	coach_number INT NOT NULL,
	CONSTRAINT fk_coach_number
		FOREIGN KEY(coach_number)
		REFERENCES Coaches(coach_number)
			ON DELETE CASCADE
	);

DROP TABLE IF EXISTS Matches;
CREATE TABLE Matches(
	match_number serial PRIMARY KEY,
	match_date timestamp NOT NULL,
	stadium_number INT NOT NULL,
	first_team_number INT NOT NULL,
	second_team_number INT NOT NULL,
	referee_number INT NOT NULL,
	final_score VARCHAR(250) NOT NULL,
	CONSTRAINT fk_referee_number
		FOREIGN KEY(referee_number)
		REFERENCES Referees(referee_number)
			ON DELETE CASCADE,
	CONSTRAINT fk_first_team_number
		FOREIGN KEY(first_team_number)
		REFERENCES Teams(team_number)
			ON DELETE CASCADE,
	CONSTRAINT fk_second_team_number
		FOREIGN KEY(second_team_number)
		REFERENCES Teams(team_number)
			ON DELETE CASCADE,
	CONSTRAINT fk_stadium_number
		FOREIGN KEY(stadium_number)
		REFERENCES Stadiums(stadium_number)
			ON DELETE CASCADE
	);




INSERT INTO Stadiums(stadium_name, stadium_capacity, stadium_city) VALUES ('Luzhniki Stadium', '81000', 'Moscow');
INSERT INTO Stadiums(stadium_name, stadium_capacity, stadium_city) VALUES ('Krestovsky Stadium', '67000', 'Saint Petersburg');
INSERT INTO Stadiums(stadium_name, stadium_capacity, stadium_city) VALUES ('Otkrytie Arena', '45360', 'Moscow');
INSERT INTO Stadiums(stadium_name, stadium_capacity, stadium_city) VALUES ('Lokomotiv Stadium', '27320', 'Moscow');
INSERT INTO Stadiums(stadium_name, stadium_capacity, stadium_city) VALUES ('Otkrytiye Arena', '44307', 'Moscow');
INSERT INTO Stadiums(stadium_name, stadium_capacity, stadium_city) VALUES ('VTB Arena', '26700', 'Moscow');

-- 1) Find all the names of stadiums from Moscow or St. Petersburg with a capacity of more than 40,000 seats.
SELECT * FROM Stadiums WHERE stadium_capacity >=40000;


INSERT INTO Coaches(coach_name, coach_age, stadium_city) VALUES ('Ivica Olić', '41', 'Moscow');
INSERT INTO Coaches(coach_name, coach_age, stadium_city) VALUES ('Sandro Schwarz', '42', 'Moscow');
INSERT INTO Coaches(coach_name, coach_age, stadium_city) VALUES ('Igor Cherevchenko', '46', 'Moscow');
INSERT INTO Coaches(coach_name, coach_age, stadium_city) VALUES ('Marko Nikolić', '41', 'Moscow');
INSERT INTO Coaches(coach_name, coach_age, stadium_city) VALUES ('Domenico Tedesco', '35', 'Moscow');
INSERT INTO Coaches(coach_name, coach_age, stadium_city) VALUES ('Yuri Matveyev', '53', 'Yekaterinburg');


INSERT INTO Teams(team_name, city, number_of_people_in_the_team, coach_number) VALUES ('PFC_CSKA_Moscow', 'Moscow', '30457', 1);
INSERT INTO Teams(team_name, city, number_of_people_in_the_team, coach_number) VALUES ('Dynamo Moscow', 'Moscow', '26700', 2);
INSERT INTO Teams(team_name, city, number_of_people_in_the_team, coach_number) VALUES ('Khimki', 'Moscow', '18636', 3);
INSERT INTO Teams(team_name, city, number_of_people_in_the_team, coach_number) VALUES ('Lokomotiv Moscow', 'Moscow', '27320', 4);
INSERT INTO Teams(team_name, city, number_of_people_in_the_team, coach_number) VALUES ('Spartak Moscow', 'Moscow', '44307', 5);
INSERT INTO Teams(team_name, city, number_of_people_in_the_team, coach_number) VALUES ('FC Ural Yekaterinburg', 'Yekaterinburg', '35696', 6);

select * from Teams;

-- 2) . Find the average number of people per team in each of the cities. Display the city and the average number of people in the team.

SELECT T.team_name AS NameT, number_of_people_in_the_team AS CountT, city AS CityT FROM Teams T;


INSERT INTO Referees(referee_name, referee_age, main_referee) VALUES ('Aleksei Eskov', '42', 'Y');
INSERT INTO Referees(referee_name, referee_age, main_referee) VALUES ('Alexei Kovalev', '39', 'Y');
INSERT INTO Referees(referee_name, referee_age, main_referee) VALUES ('Sergey Lapochkin', '40', 'Y');
INSERT INTO Referees(referee_name, referee_age, main_referee) VALUES ('Maksim Layushkin', '48', 'Y');
INSERT INTO Referees(referee_name, referee_age, main_referee) VALUES ('Vitali Doroshenko', '50', 'Y');
INSERT INTO Referees(referee_name, referee_age, main_referee) VALUES ('Sergey Ivanov', '36', 'Y');
INSERT INTO Referees(referee_name, referee_age, main_referee) VALUES ('Sergei Karasev', '41', 'Y');
INSERT INTO Referees(referee_name, referee_age, main_referee) VALUES ('Eduard Malyi', '51', 'N');
INSERT INTO Referees(referee_name, referee_age, main_referee) VALUES ('Gennadi Maslyayev', '62', 'N');
INSERT INTO Referees(referee_name, referee_age, main_referee) VALUES ('Anatoliy Zhabchenko', '52', 'N');
INSERT INTO Referees(referee_name, referee_age, main_referee) VALUES ('Nadezhda Ulyanovskaya', '55', 'N');



INSERT INTO Matches(match_date, stadium_number, first_team_number, second_team_number, referee_number, final_score) 
VALUES ('2021-04-24', '4', '4', '1', '2', '3-0');
INSERT INTO Matches(match_date, stadium_number, first_team_number, second_team_number, referee_number, final_score) 
VALUES ('2021-05-16', '6', '2', '1', '3', '3-2');
INSERT INTO Matches(match_date, stadium_number, first_team_number, second_team_number, referee_number, final_score) 
VALUES ('2021-05-16', '4', '4', '1', '1', '3-0');
INSERT INTO Matches(match_date, stadium_number, first_team_number, second_team_number, referee_number, final_score) 
VALUES ('2021-05-16', '3', '1', '3', '5', '3-3');
INSERT INTO Matches(match_date, stadium_number, first_team_number, second_team_number, referee_number, final_score) 
VALUES ('2021-05-09', '4', '2', '1', '1', '1-0');
INSERT INTO Matches(match_date, stadium_number, first_team_number, second_team_number, referee_number, final_score) 
VALUES ('2021-05-09', '5', '4', '3', '4', '2-1');
INSERT INTO Matches(match_date, stadium_number, first_team_number, second_team_number, referee_number, final_score) 
VALUES ('2021-05-08', '1', '1', '4', '2', '3-2');
INSERT INTO Matches(match_date, stadium_number, first_team_number, second_team_number, referee_number, final_score) 
VALUES ('2021-05-01', '1', '1', '3', '2', '3-3');
INSERT INTO Matches(match_date, stadium_number, first_team_number, second_team_number, referee_number, final_score) 
VALUES ('2021-05-01', '2', '2', '4', '6', '1-0');
INSERT INTO Matches(match_date, stadium_number, first_team_number, second_team_number, referee_number, final_score) 
VALUES ('2021-05-01', '3', '5', '6', '1', '1-0');
INSERT INTO Matches(match_date, stadium_number, first_team_number, second_team_number, referee_number, final_score) 
VALUES ('2021-04-26', '2', '2', '3', '2', '3-0');


-- 3) Find the name of the referee and the date of the last match that he refereed.


SELECT R.referee_name AS NameR, M.match_date AS DateM FROM Referees R JOIN Matches M ON R.referee_number = M.referee_number ORDER BY M.match_date desc;


-- 4)  Find the main referees who participated in more than three matches. Display the name of the referee and the number of matches. 
-- Sort the data by the number of matches in descending order.

SELECT  R.referee_name AS NameR, COUNT(R.referee_number) FROM Referees R JOIN Matches M ON R.referee_number = M.referee_number GROUP BY R.referee_number,  R.referee_name HAVING COUNT(R.referee_number) >= 3;


--5) Find all the numbers of matches in which the first team was from Moscow, and the second was not.

SELECT M.match_number AS NM, T.team_name AS NameT FROM Teams T JOIN Matches M ON T.team_number = M.first_team_number WHERE M.first_team_number IN (SELECT T1.team_number FROM Teams T1 WHERE T1.city = 'Moscow');
