# Partitioning & Database Diagrams *16/10/2023*
## Partitioning

Partition tables: suddivisione di tabelle in "sottotabelle" in base a intervalli di valore, permettono di rintracciare dati più velocemente. Permette anche di droppare solo partizioni di singole tabelle

[Link esempio completo documentazione Microsoft](https://learn.microsoft.com/en-us/sql/relational-databases/partitions/create-partitioned-tables-and-indexes?view=sql-server-ver16)


**IL PARTITIONING DEVE ESSERE SPECIFICATO AL MOMENTO DELLA CREAZIONE DELLA TABELLA**

**NON È POSSIBILE PARTIZIONARE UNA TABELLA GIA' ESISTENTE**

---
Note:
- Filegroup: sono raggruppamenti di file, quando si vede *ON PRIMARY* o *ON SECONDARY* si sta dichiarando su che filegroup si lavora (primario o secondario)
[(Documentazione)](https://learn.microsoft.com/en-us/sql/relational-databases/databases/database-files-and-filegroups?view=sql-server-ver16)

---
**STEP 1**)
Si crea una partition function, una funzione che essenzialmente restituisce un numero in base al range in cui il record rientra

```SQL
CREATE PARTITION FUNCTION myRangePF1 (int) 
    AS RANGE LEFT FOR VALUES (1, 100, 1000);
```
[Documentazione](https://learn.microsoft.com/en-us/sql/t-sql/statements/create-partition-function-transact-sql?view=sql-server-ver16)

---
**STEP 2**)
Si crea un partition scheme sulla partition function:
``` SQL
CREATE PARTITION SCHEME myRangeps1
    AS PARTITION myRangePF1
    ALL TO ('primary') -- filegroup dove si stabilisce crea
GO

```
[Documentazione](https://learn.microsoft.com/en-us/sql/t-sql/statements/create-partition-scheme-transact-sql?view=sql-server-ver16)

---
**STEP 3**)
Creazione tabella con partitioning:
``` SQL
CREATE TABLE dbo.PartitionTable (col 1 datatime2(0), col2 char(10))
    on myRangePS1 (col1)
GO
```
*Documentazione: vedi esempio completo*

---
**STEP 4**)
Alterare una partition function e aggiunge un'ulteriore partizione:
(*uncertain*)
```SQL
ALTER PARTITION FUNCTION myRangePF1()
    split RANGE ('2022-07-01');
GO
```
[Documentazione](https://learn.microsoft.com/en-us/sql/t-sql/statements/alter-partition-function-transact-sql?view=sql-server-ver16)

---
Alterare un partition scheme:
``` SQL
ALTER PARTITION SCHEME myRangePS1 next used [PRIMARY] -- "next" specifica dove aggiungere la "scatola" in cui va il record
ALTER PARTITION FUNCTION myRangePF1() SPLIT RANGE (250);
```

## Database Diagrams

