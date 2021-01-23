class ConciertsController < ApplicationController
  before_action :set_conciert, only: %w[ show edit update destroy ]

  # GET /concierts
  # GET /concierts.json
  def index
    @concierts = Conciert.all
  end

  # GET /concierts/1
  # GET /concierts/1.json
  def show
  end

  # GET /concierts/new
  def new
    @conciert = Conciert.new
  end

  # GET /concierts/1/edit
  def edit
  end

  # POST /concierts
  # POST /concierts.json
  def create
    @conciert = Conciert.new(conciert_params)

    respond_to do |format|
      if @conciert.save
        format.html { redirect_to @conciert, notice: "Conciert was successfully created." }
        format.json { render :show, status: :created, location: @conciert }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @conciert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concierts/1
  # PATCH/PUT /concierts/1.json
  def update
    respond_to do |format|
      if @conciert.update(conciert_params)
        format.html { redirect_to @conciert, notice: "Conciert was successfully updated." }
        format.json { render :show, status: :ok, location: @conciert }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @conciert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concierts/1
  # DELETE /concierts/1.json
  def destroy
    @conciert.destroy
    respond_to do |format|
      format.html { redirect_to concierts_url, notice: "Conciert was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conciert
      @conciert = Conciert.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conciert_params
      params.require(:conciert).permit(:people, :duration, :date, :group_id)
    end
end
