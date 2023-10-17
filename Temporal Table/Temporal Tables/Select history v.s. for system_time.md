per vedere lo storico ci sono due modi, la select:

```SQL
select * from dbo.ArticlesHistory
```

| idArticle|category|price|datestart |dateend |
|-|-|-|-|-|
|2|	Bravo	|200.00|	2023-10-16 13:20:24|2023-10-16 13:21:09
|3|	Charlie	|300.00|	2023-10-16 13:20:24|2023-10-16 13:27:56
|2|	Bravo	|250.00|	2023-10-16 13:21:09|2023-10-16 13:27:56

oppure l'utilizzo di *for system_time all*:
```SQL
select *, DateStart,DateEnd from dbo.Articles for system_time all
order by DateStart desc
```

| idArticle|category|price|datestart |dateend |
|-|-|-|-|-|
|1|Alfa	|100.00 | 2023-10-16 13:20:24	|9999-12-31 23:59:59|
|2|Bravo	|300.00| 2023-10-16 13:27:56	|9999-12-31 23:59:59|
|3|Charlie	|350.00| 2023-10-16 13:27:56	|9999-12-31 23:59:59|
|4|Delta	|400.00| 2023-10-16 13:20:24	|9999-12-31 23:59:59|
|2|Bravo	|200.00| 2023-10-16 13:20:24	|2023-10-16 13:21:09|
|3|Charlie	|300.00| 2023-10-16 13:20:24	|2023-10-16 13:27:56|
|2|Bravo	|250.00| 2023-10-16 13:21:09	|2023-10-16 13:27:56|




```SQL
/* valori del FOR SYSTEM_TIME:

	AS OF <datetime>  -- in un momento preciso
	FROM <startdatetime> TO <enddatetime>
	BETWEEN <startdatetime> AND <enddatetime>
	CONTAINED IN (<startdatetime> , <enddatetime>)
	ALL --> tutti i valori storici ed attuali

	senza FOR SYSTEM_TIME presenta il dato attuale
*/
```

|clausola|effetto|
|-|-|
|as of| in un momento preciso|
|from <> to <>| in un intervallo|
|between<> and <>|controlla che lo start time sia all'interno di un periodo|
|contained in(<>,<>)|controlla che il periodo sia perfettamente contenuto nei suoi argomenti|
|all| tutto|


---
Prossimo: [[Rimozione versioning]]
