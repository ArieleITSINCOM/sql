
Per srotolare il json del campo *$node_id* usiamo la seguente query
```SQL
select 
JSON_VALUE($node_id,'$.id') as id,
		JSON_VALUE($node_id,'$.type') as [ype],
		JSON_VALUE($node_id,'$.schema')as [schema],
		JSON_VALUE($node_id,'$.table') as [table]
from its.person
```

---
Torna indietro:[[Costruzione Nodi]]