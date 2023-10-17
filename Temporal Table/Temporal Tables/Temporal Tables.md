Sono tabelle che "annotano" qualsiasi cosa sia stata fatta.
Tengono traccia della validità temporale dei record.

prerequisiti:
- chiave primaria
- 2 campi datetime2 dichiarati come: GENERATED ALWAYS AS ROW START/END
- un attributo PERIOD SYSTEM_TIME definito sui due campi datetime2

---
prossimo: [[Creation]]