
Si crea un **partition scheme** sulla partition function:

Il partition scheme è lo schema che crea i "*container*" su cui andrà a organizzare i record in base ai criteri della partition function.

Nel partition scheme si deve specificare nel parametro "ALL TO()" il filegroup in cui si vuole salvare la ripartizione,

## CREATE

``` SQL
CREATE PARTITION SCHEME myRangeps1
    AS PARTITION myRangePF1
    ALL TO ('primary') -- filegroup dove si stabilisce crea

GO
```

>[Documentazione](https://learn.microsoft.com/en-us/sql/t-sql/statements/create-partition-scheme-transact-sql?view=sql-server-ver16)



## ALTER

Alterare un partition scheme:

``` SQL
ALTER PARTITION SCHEME myRangePS1 next used [PRIMARY] -- "next" specifica in che filegroup aggiungere la "scatola" in cui va il record

ALTER PARTITION FUNCTION myRangePF1() SPLIT RANGE (250);
```

>[Documentazione](https://learn.microsoft.com/en-us/sql/t-sql/statements/alter-partition-scheme-transact-sql?view=sql-server-ver16)

---
>Prossimo argomento:[[Create Table con Partitioning]]