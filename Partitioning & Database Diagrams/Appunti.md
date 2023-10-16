# Partitioning & Database Diagrams *16/10/2023*
## Partitioning

Partition tables: suddivisione di tabelle in "sottotabelle" in base a intervalli di valore, permettono di rintracciare dati più velocemente. Permette anche di droppare solo partizioni di singole tabelle

**IL PARTITIONING DEVE ESSERE SPECIFICATO AL MOMENTO DELLA CREAZIONE DELLA TABELLA**

**NON È POSSIBILE PARTIZIONARE UNA TABELLA GIA' ESISTENTE**

Per prima cosa è necessario creare una partition function:
*docs: https://learn.microsoft.com/en-us/sql/t-sql/statements/create-partition-function-transact-sql?view=sql-server-ver16*
```SQL
CREATE PARTITION FUNCTION myRangePF1 (int)  
    AS RANGE LEFT FOR VALUES (1, 100, 1000);
```


Si crea un partitioning sulla partition function:
``` SQL
CREATE PARTITION SCHEME myRangeps1
    AS partition myRangePF1
    ALL TO ('primary')
GO
```

Creazione tabella con partitioning:
``` SQL
CREATE TABLE dbo.PartitionTable (col 1 datatime2(0), col2 char(10))
    on myRangePS1 (col1)
GO
```

Alterare una partition function:
```SQL
ALTER PARTITION FUNCTION myRangePF1()
    split RANGE ('2022-07-01');
GO
```



## Database Diagrams

