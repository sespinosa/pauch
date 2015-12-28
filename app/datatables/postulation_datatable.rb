class PostulationDatatable < AjaxDatatablesRails::Base

  def initialize view_context
    @vc = view_context
    super(view_context)
  end
  
  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= %w(Postulation.program_id Postulation.name Postulation.email Postulation.rut Postulation.observations Postulation.find_out_id)
  end

  def searchable_columns
    []
  end

  private

  def data
    estados = ['PENDIENTE', 'ACEPTADO', 'RECHAZADO']
    if @vc.current_user.has_role? :admin
      records.map do |record|
        [
          program_tooltip(record),
          link_to_request(record),
          record.email,
          record.rut,
          observation_tooltip(record),
          record.find_outs.map { |fo| fo.name  }.join(' | '),
          estados[record.postulation_status],
          (@vc.l(record.folder_delivery) if record.folder_delivery),
          (@vc.l(record.interview) if record.interview),
          estados[record.enrollment_status],
          estados[record.tuition_status],
          (intern_observations_tooltip(record) if record.intern_observations),
          "#{delete_button(record).html_safe + download_button(record).html_safe}"
        ]
      end
    else
      if @vc.current_user.has_role? :acceso
        records.map do |record|
          [
            program_tooltip(record),
            "#{record.name} #{record.surname} #{record.second_surname}",
            record.email,
            record.rut,
            observation_tooltip(record),
            record.find_outs.map { |fo| fo.name  }.join(' | '),
            (@vc.l(record.updated_at, format: :short) if record.updated_at),
            "#{intern_edit(record) + download_button(record).html_safe}"
          ]
        end
      else
        if @vc.current_user.has_role? :descarga
          records.map do |record|
            [
              "#{record.name} #{record.surname} #{record.second_surname}",
              record.email,
              record.rut,
              "#{download_button(record).html_safe}"
            ]
          end
        end
      end
    end
  end

  def get_raw_records
    # insert query here
    Postulation.all
  end
  
  # ==== Insert 'presenter'-like methods below if necessary
  def link_to_request record
    @vc.link_to("#{record.name} #{record.surname} #{record.second_surname}", "/postulations/#{record.id}")
  end
  
  def delete_button record

    delete_icon = '<i class="fa fa-trash-o" style="color: red; font-size: 25px;"></i>'.html_safe

    @vc.link_to(delete_icon, "/postulations/#{record.id}", method: :delete, data: { confirm: '¿Seguro que quieres eliminar la postulación?' })

  end
  
  def download_button record
    download_icon = '&nbsp;<i class="fa fa-arrow-circle-down" style="color: green; font-size: 25px;"></i>'.html_safe
    
    @vc.link_to(download_icon, "/postulations/#{record.id}/download_files")
    
  end
  
  def intern_edit record

    intern_edit = '<i class="fa fa-pencil" style="font-size: 25px;"></i>'.html_safe

    @vc.link_to(intern_edit, "/postulations/#{record.id}/control_interno")

  end
  
  def intern_observations_tooltip record
    "<button type='button' class='btn btn-default' data-toggle='tooltip' data-placement='top' title='#{record.intern_observations}' data-original-title='#{record.intern_observations}' >Observación Interna</button>"
  end
  
  def program_tooltip record
    tooltip_btn = "<button type='button' class='btn btn-default' data-toggle='tooltip' data-placement='top' title='#{record.program.try(:name)}' data-original-title='#{record.program.try(:name)}' >#{record.program.try(:code)}</button>"
  end
  def observation_tooltip record
    tooltip_btn = "<button type='button' class='btn btn-default' data-toggle='tooltip' data-placement='top' title='#{record.observations}' data-original-title='#{record.observations}'>Observación</button>"
  end
  
  def control_popover record
    estados = ['PENDIENTE', 'ACEPTADO', 'RECHAZADO']
    content = "Entrega de carpeta : #{@vc.l(record.folder_delivery) if record.folder_delivery} <br /> Fecha entrevista : <br /> #{@vc.l(record.interview) if record.interview} <br /> Estado postulación : <br /> #{estados[record.postulation_status] || "NINGUNO"} <br /> Estado matricula : <br /> #{estados[record.enrollment_status] || "NINGUNO"} <br /> Estado pago arancel :<br /> #{estados[record.tuition_status] || "NINGUNO"} <br /> Observaciones internas :<br /> #{record.intern_observations}"
    "<button type='button' class='btn btn-lg btn-danger' data-placement='top' data-toggle='popover' title='Datos de control' data-content='#{content}'>Control</button>"
  end
  
end
