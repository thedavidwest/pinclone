# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  mobileNav()
  $('#all-pins').imagesLoaded ->
    $('#all-pins').masonry
      itemSelector: '.box'
      isFitWidth: true
      isAnimated: true

mobileNav = ->
  $('.mobile-nav-toggle').on 'click', ->
    status = $(this).hasClass('is-open')
    if status
      $('.mobile-nav-toggle, .mobile-nav').removeClass 'is-open'
    else
      $('.mobile-nav-toggle, .mobile-nav').addClass 'is-open'
    return
  return
