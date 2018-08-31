create database AutoTest
go

use AutoTest

create table URLTest
(
	id int identity
		primary key,
	url nvarchar(1000) not null,
	expectValue nvarchar(1000) not null
)
go

create unique index URLTest_id_uindex
	on URLTest (id)
go

