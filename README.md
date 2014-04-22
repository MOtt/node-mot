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


## Server-Varianten
------------------
### Entwicklung
1.  In das entsprechend Verzeichnis wechseln (*cd ...*)
2.  Server starten mit: **node server**

### Produktion
1.  In das entsprechend Verzeichnis wechseln (*cd ...*)
2.  Server starten mit: **forever start server.js**

## Aktueller Stand
------------------
- Bestehende Tasks werden nochmals gespeichert, wenn Sie verändert werden  (nur bei Klick auf Speichern - bei wechsel auf anderen Task nicht)
- Testing wurde aus zeitgründen (noch) nicht realisiert