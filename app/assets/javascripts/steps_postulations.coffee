$(document).on 'ready', ->
  
  check_file = (el, el_target) ->
    if el.val().length > 0
      el_target.html('Adjunto')
    else
      el_target.html('No se adjunta')
     
      
  validate_step = (step)->
    show_modal = false
    if step == 1
      if $('#postulation_program_id').val().length == 0
        $('#postulation_program_id').addClass('not-valid')
        show_modal = true
      else
        $('#postulation_program_id').removeClass('not-valid')
    else if step == 2
      $('div[data-step=2]').find('select, input').each ->
        if $(this).val().length == 0
          $(this).addClass('not-valid')
          show_modal = true
        else
          $(this).removeClass('not-valid')
    else if step == 3
      $('div[data-step=3]').find('select, input').each ->
        if $(this).val().length == 0
          $(this).addClass('not-valid')
          show_modal = true
        else
          $(this).removeClass('not-valid')
    else if step == 4
      $('#postulation_find_out_ids, #postulation_financing_id').each ->
        if $(this).val() == null or $(this).val() == ""
          if $(this).val() == null
            $(this).parent().addClass('not-valid')
          $(this).parent().addClass('not-valid')
          show_modal = true
        else
          if $(this).val() == null
            $(this).parent().removeClass('not-valid')
          $(this).removeClass('not-valid')
    else if step == 5
      $('#postulation_cv, #postulation_picture, #postulation_degree_1, #postulation_postulation_tab, #postulation_inscription_receip, #postulation_ci').each ->
        if $(this).val().length == 0
          $(this).addClass('not-valid')
          show_modal = true
        else
          $(this).removeClass('not-valid')
    
    return show_modal
    
  $('.step-panel').hide ->
    $('.step-panel[data-step=1]').show()
    
  $('.next-step').on 'click', (e) ->
    e.preventDefault()
    step = $(this).parent().data('step')
    
    if validate_step(step)
      $('#modal-validation').modal('show')
      return
    
    $('.step-panel').hide ->
      $('.step-panel[data-step=' + (step+1) + ']').show()
    $('#progreso > li[data-step=' + step + ']').removeClass('progtrckr-todo')
    $('#progreso > li[data-step=' + step + ']').addClass('progtrckr-done')
  
    $('#table_program').html($('#postulation_program_id').find(":selected").text())
    $('#table_postulation_rut').html($('#postulation_rut').val())
    $('#table_postulation_name').html($('#postulation_name').val())
    $('#table_postulation_surname').html($('#postulation_surname').val())
    $('#table_postulation_second_surname').html($('#postulation_second_surname').val())
    $('#table_postulation_nationality').html($('#postulation_nationality').val())
    $('#table_postulation_phone').html($('#postulation_phone').val())
    $('#table_postulation_mobile_phone').html($('#postulation_mobile_phone').val())
    $('#table_postulation_email').html($('#postulation_email').val())
    $('#table_postulation_address').html($('#postulation_address').val())
    $('#table_postulation_commune').html($('#postulation_commune').val())
    $('#table_postulation_city').html($('#postulation_city').val())
    $('#table_postulation_degree_school').html($('#postulation_degree_school').val())
    $('#table_postulation_degree').html($('#postulation_degree').val())
    $('#table_postulation_degree_year').html($('#postulation_degree_year').val())
    $('#table_postulation_occupation').html($('#postulation_occupation').val())
    
    $('input[type=file]').each ->
      check_file($(this), $('#table_'+$(this).attr('id')))
    
  $('.last-step').on 'click', (e) ->
    e.preventDefault()
    step = $(this).parent().data('step')
    $('.step-panel').hide ->
      $('.step-panel[data-step=' + (step-1) + ']').show()
    $('#progreso > li[data-step=' + step + ']').removeClass('progtrckr-done')
    $('#progreso > li[data-step=' + step + ']').addClass('progtrckr-todo')
    
    
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'No hay resultados'
    placeholder: '¿Como te enteraste?, click aquí'
    
  if $('.find_out_wrapper').length > 0
    $('.find_out_wrapper').hide()
    $('.chosen-select').chosen().change (e)->
      if $(this).val()
        $(this).val().forEach (el) ->
          if el == "9"
            $('.find_out_wrapper').show()
          else
            $('.find_out_wrapper').hide()
            
  if $('.no_continuation_wrapper').length > 0
    $('.no_continuation_wrapper').hide()
    if $('#postulation_financing_id').length > 0
      $('#postulation_financing_id').on 'change', (e)->
        if $(this).val() == '1' || $(this).val() == '2' || $(this).val() == '3'
          $('.no_continuation_wrapper').show()
        else
          $('.no_continuation_wrapper').hide()
    
    
  