Effettuare del partitioning, si usa una partition function, le partition funcion assegnano al valore di input un numero in base all'intervallo in cui ricade.


```SQL

CREATE PARTITION FUNCTION myRangePF1 (int)

    AS RANGE LEFT FOR VALUES (1, 100, 1000);

```

>[Documentazione](https://learn.microsoft.com/en-us/sql/t-sql/statements/create-partition-function-transact-sql?view=sql-server-ver16)

La partition function si applica sul partition scheme.

Partition Function