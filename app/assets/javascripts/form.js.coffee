ready = ->
  reloadSearchProperty()
  $('#category-filter').on 'change', reloadSearchProperty

window.reloadSearchProperty = ->
  category = $('#category-filter').val()
  $.get('/update_category_properties/' + category, (data) ->
    $('#property-select').html(data)
  )

$(document).ready(ready)
$(document).on('page:load', ready)
