class PostulationsController < ApplicationController
  before_action :set_postulation, only: [:show, :edit, :update, :destroy, :control]
  before_action :restrict_not_logged, only: [:index, :update, :destroy, :edit]
  require 'zip'
  
  # GET /postulations
  # GET /postulations.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: PostulationDatatable.new(view_context) }
    end
  end
  
  def download_files
    
    postulation = Postulation.find(params[:id])
    filename = "#{postulation.rut.gsub(".", "") if postulation.rut.present?}-Programa_#{postulation.program.try(:code)}-#{postulation.name}_#{postulation.surname}.zip"
    
    temp_file = Tempfile.new(filename)
    
    paths = []
    
    paths << [ postulation.cv.try(:path), postulation.cv_file_name ]
    paths << [ postulation.picture.try(:path), postulation.picture_file_name ]
    paths << [ postulation.degree_1.try(:path), postulation.degree_1_file_name ]
    paths << [ postulation.degree_2.try(:path), postulation.degree_2_file_name ]
    paths << [ postulation.postulation_tab.try(:path), postulation.postulation_tab_file_name ]
    paths << [ postulation.inscription_receip.try(:path), postulation.inscription_receip_file_name ]
    paths << [ postulation.intention_letter.try(:path), postulation.intention_letter_file_name ]
    paths << [ postulation.ci.try(:path), postulation.ci_file_name ]
    paths << [ postulation.recommendation_letter_1.try(:path), postulation.recommendation_letter_1_file_name ]
    paths << [ postulation.recommendation_letter_2.try(:path), postulation.recommendation_letter_2_file_name ]
    paths << [ postulation.tesis_proposal.try(:path), postulation.tesis_proposal_file_name ]
    paths << [ postulation.interest_declaration.try(:path), postulation.interest_declaration_file_name ]
    
  
    paths.map! {|p| p if p != [nil, nil] }
    paths = paths.compact.uniq { |p| p[1]}
  
  
  if paths != [[nil, nil]]
    Zip::File.open(temp_file.path, Zip::File::CREATE) do |zip|
      paths.each do |p|
        zip.add(p[1], p[0])
      end
    end

    zip_data = File.read(temp_file.path)
    send_data(zip_data, :type => 'application/zip', :filename => filename)
  else
    render html: "<div class='col-md-12'><h1 class='title1'>No hay archivos adjuntos!</h1></div>".html_safe, layout: true
  end
    

    

  end
  
  def data_dump
    estados = ['PENDIENTE', 'ACEPTADO', 'RECHAZADO']
    @postulaciones = []
    @solicitudes_informacion = []
    Postulation.all.each do |p|
      postulacion = [
        p.id,
        p.program.try(:code),
        p.program.try(:name),
        p.name,
        p.surname,
        p.second_surname,
        p.rut,
        (view_context.l(p.birthdate) if p.birthdate),
        p.birthplace,
        p.nationality,
        p.phone,
        p.mobile_phone,
        p.message_phone,
        p.email,
        p.address,
        p.commune,
        p.city,
        p.degree_school,
        p.degree,
        p.degree_country,
        p.degree_year,
        p.other_degree,
        p.other_degree_country,
        p.other_degree_year,
        p.occupation,
        p.work_address,
        p.work_commune,
        p.work_city,
        p.work_phone,
        p.work_email,
        p.observations,
        p.find_outs.map { |fo| fo.name  }.join(' | '),
        p.financing.try(:name),
        p.folder_delivery,
        p.interview,
        estados[p.postulation_status],
        estados[p.enrollment_status],
        estados[p.tuition_status],
        p.intern_observations
      ]
      @postulaciones << postulacion
    end
    
    
    InfoRequest.all.each do |ir|
      info_request = [
        ir.id,
        ir.program.try(:code),
        ir.program.try(:name),
        ir.name,
        ir.surname,
        ir.second_surname,
        ir.rut,
        ir.email,
        ir.observations,
        ir.find_outs.map { |fo| fo.name  }.join(' | ')
      ]
      @solicitudes_informacion << info_request
    end
    
    require 'json'
    
    @postulaciones = @postulaciones.to_json
    @solicitudes_informacion = @solicitudes_informacion.to_json
    
  end
  
  def control
    
    @postulation = Postulation.find(params[:id])
    if params[:postulation]
      @postulation.update(postulation_params)
    end
    
    
#    render json: params[:id]
  end

  # GET /postulations/1
  # GET /postulations/1.json
  def show
    render "recieved" if !current_user
  end

  # GET /postulations/new
  def new
    @postulation = Postulation.new
    
  end

  # GET /postulations/1/edit
  def edit
  end

  # POST /postulations
  # POST /postulations.json
  def create
    @postulation = Postulation.new(postulation_params)
    @postulation.postulation_status = 0
    @postulation.enrollment_status = 0
    @postulation.tuition_status = 0
    
    formulario_valido = postulation_params.map { |k, parm| parm.blank? ? 0 : 1 }.sum > 0
    
    respond_to do |format|
      if formulario_valido and @postulation.save
        format.html { redirect_to @postulation, notice: 'Postulation was successfully created.' }
        format.json { render :show, status: :created, location: @postulation }
      else
        format.html { render :new }
        format.json { render json: @postulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postulations/1
  # PATCH/PUT /postulations/1.json
  def update
    respond_to do |format|
      if @postulation.update(postulation_params)
        format.html { redirect_to @postulation, notice: 'Postulation was successfully updated.' }
        format.json { render :show, status: :ok, location: @postulation }
      else
        format.html { render :edit }
        format.json { render json: @postulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postulations/1
  # DELETE /postulations/1.json
  def destroy
    @postulation.destroy
    respond_to do |format|
      format.html { redirect_to postulations_url, notice: 'Postulation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
    def restrict_not_logged
      redirect_to root_path if !current_user
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_postulation
      @postulation = Postulation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def postulation_params
      params.require(:postulation).permit(:program_id, :name, :internal_commentary, :surname, :second_surname, :rut, :birthdate, :birthplace, :nationality, :phone, :mobile_phone, :message_phone, :email, :address, :commune, :city, :degree_school, :degree, :degree_country, :degree_year, :other_degree, :other_degree_country, :other_degree_year, :occupation, :work_address, :work_commune, :work_city, :work_phone, :work_email, :observations, :financing_id, :cv, :picture, :degree_1, :degree_2, :postulation_tab, :inscription_receip, :intention_letter, :ci, :recommendation_letter_1, :recommendation_letter_2, :tesis_proposal, :interest_declaration, :folder_delivery, :interview, :postulation_status, :enrollment_status, :tuition_status, :intern_observations, :no_continuation, :find_out_other, find_out_ids: [] )
    end
end
