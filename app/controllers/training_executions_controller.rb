class TrainingExecutionsController < ApplicationController
  before_action :set_training_execution, only: [:show, :edit, :update, :destroy, :register_attendances, :save_attendances]

  # GET /training_executions
  # GET /training_executions.json
  def index
    gon.areas = Area.all
    gon.companies = Company.all
    @training_executions = TrainingExecution.filter_training_executions(params)
    @training_executions = @training_executions.paginate(page: params[:page])
  end

  # GET /training_executions/1
  # GET /training_executions/1.json
  def show
    @aide = if @training_execution.area_id.present?
              Area.find(@training_execution.area_id)
            elsif @training_execution.collaborator_id.present?
              Employee.find(@training_execution.collaborator_id)
            end
  end

  # GET /training_executions/new
  def new
    if params[:training_id].present?
      @training_execution = TrainingExecution.new(Training.find(params[:training_id]).attributes)
      @training_execution.planned = true
      @training_execution.training_id = params[:training_id]
    else
      @training_execution = TrainingExecution.new
    end
  end

  # GET /training_executions/1/edit
  def edit
  end

  # POST /training_executions
  # POST /training_executions.json
  def create
    @training_execution = TrainingExecution.new(training_execution_params)

    respond_to do |format|
      if @training_execution.save
        format.html { redirect_to @training_execution, notice: 'La ejecución de la formación fue creada exitósamente.' }
        format.json { render :show, status: :created, location: @training_execution }
      else
        format.html { render :new }
        format.json { render json: @training_execution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /training_executions/1
  # PATCH/PUT /training_executions/1.json
  def update
    respond_to do |format|
      if @training_execution.update(training_execution_params)
        format.html { redirect_to @training_execution, notice: 'La ejecución de la formación fue actualizada exitósamente.' }
        format.json { render :show, status: :ok, location: @training_execution }
      else
        format.html { render :edit }
        format.json { render json: @training_execution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /training_executions/1
  # DELETE /training_executions/1.json
  def destroy
    @training_execution.destroy
    respond_to do |format|
      format.html { redirect_to training_executions_url, notice: 'La ejecución de la formación fue eliminada exitósamente.' }
      format.json { head :no_content }
    end
  end

  def register_attendances
    @employees = Employee.where.not(id: @training_execution.employees.ids)
    @selected_employees = @training_execution.employees
  end

  def save_attendances
    @training_execution.save_attendances(params[:employees_id])
    respond_to do |format|
      if @training_execution.save
        format.html { redirect_to @training_execution, notice: 'Se registró exitósamente las asistencias a la formación ejecutada.' }
        format.json { render :show, status: :ok, location: @training_execution }
      else
        format.html { render :register_attendances }
        format.json { render json: @training_execution.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_training_execution
    @training_execution = TrainingExecution.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def training_execution_params
    params.require(:training_execution).permit(:category, :topic, :objective, :date, :hourly_intensity, :trainer, :internal, :area_id, :collaborator_id, :company_id, :training_id, :planned)
  end
end
