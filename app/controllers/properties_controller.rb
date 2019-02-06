class PropertiesController < ApplicationController

  def index
    @properties = Property.all
    render json: @properties, status: :ok
  end
end