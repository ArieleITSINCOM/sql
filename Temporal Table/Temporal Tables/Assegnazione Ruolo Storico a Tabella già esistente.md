È possibile assegnare il ruolo di tabella storica a una tabella già esistente, bisogna applicare il *SYSTEM_TIME* alle colonne specifiche della tabella (*DateStart*, *DateEnd*) e associarle al SYSTEM_VERSIONING.

```SQL
ALTER TABLE dbo.Articles ADD PERIOD FOR SYSTEM_TIME (DateStart, DateEnd);
ALTER TABLE dbo.Articles
  SET ( SYSTEM_VERSIONING = ON ( HISTORY_TABLE = dbo.ArticlesHistory ) );
GO
```