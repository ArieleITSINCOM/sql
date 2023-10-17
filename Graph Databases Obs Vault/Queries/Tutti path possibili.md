Utilizziamo la funzione [SHORTEST_PATH](https://learn.microsoft.com/en-us/sql/relational-databases/graphs/sql-graph-shortest-path?view=sql-server-ver16), 
```SQL
select 
	Person.Name ,
	STRING_AGG(FollowedPerson.Name, ' -> ' )WITHIN GROUP (GRAPH PATH) as FollowedPeople
from 
	its.Person as Person
	,its.Follows for path as Follows		-- 22 rows
	,its.Person for path as FollowedPerson	-- 10 rows
where 1=1
	and Person.Name = 'Alfa'
	and MATCH(SHORTEST_PATH(Person (-(Follows)-> FollowedPerson)+))
```



- *for path* serve a renderli ciclabili nel shortestpath
- *SHORTEST_PATH* cerca tutti i path più brevi per raggiungere tutti gli utenti raggiungibili
- *STRING_AGG (...) WITHIN GROUP* aggrega stringhe 
-  *(GRAPH PATH)* i percorsi del grafo (è output di *SHORTEST_PATH*)
