La costruzione può essere fatta anche sono con questo comando:

``` sql
CREATE TABLE its.follows AS EDGE 
```

Le tabelle di edge, la *select* * di questa tabella restituisce:
![[Pasted image 20231017095436.png]]

Noi però usiamo:
```SQL
CREATE TABLE its.follows ([value] tinyint default(1))AS EDGE
```

Che genera
![[Pasted image 20231017095613.png]]

---
## Creazione arco
``` SQL
insert into its.follows ($from_id,$to_id)values
	((select $node_id from its.person where name='Alfa'),
	(select $node_id from its.person where name='Delta'))
```

La tabella assume questo aspetto:
![[Pasted image 20231017102653.png]]



---
Prossimo:[[Query]]
Correlato: