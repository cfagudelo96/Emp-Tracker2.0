# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@employeesFilterChanged = ->
  filters = $('#filters')
  filters.children().remove()
  filter_selected = $('#filter').val()
  html
  if filter_selected == 'name'
    html = '<input type="text" name="name" id="name" placeholder="Filtrar por..." class="form-control">'
    filters.append(html)
  else if filter_selected == 'identification'
    html = '<input type="number" name="identification" id="identification" placeholder="Filtrar por..." class="form-control">'
    filters.append(html)
  else if filter_selected == 'position'
    html = '<input type="text" name="position" id="position" placeholder="Filtrar por..." class="form-control">'
    filters.append(html)
  else if filter_selected == 'admission_date'
    html = '<div class="row">'
    html += '<div class="col-md-6">'
    html += '<div class="input-group date" id="initial-date-picker">'
    html += '<input type="text" name="initial_date" id="initial_date" placeholder="Fecha inicial" class="form-control">'
    html += '<span class="input-group-addon">'
    html += '<i class="fa fa-calendar"></i>'
    html += '</span>'
    html += '</div>'
    html += '</div>'
    html += '<div class="col-md-6">'
    html += '<div class="input-group date" id="final-date-picker">'
    html += '<input type="text" name="final_date" id="final_date" placeholder="Fecha final" class="form-control">'
    html += '<span class="input-group-addon">'
    html += '<i class="fa fa-calendar"></i>'
    html += '</span>'
    html += '</div>'
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
  else if filter_selected == 'company_id'
    html = '<select id="companies_id" class="form-control" name="company_id">'
    for company in gon.companies
      html += "<option value='#{company.id}'>#{company.name}</option>"
    html += '</select>'
    filters.append(html)
  else if filter_selected == 'without_trainings'
    html = '<div class="row">'
    html += '<div class="col-md-6">'
    html += '<div class="input-group date" id="initial-date-picker">'
    html += '<input type="text" name="trainings_initial_date" id="trainings_initial_date" placeholder="Fecha inicial" class="form-control">'
    html += '<span class="input-group-addon">'
    html += '<i class="fa fa-calendar"></i>'
    html += '</span>'
    html += '</div>'
    html += '</div>'
    html += '<div class="col-md-6">'
    html += '<div class="input-group date" id="final-date-picker">'
    html += '<input type="text" name="trainings_final_date" id="trainings_final_date" placeholder="Fecha final" class="form-control">'
    html += '<span class="input-group-addon">'
    html += '<i class="fa fa-calendar"></i>'
    html += '</span>'
    html += '</div>'
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
