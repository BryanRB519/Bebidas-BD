-- buenos dias, tardes o noches estimado cliente le notifico principalmente que cada que entre ejecute el siguiente codigo para hacer funcionar ciertos comandos a futuro
SET SQL_SAFE_UPDATES= 0; -- esto desactivara el modo seguro de SQL para poder ejecutar ciertos delete y update 

create database proyecto_bebidas;

use proyecto_bebidas;

create table Local_Viper(
ID_local int primary key NOT NULL auto_increment,
ID_Gaseosas int(20) NOT NULL,
ID_agua int(20) NOT NULL,
ID_Jugo int(20) NOT NULL,
ID_Alcohol int(20) NOT NULL,
ID_Energizante int(20) NOT NULL,
ID_Ventas int(20) NOT NULL,
ID_Productos int(20) NOT NULL,
ID_Clientes int(20) NOT NULL,
Direccion varchar(20),
Nombre_Local varchar(20)
);

create table Gaseosas(
ID_Gaseosas int primary key NOT NULL auto_increment,
Marcas varchar(20),
Gustos varchar(20),
ID_Distribuidor int(20) NOT NULL,
Precios int(20) NOT NULL,
Fecha_de_vencimientos varchar(20),
Embase_por_litro varchar(20),
stock_lote int(20) NOT NULL,
ID_local int(20),
foreign key (ID_local) references Local_Viper(ID_local) on update cascade on delete cascade
);

create table Bebidas_Alcohólicas(
ID_Alcohol int primary key NOT NULL auto_increment,
Marcas varchar(20),
Gustos varchar(20),
ID_Distribuidor int(20) NOT NULL,
Precios int(20) NOT NULL,
Fecha_de_vencimientos varchar(20),
Embase_por_litro varchar(20),
stock_lote int(20),
ID_local int(20),
foreign key (ID_local) references Local_Viper(ID_local) on update cascade on delete cascade
);

create table Bebidas_Energizante(
ID_Energizante int primary key NOT NULL auto_increment,
Marcas varchar(20),
Gustos varchar(20),
ID_Distribuidor int(20) NOT NULL,
Precios int(20) NOT NULL,
Fecha_de_vencimientos varchar(20),
Embase_por_litro varchar(20),
stock_lote int(20),
ID_local int(20),
foreign key (ID_local) references Local_Viper(ID_local) on update cascade on delete cascade
);

create table Agua_Saborizadas(
ID_Jugos int primary key NOT NULL auto_increment,
Marcas varchar(20),
Gustos varchar(20),
ID_Distribuidor int(20) NOT NULL,
Precios int(20) NOT NULL,
Fecha_de_vencimientos varchar(20),
Embase_por_litro varchar(20),
stock_lote int(20),
ID_local int(20),
foreign key (ID_local) references Local_Viper(ID_local) on update cascade on delete cascade
);

create table Agua(
ID_Agua int primary key NOT NULL auto_increment,
Marcas varchar(20),
ID_Distribuidor int(20) NOT NULL,
Precios int(20),
Fecha_de_vencimientos varchar(20),
Embase_por_litro varchar(20),
stock_lote int(20) NOT NULL,
ID_local int(20),
foreign key (ID_local) references Local_Viper(ID_local) on update cascade on delete cascade
);

create table Ventas(
ID_Ventas int primary key NOT NULL auto_increment,
ID_Clientes int(20) NOT NULL,
Precios int(20) NOT NULL,
Fiado Varchar(20),
Descuentos int(20),
Unidades_Vendidas int(20),
Pedidos varchar(20),
Formas_de_Pago Varchar(20),
ID_local int(20),
foreign key (ID_local) references Local_Viper(ID_local) on update cascade on delete cascade
);

create table Productos(
ID_Productos int primary key NOT NULL auto_increment,
Nombre_de_Productos Varchar(20),
Cantidad_por_Unidad int(20),
ID_local int(20),
foreign key (ID_local) references Local_Viper(ID_local) on update cascade on delete cascade
);

create table Clientes(
ID_cliente int primary key NOT NULL auto_increment,
Nombre Varchar(20),
Apellido Varchar(20),
Direccion int(20),
ID_local int(20),
foreign key (ID_local) references Local_Viper(ID_local) on update cascade on delete cascade
);

create table Detalles_Pedidos(
ID_Productos int primary key NOT NULL auto_increment,
ID_Pedidos int(20),
Precios int(20),
Cantidad int(20),
Descuentos int(20),
ID_local int(20),
foreign key (ID_local) references Local_Viper(ID_local) on update cascade on delete cascade
);

create table Distribuidores(
ID_distribuidor int primary key NOT NULL auto_increment,
marca_distribuidor varchar(20),
ID_local int(20),
foreign key (ID_local) references Local_Viper(ID_local) on update cascade on delete cascade
);

create table localidad_clientes(
ID_localidad_cliente int primary key NOT NULL auto_increment,
nombre_cliente varchar(20),
edad_cliente int(20),
documento varchar(20),
ID_localidad int(20),
ID_local int(20),
foreign key (ID_local) references Local_Viper(ID_local) on update cascade on delete cascade
);

create table localidades(
ID_localidades int primary key NOT NULL auto_increment,
nombre_localidad varchar(20),
ID_localidad int(20),
ID_local int(20),
foreign key (ID_local) references Local_Viper(ID_local) on update cascade on delete cascade
);


-- ahora creamos la tabla auditora que nos servira mas tarde cuando estemos mas avanzados en el proyecto
CREATE TABLE Auditoria_Agua_Saborizadas (
    ID_Auditoria INT PRIMARY KEY AUTO_INCREMENT,
    ID_Jugos INT,
    Marcas VARCHAR(20),
    Gustos VARCHAR(20),
    ID_Distribuidor INT,
    Precios INT,
    Fecha_de_vencimientos VARCHAR(20),
    Embase_por_litro VARCHAR(20),
    stock_lote INT,
    ID_local INT,
    Operacion ENUM('INSERT', 'UPDATE', 'DELETE'),
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Usuario VARCHAR(50) -- Puedes almacenar el nombre del usuario que realiza la operación, si es necesario
);

CREATE TABLE Auditoria_gaseosas (
    ID_Auditoria INT PRIMARY KEY AUTO_INCREMENT,
    ID_Gaseosas INT,
    Marcas VARCHAR(20),
    Gustos VARCHAR(20),
    ID_Distribuidor INT,
    Precios INT,
    Fecha_de_vencimientos VARCHAR(20),
    Embase_por_litro VARCHAR(20),
    stock_lote INT,
    ID_local INT,
    Operacion ENUM('INSERT', 'UPDATE', 'DELETE'),
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Usuario VARCHAR(50) -- Puedes almacenar el nombre del usuario que realiza la operación, si es necesario
);

INSERT INTO local_viper(ID_local, ID_Gaseosas, ID_agua, ID_Jugo, ID_Alcohol, ID_Energizante, ID_Ventas, ID_Productos, ID_Clientes, Direccion, Nombre_Local)
VALUES
    ('1', '4', '1', '2', '5', '3', '1', '1', '1', 'avenida siempre viva', 'Local_viper');

INSERT INTO agua(ID_Agua, Marcas, ID_Distribuidor, Precios, Fecha_de_vencimientos, Embase_por_litro, stock_lote, ID_local)
VALUES
    ('1', 'aguita', '1', '2500', '2026-11-23', '1-L', '12', '1' ),
    ('2', 'villavicencio', '2', '2500', '2026-11-23', '1-L', '15', '1');
    
INSERT INTO agua_saborizadas(ID_Jugos, Marcas, Gustos, ID_Distribuidor, Precios, Fecha_de_vencimientos, Embase_por_litro, stock_lote, ID_local)
VALUES
    ('8', 'baggio', 'pera', '2', '3000', '2026-11-25', '1-L', '40', '1'),
    ('7', 'baggio', 'multifruta', '1', '1500', '2026-11-24', '1-L', '23', '1' );
    
INSERT INTO bebidas_alcoholicas(ID_Alcohol, Marcas, Gustos, ID_Distribuidor, Precios, Fecha_de_vencimientos, Embase_por_litro, stock_lote, ID_local)
VALUES
    ('1', 'brama', 'clasico', '1', '3500', '2026-11-24', '1-L', '233', '1' ),
    ('2', 'fernet', 'clasico', '2', '9000', '2026-11-25', '1-L', '400', '1');
    
INSERT INTO bebidas_energizante(ID_Energizante, Marcas, Gustos, ID_Distribuidor, Precios, Fecha_de_vencimientos, Embase_por_litro, stock_lote, ID_local)
VALUES
    ('1', 'monster', 'durazno', '1', '2000', '2026-11-24', '473-mL', '23', '1' ),
    ('2', 'redbull', 'classic', '2', '1500', '2026-11-25', '473-mL', '40', '1');
    
INSERT INTO gaseosas(ID_Gaseosas, Marcas, Gustos, ID_Distribuidor, Precios, Fecha_de_vencimientos, Embase_por_litro, stock_lote, ID_local)
VALUES
    ('8', 'manaos', 'pomelo_blanco', '1', '1500', '2026-11-24', '1-L', '78', '1' ),
    ('7', 'manaos', 'naranja', '1', '2800', '2026-11-25', '1-L', '400', '1');
    
INSERT INTO agua_saborizada(ID_Jugos, ID_Gaseosas, ID_Alcohol, ID_Agua, ID_Energizante, ID_Ventas, ID_Productos, Direccion, Nombre_local, ID_local)
VALUES
    ('1', '1', '1', '1', '1', '1', '1', 'avenidasiempreviva', 'viper', '1' );   
    
INSERT INTO productos(ID_Productos, Nombre_de_productos, Cantidad_por_unidad,  ID_local)
VALUES
    ('1', 'agua', '12', '1'),
    ('2', 'agua saborizada', '12', '1');
    
INSERT INTO ventas(ID_Ventas, ID_Clientes, Precios, Fiado, Descuentos, Unidades_Vendidas, Pedidos, Formas_de_Pago, ID_local)
VALUES
    ('1', '1', '2000', 'no', '1000', '2', 'no', 'efectivo', '1');
        
INSERT INTO distribuidores(ID_distribuidor, marca_distribuidor, ID_local)
VALUES
    ('1', 'baggio', '1'),
    ('2', 'manaos', '1'),
    ('3', 'ades', '1');
    
INSERT INTO gaseosas(ID_Gaseosas, Marcas, Gustos, ID_Distribuidor, Precios, Fecha_de_vencimientos, Embase_por_litro, stock_lote , ID_local)
VALUES
('9', 'manaos', 'pomelo_rosado', '2', '1200', '2026-11-24', '1L', '40', '1'),
('10', 'manaos', 'pomelo_amarillo', '2', '1200', '2026-11-24', '1L', '40', '1'),
('11', 'manaos', 'lima', '2', '1200', '2026-11-24', '1L', '40', '1'),
('12', 'manaos', 'cola', '2', '1200', '2026-11-24', '1L', '50', '1'),
('13', 'manaos', 'limon', '2', '1200', '2026-11-24', '1L', '50', '1'),
('14', 'manaos', 'granadina', '2', '1200', '2026-11-24', '1L', '50', '1');

SET SQL_SAFE_UPDATES = 0;
update gaseosas set stock_lote = 30 where gustos like 'granadina%';
update gaseosas set stock_lote = 10 where gustos like 'cola%';

delete from gaseosas where Gustos = 'granadina';

INSERT INTO bebidas_energizante
VALUES ('6', 'geitorade', 'uva', '4', '2400', '2028-07-20', '1-L', '39', '1'),
       ('7', 'geitorade', 'manzana', '4', '2400', '2028-07-20', '1-L', '40', '1'),
       ('8', 'geitorade', 'cereza', '4', '2400', '2028-07-20', '1-L', '70', '1'),
       ('9', 'geitorade', 'durazno', '4', '2400', '2028-07-20', '1-L', '35', '1');
       
SELECT ID_jugos, marcas FROM agua_saborizadas WHERE
ID_Distribuidor = (SELECT ID_Distribuidor FROM distribuidores WHERE
ID_Distribuidor = '1');

SELECT nombre_cliente, documento FROM localidad_clientes WHERE
ID_localidad = (SELECT ID_localidad FROM localidades WHERE
ID_localidad = '2');

CREATE OR REPLACE VIEW baggio_info AS
SELECT Marcas, gustos, Precios
FROM agua_saborizadas
WHERE ID_distribuidor = 1;
    
create or replace view manaos_info
as (select Marcas, gustos, Precios from gaseosas where ID_Distribuidor=1);

CREATE OR REPLACE VIEW geitorade_info AS
SELECT Marcas, gustos, Precios
FROM bebidas_energizante
WHERE ID_distribuidor = 4;

CREATE OR REPLACE VIEW fernecito_info AS
SELECT Marcas, gustos, Precios
FROM bebidas_alcohólicas
WHERE ID_distribuidor = 7;

CREATE OR REPLACE VIEW clientes_info AS
SELECT nombre_cliente, edad_cliente, documento
FROM localidad_clientes
WHERE ID_localidad = 1;

SELECT * FROM baggio_info WHERE gustos
LIKE 'A%' OR gustos LIKE 'M%';

SELECT * FROM agua_saborizadas WHERE marcas
LIKE 'A%' OR gustos LIKE 'M%';

drop table distribuidores;

UPDATE bebidas_energizante
SET stock_lote = 20
WHERE ID_Energizante IN (
    SELECT ID_Energizante
    FROM (
        SELECT ID_Energizante
        FROM bebidas_energizante
        WHERE Gustos LIKE 'cereza%'
    ) AS subquery
);

UPDATE bebidas_energizante
SET stock_lote = 25
WHERE ID_Energizante IN (
    SELECT ID_Energizante
    FROM (
        SELECT ID_Energizante
        FROM bebidas_energizante
        WHERE Gustos LIKE 'durazno%'
    ) AS subquery
);

DELETE FROM bebidas_energizante
WHERE ID_Distribuidor = (SELECT ID_Distribuidor FROM distribuidores WHERE ID_Distribuidor = '10');

delete from bebidas_energizante where ID_Energizante = (select ID_distribuidor from distribuidores where ID_distribuidor = '5');
delete from bebidas_energizante where ID_Energizante = (select ID_distribuidor from distribuidores where ID_distribuidor = '1');



DELIMITER //

CREATE FUNCTION obtener_precio_bebida(marca_bebida VARCHAR(100))
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE precio DECIMAL(10, 2);

    SELECT Precios INTO precio
    FROM bebidas_energizante
    WHERE Marcas = marca_bebida
    LIMIT 1;
    RETURN precio;
END //

DELIMITER ;


DELIMITER //

CREATE FUNCTION obtener_precio_y_distribuidor(marca_bebida VARCHAR(100), id_local INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE precio DECIMAL(10, 2);
    DECLARE id_distribuidor INT;
    DECLARE resultado VARCHAR(255);

    SELECT Precios INTO precio
    FROM bebidas_energizante
    WHERE Marcas = marca_bebida
    LIMIT 1;

    SELECT d.ID_distribuidor INTO id_distribuidor
    FROM distribuidores d
    JOIN bebidas_energizante b ON d.ID_distribuidor = b.ID_distribuidor
    WHERE b.Marcas = marca_bebida
    AND d.ID_local = id_local
    LIMIT 1;

    SET resultado = CONCAT('Precio: ', COALESCE(precio, 'No disponible'), ', ID Distribuidor: ', COALESCE(id_distribuidor, 'No disponible'));

    RETURN resultado;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS buscar_filas_bebidas;
DELIMITER $$
CREATE PROCEDURE buscar_filas_bebidas (IN cantidad_filas INT)
BEGIN
    SELECT * FROM bebidas_energizante LIMIT cantidad_filas;
END $$
DELIMITER ;

call proyecto_bebidas.buscar_filas_bebidas(2);

DROP PROCEDURE IF EXISTS insertar_bebida;

DELIMITER $$
CREATE PROCEDURE insertar_bebida(
    IN id_energizante INT,                -- ID de la bebida
    IN marca VARCHAR(100),                -- Nombre de la bebida
    IN precio DECIMAL(10, 2),             -- Precio de la bebida
    IN stock INT,                         -- Stock de la bebida
    IN id_distribuidor INT,               -- ID del distribuidor
    IN gustos VARCHAR(100),               -- Gustos de la bebida
    IN fecha_vencimiento DATE,            -- Fecha de vencimiento
    IN id_local INT                       -- ID del local
)
BEGIN
    DECLARE cantidad INT;
    SELECT COUNT(*) INTO cantidad
    FROM bebidas_energizante
    WHERE Marcas = marca;
    IF cantidad = 0 THEN
        INSERT INTO bebidas_energizante (ID_Energizante, Marcas, Precios, stock_lote, ID_Distribuidor, Gustos, Fecha_de_vencimientos, ID_Local)
        VALUES (id_energizante, marca, precio, stock, id_distribuidor, gustos, fecha_vencimiento, id_local);
    END IF;
    SELECT * FROM bebidas_energizante;
END $$
DELIMITER ;

CALL insertar_bebida(10, 'Prime', 2000.00, 20, 5, 'Limón', '2025-12-12', 1);

DROP PROCEDURE IF EXISTS eliminar_full_bebidas;

DELIMITER $$

CREATE PROCEDURE eliminar_full_bebidas(
    IN ID_Energizante INT                     -- ID de la bebida a eliminar
)
BEGIN
    -- Verificar si la bebida existe
    DECLARE cantidad INT;
    SELECT COUNT(*) INTO cantidad
    FROM bebidas_energizante
    WHERE ID_Energizante = ID_Energizante;
    IF cantidad > 10 THEN
        -- Eliminar la bebida si existe
        DELETE FROM bebidas_energizante
        WHERE ID_Energizante = ID_Energizante;
        
        SELECT 'La bebida ha sido eliminada.' AS Mensaje;
    ELSE
        SELECT 'No se encontró la bebida con ese ID.' AS Mensaje;
    END IF;
    -- Seleccionar todas las bebidas para verificar la eliminación
    SELECT * FROM bebidas_energizante;
END $$
DELIMITER ;

CALL eliminar_full_bebidas(1);

DROP PROCEDURE IF EXISTS actualizar_full_stock;

DELIMITER $$

CREATE PROCEDURE actualizar_full_stock(
    IN ID_Energizante INT,                     -- ID del producto a actualizar
    IN nuevo_stock INT                       -- Nuevo valor de stock
)
BEGIN
    -- Actualizar el stock del producto
    UPDATE bebidas_energizante
    SET stock_lote = nuevo_stock
    WHERE id_energizante = ID_Energizante;

    -- Mensaje de confirmación
    SELECT 'Stock actualizado con éxito.' AS Mensaje;
    
    -- Opcional: Seleccionar el producto actualizado para verificar el cambio
    SELECT * FROM bebidas_energizante WHERE id_energizante = ID_Energizante;
END $$

DELIMITER ;

CALL actualizar_full_stock(1,80);

DROP trigger IF EXISTS trg_gaseosas_Insert;
CREATE TRIGGER trg_gaseosas_Insert
AFTER INSERT ON gaseosas
FOR EACH ROW
INSERT INTO auditoria_gaseosas (ID_Gaseosas, Marcas, Gustos, ID_Distribuidor, Precios, Fecha_de_vencimientos, Embase_por_litro, stock_lote, ID_local, Operacion)
VALUES (NEW.ID_Gaseosas, NEW.Marcas, NEW.Gustos, NEW.ID_Distribuidor, NEW.Precios, NEW.Fecha_de_vencimientos, NEW.Embase_por_litro, NEW.stock_lote, NEW.ID_local, 'INSERT');

DROP trigger IF EXISTS trg_Agua_Saborizadas_Insert;
CREATE TRIGGER trg_Agua_Saborizadas_Insert
AFTER INSERT ON agua_saborizadas
FOR EACH ROW
INSERT INTO auditoria_agua_saborizadas (ID_Jugos, Marcas, Gustos, ID_Distribuidor, Precios, Fecha_de_vencimientos, Embase_por_litro, stock_lote, ID_local, Operacion)
VALUES (NEW.ID_Jugos, NEW.Marcas, NEW.Gustos, NEW.ID_Distribuidor, NEW.Precios, NEW.Fecha_de_vencimientos, NEW.Embase_por_litro, NEW.stock_lote, NEW.ID_local, 'INSERT');

-- el siguiente insert se hace ya con los trigger por eso lo pusimos aca
INSERT INTO Agua_Saborizadas (ID_Jugos, Marcas, Gustos, ID_Distribuidor, Precios, Fecha_de_vencimientos, Embase_por_litro, stock_lote, ID_local)
VALUES ('9', 'MarcaX', 'Limón', 1, 150, '2024-12-31', '1.5L', 100, 1);

INSERT INTO gaseosas (ID_Gaseosas, Marcas, Gustos, ID_Distribuidor, Precios, Fecha_de_vencimientos, Embase_por_litro, stock_lote, ID_local)
VALUES ('14', 'Tai', 'Naranja', 1, 150, '2024-12-31', '1.5L', 100, 1);


CREATE USER 'tiaviper12345'
IDENTIFIED BY 'viper.123';

CREATE USER 'cypher123'
IDENTIFIED BY 'amir.789';

CREATE USER 'jett_revive_me134'
IDENTIFIED BY 'windwarrior160';

CREATE USER 'macaco_do_fuego456'
IDENTIFIED BY 'phoenix200';

FLUSH PRIVILEGES;

DROP USER 'jett_revive_me134';

GRANT ALL ON proyecto_bebidas to cypher123; -- todos los permisos sobre toda la bb.dd.
GRANT ALL ON bebidas_alcohólicas TO 'macaco_do_fuego456'; -- permisos sobre una tabla específica.
GRANT SELECT, UPDATE ON bebidas_energizante to tiaviper12345; -- permisos limitados sobre una tabla.
GRANT SELECT ON proyecto_bebidas TO 'jett_revive_me134'; -- permisos de solo lectura en una tabla
GRANT SELECT ON proyecto_bebidas.* TO 'jett_revive_me134'@'localhost';
FLUSH PRIVILEGES;

