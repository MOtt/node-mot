###
  @desc     Konfiguration der Routen für die Applikation

  @author   Patrick Lehmann <lehmann@bl-informatik.ch>
  @date     2014-03-14
###
application.config ($routeProvider) ->


  $routeProvider.when('/',
    templateUrl: 'angular/frontend/index.html'
    controller: 'IndexController'
  )

  $routeProvider.when('/tasks',
    templateUrl: 'angular/frontend/scrum/tasks/index.html'
    controller: 'ScrumTasksController'
  )

  $routeProvider.when('/projects',
    templateUrl: 'angular/frontend/scrum/projects/index.html'
    controller: 'ScrumProjectsController'
  )
  
  $routeProvider.otherwise redirectTo: '/'