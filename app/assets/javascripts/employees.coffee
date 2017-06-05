# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@filterChanged = ->
  filters = $('#filters')
  filters.children().remove()
  area = $('#area_id')
  area.removeAttr('name')
  area.hide()
  company = $('#company_id')
  company.removeAttr('name')
  company.hide()
  filter_selected = $('#filter').val()
  if filter_selected == 'name'
    filters.append('<input type="text" name="name" id="name" placeholder="Filtrar por..." class="form-control">')
  else if filter_selected == 'identification'
    filters.append('<input type="number" name="identification" id="identification" placeholder="Filtrar por..." class="form-control">')
  else if filter_selected == 'position'
    filters.append('<input type="text" name="position" id="position" placeholder="Filtrar por..." class="form-control">')
  else if filter_selected == 'area_id'
    area.attr('name', 'area_id')
    area.show()
  else if filter_selected == 'company_id'
    company.attr('name', 'company_id')
    company.show()
