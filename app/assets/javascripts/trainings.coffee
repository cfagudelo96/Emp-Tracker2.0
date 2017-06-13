# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@trainingCategoryChanged = ->
  category_select = $('#training_category')
  if category_select.val() == 'Otro'
    category_select.removeAttr('name')
    $('#training_category_other').attr('name', 'training[category]')
    $('#category_form_group').show('slow')
  else
    $('#training_category_other').removeAttr('name')
    category_select.attr('name', 'training[category]')
    $('#category_form_group').hide('slow')

@trainingAttendantChanged = ->
  attendant = $("input:radio[name='attendant']:checked").val();
  if attendant == 'area'
    $('#collaborator_form_group').hide('slow')
    $('#area_form_group').show('slow')
    $('#training_collaborator_id').val(null)
  else if attendant == 'collaborator'
    $('#area_form_group').hide('slow')
    $('#collaborator_form_group').show('slow')
    $('#training_area_id').val(null)

@trainingsFilterChanged = ->
  removeFilterCategoryOther()
  filters = $('#filters')
  filters.children().remove()
  filter_selected = $('#filter').val()
  html
  if filter_selected == 'category'
    html = '<select name="category" id="category" onchange="trainingsFilterCategoryChanged()" class="form-control">'
    html += '<option value="Capacitación">Capacitación</option>'
    html += '<option value="Inducción">Inducción</option>'
    html += '<option value="Entrenamiento">Entrenamiento</option>'
    html += '<option value="Otro">Otro</option>'
    html += '</select>'
    filters.append(html)
  else if filter_selected == 'topic'
    html = '<input type="text" name="topic" id="topic" placeholder="Filtrar por..." class="form-control">'
    filters.append(html)
  else if filter_selected == 'date'
    html = '<div class="col-md-6 margin-bottom">'
    html += '<div class="input-group date" id="initial-date-picker">'
    html += '<input type="text" name="initial_date" id="initial_date" value="" placeholder="Fecha inicial" class="form-control">'
    html += '<span class="input-group-addon">'
    html += '<i class="fa fa-calendar"></i>'
    html += '</span>'
    html += '</div>'
    html += '</div>'
    html += '<div class="col-md-6">'
    html += '<div class="input-group date" id="final-date-picker">'
    html += '<input type="text" name="final_date" id="final_date" value="" placeholder="Fecha final" class="form-control">'
    html += '<span class="input-group-addon">'
    html += '<i class="fa fa-calendar"></i>'
    html += '</span>'
    html += '</div>'
    html += '</div>'
    filters.append(html)
    $('#initial-date-picker').datetimepicker({
      locale: 'es'
      format: 'DD/MM/YYYY'
    })
    $('#final-date-picker').datetimepicker({
      locale: 'es'
      format: 'DD/MM/YYYY'
    })
  else if filter_selected == 'area_id'
    html = '<select name="area_id" id="area_id" class="form-control" >'
    for area in gon.areas
      html += "<option value='#{area.id}'>#{area.name}</option>"
    html += '</select>'
    filters.append(html)
  else if filter_selected == 'collaborator'
    html = '<input type="text" name="collaborator" id="collaborator" placeholder="Filtrar por nombre de colaborador..." class="form-control">'
    filters.append(html)
  else if filter_selected == 'company_id'
    html = '<select id="companies_id" class="form-control" name="company_id">'
    for company in gon.companies
      html += "<option value='#{company.id}'>#{company.name}</option>"
    html += '</select>'
    filters.append(html)

@trainingsFilterCategoryChanged = ->
  category_select = $('#category')
  if category_select.val() == 'Otro'
    category_select.removeAttr('name')
    $('#category_other').attr('name', 'category')
    $('#category_form_group').show('slow')
  else
    category_select.attr('name', 'category')
    removeFilterCategoryOther()

removeFilterCategoryOther = ->
  $('#category_other').removeAttr('name')
  $('#category_form_group').hide('slow')
