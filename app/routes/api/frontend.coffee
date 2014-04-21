###
  Routen definieren
###

module.exports = ( app ) ->

    app.get     '/api/scrumboard/tasks',                 app.controllers.api.scrumboard.tasks.index
    app.post    '/api/scrumboard/tasks',                 app.controllers.api.scrumboard.tasks.create
    app.get     '/api/scrumboard/tasks/:id',             app.controllers.api.scrumboard.tasks.show
    app.post    '/api/scrumboard/tasks/:id',             app.controllers.api.scrumboard.tasks.update
    app.delete  '/api/scrumboard/tasks/:id',             app.controllers.api.scrumboard.tasks.destroy



    # Alle anderen Routen mit HTTP-Statuscode 404 (Nicht gefunden) abschliessen
    app.all '/api/*', (req, res) ->
      res.status 404
      res.json { error: true, status: 404, message: 'not_found' }