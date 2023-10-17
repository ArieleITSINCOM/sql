
```SQL
create table its.person(
	id int identity(1,1),
	name varchar(15),
	surname varchar(15),
	fullnamename as concat(surname, ' ', name),
) AS NODE
```

AS NODE rende la tabella una tabella a grafo:
![[Pasted image 20231017092327.png]]

la popoliamo con i dati di *dbo.person*:
```SQL
insert into its.person
	select name, REVERSE(name) as surname from dbo.person
```

la select * di *its.person* restituisce la seguente tabella:

|$node_id_7CF901CA3B2C49459D8EA47FDA7BE44A|id|name|surname|fullname|
|-|-|-|-|
|{"type":"node","schema":"its","table":"person","id":0}	|1|Alfa|	aflA|
|{"type":"node","schema":"its","table":"person","id":1}	|2|Bravo|ovarB	|
|{"type":"node","schema":"its","table":"person","id":2}	|3|Char|eilrahC	|
|{"type":"node","schema":"its","table":"person","id":3}	|4|Delt|atleD	|
|{"type":"node","schema":"its","table":"person","id":4}	|5|Echo|	ohcE|
|{"type":"node","schema":"its","table":"person","id":5}	|6|Fox	|xoF Fox|
|{"type":"node","schema":"its","table":"person","id":6}	|7|Golf|	floG|
|{"type":"node","schema":"its","table":"person","id":7}	|8|Hotel|letoH	|
|{"type":"node","schema":"its","table":"person","id":8}	|9|India|aidnI	|
|{"type":"node","schema":"its","table":"person","id":9}	|10|Juliet|teiluJ|


Rimuovendo e riaggiungendo il record con *id*=10, il campo id del $node_id_... avrà id 10, si comporta come una identity.

---
## pseudocolonne

SQL server genere una pesuodocolonna

sono autogenerate e autogestite, vengono sempre introdotte dal dollaro, finiscono con un codice identificativo univoco che può essere evitato nel momento che si chiama la colonna, quindi nel nostro caso possiamo usare semplicemente `select $node_id` anzichè `select $node_id_7CF...`


---
## Colonna inaccessibile

Nelle cartella *columns* della tabella è visibile una colonna aggiuntiva *graph_id*, **non è chiamabile** ed è autogestita da sql server
![[Pasted image 20231017094402.png]]

---
## Nodi

La creazione con questa query rende ogni record un singolo nodo

---
Prossimo:[[Costruzione Archi]]
Correlato: [[Srotolamento json]]

