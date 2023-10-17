## 1) mostra tutti i nomi

```SQL
select distinct name from its.person
```

## 2) mostra collegamenti 1 liv senza MATCH() (solo ANSI-92)

```SQL
select p.name,fp.name
from its.person p
	inner join its.follows f
	on
	p.$node_id = f.$from_id
	inner join its.person as fp
	on f.$to_id = fp.$node_id
```

## 3) es 2 usando MATCH() (no ANSI-92)

```SQL
select Person.name + ' -> ' + followedperson.name as link
from
	its.Person as Person
	,its.Follows as Follows		-- 22 rows
	,its.Person as FollowedPerson	-- 10 rows
where 1=1
	and MATCH(Person -(Follows)-> FollowedPerson)
```

## 4) tabella skills
```SQL
create table its.skill (
	id int identity(1,1),
	[language] varchar(15),
) as node
```
Creiamo anche una tabella di edge *its.competences* con il campo "*Level*" con default a 0

## 5) estrarre persona e relativa skill
```SQL
select person.name,skill.[language]
from 
	its.skill as skill
	,its.person as person
	,its.competence as knows
where match(person-(knows)->skill)
```

## 6) data una persona, trovare le sue competenze e trovare chi segue

```SQL
select person.name,skill.[language],followedperson.name

from 
	its.skill as skill
	,its.person as person
	,its.competence as knows
	,its.follows as follows
	,its.person as followedperson
where match(person-(knows)->skill)
	and match(person-(follows)->followedperson)
```
OPPURE (equivalente):
```SQL
select person.name,skill.[language],followedperson.name

from 
	its.skill as skill
	,its.person as person
	,its.competence as knows
	,its.follows as follows
	,its.person as followedperson
where match (followedperson <-(follows)- person -(knows)->skill)
```

## 7) data una skill (es Python, SQL) scoprire chi non le ha

note:
- *NOT MATCH()* restituisce errore, non si può combinare *MATCH()* con *NOT* o *OR*


```SQL

```
### extra: persona1, persona2 e skill in comune

```SQL
select person.name,skill.[language],followedperson.name
from 
	its.skill as skill
	,its.person as person
	,its.competence as knows
	,its.follows as follows
	,its.person as followedperson
	,its.competence as knows2
where 1=1
	and skill.[language] in ('python','t-sql')
	and match(person -(follows)-> followedperson -(knows)-> skill)
	and match(person -(knows2)-> skill)
```

## 8)
```SQL

```

## 9)
```SQL

```