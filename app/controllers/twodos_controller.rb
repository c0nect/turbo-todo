class TwodosController < ApplicationController
  before_action :set_twodo, only: %i[ show edit update destroy ]

  # GET /twodos or /twodos.json
  def index
    @twodos = Twodo.all
  end

  # GET /twodos/1 or /twodos/1.json
  def show
  end

  # GET /twodos/new
  def new
    @twodo = Twodo.new
  end

  # GET /twodos/1/edit
  def edit
  end

  # POST /twodos or /twodos.json
  def create
    @twodo = Twodo.new(twodo_params)
  
    respond_to do |format|
      if @twodo.save
        format.turbo_stream
        format.html { redirect_to twodo_url(@twodo), notice: "twodo was successfully created." }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@twodo)}_form", partial: "form", locals: { twodo: @twodo }) }
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @twodo.update(twodo_params)
        format.turbo_stream
        format.html { redirect_to twodo_url(@twodo), notice: "twodo was successfully updated." }
        format.json { render :show, status: :ok, location: @twodo }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@twodo)}_form", partial: "form", locals: { twodo: @twodo }) }
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @twodo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twodos/1 or /twodos/1.json
  def destroy
    @twodo.destroy
  
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("#{helpers.dom_id(@twodo)}_container") }
      format.html { redirect_to twodos_url, notice: "twodo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twodo
      @twodo = Twodo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def twodo_params
      params.require(:twodo).permit(:name, :status)
    end
end
