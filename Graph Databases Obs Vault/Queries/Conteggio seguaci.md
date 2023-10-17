```SQL
select person.name, count(*) as count
FROM its.Person, its.follows, its.person as FollowedPerson
	WHERE 1=1
	and MATCH (person -(Follows)-> FollowedPerson)
	group by person.name
```

Output:

|Name|Count|
|-|-|
|Alfa|	2|
|Bravo|	2|
|Charlie	|3|
|Delta	|2|
|Echo	|3|
|Fox	|3|
|Golf	|1|
|Hotel	|2|
|India	|2|
|Juliet	|2|
