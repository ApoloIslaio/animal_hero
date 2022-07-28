class OngsController < ApplicationController
  before_action :set_ong, only: [:show, :edit, :update, :destroy]
  before_action :set_states_options, only: [:new, :create, :show, :edit, :update]


  # GET /ongs
  # GET /ongs.json
  def index
    if params[:id].nil?
      @ongs = Ong.all
    else
      @ongs = Ong.where(id: params[:id])
    end
  end

  # GET /ongs/1
  # GET /ongs/1.json
  def show
  end

  # GET /ongs/new
  def new
    @ong = Ong.new
    show_states
  end

  # GET /ongs/1/edit
  def edit
    show_states
  end

  # POST /ongs
  # POST /ongs.json
  def create
    @ong = Ong.new(ong_params)

    respond_to do |format|
      if @ong.save
        format.html { redirect_to @ong, notice: 'Ong criada com sucesso' }
        format.json { render :show, status: :created, location: @ong }
      else
        format.html { render :new }
        format.json { render json: @ong.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ongs/1
  # PATCH/PUT /ongs/1.json
  def update
    respond_to do |format|
      if @ong.update(ong_params)
        format.html { redirect_to @ong, notice: 'Ong atualizada com sucesso' }
        format.json { render :show, status: :ok, location: @ong }
      else
        format.html { render :edit }
        format.json { render json: @ong.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ongs/1
  # DELETE /ongs/1.json
  def destroy
    @ong.destroy
    respond_to do |format|
      format.html { redirect_to ongs_url, notice: 'Ong was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_states
    show_states_for_selected = State.all
  end

  private
    def set_states_options
      @states_options = State.all.pluck(:description, :id)
    end


    # Use callbacks to share common setup or constraints between actions.
    def set_ong
      @ong = Ong.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ong_params
      params.require(:ong).permit(:nome, :email, :estado, :logo, :state_id)
    end
end
