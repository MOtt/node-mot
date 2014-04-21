###
  Modul-Abhängigkeiten
###
express           = require 'express'
load              = require 'express-load'
http              = require 'http'
path              = require 'path'
reload            = require 'reload'
mongoose          = require 'mongoose'
Mincer            = require 'mincer'
less              = require 'less'
flash             = require 'connect-flash'

###
  Express app
###
app = express()


###
  Server
###
server = http.createServer app

###
  Konfiguration der Applikation
###

app.configure ->
  app.set 'root', __dirname
  app.set 'mongoDbServer', 'ple.bli.ch'
  app.set 'mongoDbDatabase', 'scrum_board_mot'
  app.set 'port', 4444


  # Template engine
  app.set 'views', "#{__dirname}/views"
  app.set 'view engine', 'jade'
  app.locals.pretty = true if app.settings.env is 'development'

  # Express
  app.use express.favicon()
  app.use express.logger("dev") if app.settings.env is 'development'
  app.use express.json()
  app.use express.urlencoded()
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser()

  app.use app.router

  # Flash-Nachrichten
  app.use flash()

  # Assets
  environment = new Mincer.Environment()
  environment.appendPath "app/assets/images"
  environment.appendPath "app/assets/javascripts"
  environment.appendPath "app/assets/stylesheets"
  environment.appendPath "app/assets/vendor"

  app.use "/assets", Mincer.createServer(environment)

  # Static content
  app.use express.static "#{__dirname}/public"
  app.enable 'trust proxy'

###
  Konfiguration der Umgebung und die Module automatisch in die Applikation laden
###

process.chdir 'app'

load('middelware')
  .then('models')
  .then('controllers')
  .then('routes')
  .into app


###
# Verbindung zu MongoDB
###

mongoose.connect("mongodb://#{app.get 'mongoDbServer'}/#{app.get 'mongoDbDatabase'}" )

###
  Auf Port warten
###

reload(server, app)

server.listen app.settings.port, ->
  console.log "#{app.settings.name}: listening on port #{app.settings.port} in #{app.settings.env} mode"

module.exports = app
