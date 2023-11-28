-- Tarea 5
-- Marco Rodriguez Vargas. Carnet 2022149445
-- Esquema de Base de datos
# Las instrucciones DDL
create database blockbuster;
use blockbuster;
create table customer(
	customer_id int not null auto_increment primary key,
    first_name varchar(50),
    last_name varchar(50),
    address varchar(50),
	phone_number int unsigned
    );
    
create table movie(
	movie_id int not null auto_increment primary key,
    title varchar(50),
    release_date varchar(20),
    category varchar(25)
	);

create table loan(
	customer_id int not null,
    movie_id int not null,
    initial_date varchar(20),
    expiration_date varchar(20),
    loan_status varchar(10),
    key loan_customer_id(customer_id),
    constraint loan_id_customer foreign key (customer_id) references customer(customer_id) on delete restrict on update cascade,
    key loan_movie_id(movie_id),
    constraint loan_id_movie foreign key (movie_id) references movie(movie_id) on delete restrict on update cascade
    );

# Las instrucciones DML
-- insertar datos en cliente
insert into customer set first_name='Pedro', last_name='Rey', address='San Pedro, San Jose', phone_number='88453945';
insert into customer set first_name='Merce', last_name='Liu', address='Desamparados, Alajuela', phone_number='89473212';
insert into customer set first_name='Rafael', last_name='Mena', address='Santa Barbara, Heredia', phone_number='88231265';
insert into customer set first_name='Vanesa', last_name='Vargas', address='N/A', phone_number='88453945';
insert into customer set first_name='Leonardo', last_name='Costa', address='Guapiles, Limón', phone_number='88264251';
insert into customer set first_name='Michelle', last_name='Navarro', address='Santa Ana, San Jose', phone_number='88453945';
insert into customer set first_name='Kevin', last_name='Madrigal', address='Oreamuno, Cartago', phone_number='88326478';
insert into customer set first_name='Emily', last_name='Sanz', address='N/A', phone_number='89237501';
insert into customer set first_name='Manuel', last_name='Llanos', address='Siquirres, Limón', phone_number='88213456';
insert into customer set first_name='Daniela', last_name='Ulises', address='Sabanilla, San Jose', phone_number='89876421';
insert into customer set first_name='Bryan', last_name='Ganoza', address='Sabana, San Jose', phone_number='89021264'; -- cliente que no ha alquilado ninguna pelicula

select * from customer;

-- insertar datos en pelicula
insert into movie set title='Black Adam',release_date='October 21, 2022',category='Action';
insert into movie set title='Smile',release_date='September 30, 2022',category='Horror';
insert into movie set title='Creed',release_date='November 25, 2015',category='Action';
insert into movie set title='Ready Player One',release_date='March 29, 2018',category='Science Fiction';
insert into movie set title='The Batman',release_date='March 4, 2022',category='Action';
insert into movie set title='Bullet Train',release_date='August 5, 2022',category='Mystery';
insert into movie set title='Me Before You',release_date='June 3, 2016',category='Romance';
insert into movie set title='The Purge',release_date='May 31, 2013',category='Horror';
insert into movie set title='Tenet',release_date='August 12, 2020',category='Action';
insert into movie set title='The Visit',release_date='September 11, 2015',category='Horror';

select * from movie;

-- insertar datos en prestamo, fecha actual 2023-04-10
insert into loan set customer_id='1',movie_id='10', initial_date='2015-01-20',expiration_date='2015-01-23',loan_status='Inactive';
insert into loan set customer_id='2',movie_id='9', initial_date='2021-06-15',expiration_date='2021-06-18',loan_status='Inactive';
insert into loan set customer_id='3',movie_id='8', initial_date='2018-05-12',expiration_date='2018-05-15',loan_status='Inactive';
insert into loan set customer_id='4',movie_id='7', initial_date='2019-08-05',expiration_date='2019-08-08',loan_status='Inactive';
insert into loan set customer_id='5',movie_id='6', initial_date='2023-04-10',expiration_date='2023-04-13',loan_status='Active'; -- cedula 5 tiene 2 prestamos activos
insert into loan set customer_id='6',movie_id='5', initial_date='2022-02-01',expiration_date='2022-02-04',loan_status='Inactive'; -- cedula 7 tiene 4 prestamos activos
insert into loan set customer_id='7',movie_id='4', initial_date='2023-10-09',expiration_date='2023-10-12',loan_status='Active';
insert into loan set customer_id='8',movie_id='3', initial_date='2015-07-07',expiration_date='2015-07-10',loan_status='Inactive';
insert into loan set customer_id='9',movie_id='2', initial_date='2021-03-13',expiration_date='2021-03-16',loan_status='Inactive';
insert into loan set customer_id='10',movie_id='1', initial_date='2016-02-04',expiration_date='2016-02-07',loan_status='Inactive';
insert into loan set customer_id='7',movie_id='1', initial_date='2023-10-09',expiration_date='2023-10-12',loan_status='Active';
insert into loan set customer_id='7',movie_id='2', initial_date='2023-10-09',expiration_date='2023-10-12',loan_status='Active';
insert into loan set customer_id='7',movie_id='5', initial_date='2023-10-09',expiration_date='2023-10-12',loan_status='Active';
insert into loan set customer_id='5',movie_id='3', initial_date='2023-04-10',expiration_date='2023-04-13',loan_status='Active';

select * from loan;

-- Consultas
-- 1. Mostrar la Cédula, Nombre , Apellido y Teléfono Celular de los clientes que han pedido prestada una película al video, no importa si el préstamo está activo o no.
select customer.customer_id as  Cédula, customer.first_name as Nombre, customer.last_name as Apellido, customer.phone_number as Número_de_teléfono
from customer
join loan on customer.customer_id=loan.customer_id
where loan.loan_status='active' or loan.loan_status='inactive'
group by customer.customer_id; 

-- 2. Mostrar la cantidad de préstamos activos por cédula
select customer.customer_id as  Cédula, count(loan.customer_id) as Préstamos_activos 
from customer 
join loan on customer.customer_id=loan.customer_id
where loan.loan_status='active'
group by customer.customer_id; 

-- 3. Mostrar la cantidad de préstamos inactivos existentes por cédula
select customer.customer_id as Cédula, count(loan.customer_id) as Préstamos_inactivos 
from customer 
join loan on customer.customer_id=loan.customer_id
where loan.loan_status='inactive'
group by customer.customer_id; 

-- 4. Mostrar el total de préstamos inactivos existentes .
select count(loan.loan_status) as Préstamos_inactivos 
from loan 
where loan.loan_status='inactive'; 

-- 5. Mostrar a todos aquellos clientes que nunca han realizado un préstamo.
select customer.customer_id as Cédula, customer.first_name as Nombre, customer.last_name as Apellido 
from customer 
where customer.customer_id not in(select loan.customer_id from loan);

-- 6. Actualizar el campo Dirección y poner Guanacaste, del cliente con cédula 10.
update customer set address = 'guanacaste' where customer_id='10';

-- update customer set address = 'N/A' where customer_id='10'; -- Actualizar direccion de cedula 10 a N/A
select * from customer where customer_id='10'; -- Consultar el cambio de la direccion a la cedula 10

-- 7. Mostrar la cédula, nombre, apellido de los clientes que tienen entre 1 y 3 préstamos activos.
select customer.customer_id as  Cédula, customer.first_name as Nombre, customer.last_name as Apellido, count(loan.customer_id) as Préstamos_activos
from customer 
join loan on customer.customer_id=loan.customer_id 
where loan.loan_status='active' 
group by customer.customer_id 
having count(loan.customer_id) >= 1 and count(loan.customer_id) <= 3;