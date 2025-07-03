-- Lenguaje SQL-LDD (create, alter, drop)

-- Crear la base de datos empresa
CREATE DATABASE empresa;
Go
-- Utilizar la base de datos creada
USE empresa;
Go

-- crear la tabla empleados
CREATE TABLE Empleados(
  IdEmpleado int not null, 
  Nombre varchar(100) not null, 
  Puesto varchar(50) not null, 
  FechaIngreso date, 
  Salario money not null,
  CONSTRAINT pk_empleados
  PRIMARY KEY (IdEmpleado)
);
GO

CREATE TABLE Productos(
 ProductoId int primary key, 
 NombreProducto nvarchar(50) not null, 
 Existencia int not null,
 PrecioUnitario money not null
);
GO

CREATE TABLE Productos2(
  ProductoId int not null identity(1,1),
  NombreProducto nvarchar(50) not null, 
  Existencia int not null, 
  Precio money not null, 
  CONSTRAINT pk_productos2
  PRIMARY KEY(ProductoId),
  CONSTRAINT unique_nombreproducto
  UNIQUE(NombreProducto),
  CONSTRAINT chk_existencia
  CHECK (Existencia>0 AND Existencia<=1000), 
  CONSTRAINT chk_precio
  CHECK(Precio>0.0)
);
GO

-- Insertar un producto en productos sin identity
INSERT INTO Productos (ProductoId, NombreProducto, 
Existencia,PrecioUnitario)
VALUES(1,'Burritos de Frijoles', 65, 20.99);
GO

INSERT INTO Productos (ProductoId, NombreProducto, 
Existencia,PrecioUnitario)
VALUES(2,'Burritos de Frijoles', 65, 20.99);
GO

SELECT * FROM Productos;
GO

-- Insertar en la tabla productos2 con identity
INSERT INTO Productos2 (NombreProducto, 
Existencia,Precio)
VALUES('Burritos Chorizo Verde', 100, 21.0);
GO

INSERT INTO Productos2 (NombreProducto, 
Existencia,Precio)
VALUES('Burritos Chorizo Grueso', 450, 459.12);
GO

INSERT INTO Productos2 (NombreProducto, 
Existencia,Precio)
VALUES('Burritos Chorizo Grueso2', 450, 459.12);
GO

INSERT INTO Productos2 (NombreProducto, 
Existencia,Precio)
VALUES('Burritos frijol', 999, 60);
GO

SELECT * FROM Productos2;
Go

-- Crear dos tablas con razon de cardinalidad de 1:N con participaci�n total, 
-- esto quiere decir que la foreign key es not null

CREATE TABLE categoria (
  CategoriaId int not null identity(1,1),
  NombreCategoria nvarchar(20) not null, 
  CONSTRAINT pk_categoria
  PRIMARY KEY(CategoriaId), 
  CONSTRAINT unique_nombrecategoria
  UNIQUE(NombreCategoria)
);
GO

CREATE TABLE productos3
(
  ProductoId int not null identity(1,1),
  NombreProducto nvarchar(20) not null, 
  Existencia int not null, 
  PrecioUnitario money not null, 
  CategoriaId int not null, 
  CONSTRAINT pk_productos3 
  PRIMARY KEY(ProductoId),
  CONSTRAINT chk_existencia3
  CHECK( Existencia >0 and Existencia<=1000),
  CONSTRAINT chk_preciounitario
  CHECK (PrecioUnitario>0.0),
  CONSTRAINT unique_nombreproducto3
  UNIQUE(NombreProducto),
  CONSTRAINT fk_productos3_categoria
  FOREIGN KEY(CategoriaId)
  REFERENCES categoria(CategoriaId)
  );
GO

CREATE TABLE categoria2 (
  Id int not null identity(1,1),
  NombreCategoria nvarchar(20) not null, 
  CONSTRAINT pk_categoria2
  PRIMARY KEY(Id), 
  CONSTRAINT unique_nombrecategoria2
  UNIQUE(NombreCategoria)
);
GO

CREATE TABLE productos4
(
  ProductoId int not null identity(1,1),
  NombreProducto nvarchar(20) not null, 
  Existencia int not null, 
  PrecioUnitario money not null, 
  CategoriaId int not null, 
  CONSTRAINT pk_productos4 
  PRIMARY KEY(ProductoId),
  CONSTRAINT chk_existencia4
  CHECK( Existencia >0 and Existencia<=1000),
  CONSTRAINT chk_preciounitario4
  CHECK (PrecioUnitario>0.0),
  CONSTRAINT unique_nombreproducto4
  UNIQUE(NombreProducto),
  CONSTRAINT fk_productos4_categoria2
  FOREIGN KEY(CategoriaId)
  REFERENCES categoria2(Id)
  );
GO

create table tabla1(
 tabla1id int not null identity(1,1),
 tabla1id2 int not null, 
 nombre nvarchar(20) not null, 
 CONSTRAINT pk_tabla1
 PRIMARY KEY(tabla1id,tabla1id2)
);
GO

CREATE TABLE tabla2(
  idtabla2 int not null identity(1,1), 
  nombre nvarchar(20),
  tabla1id int, 
  tabla1id2 int,
  CONSTRAINT pk_tabla2
  PRIMARY KEY (idtabla2),
  CONSTRAINT fk_tabla2_tabla1
  FOREIGN KEY(tabla1id, tabla1id2)
  REFERENCES tabla1(tabla1id,tabla1id2)
);

-- Crear tablas con razon de cardinalidad 1 a 1

CREATE TABLE employee
(
  id int not null identity(1,1), 
  nombre nvarchar(20) not null, 
  ap1 nvarchar(20) not null, 
  ap2 nvarchar(20) not null,
  sexo char(1) not null, 
  salario money not null, 
  CONSTRAINT pk_employee
  PRIMARY KEY(id)
);
GO

CREATE TABLE Department
(
  id int not null identity(1,1), 
  Nombre nvarchar(20) not null, 
  ubicacion nvarchar(30) not null, 
  employeeid int not null,
  CONSTRAINT pk_department
  PRIMARY KEY (id), 
  CONSTRAINT fk_department_employee
  FOREIGN KEY (employeeid)
  REFERENCES employee(id), 
  CONSTRAINT unique_employeeid
  UNIQUE(employeeid)
);
GO
