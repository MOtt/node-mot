_ = require 'underscore'

module.exports = ( app ) ->
  ScrumboardTask = app.models.scrumboard.task.ScrumboardTask
  class TasksController

    ###
      Gibt alle ScrumboardTasks zurück
    ###

    @index = ( req, res) ->

      ###
        Definieren der Abfrageparameter (Abhängig der Query-Parameter)
      ###

      ScrumboardTask
      .find(
          inProgress: req.query.inProgress
          done:       req.query.done
        )
      .sort('-createdAt')
      .exec( (err, tasks) ->
          if not err
            res.json tasks
          else
            res.status 500
            res.send false
        )

    ###
      Task zur übergebenen ID als JSON-Objekt zurückgeben
      Falls nicht vorhanden wird ein HTTP-Responsecode 404 (Nicht gefunden) zurückgegeben
    ###

    @show = ( req, res ) ->
      ScrumboardTask.findOne( _id: req.params.id )
      .exec(
          ( err, task ) ->
            if not err
              res.json task
            else
              res.status 404
              res.send false
        )

    ###
      Erstellt ein neuer Task gem. Eingabe
      Falls nicht vorhanden wird ein HTTP-Responsecode 400 (Fehlerhafte Anfrage) zurückgegeben
    ###
    @create = ( req, res ) ->
      task = new ScrumboardTask

      task.label = req.body.label if req.body.label
      task.text = req.body.text if req.body.text
      task.effort = req.body.effort if req.body.effort
      task.employee = req.body.employee if req.body.employee

      task.save ( err ) ->
        if not err
          res.json task
        else
          res.status 400
          res.send false

    ###
    Gem. übergebener ID wird der bestehende Task nachgeführt
    Falls nicht vorhanden wird ein HTTP-Responsecode 404 (Nicht gefunden) zurückgegeben
    ###

    @update = ( req, res ) ->
      # Entfernen der durch die Module gesetzten Attribute
      req.body = _.omit(req.body, '_id')
      req.body = _.omit(req.body, 'id')
      req.body = _.omit(req.body, 'createdAt')
      req.body = _.omit(req.body, 'updatedAt')

      ScrumboardTask.findOne( _id: req.params.id )
      .exec(
          ( err, task ) ->
            if not err
              task = _.extend(task, req.body)
              task.save ( err ) ->
                if not err
                  res.redirect "/api/scrumboard/tasks/#{req.params.id}"
                else
                  console.log err
                  res.status 500
                  res.json err
            else
              res.status 404
        )

    ###
      Löscht das Objekt mit der übergebenen ID
      Falls nicht vorhanden wird ein HTTP-Responsecode 404 (Nicht gefunden) zurückgegeben
    ###

    @destroy = ( req, res ) ->
      ScrumboardTask.remove
        _id: req.params.id
      , (err) ->
        if not err
          res.json true
        else
          res.status 404
          res.json {
            error: true
            message: err
          }