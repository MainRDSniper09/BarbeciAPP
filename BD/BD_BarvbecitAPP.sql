-- RF 001
/*
Juan Nicolas Barreto 11/09/2024
Se crea la base de datos de nuestra pagina web 
Juan Nicolas Barreto 4/10/2024
Se modifica Nuestra BD
*/

-- Tabla DBVENTA
create database DBVENTA 

go
-- Usamos la base DBVENTA
use DBVENTA

go

-- Tabla Menu
create table Menu(
idMenu int primary key identity(1,1), -- Llave primaria 
descripcion varchar(30),
idMenuPadre int references Menu(idMenu),
icono varchar(30),
controlador varchar(30),
paginaAccion varchar(30),
esActivo bit, 
fechaRegistro datetime default getdate() -- Control de registro con DATETIME
)

go

-- Tabla Rol
-- Se encarga de brindar tipos de roles
create table Rol(
idRol int primary key identity(1,1),
descripcion varchar(30),
esActivo bit,
fechaRegistro datetime default getdate()
)

go
 
 -- Tabla Menu Rol
 -- Se encarga de mostrar cuales roles hay dentro del sistema
 create table RolMenu(
 idRolMenu int primary key identity(1,1),
 idRol int references Rol(idRol),
 idMenu int references Menu(idMenu),
 esActivo bit,
 fechaRegistro datetime default getdate()
 )

go

-- Tabla Usuario
-- Se encarga de almacenar los datos del usuario que se haya o ya este registrado en nuestro sistema
create table Usuario(
idUsuario int primary key identity(1,1),
nombre varchar(50),
correo varchar(50),
telefono varchar(50),
idRol int references Rol(idRol),
urlFoto varchar(500),
nombreFoto varchar(100),
clave varchar(100),
esActivo bit,
fechaRegistro datetime default getdate()
)

go

-- Tabla Categoria
-- Se encarga de establecer una categoria de nuestros productos en este caso nuestros servicios
create table Categoria(
idCategoria int primary key identity(1,1),
descripcion varchar(50),
esActivo bit,
fechaRegistro datetime default getdate()
)

go

-- Tabla Producto
-- Se encarga se almacenar nuestro producto 'Servicio' de corte dentro de nuestro sistema
create table Producto(
idProducto int primary key identity(1,1),
codigoBarra varchar(50),
marca varchar(50),
descripcion varchar(100),
idCategoria int references Categoria(idCategoria),
stock int,
urlImagen varchar(500), -- Guardamos la url en la nube
nombreImagen varchar(100),
precio decimal(10,2),
esActivo bit,
fechaRegistro datetime default getdate()
)

go

-- Tabla Numero Correlativo
-- Se encarga de generar los numeros de venta -> 0000012 Ejemplo
create table NumeroCorrelativo(
idNumeroCorrelativo int primary key identity(1,1),
ultimoNumero int,
cantidadDigitos int,
gestion varchar(100),
fechaActualizacion datetime
)

go

-- Tabla Tipo Documento de Venta
-- Aqui podremos registrar si es un desprendible o una factura
create table TipoDocumentoVenta(
idTipoDocumentoVenta int primary key identity(1,1),
descripcion varchar(50),
esActivo bit,
fechaRegistro datetime default getdate()
)

go

-- Tabla venta
-- Tabla que almacena todo lo que es el precio de la venta y el registro
create table Venta(
idVenta int primary key identity(1,1),
numeroVenta varchar(6),
idTipoDocumentoVenta int references TipoDocumentoVenta(idTipoDocumentoVenta),
idUsuario int references Usuario(idUsuario),
documentoCliente varchar(10),
nombreCliente varchar(20),
subTotal decimal(10,2),
impuestoTotal decimal(10,2),
Total decimal(10,2),
fechaRegistro datetime default getdate()
)

go

-- Tabla Detalle de venta
-- Se encarga de mostrarnos el detalle de nuestra venta o venta de nuestro servicio
create table DetalleVenta(
idDetalleVenta int primary key identity(1,1),
idVenta int references Venta(idVenta),
idProducto int,
marcaProducto varchar(100),
descripcionProducto varchar(100),
categoriaProducto varchar(100),
cantidad int,
precio decimal(10,2),
total decimal(10,2)
)

go

-- Tabla Negocio
-- Tabla en donde se almacena todo lo que tiene que ver con el id del negocio, nombre, logo, contacto etc
create table Negocio(
idNegocio int primary key,
urlLogo varchar(500),
nombreLogo varchar(100),
numeroDocumento varchar(50),
nombre varchar(50),
correo varchar(50),
direccion varchar(50),
telefono varchar(50),
porcentajeImpuesto decimal(10,2),
simboloMoneda varchar(5)
)

go

-- Tabla Configuracion
-- Guardamos toda la informacion de los recursos externos
create table Configuracion(
recurso varchar(50),
propiedad varchar(50),
valor varchar(60)
)

