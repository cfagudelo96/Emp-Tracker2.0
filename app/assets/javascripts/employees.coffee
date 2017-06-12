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
  else if filter_selected == 'identification'
    html = '<input type="number" name="identification" id="identification" placeholder="Filtrar por..." class="form-control">'
  else if filter_selected == 'position'
    html = '<input type="text" name="position" id="position" placeholder="Filtrar por..." class="form-control">'
  else if filter_selected == 'area_id'
    html = '<select name="area_id" id="area_id" class="form-control" >'
    for area in gon.areas
      html += "<option value='#{area.id}'>#{area.name}</option>"
    html += '</select>'
  else if filter_selected == 'company_id'
    html = '<select id="companies_id" class="form-control" name="company_id">'
    for company in gon.companies
      html += "<option value='#{company.id}'>#{company.name}</option>"
    html += '</select>'
  filters.append(html)
