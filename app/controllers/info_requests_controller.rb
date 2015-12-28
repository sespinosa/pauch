class InfoRequestsController < ApplicationController
  before_action :set_info_request, only: [:show, :edit, :update, :destroy]
  before_action :restrict_not_logged, only: [:index, :update, :destroy, :edit]
  
  # GET /info_requests
  # GET /info_requests.json
  def index
    if current_user.has_any_role? :admin, :acceso
      respond_to do |format|
        format.html
        format.json { render json: InfoRequestDatatable.new(view_context) }
      end
    else
      redirect_to :root
    end
  end

  # GET /info_requests/1
  # GET /info_requests/1.json
  def show
    render "recieved" if !current_user
  end

  # GET /info_requests/new
  def new
    @info_request = InfoRequest.new
  end

  # GET /info_requests/1/edit
  def edit
  end

  # POST /info_requests
  # POST /info_requests.json
  def create
    @info_request = InfoRequest.new(info_request_params)

    respond_to do |format|
      if @info_request.save
        format.html { redirect_to @info_request, notice: 'Solicitud de información enviada.' }
        format.json { render :show, status: :created, location: @info_request }
      else
        format.html { render :new }
        format.json { render json: @info_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /info_requests/1
  # PATCH/PUT /info_requests/1.json
  def update
    respond_to do |format|
      if @info_request.update(info_request_params)
        format.html { redirect_to @info_request, notice: 'Info request was successfully updated.' }
        format.json { render :show, status: :ok, location: @info_request }
      else
        format.html { render :edit }
        format.json { render json: @info_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /info_requests/1
  # DELETE /info_requests/1.json
  def destroy
    @info_request.destroy
    respond_to do |format|
      format.html { redirect_to info_requests_url, notice: 'Info request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
    def restrict_not_logged
      redirect_to root_path if !current_user
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_info_request
      @info_request = InfoRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def info_request_params
      params.require(:info_request).permit(:program_id, :name, :internal_commentary, :surname, :second_surname, :contact_phone, :rut, :observations, :email, :find_out_other, find_out_ids: [])
    end
end
