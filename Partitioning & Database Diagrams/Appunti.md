# Partitioning & Database Diagrams *16/10/2023*
## Partitioning

Partition tables: suddivisione di tabelle in "sottotabelle" in base a intervalli di valore, permettono di rintracciare dati più velocemente. Permette anche di droppare solo partizioni di singole tabelle

*esempio completo doc Microsoft:https://learn.microsoft.com/en-us/sql/relational-databases/partitions/create-partitioned-tables-and-indexes?view=sql-server-ver16*


**IL PARTITIONING DEVE ESSERE SPECIFICATO AL MOMENTO DELLA CREAZIONE DELLA TABELLA**

**NON È POSSIBILE PARTIZIONARE UNA TABELLA GIA' ESISTENTE**

Per prima cosa è necessario creare una partition function:

```SQL
CREATE PARTITION FUNCTION myRangePF1 (int)  
    AS RANGE LEFT FOR VALUES (1, 100, 1000);
```
*docs: https://learn.microsoft.com/en-us/sql/t-sql/statements/create-partition-function-transact-sql?view=sql-server-ver16*


Si crea un partitioning sulla partition function:
``` SQL
CREATE PARTITION SCHEME myRangeps1
    AS partition myRangePF1
    ALL TO ('primary')
GO
```
*docs:https://learn.microsoft.com/en-us/sql/t-sql/statements/create-partition-scheme-transact-sql?view=sql-server-ver16*


Creazione tabella con partitioning:
``` SQL
CREATE TABLE dbo.PartitionTable (col 1 datatime2(0), col2 char(10))
    on myRangePS1 (col1)
GO
```
*docs:*


Alterare una partition function:
```SQL
ALTER PARTITION FUNCTION myRangePF1()
    split RANGE ('2022-07-01');
GO
```



## Database Diagrams

