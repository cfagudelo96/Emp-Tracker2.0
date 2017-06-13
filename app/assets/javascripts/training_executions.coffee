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

@selectEmployee = (element, employee_id, employee_name, employee_identification) ->
  $('.active').removeClass('active')
  $(element).addClass('active')
  selectedEmployee = {
    id: employee_id,
    name: employee_name,
    identification: employee_identification
    element: element
  }

@addEmployee = ->
  if selectedEmployee?
    $('#selected-employees').append("<button type='button' onclick='selectEmployee(this, #{selectedEmployee.id}, \"#{selectedEmployee.name}\")' class='list-group-item list-group-item-compact'>#{selectedEmployee.name}</button>")
    $('#hidden-inputs').append("<input type='hidden' name='employees_id[]' value='#{selectedEmployee.id}' id='employee-#{selectedEmployee.id}'>")
    $(selectedEmployee.element).remove()
    selectedEmployee = null

@removeEmployee = ->
  if selectedEmployee?
    $("#employee-#{selectedEmployee.id}").remove()
    $(selectedEmployee.element).remove()
    $('#non-selected-employees').append("<button type='button' onclick='selectEmployee(this, #{selectedEmployee.id}, \"#{selectedEmployee.name}\")' class='list-group-item list-group-item-compact'>#{selectedEmployee.name}</button>")
    selectedEmployee = null

@filterEmployees = ->
  filter = $('#employees-filter').val().toUpperCase()
  nonSelectedEmployees = $('#non-selected-employees').children()
  filterElement(filter, $(nonSelectedEmployee)) for nonSelectedEmployee in nonSelectedEmployees

filterElement = (filter, element) ->
  if element.text().toUpperCase().indexOf(filter) > -1
    element.show()
  else
    element.hide()
