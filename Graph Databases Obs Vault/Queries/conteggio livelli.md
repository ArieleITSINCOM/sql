```SQL
select * from(
select 
	Person.Name ,
	STRING_AGG(FollowedPerson.Name, ' -> ' )WITHIN GROUP (GRAPH PATH) as FollowedPeople,
	LAST_VALUE(followedperson.name)within group (graph path) as lastperson,
	COUNT(followedperson.name) within group(graph path) as level
from 
	its.Person as Person
	,its.Follows for path as Follows		-- 22 rows
	,its.Person for path as FollowedPerson	-- 10 rows
where 1=1
	--and Person.Name = 'Alfa'
	and MATCH(SHORTEST_PATH(Person (-(Follows)-> FollowedPerson)+)) )as t
where t.lastperson = 'alfa'
	and t.name <>'alfa'
```