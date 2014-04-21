###
  ScrumboardTaskController

###

"use strict"
application.controller 'ScrumboardTasksController', ['$scope', '$rootScope', 'ScrumboardTask', ($scope, $rootScope, ScrumboardTask) ->

  $scope.createDummy = () ->
    $scope.currentTask = new ScrumboardTask()
    $scope.currentTask.effort = 1

  $scope.createDummy()

  $scope.init = () ->
    $scope.tasksToDo = ScrumboardTask.queryToDo()
    $scope.tasksInProgress = ScrumboardTask.queryInProgress()
    $scope.tasksDone = ScrumboardTask.queryDone()

  $scope.destroy = (task) ->
    console.log task

    if confirm('Task wirklich löschen?')
      ScrumboardTask.remove
        id: task._id
      , ->
          $scope.init()
      , (error) ->
          console.log error


  $scope.edit = (task) ->
    console.log task
    $scope.currentTask = task


  $scope.saveTask = () ->
    $scope.currentTask.$save ->
      $scope.init()
      $scope.createDummy()
      console.log 'Task erstellt'
    , (error) ->
      console.log error


  $scope.previousQueue = (task) ->
    if confirm('Auf vorherige Task-Queue zurücksetzen?')
      if task.done
        task.id = task._id
        task.toDo = true
        task.inProgress = true
        task.done = false
        task.$save ->
          console.log ('done -> inProgress')
          $scope.init()
        , (error) ->
          console.log error
      else
        if task.inProgress
          task.id = task._id
          task.toDo = true
          task.inProgress = false
          task.done = false
          task.$save ->
            console.log ('inProgress -> toDo')
            $scope.init()
          , (error) ->
            console.log error
        else
          if task.toDo
            alert('Task ist bereits in tiefster Queue')
      console.log 'vorherige Task-Queue = ja'
      console.log task


  $scope.nextQueue = (task) ->
    if confirm('Nächste Task-Queue?')
      if task.done
        alert('Task ist bereits erledigt')
      else
        if task.inProgress
          task.id = task._id
          task.toDo = true
          task.inProgress = true
          task.done = true
          task.$save ->
            console.log ('inProgress -> done')
            $scope.init()
          , (error) ->
            console.log error
        else
          if task.toDo
            task.id = task._id
            task.toDo = true
            task.inProgress = true
            task.done = false
            task.$save ->
              console.log ('toDo -> inProgress')
              $scope.init()
            , (error) ->
              console.log error
          else
            task.id = task._id
            task.toDo = true
            task.inProgress = true
            task.done = false
            task.$save ->
              console.log ('toDo -> inProgress')
              $scope.init()
            , (error) ->
              console.log error
      console.log 'nächste Task-Queue = ja'
      console.log task
]