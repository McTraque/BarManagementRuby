class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy, :enable, :disable]

  # GET /providers
  # GET /providers.json
  def index
    @providers = Provider.all
  end

  # GET /providers/1
  # GET /providers/1.json
  def show
  end

  # GET /providers/new
  def new
    @provider = Provider.new
  end

  # GET /providers/1/edit
  def edit
  end

  # POST /providers
  # POST /providers.json
  def create
    @provider = Provider.new(provider_params)

    respond_to do |format|
      if @provider.save
        format.html { redirect_to @provider, notice: 'El proveedor ha sido creado con éxito.' }
        format.json { render :show, status: :created, location: @provider }
      else
        format.html { render :new }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /providers/1
  # PATCH/PUT /providers/1.json
  def update
    respond_to do |format|
      if @provider.update(provider_params)
        format.html { redirect_to @provider, notice: 'El proveedor ha sido actualizado con éxito.' }
        format.json { render :show, status: :ok, location: @provider }
      else
        format.html { render :edit }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /providers/1
  # DELETE /providers/1.json
  def disable
    @provider.disabled!
    respond_to do |format|
      format.html { redirect_to providers_url, notice: 'El proveedor ha sido deshabilitado con éxito' }
      format.json { head :no_content }
    end
  end

  def enable
    @provider.enable!
    respond_to do |format|
      format.html { redirect_to providers_url, notice: 'El proveedor ha sido habilitado con éxito' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_params
      params.require(:provider).permit(:razon_social, :nit, :nombre_completo, :telefono, :email)
    end
end
