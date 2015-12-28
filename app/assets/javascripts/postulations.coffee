# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('[data-toggle="popover"]').popover()
  $('[data-toggle="tooltip"]').tooltip()
  $('#postulations-table').on 'draw.dt', ->
    $('[data-toggle="tooltip"]').tooltip()
    $('[data-toggle="popover"]').popover
      html: true
    $('#postulations-table_filter').hide()
  $('#postulations-table').dataTable
    pageLength: 50
    processing: true
    serverSide: true
    ajax: $('#postulations-table').data('source')
    pagingType: 'full_numbers'
    language:
      url: "/assets/Spanish.json" 
      
      
  firstRowRenderer = (instance, td, row, col, prop, value, cellProperties) ->
      Handsontable.renderers.TextRenderer.apply(this, arguments)
      td.style.fontWeight = 'bold'
      td.style.color = 'white'
      td.style.background = '#0099cc'
    if $('#div_dump').length > 0
      div_postulaciones = document.getElementById('tabla_postulaciones')
      @tabla_postulaciones = new Handsontable div_postulaciones,
        data: postulaciones,
        minSpareRows: 1,
        rowHeaders: false,
        colHeaders: false,
        contextMenu: true,
        cells: (row, col, prop) ->
          cellProperties = {}
          if row == 0
            cellProperties.renderer = firstRowRenderer
            cellProperties.readOnly = true
          return cellProperties

      div_solicitudes_informacion = document.getElementById('tabla_solicitudes_informacion')
      @tabla_postulaciones = new Handsontable div_solicitudes_informacion,
        data: solicitudes_informacion,
        minSpareRows: 1,
        rowHeaders: false,
        colHeaders: false,
        contextMenu: true,
        cells: (row, col, prop) ->
          cellProperties = {}
          if row == 0
            cellProperties.renderer = firstRowRenderer
            cellProperties.readOnly = true
          return cellProperties