# ScrumBoard
=============

Diese Applikation wurde gemäss der Aufgabenstellung im Web-Programmieren 2 - Seminar (ZHAW@2014) erstellt

Folgende Techniken wurden gemäss Anforderungen der Aufgabenstellung verwendet: 
- Web / API Server mit NodeJS
- REST API
- Frontend Anwendung mit AngularJS / UnderscoreJS / jQuery
- Optionaler Persistenz-Layer

Hier die wichtigsten Komponenten welche verwendet wurden: 
- NodeJS als serverseitige Plattform für den Aufbau der Applikation
- AngularJS als MVC-Framework
- jQuery als JavaScript-Bibliothek
- CoffeeScript als JavaScript Precompiler
- LESS-Unterstützung für CSS
- UnderscoreJS-Integration für diverse JavaScript Hilfsfunktionen
- Jade - HTML Template Engine für NodeJS
- Mongoose als Persistenz-Layer
- MongoDB als Datenbank


## Installation
------------------
1.  Klonen des Pakets mit "**git clone '*Pfad zum GIT Repo*'**"
2.  In das entsprechend Verzeichnis wechseln (*cd ...*)
3.  Installation der benötigten Module mit **npm install**
4.  Installation der clientseitigen Dependencies mit **bower install**


## Server starten
------------------
### Entwicklung (temporär)
1.  In das entsprechend Verzeichnis wechseln (*cd ...*)
2.  Server starten mit: **node server**

### Produktion
1.  In das entsprechend Verzeichnis wechseln (*cd ...*)
2.  Server starten mit: **forever start server.js**
3.  Server stoppen mit **forever stop server.js**


## Anleitung
------------------
### Task erfassen
Alle Felder entsprechend abfüllen und auf Button *Als neuer Task speichern* klicken

### Task ändern
gewünschter Task im Betreff anklicken und in der Bearbeitungsmaske ändern. Änderung wird bei Eingabe gespeichert

### Task verschieben
Beim entsprechenden Task den Pfeil nach links oder nach rechts anklicken und die Meldung bestätigen

### Task löschen
Beim entsprechenden Task den Papierkorb anklicken und die Meldung bestätigen


## Aktueller Stand
------------------
- Unit-Testing wurde aus zeitgründen (noch) nicht realisiert
- Bekanntes Problem: unter IE reagiert die Seite teilweise nicht