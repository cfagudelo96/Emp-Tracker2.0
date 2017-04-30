# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

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

@attendantChanged = ->
  attendant = $("input:radio[name ='attendant']:checked").val();
  if attendant == 'area'
    $('#collaborator_form_group').hide('slow')
    $('#area_form_group').show('slow')
    $('#training_collaborator_id').val(null)
  else if attendant == 'collaborator'
    $('#area_form_group').hide('slow')
    $('#collaborator_form_group').show('slow')
    $('#training_area_id').val(null)
