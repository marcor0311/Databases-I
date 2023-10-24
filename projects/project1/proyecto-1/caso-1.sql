-- Proyecto 1
-- Caso 1
-- Marco Rodriguez Vargas. Carnet 2022149445
-- Esquema de Base de datos
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;
# Las instrucciones DDL
create database caso_1;
use caso_1;
create table presidente_compañia(
	cedula_presidente int not null auto_increment primary key,
    nombre varchar(50)
    );
    
create table gerente_compañia(
	cedula_gerente int not null auto_increment primary key,
    nombre varchar(50)
    );
    
 create table control_compañias(
	codigo_compañia int not null auto_increment primary key,
    nombre_compañia varchar(50),
    direccion varchar(50),
    numero_patronal int not null,
	cedula_presidente int not null,
    key cedula_presidente_key(cedula_presidente),
    constraint presidente_cedula foreign key (cedula_presidente) references presidente_compañia(cedula_presidente) on delete restrict on update cascade,
	cedula_gerente int not null,
	key cedula_gerente_key(cedula_gerente),
    constraint gerente_cedula foreign key (cedula_gerente) references gerente_compañia(cedula_gerente) on delete restrict on update cascade
	);   
    
create table control_segmentos(
	codigo_segmento int not null auto_increment primary key,
    descripcion varchar(50),
	codigo_compañia int not null,
	key codigo_compañia_key(codigo_compañia),
    constraint codigo_compañia foreign key (codigo_compañia) references control_compañias(codigo_compañia) on delete restrict on update cascade,
	cedula_gerente int not null,
	key cedula_gerente_key(cedula_gerente),
    constraint gerente_segmento foreign key (cedula_gerente) references control_compañias(cedula_gerente) on delete restrict on update cascade
    );
    
create table control_ordenes(
	num_orden int not null auto_increment primary key,
    fecha_orden date,
    usuario_comp varchar(50),
    usuario_aprob varchar(50),
    monto_total int not null,
	codigo_compañia int not null,
	key codigo_compañia_key(codigo_compañia),
    constraint codigo_compañia_ord foreign key (codigo_compañia) references control_compañias(codigo_compañia) on delete restrict on update cascade
	);
    
create table orden_linea(
	codigo_compañia int not null,
	key codigo_compañia_key(codigo_compañia),
    constraint codigo_compañia_linea foreign key (codigo_compañia) references control_compañias(codigo_compañia) on delete restrict on update cascade,
    
    num_orden int not null,
    key num_orden_key(num_orden),
	constraint num_orden_linea foreign key (num_orden) references control_ordenes(num_orden) on delete restrict on update cascade,
    
	num_linea int not null,
    key num_linea_key(num_linea),
    constraint num_linea_orden foreign key (num_linea) references control_linea(num_linea) on delete restrict on update cascade
	);
    
create table control_linea(
	num_linea int not null auto_increment primary key,
    cant_ordenada int not null,
    precio_art_negociado int not null,
	codigo_articulo int not null,
    key codigo_articulo_key(codigo_articulo),
    constraint codigo_articulo_linea foreign key (codigo_articulo) references control_articulos(codigo_articulo) on delete restrict on update cascade,
    total_linea int not null
	);
    
create table control_articulos(
	codigo_articulo int not null auto_increment primary key,
    descripcion_articulo varchar(50),
    precio_unitario int not null,
    stock int not null,
    fecha_ult_compra date,
    fecha_ult_inventario date,
	codigo_tipo_art int not null,
    key codigo_tipo_art_key(codigo_tipo_art),
    constraint codigo_tipo_articulo foreign key (codigo_tipo_art) references tipo_articulo(codigo_tipo_art) on delete restrict on update cascade
	);
    
create table tipo_articulo(
	codigo_tipo_art int not null auto_increment primary key,
    nombre_tipo_art varchar(50)
	);
    
create table precio_articulo(
	precio_venta int not null,
    
	codigo_articulo int not null,
    key codigo_articulo_key(codigo_articulo),
    constraint codigo_articulo_precio foreign key (codigo_articulo) references control_articulos(codigo_articulo) on delete restrict on update cascade,
    
    codigo_segmento int not null,
	key codigo_segmento_key(codigo_segmento),
    constraint codigo_segmento_precio foreign key (codigo_segmento) references control_segmentos(codigo_segmento) on delete restrict on update cascade
	);
    
create table proveedor_articulo (
	codigo_proveedor int not null,
	key codigo_proveedor_key(codigo_proveedor),
    constraint codigo_proveedor_art foreign key (codigo_proveedor) references control_proveedores(codigo_proveedor) on delete restrict on update cascade,
    
	codigo_articulo int not null,
	key codigo_articulo_key(codigo_articulo),
    constraint codigo_articulo_art foreign key (codigo_articulo) references control_articulos(codigo_articulo) on delete restrict on update cascade
	);
    
create table control_proveedores(
	codigo_proveedor int not null auto_increment primary key,
    nombre_proveedor varchar(50),
    cedula_proveedor varchar(50),
    telefono_proveedor int not null,
    direccion_proveedor varchar(50),
    nombre_contacto varchar(50),
	codigo_tipo_prov int not null,
	key codigo_tipo_prov_key(codigo_tipo_prov),
    constraint codigo_tipo_proveedor foreign key (codigo_tipo_prov) references tipo_proveedor(codigo_tipo_prov) on delete restrict on update cascade
	);
    
create table tipo_proveedor(
	codigo_tipo_prov int not null auto_increment primary key,
    nombre_tipo_prov varchar(50)
    );
# Las instrucciones DML

-- insertar datos en presidente compañia
insert into presidente_compañia set nombre='Pedro Rey';
insert into presidente_compañia set nombre='Merce Liu';
insert into presidente_compañia set nombre='Rafael Mena';
insert into presidente_compañia set nombre='Vanesa Vargas';
insert into presidente_compañia set nombre='Leonardo Costa';
insert into presidente_compañia set nombre='Michelle Navarro';
insert into presidente_compañia set nombre='Kevin Madrigal';
insert into presidente_compañia set nombre='Emily Sanz';
insert into presidente_compañia set nombre='Manuel Llanos';
insert into presidente_compañia set nombre='Daniela Ulises';
select * from presidente_compañia;

-- insertar datos en gerente compañia
insert into gerente_compañia set nombre='Michael Villa';
insert into gerente_compañia set nombre='Eduardo Vargas';
insert into gerente_compañia set nombre='Leo Messi';
insert into gerente_compañia set nombre='Adam Walker';
insert into gerente_compañia set nombre='Julissa Leon';
insert into gerente_compañia set nombre='Jimena Navarro';
insert into gerente_compañia set nombre='Kendal Ramirez';
insert into gerente_compañia set nombre='Bryan Davila';
insert into gerente_compañia set nombre='Isaac Trujillo';
insert into gerente_compañia set nombre='Edgar Salas';
select * from gerente_compañia;

-- insertar datos en control de compañias
insert into control_compañias set cedula_presidente='1', cedula_gerente='1', nombre_compañia='Pops', direccion='la agonia, alajuela', numero_patronal='1111';
insert into control_compañias set cedula_presidente='2', cedula_gerente='2', nombre_compañia='Starbucks', direccion='belen, heredia', numero_patronal='2222';
insert into control_compañias set cedula_presidente='3', cedula_gerente='3', nombre_compañia='Rostipollos', direccion='tilaran, guanacaste', numero_patronal='3333';
insert into control_compañias set cedula_presidente='4', cedula_gerente='4', nombre_compañia='Spoon', direccion='desamparados, alajuela', numero_patronal='4444';
insert into control_compañias set cedula_presidente='5', cedula_gerente='5', nombre_compañia='Canton', direccion='santa barbara, heredia', numero_patronal='5555';
insert into control_compañias set cedula_presidente='6', cedula_gerente='6', nombre_compañia='Subway', direccion='desamparados, san jose', numero_patronal='6666';
insert into control_compañias set cedula_presidente='7', cedula_gerente='7', nombre_compañia='KFC', direccion='santa ana, san jose', numero_patronal='7777';
insert into control_compañias set cedula_presidente='8', cedula_gerente='8', nombre_compañia='Burger King', direccion='los olivares, alajuela', numero_patronal='8888';
insert into control_compañias set cedula_presidente='9', cedula_gerente='9', nombre_compañia='Moyo', direccion='san francisco, heredia', numero_patronal='9999';
insert into control_compañias set cedula_presidente='10', cedula_gerente='10', nombre_compañia='Satay', direccion='curridabat, san jose', numero_patronal='1212';
select * from control_compañias;

-- insertar datos en control segmentos
insert into control_segmentos set descripcion='recurso urbano, semanal', codigo_compañia='1', cedula_gerente='1';
insert into control_segmentos set descripcion='recurso urbano, diario', codigo_compañia='2', cedula_gerente='2';
insert into control_segmentos set descripcion='recurso rural, mensual', codigo_compañia='3', cedula_gerente='3';
insert into control_segmentos set descripcion='recurso urbano, mensual', codigo_compañia='4', cedula_gerente='4';
insert into control_segmentos set descripcion='recurso urbano, diario', codigo_compañia='5', cedula_gerente='5';
insert into control_segmentos set descripcion='recurso urbano, diario', codigo_compañia='6', cedula_gerente='6';
insert into control_segmentos set descripcion='recurso urbano, semanal', codigo_compañia='7', cedula_gerente='7';
insert into control_segmentos set descripcion='recurso urbano, mensual', codigo_compañia='8', cedula_gerente='8';
insert into control_segmentos set descripcion='recurso urbano, mensual', codigo_compañia='9', cedula_gerente='9';
insert into control_segmentos set descripcion='recurso urbano, diario', codigo_compañia='10', cedula_gerente='10';
select * from control_segmentos;

-- insertar datos en control_ordenes
insert into control_ordenes set fecha_orden='2022-01-13',usuario_comp='maxi24', usuario_aprob='adam212', monto_total='1000', codigo_compañia='1';
insert into control_ordenes set fecha_orden='2022-01-17',usuario_comp='jules934', usuario_aprob='thore23', monto_total='2000', codigo_compañia='2';
insert into control_ordenes set fecha_orden='2022-01-18',usuario_comp='huli90', usuario_aprob='liam321', monto_total='3000', codigo_compañia='3';
insert into control_ordenes set fecha_orden='2022-02-12',usuario_comp='axelll23', usuario_aprob='bryan930', monto_total='4000', codigo_compañia='4';
insert into control_ordenes set fecha_orden='2022-02-23',usuario_comp='dias903', usuario_aprob='thore23', monto_total='5000', codigo_compañia='5';
insert into control_ordenes set fecha_orden='2022-03-25',usuario_comp='bati930', usuario_aprob='adam212', monto_total='6000', codigo_compañia='6';
insert into control_ordenes set fecha_orden='2022-05-01',usuario_comp='leo32', usuario_aprob='adam212', monto_total='7000', codigo_compañia='7';
insert into control_ordenes set fecha_orden='2022-06-27',usuario_comp='yewest34', usuario_aprob='liam321', monto_total='8000', codigo_compañia='8';
insert into control_ordenes set fecha_orden='2022-06-29',usuario_comp='huae902', usuario_aprob='thore23', monto_total='9000', codigo_compañia='9';
insert into control_ordenes set fecha_orden='2022-07-15',usuario_comp='kante34', usuario_aprob='adam212', monto_total='10000', codigo_compañia='10';
select * from control_ordenes;

-- insertar datos en orden linea
insert into orden_linea set num_orden='1', codigo_compañia='1', num_linea='1';
insert into orden_linea set num_orden='1', codigo_compañia='1', num_linea='2';
insert into orden_linea set num_orden='1', codigo_compañia='1', num_linea='3';
insert into orden_linea set num_orden='2', codigo_compañia='2', num_linea='4';
insert into orden_linea set num_orden='2', codigo_compañia='2', num_linea='5';
insert into orden_linea set num_orden='3', codigo_compañia='3', num_linea='6';
insert into orden_linea set num_orden='3', codigo_compañia='3', num_linea='7';
insert into orden_linea set num_orden='3', codigo_compañia='3', num_linea='8';
insert into orden_linea set num_orden='3', codigo_compañia='3', num_linea='9';
insert into orden_linea set num_orden='3', codigo_compañia='3', num_linea='10';
select * from orden_linea;

-- insertar datos en control_linea
insert into control_linea set cant_ordenada='3', precio_art_negociado='1200', codigo_articulo='1', total_linea='3600';
insert into control_linea set cant_ordenada='4', precio_art_negociado='2000', codigo_articulo='2', total_linea='8000';
insert into control_linea set cant_ordenada='5', precio_art_negociado='500', codigo_articulo='3', total_linea='2500';
insert into control_linea set cant_ordenada='1', precio_art_negociado='850', codigo_articulo='4', total_linea='850';
insert into control_linea set cant_ordenada='2', precio_art_negociado='1600', codigo_articulo='5', total_linea='3200';
insert into control_linea set cant_ordenada='3', precio_art_negociado='900', codigo_articulo='6', total_linea='2700';
insert into control_linea set cant_ordenada='6', precio_art_negociado='550', codigo_articulo='7', total_linea='3300';
insert into control_linea set cant_ordenada='7', precio_art_negociado='1200', codigo_articulo='8', total_linea='8400';
insert into control_linea set cant_ordenada='8', precio_art_negociado='1500', codigo_articulo='9', total_linea='12000';
insert into control_linea set cant_ordenada='2', precio_art_negociado='1500', codigo_articulo='10', total_linea='3000';
select * from control_linea;

-- insertar datos en control_articulos
insert into control_articulos set descripcion_articulo='leche', precio_unitario='2000', stock='5', fecha_ult_compra='2022-01-07',fecha_ult_inventario='2022-01-09', codigo_tipo_art='1';
insert into control_articulos set descripcion_articulo='pan blanco', precio_unitario='3000', stock='12', fecha_ult_compra='2022-01-15',fecha_ult_inventario='2022-01-19', codigo_tipo_art='2';
insert into control_articulos set descripcion_articulo='pollo frito', precio_unitario='3500', stock='15', fecha_ult_compra='2022-01-17',fecha_ult_inventario='2022-01-18', codigo_tipo_art='3';
insert into control_articulos set descripcion_articulo='servilletas', precio_unitario='3700', stock='10', fecha_ult_compra='2022-03-07',fecha_ult_inventario='2022-03-21', codigo_tipo_art='4';
insert into control_articulos set descripcion_articulo='vasos de plastico', precio_unitario='5000', stock='7', fecha_ult_compra='2022-05-19',fecha_ult_inventario='2022-05-21', codigo_tipo_art='5';
insert into control_articulos set descripcion_articulo='papel para impresora', precio_unitario='3675', stock='6', fecha_ult_compra='2022-06-21',fecha_ult_inventario='2022-06-25', codigo_tipo_art='6';
insert into control_articulos set descripcion_articulo='pantalla OLED', precio_unitario='4000', stock='21', fecha_ult_compra='2022-11-04',fecha_ult_inventario='2022-11-07', codigo_tipo_art='7';
insert into control_articulos set descripcion_articulo='mayonesa', precio_unitario='4125', stock='17', fecha_ult_compra='2022-12-05',fecha_ult_inventario='2022-12-08', codigo_tipo_art='8';
insert into control_articulos set descripcion_articulo='juguete de infante', precio_unitario='4250', stock='15', fecha_ult_compra='2022-12-13',fecha_ult_inventario='2022-12-17', codigo_tipo_art='9';
insert into control_articulos set descripcion_articulo='cuchillo', precio_unitario='4500', stock='5', fecha_ult_compra='2023-01-05',fecha_ult_inventario='2023-01-07', codigo_tipo_art='10';
select * from control_linea;

-- insertar datos en tipo_articulo
insert into tipo_articulo set nombre_tipo_art='lacteo';
insert into tipo_articulo set nombre_tipo_art='grano';
insert into tipo_articulo set nombre_tipo_art='proteínas cárnicas';
insert into tipo_articulo set nombre_tipo_art='articulo de limpieza para restaurante';
insert into tipo_articulo set nombre_tipo_art='utencilio desechable';
insert into tipo_articulo set nombre_tipo_art='articulo de oficina';
insert into tipo_articulo set nombre_tipo_art='electronica';
insert into tipo_articulo set nombre_tipo_art='condimento';
insert into tipo_articulo set nombre_tipo_art='jugueteria';
insert into tipo_articulo set nombre_tipo_art='utencilio de cocina';
select * from tipo_articulo;

-- insertar datos en precio_articulo
insert into precio_articulo set precio_venta='5000', codigo_articulo='1', codigo_segmento='1';
insert into precio_articulo set precio_venta='6000', codigo_articulo='2', codigo_segmento='2';
insert into precio_articulo set precio_venta='5425', codigo_articulo='3', codigo_segmento='3';
insert into precio_articulo set precio_venta='5500', codigo_articulo='4', codigo_segmento='4';
insert into precio_articulo set precio_venta='5750', codigo_articulo='5', codigo_segmento='5';
insert into precio_articulo set precio_venta='5100', codigo_articulo='6', codigo_segmento='6';
insert into precio_articulo set precio_venta='6050', codigo_articulo='7', codigo_segmento='7';
insert into precio_articulo set precio_venta='6250', codigo_articulo='8', codigo_segmento='8';
insert into precio_articulo set precio_venta='6500', codigo_articulo='9', codigo_segmento='9';
insert into precio_articulo set precio_venta='7000', codigo_articulo='10', codigo_segmento='10';
select * from precio_articulo;

-- insertar datos en proveedor_articulo
insert into proveedor_articulo set codigo_proveedor='1', codigo_articulo='1';
insert into proveedor_articulo set codigo_proveedor='2', codigo_articulo='2';
insert into proveedor_articulo set codigo_proveedor='3', codigo_articulo='3';
insert into proveedor_articulo set codigo_proveedor='4', codigo_articulo='4';
insert into proveedor_articulo set codigo_proveedor='5', codigo_articulo='5';
insert into proveedor_articulo set codigo_proveedor='6', codigo_articulo='6';
insert into proveedor_articulo set codigo_proveedor='7', codigo_articulo='7';
insert into proveedor_articulo set codigo_proveedor='8', codigo_articulo='8';
insert into proveedor_articulo set codigo_proveedor='9', codigo_articulo='9';
insert into proveedor_articulo set codigo_proveedor='10', codigo_articulo='10';
select * from proveedor_articulo;

-- insertar datos en control_proveedores
insert into control_proveedores set nombre_proveedor='CONALEP', cedula_proveedor='11', codigo_tipo_prov='1', telefono_proveedor='88784432', direccion_proveedor='alajuela', nombre_contacto='Jules Anderson';
insert into control_proveedores set nombre_proveedor='LEO CORP', cedula_proveedor='22', codigo_tipo_prov='2', telefono_proveedor='88645654', direccion_proveedor='heredia', nombre_contacto='Emilia Hex';
insert into control_proveedores set nombre_proveedor='ATLAS', cedula_proveedor='33', codigo_tipo_prov='3', telefono_proveedor='88534321', direccion_proveedor='san jose', nombre_contacto='Anthony Anderson';
insert into control_proveedores set nombre_proveedor='MIRAVALLE', cedula_proveedor='44', codigo_tipo_prov='4', telefono_proveedor='88645563', direccion_proveedor='heredia', nombre_contacto='Walter Felix';
insert into control_proveedores set nombre_proveedor='AQUILES', cedula_proveedor='55', codigo_tipo_prov='5', telefono_proveedor='87965434', direccion_proveedor='san jose', nombre_contacto='Jose Vargas';
insert into control_proveedores set nombre_proveedor='CHASTAIN', cedula_proveedor='66', codigo_tipo_prov='6', telefono_proveedor='88543535', direccion_proveedor='heredia', nombre_contacto='Tony Felds';
insert into control_proveedores set nombre_proveedor='ATLANTIDA', cedula_proveedor='77', codigo_tipo_prov='7', telefono_proveedor='88564568', direccion_proveedor='guanacaste', nombre_contacto='Justin Henderson';
insert into control_proveedores set nombre_proveedor='MERIDA SHIP', cedula_proveedor='88', codigo_tipo_prov='8', telefono_proveedor='89567345', direccion_proveedor='limon', nombre_contacto='Paul Foder';
insert into control_proveedores set nombre_proveedor='RAPPI', cedula_proveedor='99', codigo_tipo_prov='9', telefono_proveedor='88645634', direccion_proveedor='cartago', nombre_contacto='Bryan Aguilera';
insert into control_proveedores set nombre_proveedor='BRIGHTING', cedula_proveedor='111', codigo_tipo_prov='10', telefono_proveedor='89567313', direccion_proveedor='alajuela', nombre_contacto='Jason Radin';
select * from control_proveedores;

-- insertar datos en tipo_proveedor
insert into tipo_proveedor set nombre_tipo_prov='lacteo';
insert into tipo_proveedor set nombre_tipo_prov='grano';
insert into tipo_proveedor set nombre_tipo_prov='proteínas cárnicas';
insert into tipo_proveedor set nombre_tipo_prov='articulo de limpieza para restaurante';
insert into tipo_proveedor set nombre_tipo_prov='utencilio desechable';
insert into tipo_proveedor set nombre_tipo_prov='articulo de oficina';
insert into tipo_proveedor set nombre_tipo_prov='electronica';
insert into tipo_proveedor set nombre_tipo_prov='condimento';
insert into tipo_proveedor set nombre_tipo_prov='jugueteria';
insert into tipo_proveedor set nombre_tipo_prov='utencilio de cocina';
select * from tipo_proveedor;