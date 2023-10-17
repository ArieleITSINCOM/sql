Rimuovendo una tabella dal versioning, la sua tabella history diventa disponibile come una tabella normale.

``` SQL
ALTER TABLE dbo.Articles SET ( SYSTEM_VERSIONING = OFF);
```

Una volta rimossa dal versioning, la tabella diventa droppabile.

