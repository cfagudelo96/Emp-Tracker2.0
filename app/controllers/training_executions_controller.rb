class TrainingExecutionsController < ApplicationController
  before_action :set_training

  # GET /trainings/1/training_executions/new
  def new
    @training_execution = TrainingExecution.new
  end

  private
    def set_training
      @training = Training.find(params[:training_id])
    end
end
