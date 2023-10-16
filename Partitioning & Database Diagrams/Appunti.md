# Partitioning & Database Diagrams *16/10/2023*
## Partitioning

Partition tables: suddivisione di tabelle in "sottotabelle" in base a intervalli di valore, permettono di rintracciare dati più velocemente. Permette anche di droppare solo partizioni di singole tabelle

**LA TABELLA DEVE ESSERE CREATA CON UN PARTITIONING**

**NON È POSSIBILE PARTIZIONARE UNA TABELLA GIA' ESISTENTE**

Creazione di un partitioning:
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

## Database Diagrams

