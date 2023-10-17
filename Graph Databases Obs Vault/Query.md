


```SQL
SELECT *
FROM its.Person, its.follows, its.person as FollowedPerson
	WHERE Person.Name  = 'Charlie'
	and MATCH (person -(Follows)-> FollowedPerson)
```

person ha 10 record
follows 22
Punti chiave:
- la virgola tra le tabelle esegue una cross join,
- Applicando solo selelct from ottengo 2200 righe
- Applicando il where prendo 1 solo record, portandolo a 220 righe 
- Applicando il MATCH ottengo solo le righe relazionate
> [documentazione match](https://learn.microsoft.com/it-it/sql/t-sql/queries/match-sql-graph?view=sql-server-ver16)

Per avere una vista più grafica:
```SQL
SELECT person.name + ' -> ' + followedperson.name

FROM its.Person, its.follows, its.person as FollowedPerson
	WHERE Person.Name  = 'Charlie'
	and MATCH (person -(Follows)-> FollowedPerson)
```
---

Esempi di query:
- Conteggio seguaci: [[Conteggio seguaci]]
- Seguaci di seguace: [[Seguace di Seguaci]]
- Tutti path possibili:[[Tutti path possibili]]