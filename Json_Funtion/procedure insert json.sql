alter procedure its.sp_insertJson
	
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


declare @id int  = (select MAX(id)+1 from its.json)

declare @j nvarchar(max), @jAnimali nvarchar(max)



set @jAnimali = 

	JSON_MODIFY(
			JSON_MODIFY('{}','$.nome',@animaleNome),
				'$.specie',
				@animaleSpecie)
	
	
	--select @jAnimali, JSON_QUERY(@jAnimali)

set @j = json_modify('{}','$.id',@id)

set @j = JSON_MODIFY(
				JSON_MODIFY(@j, '$.colore', @colore),
				'append $.animali',json_query(@jAnimali))


--select @j		
	insert into its.json values(@j)
	
print 'La registrazione del json è andata a buon fine
	
per verifica:
SELECT top  100 * FROM its.json ORDER BY id desc'
END