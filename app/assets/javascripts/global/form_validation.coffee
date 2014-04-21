#
  Formular auf Eingabefehler (Pflichtfelder nicht ausgefüllt) prüfen

  Falls Pflichtfeld fehlt -> Feld umrahmen und Hinweis
#

$ ->
  $('form').validate(
    errorElement:     'span'
    errorClass:       'help-block'
    focusInvalid:     false

    rules:
      email:
        email: true

    highlight: (element) ->
      $(element).closest('.form-group').addClass('has-error')

    unhighlight: (element) ->
      $(element).closest('.form-group').removeClass('has-error')

    errorPlacement: (error, element) ->
      if element.parent('.input-group').size() > 0
        error.insertAfter element.parent('.input-group')
      else
        error.insertAfter element
  )

  # Falls Formular geändert hat, Inhalt nochmals validieren
  form = $('form')
  $('select', form).change ->
    form.validate(element($(this)))