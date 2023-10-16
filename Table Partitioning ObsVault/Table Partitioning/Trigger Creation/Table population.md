![[Pasted image 20231016124556.png]]

## quantità articoli:

``` SQL
select SUM(num_articoli)as somma, id_articolo as articolo
from its.magazzino
group by id_articolo
```

---
Prossimo step:
[[Aggiunta colonna data]]