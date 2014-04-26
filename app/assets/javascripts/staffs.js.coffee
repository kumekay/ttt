$ ->
  stuff = $('.stuff_item')

  item_click_handler = (obj)->
    target = obj.target
    href = $(target).closest('.stuff_item').attr('href')
    location.href = href

  like_click_handler = (obj) ->
    target = obj.target
    target = $(target).closest('.label').get(0)
    if target.classList.contains('orange')
      target.classList.remove('orange')
    else
      target.classList.add('orange')

  stuff.find('.like.label').click(like_click_handler)
  stuff.find('img').click(item_click_handler)
  stuff.find('.name').click(item_click_handler)

