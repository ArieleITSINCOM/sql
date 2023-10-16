Creazione tabella con partitioning:

``` SQL
CREATE TABLE dbo.PartitionTable (col 1 datatime2(0), col2 char(10))
    on myRangePS1 (col1)
GO
```

>[Link esempio completo documentazione Microsoft](https://learn.microsoft.com/en-us/sql/relational-databases/partitions/create-partitioned-tables-and-indexes?view=sql-server-ver16)


Create Table con partition