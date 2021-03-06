class TrainingsController < ApplicationController
  before_action :set_training, only: [:show, :edit, :update, :destroy]

  # GET /trainings
  # GET /trainings.json
  def index
    gon.areas = Area.all
    gon.companies = Company.all
    @trainings = Training.filter_trainings(params)
    @trainings = @trainings.paginate(page: params[:page])
  end

  def all
    @trainings = Training.all
    @training_executions = TrainingExecution.all
  end

  # GET /trainings/1
  # GET /trainings/1.json
  def show
    @aide = if @training.area_id.present?
              Area.find(@training.area_id)
            elsif @training.collaborator_id.present?
              Employee.find(@training.collaborator_id)
            end
  end

  # GET /trainings/new
  def new
    @training = Training.new
  end

  # GET /trainings/1/edit
  def edit
  end

  # POST /trainings
  # POST /trainings.json
  def create
    @training = Training.new(training_params)

    respond_to do |format|
      if @training.save
        format.html { redirect_to @training, notice: 'La formación ha sido creada exitósamente.' }
        format.json { render :show, status: :created, location: @training }
      else
        format.html { render :new }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainings/1
  # PATCH/PUT /trainings/1.json
  def update
    respond_to do |format|
      if @training.update(training_params)
        format.html { redirect_to @training, notice: 'La formación fue actualizada exitósamente.' }
        format.json { render :show, status: :ok, location: @training }
      else
        format.html { render :edit }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainings/1
  # DELETE /trainings/1.json
  def destroy
    @training.destroy
    respond_to do |format|
      format.html { redirect_to trainings_url, notice: 'La formación fue eliminada exitósamente.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_training
    @training = Training.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def training_params
    params.require(:training).permit(:category, :topic, :objective, :date, :hourly_intensity, :trainer, :internal, :area_id, :collaborator_id, :company_id)
  end
end
