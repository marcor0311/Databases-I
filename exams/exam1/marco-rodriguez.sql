-- Examen 1
-- Caso
-- Marco Rodriguez Vargas. Carnet 2022149445
-- Esquema de Base de datos
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;
# Las instrucciones DDL
drop database if exists caso_examen;
create database caso_examen;
use caso_examen;

create table Proveedor(
	Numero_cedula int not null auto_increment primary key,
    Tipo_cedula varchar(50),
    Nombre_proveedor varchar(50),
    Contacto_proveedor varchar(50)
    );
    
create table Proveedor_telefono(
	Numero_cedula int not null,
    key Numero_cedula_key(Numero_cedula),
    constraint Numero_cedula foreign key (Numero_cedula) references Proveedor(Numero_cedula) on delete restrict on update cascade,
    Telefono int not null,
    Id_prov_tel int not null auto_increment primary key
	);
    
create table Proveedor_direccion(
	Numero_cedula int not null,
    key Numero_cedula_key(Numero_cedula),
    constraint Numero_cedula_prov foreign key (Numero_cedula) references Proveedor(Numero_cedula) on delete restrict on update cascade,
    Direccion_exacta varchar(50),
    Distrito varchar(25),
    Canton varchar(25),
    Provincia varchar(25),
	Id_prov_dir int not null auto_increment primary key
	);
    
create table Departamento_proveedor (
	Numero_cedula int not null,
    key Numero_cedula_key(Numero_cedula),
    constraint Numero_cedula_dept foreign key (Numero_cedula) references Proveedor(Numero_cedula) on delete restrict on update cascade,
	Codigo_departamento int not null,
    key Codigo_departamento_key(Codigo_departamento),
    constraint Codigo_departamento foreign key (Codigo_departamento) references Departamento(Codigo_departamento) on delete restrict on update cascade
	);
    
create table Departamento (
	Codigo_departamento int not null auto_increment primary key,
    Descripcion varchar(50)
	);
    
create table Departamento_empleado (
	Numero_cedula int not null,
    key Numero_cedula_key(Numero_cedula),
    constraint Numero_cedula_dep foreign key (Numero_cedula) references Empleado(Numero_cedula) on delete restrict on update cascade,
	Codigo_departamento int not null,
    key Codigo_departamento_key(Codigo_departamento),
    constraint Codigo_departamento_emp foreign key (Codigo_departamento) references Departamento(Codigo_departamento) on delete restrict on update cascade
	);
    
create table Empleado(
	Numero_cedula int not null auto_increment primary key,
    Nombre varchar(50),
    Estado_civil varchar(50),
    Salario_base int not null
    );
    
create table Empleado_telefono(
	Numero_cedula int not null,
    key Numero_cedula_key(Numero_cedula),
    constraint Numero_cedula_emp foreign key (Numero_cedula) references Empleado(Numero_cedula) on delete restrict on update cascade,
    Telefono int not null,
    Id_emp_tel int not null auto_increment primary key
	);
    
create table Empleado_direccion(
	Numero_cedula int not null,
    key Numero_cedula_key(Numero_cedula),
    constraint Numero_cedula_dir foreign key (Numero_cedula) references Empleado(Numero_cedula) on delete restrict on update cascade,
    Direccion_exacta varchar(50),
    Distrito varchar(25),
    Canton varchar(25),
    Provincia varchar(25),
    Id_emp_dir int not null auto_increment primary key
	);
    
create table Departamento_solicitud(
	Codigo_departamento int not null,
    key Codigo_departamento_key(Codigo_departamento),
    constraint Codigo_departamento_sol foreign key (Codigo_departamento) references Departamento(Codigo_departamento) on delete restrict on update cascade,
	Numero_solicitud int not null,
    key Numero_solicitud_key(Numero_solicitud),
    constraint Numero_solicitud_dep foreign key (Numero_solicitud) references Solicitud_cheque(Numero_solicitud) on delete restrict on update cascade
	);
    
create table Solicitud_cheque(
	Numero_solicitud int not null auto_increment primary key,
    Fecha_solicitud date,
    Codigo_usuario_solicitante varchar(25),
    Nombre_beneficiario varchar(25),
    Monto_solicitud int not null,
    Codigo_usuario_autorizado varchar(25)
	);
    
create table Solicitud_beneficiario(
	Numero_solicitud int not null,
    key Numero_solicitud_key(Numero_solicitud),
    constraint Numero_solicitud foreign key (Numero_solicitud) references Solicitud_cheque(Numero_solicitud) on delete restrict on update cascade,
	Id_tipo_beneficiario int not null,
	key Id_tipo_beneficiario_key(Id_tipo_beneficiario),
    constraint Id_tipo_beneficiario foreign key (Id_tipo_beneficiario) references Tipo_beneficiario(Id_tipo_beneficiario) on delete restrict on update cascade
	);
    
create table Tipo_beneficiario(
	Id_tipo_beneficiario int not null auto_increment primary key,
    Tipo_beneficiario varchar(5)
	);
    
create table Estado_solicitud(
	Numero_solicitud int not null,
    key Numero_solicitud_key(Numero_solicitud),
    constraint Numero_solicitud_est foreign key (Numero_solicitud) references Solicitud_cheque(Numero_solicitud) on delete restrict on update cascade,
	Id_estado int not null,
	key Id_estado_key(Id_estado),
    constraint Id_estado foreign key (Id_estado) references Estado(Id_estado) on delete restrict on update cascade
	);
    
create table Estado(
	Id_estado int not null auto_increment primary key,
    Tipo_estado varchar(5)
	);
    
create table Cheque_aprobado(
	Numero_solicitud int not null,
    key Numero_solicitud_key(Numero_solicitud),
    constraint Numero_solicitud_cheq foreign key (Numero_solicitud) references Solicitud_cheque(Numero_solicitud) on delete restrict on update cascade,
	Numero_cheque int not null,
	key Numero_cheque_key(Numero_cheque),
    constraint Numero_cheque_apr foreign key (Numero_cheque) references Cheque(Numero_cheque) on delete restrict on update cascade
	);

create table Cheque(
	Numero_cheque int not null auto_increment primary key,
    Fecha_emision date,
    Usuario_emisor varchar(25),
    Monto_cheque int not null
	);
    
create table Cheque_tipo_moneda(
	Codigo_moneda int not null,
    key Codigo_moneda_key(Codigo_moneda),
    constraint Codigo_moneda foreign key (Codigo_moneda) references Tipo_moneda(Codigo_moneda) on delete restrict on update cascade,
	Numero_cheque int not null,
	key Numero_cheque_key(Numero_cheque),
    constraint Numero_cheque foreign key (Numero_cheque) references Cheque(Numero_cheque) on delete restrict on update cascade
	);
    
create table Tipo_moneda(
	Codigo_moneda int not null auto_increment primary key,
    Descripcion_moneda varchar(50),
    Fecha_tipo_cambio date,
    Monto_tipo_cambio int
	);
    
create table Cheque_cuenta(
	Numero_cuenta int not null,
    key Numero_cuenta_key(Numero_cuenta),
    constraint Numero_cuenta foreign key (Numero_cuenta) references Cuenta_contable(Numero_cuenta) on delete restrict on update cascade,
	Numero_cheque int not null,
	key Numero_cheque_key(Numero_cheque),
    constraint Numero_cheque_cuen foreign key (Numero_cheque) references Cheque(Numero_cheque) on delete restrict on update cascade	
	);
    
create table Cuenta_contable(
	Numero_cuenta int not null auto_increment primary key,
    Descripcion varchar(50),
    Tipo_cuenta int not null,
    Tipo_moneda varchar (50)
	);
    
create table Cuenta_estado(
	Numero_cuenta int not null,
    key Numero_cuenta_key(Numero_cuenta),
    constraint Numero_cuenta_est foreign key (Numero_cuenta) references Cuenta_contable(Numero_cuenta) on delete restrict on update cascade,
	Id_estado_cuenta int not null,
	key Id_estado_cuenta_key(Id_estado_cuenta),
    constraint Id_estado_cuenta foreign key (Id_estado_cuenta) references Estado_cuenta(Id_estado_cuenta) on delete restrict on update cascade	
	);
    
create table Estado_cuenta(
	Id_estado_cuenta int not null auto_increment primary key,
    Tipo_estado varchar(50)
	);
    
create table Cheque_beneficiario(
	Numero_cheque int not null,
	key Numero_cheque_key(Numero_cheque),
    constraint Numero_cheque_ben foreign key (Numero_cheque) references Cheque(Numero_cheque) on delete restrict on update cascade,	
	Id_tipo_beneficiario int not null,
	key Id_tipo_beneficiario_key(Id_tipo_beneficiario),
    constraint Id_tipo_beneficiario_cheque foreign key (Id_tipo_beneficiario) references Tipo_beneficiario(Id_tipo_beneficiario) on delete restrict on update cascade
	);
    
create table Estado_cheque(
	Numero_cheque int not null,
	key Numero_cheque_key(Numero_cheque),
    constraint Numero_cheque_est foreign key (Numero_cheque) references Cheque(Numero_cheque) on delete restrict on update cascade,	
	Id_estado int not null,
	key Id_estado_key(Id_estado),
    constraint Id_estado_cheq foreign key (Id_estado) references Estado(Id_estado) on delete restrict on update cascade
	);
    
# Las instrucciones DML

-- insertar datos en proveedor
insert into proveedor set tipo_cedula='fisica', nombre_proveedor='Banco Santander', contacto_proveedor='Juan Pérez';
insert into proveedor set tipo_cedula='juridica', nombre_proveedor='BBVA', contacto_proveedor='Luis García';
insert into proveedor set tipo_cedula='fisica', nombre_proveedor='CaixaBank', contacto_proveedor='María Hernández';
insert into proveedor set tipo_cedula='juridica', nombre_proveedor='Banco Sabadell', contacto_proveedor='José Ramírez';
insert into proveedor set tipo_cedula='fisica', nombre_proveedor='Bankinter', contacto_proveedor='Ana González';
insert into proveedor set tipo_cedula='juridica', nombre_proveedor='Banco Popular', contacto_proveedor='Miguel Sánchez';
insert into proveedor set tipo_cedula='fisica', nombre_proveedor='Banco Bilbao Vizcaya Argentaria', contacto_proveedor='Gabriela Torres';
insert into proveedor set tipo_cedula='juridica', nombre_proveedor='Banco de Crédito Social Cooperativo', contacto_proveedor='Diego Flores';
insert into proveedor set tipo_cedula='fisica', nombre_proveedor='Banco Cooperativo Español', contacto_proveedor='Verónica Ortiz';
insert into proveedor set tipo_cedula='juridica', nombre_proveedor='Banco Mare Nostrum', contacto_proveedor='Javier Núñez';
select * from proveedor;

-- insertar datos en proveedor telefono
insert into proveedor_telefono set numero_cedula=1, telefono='97655678';
insert into proveedor_telefono set numero_cedula=2, telefono='57856789';
insert into proveedor_telefono set numero_cedula=3, telefono='34667890';
insert into proveedor_telefono set numero_cedula=4, telefono='97678901';
insert into proveedor_telefono set numero_cedula=5, telefono='77801287';
insert into proveedor_telefono set numero_cedula=6, telefono='86780123';
insert into proveedor_telefono set numero_cedula=7, telefono='78901234';
insert into proveedor_telefono set numero_cedula=8, telefono='89012345';
insert into proveedor_telefono set numero_cedula=9, telefono='90123456';
insert into proveedor_telefono set numero_cedula=10, telefono='81234567';

select * from proveedor_telefono;

-- insertar datos en proveedor direccion
insert into proveedor_direccion set numero_cedula=1, direccion_exacta='Avenida Los Angeles', distrito='San José', canton='San José', provincia='Provincia de San José';
insert into proveedor_direccion set numero_cedula=2, direccion_exacta='Edificio La Histica', distrito='Escazú', canton='Escazú', provincia='Provincia de San José';
insert into proveedor_direccion set numero_cedula=3, direccion_exacta='Calle Los Humida', distrito='Desamparados', canton='Desamparados', provincia='Provincia de San José';
insert into proveedor_direccion set numero_cedula=4, direccion_exacta='Residencial La Roca', distrito='Puriscal', canton='Puriscal', provincia='Provincia de San José';
insert into proveedor_direccion set numero_cedula=5, direccion_exacta='Plaza Los Laurales', distrito='Tarrazú', canton='Tarrazú', provincia='Provincia de San José';
insert into proveedor_direccion set numero_cedula=6, direccion_exacta='Apartamentos La Madrid', distrito='Aserrí', canton='Aserrí', provincia='Provincia de San José';
insert into proveedor_direccion set numero_cedula=7, direccion_exacta='Condominio Los Paisajes', distrito='Mora', canton='Mora', provincia='Provincia de San José';
insert into proveedor_direccion set numero_cedula=8, direccion_exacta='Urbanización Los Alvinos', distrito='Goicoechea', canton='Goicoechea', provincia='Provincia de San José';
insert into proveedor_direccion set numero_cedula=9, direccion_exacta='Torre Las Américas', distrito='Santa Ana', canton='Santa Ana', provincia='Provincia de San José';
insert into proveedor_direccion set numero_cedula=10, direccion_exacta='Complejo Residencial La Nube', distrito='Alajuelita', canton='Alajuelita', provincia='Provincia de San José';
select * from proveedor_direccion;

-- insertar datos en Departamento proveedor
insert into departamento_proveedor set numero_cedula='1', codigo_departamento='1';
insert into departamento_proveedor set numero_cedula='2', codigo_departamento='2';
insert into departamento_proveedor set numero_cedula='3', codigo_departamento='3';
insert into departamento_proveedor set numero_cedula='4', codigo_departamento='4';
insert into departamento_proveedor set numero_cedula='5', codigo_departamento='5';
insert into departamento_proveedor set numero_cedula='6', codigo_departamento='6';
insert into departamento_proveedor set numero_cedula='7', codigo_departamento='7';
insert into departamento_proveedor set numero_cedula='8', codigo_departamento='8';
insert into departamento_proveedor set numero_cedula='9', codigo_departamento='9';
insert into departamento_proveedor set numero_cedula='10', codigo_departamento='10';
select * from departamento_proveedor;

-- insertar datos en Departamento 
insert into departamento set descripcion='contabilidad';
insert into departamento set descripcion='análisis de datos';
insert into departamento set descripcion='desarrollo de software';
insert into departamento set descripcion='seguridad informática';
insert into departamento set descripcion='redes y comunicaciones';
insert into departamento set descripcion='investigación y desarrollo';
insert into departamento set descripcion='gestión de proyectos';
insert into departamento set descripcion='contabilidad y finanzas';
insert into departamento set descripcion='tesorería';
insert into departamento set descripcion='planificación y análisis financiero';
select * from departamento;

-- insertar datos en Departamento empleado
insert into departamento_empleado set numero_cedula='1', codigo_departamento='1';
insert into departamento_empleado set numero_cedula='2', codigo_departamento='2';
insert into departamento_empleado set numero_cedula='3', codigo_departamento='3';
insert into departamento_empleado set numero_cedula='4', codigo_departamento='4';
insert into departamento_empleado set numero_cedula='5', codigo_departamento='5';
insert into departamento_empleado set numero_cedula='6', codigo_departamento='6';
insert into departamento_empleado set numero_cedula='7', codigo_departamento='7';
insert into departamento_empleado set numero_cedula='8', codigo_departamento='8';
insert into departamento_empleado set numero_cedula='9', codigo_departamento='9';
insert into departamento_empleado set numero_cedula='10', codigo_departamento='10';
select * from departamento_empleado;

-- insertar datos en Empleado
insert into empleado set nombre='thomas', estado_civil='soltero', salario_base='218942';
insert into empleado set nombre='david', estado_civil='soltero', salario_base='45243';
insert into empleado set nombre='paul', estado_civil='casado', salario_base='168797';
insert into empleado set nombre='james', estado_civil='soltero', salario_base='157831';
insert into empleado set nombre='lucas', estado_civil='casado', salario_base='184157';
insert into empleado set nombre='adam', estado_civil='soltero', salario_base='76936';
insert into empleado set nombre='matteo', estado_civil='soltero', salario_base='32406';
insert into empleado set nombre='miguel', estado_civil='casado', salario_base='184922';
insert into empleado set nombre='samuel', estado_civil='soltero', salario_base='203678';
insert into empleado set nombre='alexander', estado_civil='casado', salario_base='138994';
select * from empleado;

-- insertar datos en Empleado telefono 
insert into empleado_telefono set numero_cedula='1', telefono='89123456';
insert into empleado_telefono set numero_cedula='2', telefono='81123456';
insert into empleado_telefono set numero_cedula='3', telefono='83123456';
insert into empleado_telefono set numero_cedula='4', telefono='84123456';
insert into empleado_telefono set numero_cedula='5', telefono='85123456';
insert into empleado_telefono set numero_cedula='6', telefono='86123456';
insert into empleado_telefono set numero_cedula='7', telefono='87123456';
insert into empleado_telefono set numero_cedula='8', telefono='88123456';
insert into empleado_telefono set numero_cedula='9', telefono='89123457';
insert into empleado_telefono set numero_cedula='10', telefono='89123458';
select * from empleado_telefono;

-- insertar datos en Empleado direccion 
insert into empleado_direccion set numero_cedula='1', direccion_exacta='50 metros este de la iglesia', distrito='Heredia', canton='Heredia', provincia='Heredia';
insert into empleado_direccion set numero_cedula='2', direccion_exacta='25 metros norte del parque', distrito='Barva', canton='Barva', provincia='Heredia';
insert into empleado_direccion set numero_cedula='3', direccion_exacta='50 metros oeste de la escuela', distrito='San Miguel', canton='Santo Domingo', provincia='Heredia';
insert into empleado_direccion set numero_cedula='4', direccion_exacta='150 metros sur del polideportivo', distrito='San Pedro', canton='Santa Bárbara', provincia='Heredia';
insert into empleado_direccion set numero_cedula='5', direccion_exacta='200 metros este de la municipalidad', distrito='San Rafael', canton='San Rafael', provincia='Heredia';
insert into empleado_direccion set numero_cedula='6', direccion_exacta='100 metros oeste del banco', distrito='San Isidro', canton='Belén', provincia='Heredia';
insert into empleado_direccion set numero_cedula='7', direccion_exacta='50 metros norte del supermercado', distrito='La Ribera', canton='Flores', provincia='Heredia';
insert into empleado_direccion set numero_cedula='8', direccion_exacta='200 metros este de la escuela', distrito='San Pablo', canton='San Pablo', provincia='Heredia';
insert into empleado_direccion set numero_cedula='9', direccion_exacta='300 metros sur del parque', distrito='Puerto Viejo', canton='Sarapiquí', provincia='Heredia';
insert into empleado_direccion set numero_cedula='10', direccion_exacta='100 metros oeste del restaurante', distrito='La Virgen', canton='Sarapiquí', provincia='Heredia';
select * from empleado_direccion;

-- insertar datos en Empleado direccion 
insert into departamento_solicitud set codigo_departamento='1', numero_solicitud='1';
insert into departamento_solicitud set codigo_departamento='2', numero_solicitud='2';
insert into departamento_solicitud set codigo_departamento='3', numero_solicitud='3';
insert into departamento_solicitud set codigo_departamento='4', numero_solicitud='4';
insert into departamento_solicitud set codigo_departamento='5', numero_solicitud='5';
insert into departamento_solicitud set codigo_departamento='6', numero_solicitud='6';
insert into departamento_solicitud set codigo_departamento='7', numero_solicitud='7';
insert into departamento_solicitud set codigo_departamento='8', numero_solicitud='8';
insert into departamento_solicitud set codigo_departamento='9', numero_solicitud='9';
insert into departamento_solicitud set codigo_departamento='10', numero_solicitud='10';
select * from departamento_solicitud;

-- insertar datos en Solicitud_cheque
insert into solicitud_cheque set fecha_solicitud='2022-08-25', Codigo_usuario_solicitante ='abc123', nombre_beneficiario='Juan Perez', monto_solicitud='15000', codigo_usuario_autorizado='def456';
insert into solicitud_cheque set fecha_solicitud='2022-07-11', Codigo_usuario_solicitante ='xyz789', nombre_beneficiario='Maria Rodriguez', monto_solicitud='8000', codigo_usuario_autorizado='klm234';
insert into solicitud_cheque set fecha_solicitud='2022-06-02', Codigo_usuario_solicitante ='nop567', nombre_beneficiario='Pedro Gonzalez', monto_solicitud='25000', codigo_usuario_autorizado='qrs890';
insert into solicitud_cheque set fecha_solicitud='2022-04-28', Codigo_usuario_solicitante ='tuv901', nombre_beneficiario='Luisa Hernandez', monto_solicitud='12000', codigo_usuario_autorizado='wxy345';
insert into solicitud_cheque set fecha_solicitud='2022-03-17', Codigo_usuario_solicitante ='bcd234', nombre_beneficiario='Ana Chavez', monto_solicitud='18000', codigo_usuario_autorizado='efg678';
insert into solicitud_cheque set fecha_solicitud='2022-09-05', Codigo_usuario_solicitante ='hij456', nombre_beneficiario='Jose Ramirez', monto_solicitud='10000', codigo_usuario_autorizado='klm789';
insert into solicitud_cheque set fecha_solicitud='2022-11-23', Codigo_usuario_solicitante ='nop789', nombre_beneficiario='Laura Gutierrez', monto_solicitud='30000', codigo_usuario_autorizado='qrs123';
insert into solicitud_cheque set fecha_solicitud='2022-01-19', Codigo_usuario_solicitante ='tuv012', nombre_beneficiario='Carlos Fernandez', monto_solicitud='5000', codigo_usuario_autorizado='wxy345';
insert into solicitud_cheque set fecha_solicitud='2022-10-07', Codigo_usuario_solicitante ='bcd345', nombre_beneficiario='Sofia Mora', monto_solicitud='20000', codigo_usuario_autorizado='efg678';
insert into solicitud_cheque set fecha_solicitud='2022-12-31', Codigo_usuario_solicitante ='hij678', nombre_beneficiario='Mario Rodriguez', monto_solicitud='15000', codigo_usuario_autorizado='klm901';
select * from solicitud_cheque;

-- insertar datos en Solicitud_beneficiario 
insert into Solicitud_beneficiario set numero_solicitud='1', Id_tipo_beneficiario='1';
insert into Solicitud_beneficiario set numero_solicitud='2', Id_tipo_beneficiario='2';
insert into Solicitud_beneficiario set numero_solicitud='3', id_tipo_beneficiario='1';
insert into Solicitud_beneficiario set numero_solicitud='4', id_tipo_beneficiario='2';
insert into Solicitud_beneficiario set numero_solicitud='5', id_tipo_beneficiario='1';
insert into Solicitud_beneficiario set numero_solicitud='6', id_tipo_beneficiario='2';
insert into Solicitud_beneficiario set numero_solicitud='7', id_tipo_beneficiario='1';
insert into Solicitud_beneficiario set numero_solicitud='8', id_tipo_beneficiario='2';
insert into Solicitud_beneficiario set numero_solicitud='9', id_tipo_beneficiario='1';
insert into Solicitud_beneficiario set numero_solicitud='10', id_tipo_beneficiario='2';
select * from Solicitud_beneficiario;

-- insertar datos en Tipo_beneficiario 
insert into Tipo_beneficiario set tipo_beneficiario='E';
insert into Tipo_beneficiario set tipo_beneficiario='P';
select * from Tipo_beneficiario;

-- insertar datos en Estado_solicitud
insert into estado_solicitud set numero_solicitud='1', id_estado='2';
insert into estado_solicitud set numero_solicitud='2', id_estado='1';
insert into estado_solicitud set numero_solicitud='3', id_estado='3';
insert into estado_solicitud set numero_solicitud='4', id_estado='2';
insert into estado_solicitud set numero_solicitud='5', id_estado='1';
insert into estado_solicitud set numero_solicitud='6', id_estado='3';
insert into estado_solicitud set numero_solicitud='7', id_estado='2';
insert into estado_solicitud set numero_solicitud='8', id_estado='1';
insert into estado_solicitud set numero_solicitud='9', id_estado='3';
insert into estado_solicitud set numero_solicitud='10', id_estado='2';
select * from estado_solicitud;

-- insertar datos en Estado
insert into Estado set tipo_estado='P';
insert into Estado set tipo_estado='X';
insert into Estado set tipo_estado='A';
insert into Estado set tipo_estado='I';
select * from Estado;

-- insertar datos en Cheque_aprobado
insert into cheque_aprobado set numero_solicitud='1', numero_cheque='1'; 
insert into cheque_aprobado set numero_solicitud='2', numero_cheque='2'; 
insert into cheque_aprobado set numero_solicitud='3', numero_cheque='3'; 
insert into cheque_aprobado set numero_solicitud='4', numero_cheque='4'; 
insert into cheque_aprobado set numero_solicitud='5', numero_cheque='5'; 
insert into cheque_aprobado set numero_solicitud='6', numero_cheque='6'; 
insert into cheque_aprobado set numero_solicitud='7', numero_cheque='7'; 
insert into cheque_aprobado set numero_solicitud='8', numero_cheque='8'; 
insert into cheque_aprobado set numero_solicitud='9', numero_cheque='9'; 
insert into cheque_aprobado set numero_solicitud='10', numero_cheque='10';
select * from cheque_aprobado;

-- insertar datos en Cheque
insert into Cheque set fecha_emision='2023-05-10', usuario_emisor='abc123', monto_cheque='24367';
insert into Cheque set fecha_emision='2023-06-12', usuario_emisor='def456', monto_cheque='91842';
insert into Cheque set fecha_emision='2023-08-05', usuario_emisor='ghi789', monto_cheque='72593';
insert into Cheque set fecha_emision='2023-07-23', usuario_emisor='jkl012', monto_cheque='32678';
insert into Cheque set fecha_emision='2023-09-01', usuario_emisor='mno345', monto_cheque='58193';
insert into Cheque set fecha_emision='2023-10-18', usuario_emisor='pqr678', monto_cheque='49783';
insert into Cheque set fecha_emision='2023-11-05', usuario_emisor='stu901', monto_cheque='78621';
insert into Cheque set fecha_emision='2023-12-24', usuario_emisor='vwx234', monto_cheque='12345';
insert into Cheque set fecha_emision='2023-11-30', usuario_emisor='yz0123', monto_cheque='92673';
insert into Cheque set fecha_emision='2023-10-10', usuario_emisor='abc456', monto_cheque='40859';
select * from Cheque;

-- insertar datos en Cheque_tipo_moneda
insert into cheque_tipo_moneda set codigo_moneda='1', numero_cheque='1';
insert into cheque_tipo_moneda set codigo_moneda='2', numero_cheque='2';
insert into cheque_tipo_moneda set codigo_moneda='3', numero_cheque='3';
insert into cheque_tipo_moneda set codigo_moneda='4', numero_cheque='4';
insert into cheque_tipo_moneda set codigo_moneda='5', numero_cheque='5';
insert into cheque_tipo_moneda set codigo_moneda='6', numero_cheque='6';
insert into cheque_tipo_moneda set codigo_moneda='7', numero_cheque='7';
insert into cheque_tipo_moneda set codigo_moneda='8', numero_cheque='8';
insert into cheque_tipo_moneda set codigo_moneda='9', numero_cheque='9';
insert into cheque_tipo_moneda set codigo_moneda='10', numero_cheque='10';
select * from cheque_tipo_moneda;

-- insertar datos en Tipo_moneda
insert into tipo_moneda set descripcion_moneda='us dollar', fecha_tipo_cambio='2023-06-01', monto_tipo_cambio='845';
insert into tipo_moneda set descripcion_moneda='euro', fecha_tipo_cambio='2023-06-02', monto_tipo_cambio='704';
insert into tipo_moneda set descripcion_moneda='pound sterling', fecha_tipo_cambio='2023-06-03', monto_tipo_cambio='973';
insert into tipo_moneda set descripcion_moneda='japanese yen', fecha_tipo_cambio='2023-06-04', monto_tipo_cambio='591';
insert into tipo_moneda set descripcion_moneda='swiss franc', fecha_tipo_cambio='2023-06-05', monto_tipo_cambio='222';
insert into tipo_moneda set descripcion_moneda='australian dollar', fecha_tipo_cambio='2023-06-06', monto_tipo_cambio='366';
insert into tipo_moneda set descripcion_moneda='canadian dollar', fecha_tipo_cambio='2023-06-07', monto_tipo_cambio='522';
insert into tipo_moneda set descripcion_moneda='hong kong dollar', fecha_tipo_cambio='2023-06-08', monto_tipo_cambio='989';
insert into tipo_moneda set descripcion_moneda='new zealand dollar', fecha_tipo_cambio='2023-06-09', monto_tipo_cambio='106';
insert into tipo_moneda set descripcion_moneda='singapore dollar', fecha_tipo_cambio='2023-06-10', monto_tipo_cambio='461';
select * from tipo_moneda;

-- insertar datos en Cheque_cuenta
insert into cheque_cuenta set numero_cuenta='1',numero_cheque='1';
insert into cheque_cuenta set numero_cuenta='2',numero_cheque='2';
insert into cheque_cuenta set numero_cuenta='3',numero_cheque='3';
insert into cheque_cuenta set numero_cuenta='4',numero_cheque='4';
insert into cheque_cuenta set numero_cuenta='5',numero_cheque='5';
insert into cheque_cuenta set numero_cuenta='6',numero_cheque='6';
insert into cheque_cuenta set numero_cuenta='7',numero_cheque='7';
insert into cheque_cuenta set numero_cuenta='8',numero_cheque='8';
insert into cheque_cuenta set numero_cuenta='9',numero_cheque='9';
insert into cheque_cuenta set numero_cuenta='10',numero_cheque='10';
select * from cheque_cuenta;

-- insertar datos en Cuenta_contable
insert into cuenta_contable set descripcion='cuenta de prueba', tipo_cuenta='01', tipo_moneda='3';
insert into cuenta_contable set descripcion='cuenta de ejemplo', tipo_cuenta='02', tipo_moneda='6';
insert into cuenta_contable set descripcion='cuenta de gastos', tipo_cuenta='05', tipo_moneda='1';
insert into cuenta_contable set descripcion='cuenta de ingresos', tipo_cuenta='04', tipo_moneda='8';
insert into cuenta_contable set descripcion='cuenta de capital', tipo_cuenta='03', tipo_moneda='4';
insert into cuenta_contable set descripcion='cuenta de orden', tipo_cuenta='06', tipo_moneda='2';
insert into cuenta_contable set descripcion='cuenta bancaria', tipo_cuenta='01', tipo_moneda='9';
insert into cuenta_contable set descripcion='cuenta de proveedores', tipo_cuenta='02', tipo_moneda='7';
insert into cuenta_contable set descripcion='cuenta de inventario', tipo_cuenta='01', tipo_moneda='5';
insert into cuenta_contable set descripcion='cuenta de ventas', tipo_cuenta='04', tipo_moneda='10';
select * from cuenta_contable;

-- insertar datos en Cuenta_estado
insert into cuenta_estado set numero_cuenta='1', id_estado_cuenta='1';
insert into cuenta_estado set numero_cuenta='2', id_estado_cuenta='2';
insert into cuenta_estado set numero_cuenta='3', id_estado_cuenta='1';
insert into cuenta_estado set numero_cuenta='4', id_estado_cuenta='2';
insert into cuenta_estado set numero_cuenta='5', id_estado_cuenta='1';
insert into cuenta_estado set numero_cuenta='6', id_estado_cuenta='2';
insert into cuenta_estado set numero_cuenta='7', id_estado_cuenta='1';
insert into cuenta_estado set numero_cuenta='8', id_estado_cuenta='2';
insert into cuenta_estado set numero_cuenta='9', id_estado_cuenta='1';
insert into cuenta_estado set numero_cuenta='10', id_estado_cuenta='2';
select * from cuenta_estado;

-- insertar datos en Estado_cuenta
insert into Estado_cuenta set tipo_estado='A';
insert into Estado_cuenta set tipo_estado='I';
select * from Estado_cuenta;

-- insertar datos en Cheque_beneficiario
insert into cheque_beneficiario set numero_cheque='1', id_tipo_beneficiario='1';
insert into cheque_beneficiario set numero_cheque='2', id_tipo_beneficiario='2';
insert into cheque_beneficiario set numero_cheque='3', id_tipo_beneficiario='1';
insert into cheque_beneficiario set numero_cheque='4', id_tipo_beneficiario='2';
insert into cheque_beneficiario set numero_cheque='5', id_tipo_beneficiario='1';
insert into cheque_beneficiario set numero_cheque='6', id_tipo_beneficiario='2';
insert into cheque_beneficiario set numero_cheque='7', id_tipo_beneficiario='1';
insert into cheque_beneficiario set numero_cheque='8', id_tipo_beneficiario='2';
insert into cheque_beneficiario set numero_cheque='9', id_tipo_beneficiario='1';
insert into cheque_beneficiario set numero_cheque='10', id_tipo_beneficiario='2';
select * from cheque_beneficiario;

-- insertar datos en Estado_cheque
insert into estado_cheque set numero_cheque='1', id_estado='2';
insert into estado_cheque set numero_cheque='2', id_estado='3';
insert into estado_cheque set numero_cheque='3', id_estado='2';
insert into estado_cheque set numero_cheque='4', id_estado='2';
insert into estado_cheque set numero_cheque='5', id_estado='1';
insert into estado_cheque set numero_cheque='6', id_estado='1';
insert into estado_cheque set numero_cheque='7', id_estado='2';
insert into estado_cheque set numero_cheque='8', id_estado='3';
insert into estado_cheque set numero_cheque='9', id_estado='1';
insert into estado_cheque set numero_cheque='10', id_estado='2';
select * from estado_cheque;