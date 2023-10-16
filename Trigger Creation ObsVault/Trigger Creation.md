
Dopo aver creato la colonna con default, procediamo alla creazione del trigger:

**SCOPO DEL TRIGGER**: se un utente prova ad effettuare un'operazione di update restituisce errore.

codice:
```SQL
create trigger reminder1
	ON its.magazzino
	instead of update
as
begin
	raiserror ('non puoi compiere questa azione',1,1)
end
```

