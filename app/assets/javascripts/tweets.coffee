# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $('#tweets').infiniteScroll
    path: "nav.pagination a[rel=next]"
    append: ".tweet"
    histroy: false
    prefill: true
    status: ".page-load-status"
