Eliminare partition vuote con MERGE():

```SQL
ALTER PARTITION SCHEME myRangePS1 NEXT USED [PRIMARY]
ALTER PARTITION FUNCTION myRangePF1()
MERGE ('2022-06-01')
go
```


Merge Partition Vuote

Troncare Partition