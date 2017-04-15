# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@plannedChanged = ->
  planned = $('#training_planned').is(':checked')
  if planned
    $('#objective_form_group').show('slow')
  else
    $('#training_objective').val('')
    $('#objective_form_group').hide('slow')

@categoryChanged = ->
  category_select = $('#training_category')
  if category_select.val() == 'Otro'
    category_select.removeAttr('name')
    $('#training_category_other').attr('name', 'training[category]')
    $('#category_form_group').show('slow')
  else
    $('#training_category_other').removeAttr('name')
    category_select.attr('name', 'training[category]')
    $('#category_form_group').hide('slow')
