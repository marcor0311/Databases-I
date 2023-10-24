-- Proyecto 1
-- Caso 2
-- Marco Rodriguez Vargas. Carnet 2022149445
-- Esquema de Base de datos
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;
# Las instrucciones DDL
create database caso_2;
use caso_2;
    
create table persona(
	cedula int not null auto_increment primary key,
    tipo int unsigned not null,
    nombre varchar(50)
    );

create table persona_fisica(
	cedula int not null,
    fecha_nacimiento varchar(50),
    key persona_fisica_key(cedula),
    constraint cedula_fisica foreign key (cedula) references persona(cedula) on delete restrict on update cascade
	);

create table persona_juridica(
	cedula int not null,
    nombre_comercial varchar(50),
    key persona_juridica_key(cedula),
    constraint cedula_juridica foreign key (cedula) references persona(cedula) on delete restrict on update cascade
	);  
 
 create table cuenta_por_cobrar(
	numero_cuenta int not null auto_increment primary key,
    cedula int not null,
    monto_cobrar int unsigned not null,
    fecha_vencimiento_cobro varchar(50),
    key cuentra_cedula_key(cedula),
    constraint cuentra_cedula foreign key (cedula) references persona(cedula) on delete restrict on update cascade
	);
    
create table cuenta_persona(
	cedula int not null,
    key persona_cuenta_cedula_key(cedula),
    constraint persona_cuenta_cedula foreign key (cedula) references persona(cedula) on delete restrict on update cascade,
    numero_cuenta int not null,
    key cuenta_persona_key(numero_cuenta),
    constraint cuenta_persona foreign key (numero_cuenta) references cuenta_por_cobrar(numero_cuenta) on delete restrict on update cascade
	);
    
create table cuenta_abono(
	numero_cuenta int not null,
    key numero_cuenta_abono_key (numero_cuenta),
    constraint numero_cuenta_abono foreign key (numero_cuenta) references cuenta_por_cobrar(numero_cuenta) on delete restrict on update cascade,
    numero_cuota int not null,
    key numero_cuota_abono_key (numero_cuota),
    constraint numero_cuota_abono foreign key (numero_cuota) references abono(numero_cuota) on delete restrict on update cascade
	);
    
create table abono(
	numero_cuota int not null auto_increment primary key,
	numero_cuenta int not null,
    key abono_cuenta_key (numero_cuenta),
    constraint abono_cuenta foreign key (numero_cuenta) references cuenta_abono(numero_cuenta) on delete restrict on update cascade,
    fecha_abono varchar(50),
    monto_abono int unsigned not null
	);
    
create table abono_pago(
	numero_cuota int not null,
    key cuota_pago_key (numero_cuota),
    constraint cuota_pago foreign key (numero_cuota) references abono(numero_cuota) on delete restrict on update cascade,
    codigo_pago int not null,
    key pago_codigo_key (codigo_pago),
    constraint codigo_pago foreign key (codigo_pago) references forma_pago(codigo_pago) on delete restrict on update cascade 
	);
    
create table forma_pago(
	codigo_pago int not null auto_increment primary key,
    nombre varchar(50),
    numero_cuota int not null,
    key numero_cuota_pago_key(numero_cuota),
    constraint numero_cuota_pago foreign key (numero_cuota) references abono_pago(numero_cuota) on delete restrict on update cascade
	);
# Las instrucciones DML
-- insertar datos en persona tipo 1
insert into persona set tipo='1', nombre='Pedro Rey';
insert into persona set tipo='1', nombre='Merce Liu';
insert into persona set tipo='1', nombre='Rafael Mena';
insert into persona set tipo='1', nombre='Vanesa Vargas';
insert into persona set tipo='1', nombre='Leonardo Costa';
insert into persona set tipo='1', nombre='Michelle Navarro';
insert into persona set tipo='1', nombre='Kevin Madrigal';
insert into persona set tipo='1', nombre='Emily Sanz';
insert into persona set tipo='1', nombre='Manuel Llanos';
insert into persona set tipo='1', nombre='Daniela Ulises';
-- insertar datos en persona tipo 2
insert into persona set tipo='2', nombre='Maurcio Morua';
insert into persona set tipo='2', nombre='Ernesto Hidalgo';
insert into persona set tipo='2', nombre='Stuart Villalobos';
insert into persona set tipo='2', nombre='Allen Campos';
insert into persona set tipo='2', nombre='Richi Cordero';
insert into persona set tipo='2', nombre='Andres Marin';
insert into persona set tipo='2', nombre='Diego Quintana';
insert into persona set tipo='2', nombre='Valentino Chavarria';
insert into persona set tipo='2', nombre='Estefania Rodriguez';
insert into persona set tipo='2', nombre='Ashley Zamora';
select * from persona;

-- insertar datos en persona fisica (tipo 1)
insert into persona_fisica set cedula='1', fecha_nacimiento='21 de octubre de 1999';
insert into persona_fisica set cedula='2', fecha_nacimiento='5 de septiembre de 2001';
insert into persona_fisica set cedula='3', fecha_nacimiento='25 de noviembre de 2004';
insert into persona_fisica set cedula='4', fecha_nacimiento='17 de marzo de 1978';
insert into persona_fisica set cedula='5', fecha_nacimiento='4 de marzo de 1995';
insert into persona_fisica set cedula='6', fecha_nacimiento='5 de agosto de 2002';
insert into persona_fisica set cedula='7', fecha_nacimiento='3 de junio de 1987';
insert into persona_fisica set cedula='8', fecha_nacimiento='18 de mayo de 2000';
insert into persona_fisica set cedula='9', fecha_nacimiento='23 de octubre de 1967';
insert into persona_fisica set cedula='10', fecha_nacimiento='26 de enero de 1992';
select * from persona_fisica;

-- insertar datos en persona juridica (tipo 2)
insert into persona_juridica set cedula='11', nombre_comercial='Pops';
insert into persona_juridica set cedula='12', nombre_comercial='Starbucks';
insert into persona_juridica set cedula='13', nombre_comercial='Rostipollos';
insert into persona_juridica set cedula='14', nombre_comercial='Spoon';
insert into persona_juridica set cedula='15', nombre_comercial='Canton';
insert into persona_juridica set cedula='16', nombre_comercial='Subway';
insert into persona_juridica set cedula='17', nombre_comercial='KFC';
insert into persona_juridica set cedula='18', nombre_comercial='Burger King';
insert into persona_juridica set cedula='19', nombre_comercial='Moyo';
insert into persona_juridica set cedula='20', nombre_comercial='Satay';
select * from persona_juridica;

-- insertar datos en cuenta por cobrar 
insert into cuenta_por_cobrar set cedula='1', monto_cobrar='1854', fecha_vencimiento_cobro='5 de mayo de 2023';
insert into cuenta_por_cobrar set cedula='2', monto_cobrar='4752', fecha_vencimiento_cobro='22 de junio de 2023';
insert into cuenta_por_cobrar set cedula='3', monto_cobrar='6457', fecha_vencimiento_cobro='7 de julio de 2023';
insert into cuenta_por_cobrar set cedula='4', monto_cobrar='7564', fecha_vencimiento_cobro='2 de noviembre de 2023';
insert into cuenta_por_cobrar set cedula='5', monto_cobrar='4567', fecha_vencimiento_cobro='15 de agosto de 2023';
insert into cuenta_por_cobrar set cedula='6', monto_cobrar='4857', fecha_vencimiento_cobro='11 de diciembre de 2023';
insert into cuenta_por_cobrar set cedula='7', monto_cobrar='6741', fecha_vencimiento_cobro='21 de mayo de 2023';
insert into cuenta_por_cobrar set cedula='8', monto_cobrar='5674', fecha_vencimiento_cobro='1 de julio de 2023';
insert into cuenta_por_cobrar set cedula='9', monto_cobrar='7542', fecha_vencimiento_cobro='23 de noviembre de 2023';
insert into cuenta_por_cobrar set cedula='10', monto_cobrar='2564', fecha_vencimiento_cobro='21 de agosto de 2023';
select * from cuenta_por_cobrar;

-- insertar datos en abono
insert into abono set numero_cuenta='1', fecha_abono='3 de mayo de 2023', monto_abono='1854';
insert into abono set numero_cuenta='2', fecha_abono='19 de junio de 2023', monto_abono='4752';
insert into abono set numero_cuenta='3', fecha_abono='4 de julio de 2023', monto_abono='6457';
insert into abono set numero_cuenta='4', fecha_abono='1 de noviembre de 2023', monto_abono='7564';
insert into abono set numero_cuenta='5', fecha_abono='12 de agosto de 2023', monto_abono='4567';
insert into abono set numero_cuenta='6', fecha_abono='9 de diciembre de 2023', monto_abono='4857';
insert into abono set numero_cuenta='7', fecha_abono='15 de mayo de 2023', monto_abono='6741';
insert into abono set numero_cuenta='8', fecha_abono='15 de abril de 2023', monto_abono='5674';
insert into abono set numero_cuenta='9', fecha_abono='3 de noviembre de 2023', monto_abono='7542';
insert into abono set numero_cuenta='10', fecha_abono='7 de agosto de 2023', monto_abono='2564';
select * from abono;

-- insertar datos en formas de pago
insert into forma_pago set nombre='Efectivo', numero_cuota='1';
insert into forma_pago set nombre='Tarjeta', numero_cuota='2';
insert into forma_pago set nombre='Sinpe movil', numero_cuota='3';
insert into forma_pago set nombre='Transferencia', numero_cuota='4';
insert into forma_pago set nombre='Sinpe movil', numero_cuota='5';
insert into forma_pago set nombre='Tarjeta', numero_cuota='6';
insert into forma_pago set nombre='Tarjeta', numero_cuota='7';
insert into forma_pago set nombre='Transferencia', numero_cuota='8';
insert into forma_pago set nombre='Efectivo', numero_cuota='9';
insert into forma_pago set nombre='Transferencia', numero_cuota='10';
select * from forma_pago;

-- insertar datos en cuenta_persona
insert into cuenta_persona set cedula='1', numero_cuenta='1';
insert into cuenta_persona set cedula='2', numero_cuenta='2';
insert into cuenta_persona set cedula='3', numero_cuenta='3';
insert into cuenta_persona set cedula='4', numero_cuenta='4';
insert into cuenta_persona set cedula='5', numero_cuenta='5';
insert into cuenta_persona set cedula='6', numero_cuenta='6';
insert into cuenta_persona set cedula='7', numero_cuenta='7';
insert into cuenta_persona set cedula='8', numero_cuenta='8';
insert into cuenta_persona set cedula='9', numero_cuenta='9';
insert into cuenta_persona set cedula='10', numero_cuenta='10';
select * from cuenta_persona;

-- insertar datos en abono_pago
insert into abono_pago set numero_cuota='1', codigo_pago='1';
insert into abono_pago set numero_cuota='2', codigo_pago='2';
insert into abono_pago set numero_cuota='3', codigo_pago='3';
insert into abono_pago set numero_cuota='4', codigo_pago='4';
insert into abono_pago set numero_cuota='5', codigo_pago='5';
insert into abono_pago set numero_cuota='6', codigo_pago='6';
insert into abono_pago set numero_cuota='7', codigo_pago='7';
insert into abono_pago set numero_cuota='8', codigo_pago='8';
insert into abono_pago set numero_cuota='9', codigo_pago='9';
insert into abono_pago set numero_cuota='10', codigo_pago='10';
select * from abono_pago;

-- insertar datos en cuenta_abono
insert into cuenta_abono set numero_cuenta='1', numero_cuota='1';
insert into cuenta_abono set numero_cuenta='2', numero_cuota='2';
insert into cuenta_abono set numero_cuenta='3', numero_cuota='3';
insert into cuenta_abono set numero_cuenta='4', numero_cuota='4';
insert into cuenta_abono set numero_cuenta='5', numero_cuota='5';
insert into cuenta_abono set numero_cuenta='6', numero_cuota='6';
insert into cuenta_abono set numero_cuenta='7', numero_cuota='7';
insert into cuenta_abono set numero_cuenta='8', numero_cuota='8';
insert into cuenta_abono set numero_cuenta='9', numero_cuota='9';
insert into cuenta_abono set numero_cuenta='10', numero_cuota='10';
select * from cuenta_abono;