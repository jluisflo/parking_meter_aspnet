GO
create database parqueo;
GO
use parqueo;
GO

Create table Operadores(
	idOperador int primary key identity not null,
	nombre nvarchar(50) not null,
	apellidos nvarchar(50) not null,
	usuario nvarchar(50) not null,
	contraseña nvarchar(50)
)

Create table EnParqueo(
	idParqueo int primary key identity not null,
	idRegistro int
)

Create table Registro(
	idRegistro int primary key identity not null,
	placa nvarchar(25),
	fechaEntrada datetime,
	fechaSalida datetime,
	tarifa money
)