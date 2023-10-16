# Partitioning  *16/10/2023*

suddivisione di tabelle in "sottotabelle" in base a intervalli di valore, permettono di rintracciare dati più velocemente. Permette anche di droppare solo partizioni di singole tabelle

>[Link esempio completo documentazione Microsoft](https://learn.microsoft.com/en-us/sql/relational-databases/partitions/create-partitioned-tables-and-indexes?view=sql-server-ver16)

**IL PARTITIONING DEVE ESSERE SPECIFICATO AL MOMENTO DELLA CREAZIONE DELLA TABELLA**
**NON È POSSIBILE PARTIZIONARE UNA TABELLA GIA' ESISTENTE**

Note:
- Filegroup: sono raggruppamenti di file, quando si vede *ON PRIMARY* o *ON SECONDARY* si sta dichiarando su che filegroup si lavora (primario o secondario)[(Documentazione)](https://learn.microsoft.com/en-us/sql/relational-databases/databases/database-files-and-filegroups?view=sql-server-ver16)


---
Prossimo argomento: [[Partition Function]]
