# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#info-request-table').on 'draw.dt', ->
    $('[data-toggle="tooltip"]').tooltip()
    $('#info-request-table_filter').hide()
  $('#info-request-table').dataTable
    pageLength: 50
    processing: true
    serverSide: true
    ajax: $('#info-request-table').data('source')
    pagingType: 'full_numbers'
    language:
      url: "/assets/Spanish.json"
      
      
  $('input[type=submit]').on 'click', (e) ->
    show_modal = false
    modal_invalid = 0
    e.preventDefault()
    $('#info_request_program_id, #info_request_name, #info_request_surname, #info_request_second_surname, #info_request_contact_phone, #info_request_rut, #info_request_email, #info_request_find_out_ids, #info_request_observations').each ->
      if $(this).val() == ""
        $(this).addClass('not-valid')
        $('#modal-validation').modal('show')
        show_modal = true
        modal_invalid += 1
      else
        $(this).removeClass('not-valid')
      
      if $(this).val() == null
        $(this).parent().addClass('not-valid')
        $('#modal-validation').modal('show')
        show_modal = true
        modal_invalid += 1
      else
        $(this).parent().removeClass('not-valid')
    if modal_invalid == 0
      $(this).parents('form').submit()
    console.log modal_invalid