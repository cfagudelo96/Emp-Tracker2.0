# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

selectedEmployee = null

@trainingExecutionCategoryChanged = ->
  category_select = $('#training_execution_category')
  if category_select.val() == 'Otro'
    category_select.removeAttr('name')
    $('#training_category_other').attr('name', 'training_execution[category]')
    $('#category_form_group').show('slow')
  else
    $('#training_category_other').removeAttr('name')
    category_select.attr('name', 'training_execution[category]')
    $('#category_form_group').hide('slow')

@trainingExecutionAttendantChanged = ->
  attendant = $("input:radio[name='attendant']:checked").val();
  if attendant == 'area'
    $('#collaborator_form_group').hide('slow')
    $('#area_form_group').show('slow')
    $('#training_execution_collaborator_id').val(null)
  else if attendant == 'collaborator'
    $('#area_form_group').hide('slow')
    $('#collaborator_form_group').show('slow')
    $('#training_execution_area_id').val(null)

@selectEmployee = (element, employee_id, employee_name) ->
  $('.active').removeClass('active')
  $(element).addClass('active')
