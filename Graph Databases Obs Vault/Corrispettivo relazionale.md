```SQL
create database ITSGraph
go
use ITSGraph
go
create table dbo.person(
	id int identity(1,1),
	name varchar(15)
	)
go
create table dbo.connections(
	connectionid int identity(1,1),
	fromid int,
	toid int,
	[value] int default(1)
	)


-- per vedere le relazioni:
select p.name, p.id, c.fromid, c.toid, fp.id, FP.name
from
	dbo.person as p
		inner join
	dbo.connections as c
	on
	p.id = c.fromid
		inner join
	dbo.person as FP
	on
	FP.id = c.toid
	
```


---
Prossimo: [[Costruzione Nodi]]