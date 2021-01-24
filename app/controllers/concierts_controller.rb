class ConciertsController < ApplicationController
  before_action :set_conciert, only: %w[ show edit update destroy ]

  # GET /concierts
  # GET /concierts.json
  def index
    @group = Group.find params[:group_id]
   
    @concierts = @group.concierts
  end

  # GET /concierts/1
  # GET /concierts/1.json
  def show
    @group = Group.find params[:group_id]
    @conciert = Conciert.find(params[:id])
  end

  # GET /concierts/new
  def new
    @group = Group.find params[:group_id]
    @conciert = Conciert.new
    
  end

  # GET /concierts/1/edit
  def edit
    @group = Group.find params[:group_id]
    @conciert = Conciert.find(params[:id])
  end

  # POST /concierts
  # POST /concierts.json
  def create
    @group = Group.find params[:group_id]
    @conciert = Conciert.new(conciert_params)
    @conciert.group = @group
    respond_to do |format|
      if @conciert.save
        format.html { redirect_to group_conciert_path(@group,@conciert), notice: "Conciert was successfully created." }
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
    @group = Group.find params[:group_id]
    @conciert = Conciert.find(params[:id])
    respond_to do |format|
      if @conciert.update(conciert_params.merge(group: @group))
        format.html { redirect_to group_conciert_path(@group,@conciert), notice: "Conciert was successfully updated." }
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
    @conciert = Conciert.find(params[:id])
    @conciert.destroy
    respond_to do |format|
      format.html { redirect_to group_concierts_url, notice: "Conciert was successfully destroyed." }
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
