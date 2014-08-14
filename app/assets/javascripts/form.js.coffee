ready = ->
  reloadSearchProperty()
  $('#equipment-filter').on 'change', reloadSearchProperty

$(document).ready(ready)
$(document).on('page:load', ready)
