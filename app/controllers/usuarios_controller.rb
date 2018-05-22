class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy, :enviar]
  before_action :authenticate_admin!, except: [:index, :show]

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all.paginate(page:params[:page], per_page:30)

    respond_to do |format|
      format.html
      format.csv { send_data @usuarios.to_csv }
      format.xlsx
    end
  end

  def enviar
    FirmaEmailMailer.notify_firma(@usuario).deliver
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
  end

  def import
    Usuario.import(params[:file])

    redirect_to root_url, notice: 'Firmas agregadas correctamente.'
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to @usuario, notice: 'Usuario was successfully created.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:nombre, :cargo, :telefono, :direccion, :rut, :email)
    end
end
