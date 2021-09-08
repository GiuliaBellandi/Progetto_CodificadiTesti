# Codifica di Testi
Esercizi:
- Esercizio 1: creare un file .xml e inserire dichiarazione XML e una dichiarazione.
- Esercizio 2 e 3: creare un file .xml non corretto, commentarlo, correggerlo e aggiungere child e sibling.
- Esercizio 4: inserire all'interno di un tag un codice HTML.
- Esercizio 5: (DTD) definire un elemento root TEI con i seguenti figli: header(obbligatoria una occorrenza), facsimile (opzionale una occorrenza) e text (obbligatoria una occorrenza).
- Esercizio 6: (DTD) definire un elemento root TEI con i seguenti elementi figli: header (obbligatoria una occorrenza) i cui attributi sono type (fixed,CDDATA,"intestazione") e lang (opzionale,NMTOKEN); facsimile (opzionale una occorrenza) i cui attributi sono source e ref (opzionale, IDREFS); testo (obbligatorio una occorrenza) un mixed content con possibile elemento seg. Gli attributi di testo sono id (obbligatorio, ID) e type (opzionale, contenuto di testo). 
- Esercizio 7 (Template): cartella con all'interno un documento XML e un file XSL modificato con variabili e parametri.
- Esercizio 8 (TEI): esercitazione sulla codifica di una cartolina. Cartella con all'interno: DTD (creata tramite TEIRoma personalmente), file XML e immagine PNG. Validata tramite Xerces. 
. Progetto Cartoline 7694-084 e 7694-091: Cartella con all'interno main.xml riferito alle cartoline, list.xml per i luoghi, le persone e gli enti sterni ed interni alle cartoline,  immagini delle cartoline (fronte e retro già disponibili) e immagine unica creata per poter visualizzare affiancate fronte e retro insieme, documento xslt e fogli di stile (css e js). Gli strumenti utilizzati sono stati: Xerces per la validazione, TEIzoner per creare all'interno del main.xml il <facsimile> (le zone non vengono poi evidenziate nel documento html), e Saxon per la creazione dell'html.
