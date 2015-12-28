class InfoRequestDatatable < AjaxDatatablesRails::Base

  def initialize view_context
    @vc = view_context
    super(view_context)
  end
  
  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= %w(InfoRequest.program_id InfoRequest.name InfoRequest.email InfoRequest.rut InfoRequest.observations InfoRequest.find_out_id)
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= %w(InfoRequest.name InfoRequest.email InfoRequest.rut InfoRequest.observations)
  end

  private

  def data
    if @vc.current_user.has_role? :admin
      records.map do |record|
        [
          program_tooltip(record),
          link_to_request(record),
          record.email,
          record.rut,
          observation_tooltip(record),
          record.find_outs.map { |fo| fo.name  }.join(' | '),
          delete_button(record).html_safe
        ]
      end
    else
      records.map do |record|
        [
          program_tooltip(record),
          link_to_request(record),
          record.email,
          record.rut,
          observation_tooltip(record),
          record.find_outs.map { |fo| fo.name  }.join(' | '),
          edit_btn(record)
        ]
      end
    end
  end

  def get_raw_records
    # insert query here
    InfoRequest.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
  def link_to_request record
    @vc.link_to("#{record.name} #{record.surname} #{record.second_surname}", "/info_requests/#{record.id}")
  end
  
  def edit_btn record
    "<a class='btn btn-info' href='/info_requests/#{record.id}/edit'>Obs. Interna</a>"
  end
  
  def delete_button record

    delete_icon = '<i class="fa fa-trash-o"></i>'.html_safe

    @vc.link_to(delete_icon, "/info_requests/#{record.id}", method: :delete, data: { confirm: '¿Seguro que quieres eliminar la solicitud?' })

  end
  
  def program_tooltip record
    tooltip_btn = "<button type='button' class='btn btn-default' data-toggle='tooltip' data-placement='top' title='#{record.program.try(:name)}' data-original-title='#{record.program.try(:name)}' >#{record.program.try(:code)}</button>"
  end
  def observation_tooltip record
    tooltip_btn = "<button type='button' class='btn btn-default' data-toggle='tooltip' data-placement='top' title='#{record.observations}' data-original-title='#{record.observations}'>Observación</button>"
  end
end
