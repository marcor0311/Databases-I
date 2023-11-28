-- Quiz-5
-- Marco Rodriguez Vargas. Carnet 2022149445
-- Esquema de Base de datos
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;
# Las instrucciones DDL
create database quiz_5;
use quiz_5;
create table movie(
	movie_id int not null auto_increment primary key,
    title varchar(50) unique,
    release_date varchar(50),
    category_id int not null,
	key category_key(category_id),
    constraint category_key foreign key (category_id) references movie_category(category_id) on delete restrict on update cascade
    );
    
create table movie_category(
	movie_id int not null,
	key movie_key(movie_id),
    constraint movie_key foreign key (movie_id) references movie(movie_id) on delete restrict on update cascade,
    category_id int not null,
	key movie_category_key(category_id),
    constraint movie_category_key foreign key (category_id) references category(category_id) on delete restrict on update cascade
	);
    
create table category(
	category_id int not null auto_increment primary key,
    category_name varchar(50)
    );
    
create table movie_rating(
	movie_id int not null,
	key rating_movie_key(movie_id),
    constraint rating_movie_key foreign key (movie_id) references movie(movie_id) on delete restrict on update cascade,
    rating_id int not null,
	key movie_rating_key(rating_id),
    constraint movie_rating_key foreign key (rating_id) references rating(rating_id) on delete restrict on update cascade
	);
    
create table rating(
	rating_id int not null auto_increment primary key,
    rating_value int check (rating_value<=5 and rating_value>=0),
    review varchar(100)
    );    

 create table user_rating(
	rating_id int not null,
	key rating_key(rating_id),
    constraint rating_key foreign key (rating_id) references rating(rating_id) on delete restrict on update cascade,
    user_id int not null,
	key user_key(user_id),
    constraint user_key foreign key (user_id) references user(user_id) on delete restrict on update cascade
	);   
    
create table user(
	user_id int not null auto_increment primary key,
    first_name varchar(50),
    last_name varchar(50)
	);

# Las instrucciones DML
-- insertar datos en pelicula
insert into movie set title='Black Adam', release_date='October 21, 2022',category_id='1';
insert into movie set title='Smile', release_date='September 30, 2022',category_id='2';
insert into movie set title='Creed', release_date='November 25, 2015',category_id='3';
insert into movie set title='Ready Player One', release_date='March 29, 2018',category_id='4';
insert into movie set title='The Batman', release_date='March 4, 2022',category_id='1';
select * from movie;

-- insertar datos en pelicula-categoria
insert into movie_category set movie_id='1',category_id='1';
insert into movie_category set movie_id='2',category_id='2';
insert into movie_category set movie_id='3',category_id='3';
insert into movie_category set movie_id='4',category_id='4';
insert into movie_category set movie_id='5',category_id='1';
select * from movie_category;

-- insertar datos en categoria
insert into category set category_name='Superhero';
insert into category set category_name='Horror';
insert into category set category_name='Action';
insert into category set category_name='Science Fiction';
insert into category set category_name='Comedy';
select * from category;

-- insertar datos en pelicula-rating
insert into movie_rating set movie_id='1',rating_id='1';
insert into movie_rating set movie_id='2',rating_id='2';
insert into movie_rating set movie_id='3',rating_id='3';
insert into movie_rating set movie_id='4',rating_id='4';
insert into movie_rating set movie_id='5',rating_id='5';
select * from movie_rating;

-- insertar datos en rating
insert into rating set rating_value='3',review='Movie was a bit boring, the only good part was the ending';
insert into rating set rating_value='5',review='I loved every single jumpscare, the plot is really nice';
insert into rating set rating_value='2',review='Not as good as any rocky movie, creed needs more identity';
insert into rating set rating_value='1',review='Hella boring, never watching it again';
insert into rating set rating_value='5',review='Best Batman movie ever, every shot of the movie is unique';
select * from rating;

-- insertar datos en usuario-rating
insert into user_rating set user_id='1',rating_id='1';
insert into user_rating set user_id='2',rating_id='2';
insert into user_rating set user_id='3',rating_id='3';
insert into user_rating set user_id='4',rating_id='4';
insert into user_rating set user_id='5',rating_id='5';
select * from user_rating;

-- insertar datos en usuario
insert into user set first_name='Pedro',last_name='Rey';
insert into user set first_name='Merce',last_name='Liu';
insert into user set first_name='Rafael',last_name='Mena';
insert into user set first_name='Vanesa',last_name='Vargas';
insert into user set first_name='Leonardo',last_name='Costa';
select * from user;

-- Consultas
-- 1. Se necesita listar las películas ordenadas por nombre
select movie.title as Titulo, movie.movie_id as codigo_pelicula
from movie
order by movie.title; 
-- 2. Las películas pueden ser renombradas
update movie set title = 'The Batman 2022' where movie_id='5';
-- 3. Las películas se pueden filtrar por categoría
select movie.movie_id as codigo_pelicula, movie.title as titulo, category.category_name as categoria
from movie 
join category on movie.category_id = category.category_id
where category_name='Superhero';