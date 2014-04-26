$ ->
  stuff = $('.stuff_item')

  stuff.click ->
    location.href = stuff.attr('href')