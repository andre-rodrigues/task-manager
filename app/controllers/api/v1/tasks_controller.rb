class Api::V1::TasksController < ApplicationController
  layout :false

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = TaskParser.parse(string_input)
    head :bad_request unless @task.save
  end

  def destroy
    head Task.find(params[:id]).destroy ? :ok : :bad_request
  end

  private

  def string_input
    params.require(:string_input)
  end
end
