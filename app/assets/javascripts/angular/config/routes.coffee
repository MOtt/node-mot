###
  Routen definieren
###

application.config ($routeProvider) ->


  $routeProvider.when('/',
    templateUrl: 'angular/frontend/index.html'
    controller: 'IndexController'
  )

  $routeProvider.when('/tasks',
    templateUrl: 'angular/frontend/scrumboard/index.html'
    controller: 'ScrumboardTasksController'
  )

  $routeProvider.otherwise redirectTo: '/'