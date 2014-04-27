$ ->
  stuff = $('.stuff_item')

  item_click_handler = (obj)->
    target = obj.target
    stuff_id = $(target).closest('.stuff_item').attr('data-stuff-id')
    href = Routes.stuff_popup_path(stuff_id)
    $.get href, (data) ->
      console.log(data)
      $(data).modal('show')

  stuff.find('img').click(item_click_handler)
  stuff.find('.name').click(item_click_handler)

