esempio:
```SQL
create table dbo.Articles
(
	IdArticle int not null CONSTRAINT PK_IdArticle PRIMARY KEY NONCLUSTERED,
	Category varchar(50),
	Price numeric (8,2),

	DateStart DATETIME2(0) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,  --l'attributo HIDDEN non le visualizza nela select
	DateEnd   DATETIME2(0) GENERATED ALWAYS AS ROW END   HIDDEN NOT NULL,
	PERIOD FOR SYSTEM_TIME (DateStart, DateEnd),
)
WITH ( SYSTEM_VERSIONING = ON ( HISTORY_TABLE = dbo.ArticlesHistory ) ); -- indicare il nome è facoltativo
;
GO
```
Il fulcro della creazione avviene nella riga WITH con system versioning, le colonne datetime2 sono visibili soltanto dalla *dbo.AritclesHistory*, che grazie al loro nome specifico vengono assegnate automaticamente a lui.

---
Prossimo:[[Select history v.s. for system_time]]
Complementare: [[Assegnazione Ruolo Storico a Tabella già esistente]]