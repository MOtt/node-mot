###
  GET-Abfragen um die Tasks in der Ansicht nach Spalte zu trennen
###

"use strict"
application.factory "ScrumboardTask", ($resource) ->
  $resource "/api/scrumboard/tasks/:id",
    id: "@id"
  ,
    queryToDo:
      method: 'GET'
      params:
        inProgress: false
        done: false
      isArray: true
    queryInProgress:
      method: 'GET'
      params:
        inProgress: true
        done: false
      isArray: true
    queryDone:
      method: 'GET'
      params:
        inProgress: true
        done: true
      isArray: true