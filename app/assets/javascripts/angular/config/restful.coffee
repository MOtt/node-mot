###
  REST-Ressourcen definieren (create -> post resp. update -> put)
###

application.factory 'my.resource', ['$resource', ($resource) ->
  (url, params, methods) ->
    defaults =
      create:
        method: 'post'
      update:
        method: 'put'

    methods = angular.extend defaults, methods
    resource = $resource url, params, methods
]