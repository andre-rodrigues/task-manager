class Api::V1::TasksController < ApplicationController

  def index
    respond_with Task.all
  end

  def show
    respond_with Task.find(params[:id])
  end

  def create
    respond_with :api, :v1, TaskParser.parse(string_input).tap(&:save)
  end

  def destroy
    respond_with Task.find(params[:id]).destroy
  end

  private

  def string_input
    params.require(:string_input)
  end
end
