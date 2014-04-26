$ ->
  stuff = $('.stuff_item')

  item_click_handler = (obj)->
    target = obj.target
    href = $(target).closest('.stuff_item').attr('href')
    location.href = href

  stuff.find('img').click(item_click_handler)
  stuff.find('.name').click(item_click_handler)

