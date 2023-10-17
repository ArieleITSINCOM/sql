```SQL
SELECT person.name + ' -> ' + followedperson.name + ' -> '+ followedperson2.name
FROM its.Person, 
	its.follows, 
	its.person as FollowedPerson,
	its.follows as Follows2,
	its.person as FollowedPerson2
	WHERE 1=1
	and MATCH (person -(Follows)->FollowedPerson-(Follows2)->FollowedPerson2)
	-- and MATCH (person -(Follows)->FollowedPerson AND FollowedPerson-(Follows2)->FollowedPerson2)
```
La riga commentata in questa circostanza è equivalente

Output

|No Column Name|
|-|
|Alfa -> Delta -> Juliet|
|Alfa -> Delta -> Golf|
|Alfa -> Echo -> Delta|
|Alfa -> Echo -> Bravo|
|Alfa -> Echo -> Hotel|
|Bravo -> Fox -> Hotel|
|Bravo -> Fox -> Echo|
|[Altre 38 righe]|
