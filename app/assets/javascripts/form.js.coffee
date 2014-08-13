ready = ->
  reloadSearchProperty()
  $('#equipment-filter').on 'change', reloadSearchProperty

window.reloadSearchProperty = ->
  equipment = $('#equipment-filter').val()
  $.get('/update_equipment_properties/' + equipment, (data) ->
    $('#property-select').html(data)
  )

$(document).ready(ready)
$(document).on('page:load', ready)
