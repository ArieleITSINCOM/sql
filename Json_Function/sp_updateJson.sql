create or alter procedure its.sp_updateJson

	@colore varchar(20) null,
	@animaleNome nvarchar(20) = null,
	@animaleSpecie nvarchar(20) = null
	as

/* json structure
id
colore
	animali
	[
	nome
	specie
	]

*/

if (@colore is null)
BEGIN
	raiserror('il parametro @colore non può essere null',-1,-1,'sp_insertJson')
END
ELSE
BEGIN

declare @jAnimali nvarchar(max)

set @jAnimali = 

	JSON_MODIFY(
			JSON_MODIFY('{}','$.nome',@animaleNome),
				'$.specie',
				@animaleSpecie)

select @jAnimali as janim, JSON_QUERY(@jAnimali) as jquery

update its.json
set j = JSON_MODIFY(j, 'append $.animali' , JSON_QUERY(@jAnimali) )
where Colore = @colore
END

exec its.sp_updateJson 'amaranto', 'spillo','ippopotamo'

SELECT top  100 * FROM its.json ORDER BY id desc

exec its.sp_insertJson 'viola'
exec its.sp_updateJson 'viola','simba','leone'
exec its.sp_updateJson 'viola','rafiki','babbuino'