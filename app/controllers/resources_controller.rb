class ResourcesController < ApplicationController
  before_filter :load_resource

  def checkin

  end

  protected

  def load_resource
    @resource = Resource.find_by_key params[:resource]
  end
end
