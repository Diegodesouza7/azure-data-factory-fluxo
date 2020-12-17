/* Criação das tabelas */
create table schema_dolar_Stage_Diego (
cotacaoCompra varchar(50),
cotacaoVenda varchar(50), 
dataHoraCotacao varchar(50) 
)

create table schema_dolar_final_Diego (
cotacaoCompra float,
cotacaoVenda float, 
dataHoraCotacao smalldatetime)

/* Procedure */
create procedure cast_all
as
begin 

insert into schema_dolar_final_Diego(cotacaoCompra, cotacaoVenda,dataHoraCotacao)
select cast(replace(cotacaoCompra, ',', '.') as float),
cast(replace(cotacaoVenda, ',', '.') as float),
cast(dataHoraCotacao as date) from [dbo].[schema_dolar_Stage_Diego]

end;
 
exec cast_all;