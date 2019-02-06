class PropertiesController < ApplicationController
  before_action :filter_by_beds, only: [:index]

  def index
    if params[:beds]
      @properties = Property.joins(:unit_type).where("unit_types.beds = ?", @beds)
    else
      @properties = Property.all
    end
    render json: @properties
  end

  private

  def filter_by_beds
    @beds = params[:beds]
  end
end