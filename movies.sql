drop database if exists movies;
create database movies;
use movies;


create table producer(
id int primary key auto_increment,
name varchar (50) not null,
adress varchar (50) not null,
bulstatt varchar (9) unique not null
);

insert into producer(name, adress, bulstatt)
values('John Smith', 'LA', '555555555'),
      ('Petar Petrov', 'Stara Zagora', '666666666');

create table actor(
id int primary key auto_increment,
name varchar (20) not null,
sex enum ('M', 'F') not null,
adress varchar(50) not null,
birthday date not null

);

insert into actor(sex, adress, birthday, name)
values('M', 'Sofia, Mladost', '1985-02-02', 'Ivan'),
      ('F', 'Varna', '1995-03-03', 'Maria'),
      ('M', 'Burgas', '2000-05-05', 'Borislav'),
      ('F', 'Plovdiv', '2002-08-08', 'Elitsa');

       

create table studio(
id int primary key auto_increment,
bulstatt varchar(9)  unique not null,
adress varchar (50) not null
);

insert into studio(bulstatt, adress)
values('111111111', 'Sofia'),
	  ('222222222', 'Plovdiv'),
      ('333333333', 'Varna');
      


drop table if exists movie;
create table movie(
id int primary key auto_increment,
title varchar (50) not null,
lenght time not null,
budget double not null,
year year not null,
producer_id int not null,
studio_id int not null,
foreign key (producer_id) references producer(id),
foreign key (studio_id) references studio(id)
);

insert into movie( lenght,title, year, budget, studio_id, producer_id)
values('02:15:10', "The day after tomorrow", '1995', 2.7, 1, 2),
      ('02:05:10', "The hunger games", '1999', 3.7, 2, 1),
      ('01:10:10', "Tryptich", '2022', 7.2, 1, 2),
      ('02:05:10', "Titanic", '1992', 4.8, 2, 1),
      ('02:05:10', "Lover", '1993', 6.3, 2, 1);
drop table if exists movie_actor;
create table movie_actor(
actor_id int not null,
movie_id int not null,
foreign key (actor_id)  references actor(id),
foreign key (movie_id)  references movie(id),
primary  key(actor_id, movie_id)
);


/*Напишете заявка, която извежда имената на всички актьори, които
са мъже или живеят в ‘‘София‘‘.*/
select actor.name
from actor
where actor.adress like '%Sofia%' 
or actor.sex = 'M';

/*Напишете заявка, която извежда топ 3 на най-високо бюджетните
филми, излезнали между 1990 и 2000 година.*/

select movie.title as Movie
from movie 
where year between 1990 and 2000
order by budget desc
limit 3;

/*: Напишете заявка, която извежда имена на филми и имената на
актьорите, които участват в тях, но само за филми, които са продуцирани от
продуцент „John Smith ”.*/
select  movie.title as Movie, actor.name as Actors
from movie join actor on movie.actor_id = actor.id
           join producer on movie.producer_id = producer.id
           where producer.name = 'John Smith';
           
/*Напишете заявка, която извежда име на актьор и средна стойност на
дължините на филмите, в който е участвал, но само за филми, имащи дължини,
по-големи от средната дължина на филмите преди 2000г. */

use movies;
select actor.name as Actor, avg(movie.lenght) as AvgMovieLenght
from movie join actor on movie.actor_id = actor.id
where movie.lenght>
(select avg(movie.lenght)
from movie
where movie.year<2000)
group by actor.name;


















