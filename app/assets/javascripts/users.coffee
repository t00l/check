$(document).on 'turbolinks:load', ->

  readURL = (input) ->
    if input.files and input.files[0]
      reader = new FileReader

      reader.onload = (e) ->
        $('#user_image, #image').val ''
        $('.imagen_previa').attr 'src', e.target.result
        $('#user_image, #image').val e.target.result
        return

      reader.readAsDataURL input.files[0]
    return

  $('#subir_imagen').change ->
    readURL this
    return
  return
