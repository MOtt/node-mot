module.exports = ( app ) ->
  class IndexController

    ###
      Gibt das Template für die Startseite zurück
    ###

    @index = (req, res ) ->
      res.render 'frontend/index'